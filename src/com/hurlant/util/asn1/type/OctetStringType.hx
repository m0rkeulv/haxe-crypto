package com.hurlant.util.asn1.type;


import flash.net.RegisterClassAlias;
import com.hurlant.util.ByteArray;

class OctetStringType extends ASN1Type
{
    
    
    public function new()
    {
        super(ASN1Type.OCTET_STRING);
    }
    
    override private function fromDERContent(s : ByteArray, length : Int) : Dynamic{
        var b : ByteArray = new ByteArray();
        s.readBytes(b, 0, length);
        return b;
    }
    private static var init = {
        registerClassAlias("com.hurlant.util.asn1.parser.OctetStringType", OctetStringType);
    }

}
