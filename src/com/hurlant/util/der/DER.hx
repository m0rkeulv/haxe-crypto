/**
 * DER
 * 
 * A basic class to parse DER structures.
 * It is very incomplete, but sufficient to extract whatever data we need so far.
 * Copyright (c) 2007 Henri Torgemane
 * 
 * See LICENSE.txt for full license information.
 */
package com.hurlant.util.der;

import com.hurlant.util.der.IAsn1Type;
import com.hurlant.util.der.Integer;
import com.hurlant.util.der.ObjectIdentifier;
import com.hurlant.util.der.PrintableString;
import com.hurlant.util.der.Set;
import com.hurlant.util.der.UTCTime;


import com.hurlant.util.ByteArray;
import com.hurlant.util.der.Sequence;

// goal 1: to be able to parse an RSA Private Key PEM file.
// goal 2: to parse an X509v3 cert. kinda.

/**
	 * DER for dummies:
	 * http://luca.ntop.org/Teaching/Appunti/asn1.html
	 * 
	 * This class does the bare minimum to get by. if that.
	 */
class DER
{
    public static var indent : String = "";
    
    public static function parse(der : ByteArray, structure : Dynamic = null) : IAsn1Type{
        /* 			if (der.position==0) {
				trace("DER.parse: "+Hex.fromArray(der));
			}
 */  // type  
        var type : Int = der.readUnsignedByte();
        var constructed : Bool = (type & 0x20) != 0;
        type &= 0x1F;
        // length
        var len : Int = der.readUnsignedByte();
        if (len >= 0x80) {
            // long form of length
            var count : Int = len & 0x7f;
            len = 0;
            while (count > 0){
                len = (len << 8) | der.readUnsignedByte();
                count--;
            }
        }  // data  
        
        var b : ByteArray;
        var p : Int;
        switch (type)
        {  // WHAT IS THIS THINGY? (seen as 0xa0)  
            // (note to self: read a spec someday.)
            // for now, treat as a sequence.
            case 0x00, 0x10:  // SEQUENCE/SEQUENCE OF. whatever  
                // treat as an array
                var p = der.position;
                var o : Sequence = new Sequence(type, len);
                var arrayStruct : Array<Dynamic> = try cast(structure, Array<Dynamic>) catch(e:Dynamic) null;
                if (arrayStruct != null) {
                    // copy the array, as we destroy it later.
                    arrayStruct = arrayStruct.slice(0);
                }
                while (der.position < p + len){
                    var tmpStruct : Dynamic = null;
                    if (arrayStruct != null) {
                        tmpStruct = arrayStruct.shift();
                    }
                    if (tmpStruct != null) {
                        while (tmpStruct && tmpStruct.optional){
                            // make sure we have something that looks reasonable. XXX I'm winging it here..
                            var wantConstructed : Bool = (Std.is(tmpStruct.value, Array));
                            var isConstructed : Bool = isConstructedType(der);
                            if (wantConstructed != isConstructed) {
                                // not found. put default stuff, or null
                                o.push(tmpStruct.defaultValue);
                                o.set(tmpStruct.name, tmpStruct.defaultValue);
                                // try the next thing
                                tmpStruct = arrayStruct.shift();
                            }
                            else {
                                break;
                            }
                        }
                    }
                    if (tmpStruct != null) {
                        var name : String = tmpStruct.name;
                        var value : Dynamic = tmpStruct.value;
                        if (tmpStruct.extract) {
                            // we need to keep a binary copy of this element
                            var size : Int = getLengthOfNextElement(der);
                            var ba : ByteArray = new ByteArray();
                            ba.writeBytes(der, der.position, size);
                            o.setStr(name + "_bin", ba);
                        }
                        var obj : IAsn1Type = DER.parse(der, value);
                        o.push(obj);
                        Reflect.setField(o, name, obj);
                    }
                    else {
                        o.push(DER.parse(der));
                    }
                }
                return o;
            case 0x11:  // SET/SET OF  
                var p = der.position;
                var s : Set = new Set(type, len);
                while (der.position < p + len){
                    s.push(DER.parse(der));
                }
                return s;
            case 0x02:  // INTEGER  
                // put in a BigInteger
                b = new ByteArray();
                der.readBytes(b, 0, len);
                b.position = 0;
                return new Integer(type, len, b);
            case 0x06:  // OBJECT IDENTIFIER:  
                b = new ByteArray();
                der.readBytes(b, 0, len);
                b.position = 0;
                return new ObjectIdentifier(type, len, b);
            case 0x03, 0x04:

                switch (type)
                {case 0x03:  // BIT STRING  
                    if (der[der.position] == 0) {
                        //trace("Horrible Bit String pre-padding removal hack."); // I wish I had the patience to find a spec for this.
                        der.position = der.position + 1;
                        len--;
                    }
                }  // OCTET STRING  
                // stuff in a ByteArray for now.
                var bs : ByteString = new ByteString(type, len);
                der.readBytes(bs.data, 0, len);
                return bs;
            case 0x05, 0x13:

                switch (type)
                {case 0x05:  // NULL  
                    // if len!=0, something's horribly wrong.
                    // should I check?
                    return null;
                }  // PrintableString  
                var ps = new PrintableString(type, len);
                ps.setString(der.readMultiByte(len, "US-ASCII"));
                return ps;  // XXX look up what this is. openssl uses this to store my email.  
            case 0x22, 0x14:  // T61String - an horrible format we don't even pretend to support correctly  
                var ps = new PrintableString(type, len);
                ps.setString(der.readMultiByte(len, "latin1"));
                return ps;
            case 0x17:  // UTCTime  
                var ut : UTCTime = new UTCTime(type, len);
                ut.setUTCTime(der.readMultiByte(len, "US-ASCII"));
                return ut;
            default:
                trace("I DONT KNOW HOW TO HANDLE DER stuff of TYPE " + type);
                return null;
        }
    }
    
    private static function getLengthOfNextElement(b : ByteArray) : Int{
        var p : Int = b.position;
        // length
        b.position = b.position + 1;
        var len : Int = b.readUnsignedByte();
        if (len >= 0x80) {
            // long form of length
            var count : Int = len & 0x7f;
            len = 0;
            while (count > 0){
                len = (len << 8) | b.readUnsignedByte();
                count--;
            }
        }
        len += b.position - p;  // length of length  
        b.position = p;
        return len;
    }
    private static function isConstructedType(b : ByteArray) : Bool{
        var type : Int = b[b.position];
        return (type & 0x20) != 0;
    }
    
    public static function wrapDER(type : Int, data : ByteArray) : ByteArray{
        var d : ByteArray = new ByteArray();
        d.writeByte(type);
        var len : Int = data.length;
        if (len < 128) {
            d.writeByte(len);
        }
        else if (len < 256) {
            d.writeByte(1 | 0x80);
            d.writeByte(len);
        }
        else if (len < 65536) {
            d.writeByte(2 | 0x80);
            d.writeByte(len >> 8);
            d.writeByte(len);
        }
        else if (len < 65536 * 256) {
            d.writeByte(3 | 0x80);
            d.writeByte(len >> 16);
            d.writeByte(len >> 8);
            d.writeByte(len);
        }
        else {
            d.writeByte(4 | 0x80);
            d.writeByte(len >> 24);
            d.writeByte(len >> 16);
            d.writeByte(len >> 8);
            d.writeByte(len);
        }
        d.writeBytes(data);
        d.position = 0;
        return d;
    }

    public function new()
    {
    }
}
