package com.hurlant.util.asn1.type;

import com.hurlant.util.Error;

import com.hurlant.util.ByteArray;

/**
 * This class represents a chunk of ASN1 definition.
 *
 * This is used by parser to know what to look for.
 *
 * @author henri
 *
 */
class ASN1Type {
    // Universal types and tag numbers
    public static var CHOICE:Int = -2;
    public static var ANY:Int = -1;
    public static inline var RESERVED:Int = 0;
    public static inline var BOOLEAN:Int = 1;
    public static inline var INTEGER:Int = 2;
    public static inline var BIT_STRING:Int = 3;
    public static inline var OCTET_STRING:Int = 4;
    public static inline var NULL:Int = 5;
    public static inline var OID:Int = 6;
    public static inline var ODT:Int = 7;
    public static inline var EXTERNAL:Int = 8;
    public static inline var REAL:Int = 9;
    public static inline var ENUMERATED:Int = 10;
    public static inline var EMBEDDED:Int = 11;
    public static inline var UTF8STRING:Int = 12;
    public static inline var ROID:Int = 13;
    public static inline var SEQUENCE:Int = 16;
    public static inline var SET:Int = 17;
    public static inline var NUMERIC_STRING:Int = 18;
    public static inline var PRINTABLE_STRING:Int = 19;
    public static inline var TELETEX_STRING:Int = 20;
    public static inline var VIDEOTEX_STRING:Int = 21;
    public static inline var IA5_STRING:Int = 22;
    public static inline var UTC_TIME:Int = 23;
    public static inline var GENERALIZED_TIME:Int = 24;
    public static inline var GRAPHIC_STRING:Int = 25;
    public static inline var VISIBLE_STRING:Int = 26;
    public static inline var GENERAL_STRING:Int = 27;
    public static inline var UNIVERSAL_STRING:Int = 28;
    public static inline var BMP_STRING:Int = 30;
    public static inline var UNSTRUCTURED_NAME:Int = 31; // ??? no clue.

    // Classes of tags
    public static inline var UNIVERSAL = 0;
    public static inline var APPLICATION = 1;
    public static inline var CONTEXT = 2;
    public static inline var PRIVATE = 3;

    // various type modifiers
    public var optional:Bool = false;
    public var implicitTag:Float = NaN;
    public var implicitClass:Int = 0;
    public var explicitTag:Float = NaN;
    public var explicitClass:Int = 0;
    public var defaultValue:Dynamic = null;
    public var extract:Bool = false; // if true, the constructed parent will copy the binary value in a [name]_bin slot.

    // core type, vs type used somewhere
    //		public var core:Boolean = true;

    public var defaultTag:Float;
    public var parsedTag:Float; // used for ANY logic

    public function new(tag:Int) {
        defaultTag = tag;
    }

    public function matches(type:Int, classValue:Int, length:Int):Bool {
        return false;
    }

    public function clone():ASN1Type {
        //			if (!core) {
        //				return this;
        //			}
        var copier:ByteArray = new ByteArray();
        //			core = false; // the clone is not core
        copier.writeObject(this);
        copier.position = 0;
        var c:ASN1Type = copier.readObject();
        //		    if (c.core) {
        //		    	throw new Error("sucks. copy should have core=false");
        //		    }
        //			core = true;
        return c;
    }

    // ok, time to parse some shit

    /**
		 * Read an ASN-1 value from a ByteArray and return it
		 * If we can't read a value that matches our type, we return null;
		 * 
		 * @param s  a ByteArray containing some DER-encoded ASN-1 values.
		 * @return   an ASN1Value object representing the value read. or null.
		 * 
		 */

    public function fromDER(s:ByteArray, size:Int):Dynamic {
        var p:Int = s.position; // We'll reset if things go wrong.
        var length:Int;
        do {
            if (!Math.isNaN(explicitTag)) {
                // unwrap the explicit tag..
                var tag:Int = readDERTag(s, explicitClass, true); // explicit tags are always constructed
                if (tag != explicitTag) {
                    break;
                }
                length = readDERLength(s);
            }
            if (!Math.isNaN(implicitTag)) {
                tag = readDERTag(s, implicitClass);
                if (tag != implicitTag) {
                    break;
                }
            }
            else {
                tag = readDERTag(s);
                if (defaultTag == ANY) {
                    parsedTag = tag;
                }
                else if (tag != defaultTag) {
                    break;
                }
            }
            length = readDERLength(s);
            var c:Dynamic = fromDERContent(s, length);
            if (c == null) {
                break;
            }
            return c;
        } while ((false));
        // we failed to parse something meaningful. fall back.
        s.position = p;
        if (defaultValue != null) {
            return fromDefaultValue();
        }
        return null;
    }

    private function fromDefaultValue():Dynamic {
        return defaultValue;
    }

    private function fromDERContent(s:ByteArray, length:Int):Dynamic {
        throw new Error("pure virtual function call: fromDERContent");
    }

    private function readDERTag(s:ByteArray, classValue:Int = UNIVERSAL, constructed:Bool = false, any:Bool = false):Int {
        var type:Int = s.readUnsignedByte();
        var c:Bool = (type & 0x20) != 0;
        var cv:Int = (type & 0xC0) >> 6; // { universal, application, context, private }
        type &= 0x1F;
        if (type == 0x1F) {
            // multibyte tag. blah.
            type = 0;
            do {
                var o:Int = s.readUnsignedByte();
                var v:Int = o & 0x7F;
                type = (type << 7) + v;
            } while (((o & 0x80) != 0));
        }
        if (classValue != cv) {
            // trace("Tag Class Mismatch. expected "+classValue+", found "+cv);
            //return -1; // tag class mismatch // XXX ignore that for now.. :(

        }
        return type;
    }

    private function readDERLength(s:ByteArray):Int {
        // length
        var len:Int = s.readUnsignedByte();
        if (len >= 0x80) {
            // long form of length
            var count:Int = len & 0x7f;
            len = 0;
            while (count > 0) {
                len = (len << 8) | s.readUnsignedByte();
                count--;
            }
        }
        return len;
    }
}
