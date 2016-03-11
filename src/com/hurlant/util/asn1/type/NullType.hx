package com.hurlant.util.asn1.type;


import flash.net.RegisterClassAlias;
import com.hurlant.util.ByteArray;

class NullType extends ASN1Type
{
    
    
    public function new()
    {
        super(ASN1Type.NULL);
    }
    
    override private function fromDERContent(s : ByteArray, length : Int) : Dynamic{
        return "NULL";
    }
    private static var init = {
        registerClassAlias("com.hurlant.util.asn1.type.NullType", NullType);
    }

}
