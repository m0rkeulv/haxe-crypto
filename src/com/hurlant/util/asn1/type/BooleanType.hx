package com.hurlant.util.asn1.type;


import flash.net.RegisterClassAlias;

class BooleanType extends ASN1Type
{
    
    public function new()
    {
        super(ASN1Type.BOOLEAN);
    }
    private static var init = {
        registerClassAlias("com.hurlant.util.asn1.BooleanType", BooleanType);
    }

}
