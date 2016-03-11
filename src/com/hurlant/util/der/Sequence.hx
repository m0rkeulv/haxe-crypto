/**
 * Sequence
 * 
 * An ASN1 type for a Sequence, implemented as an Array
 * Copyright (c) 2007 Henri Torgemane
 * 
 * See LICENSE.txt for full license information.
 */
package com.hurlant.util.der;


import com.hurlant.util.ByteArray;

class Sequence extends Array<Dynamic> implements IAsn1Type
{
    private var type : Int;
    private var len : Int;
    
    public function new(type : Int = 0x30, length : Int = 0x00)
    {
        super();
        this.type = type;
        this.len = length;
    }
    
    public function getLength() : Int
    {
        return len;
    }
    
    public function getType() : Int
    {
        return type;
    }
    
    public function toDER() : ByteArray{
        var tmp : ByteArray = new ByteArray();
        for (i in 0...length){
            var e : IAsn1Type = this[i];
            if (e == null) {  // XXX Arguably, I could have a der.Null class instead  
                tmp.writeByte(0x05);
                tmp.writeByte(0x00);
            }
            else {
                tmp.writeBytes(e.toDER());
            }
        }
        return DER.wrapDER(type, tmp);
    }
    
    public function toString() : String{
        var s : String = DER.indent;
        DER.indent += "    ";
        var t : String = "";
        for (i in 0...length){
            if (this[i] == null)                 {i++;continue;
            };
            var found : Bool = false;
            for (key in Reflect.fields(this)){
                if ((Std.string(i) != key) && this[i] == this[key]) {
                    t += key + ": " + this[i] + "\n";
                    found = true;
                    break;
                }
            }
            if (!found)                 t += this[i] + "\n";
        }  //			var t:String = join("\n");  
        
        DER.indent = s;
        return DER.indent + "Sequence[" + type + "][" + len + "][\n" + t + "\n" + s + "]";
    }
    
    /////////
    
    public function findAttributeValue(oid : String) : IAsn1Type{
        for (set/* AS3HX WARNING could not determine type for var: set exp: EIdent(this) type: null */ in this){
            if (Std.is(set, Set)) {
                var child : Dynamic = set[0];
                if (Std.is(child, Sequence)) {
                    var tmp : Dynamic = child[0];
                    if (Std.is(tmp, ObjectIdentifier)) {
                        var id : ObjectIdentifier = try cast(tmp, ObjectIdentifier) catch(e:Dynamic) null;
                        if (Std.string(id) == oid) {
                            return try cast(child[1], IAsn1Type) catch(e:Dynamic) null;
                        }
                    }
                }
            }
        }
        return null;
    }
}
