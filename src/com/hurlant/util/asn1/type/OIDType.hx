package com.hurlant.util.asn1.type;


import flash.net.RegisterClassAlias;
import com.hurlant.util.ByteArray;

class OIDType extends ASN1Type
{
    
    
    public var oid : String = null;
    
    public function new(s : String = null)
    {
        super(ASN1Type.OID);
        oid = s;
    }
    
    public function toString() : String{
        return oid;
    }
    
    /**
		 * I'm tempted to return fully defined OIDType objects
		 * Altough that's a little bit weird.
		 *  
		 * @param s
		 * @param length
		 * @return 
		 * 
		 */
    override private function fromDERContent(s : ByteArray, length : Int) : Dynamic{
        var p : Int = s.position;
        // parse stuff
        // first byte = 40*value1 + value2
        var o : Int = s.readUnsignedByte();
        var left : Int = length - 1;
        var a : Array<Dynamic> = [];
        a.push(Int(o / 40));
        a.push(Int(o % 40));
        var v : Int = 0;
        while (left-- > 0){
            o = s.readUnsignedByte();
            var last : Bool = (o & 0x80) == 0;
            o &= 0x7f;
            v = v * 128 + o;
            if (last) {
                a.push(v);
                v = 0;
            }
        }
        var str : String = a.join(".");
        if (oid != null) {
            if (oid == str) {
                return this.clone();
            }
            else {
                s.position = p;
                return null;
            }
        }
        else {
            return new OIDType(str);
        }
    }
    private static var init = {
        registerClassAlias("com.hurlant.util.asn1.OIDType", OIDType);
    }

}
