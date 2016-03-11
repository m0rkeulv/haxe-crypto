package com.hurlant.util.asn1.type;


import flash.net.RegisterClassAlias;

class GeneralizedTimeType extends ASN1Type
{
    
    
    public function new()
    {
        super(ASN1Type.GENERALIZED_TIME);
    }
    private static var init = {
        registerClassAlias("com.hurlant.util.asn1.GeneralizedTime", GeneralizedTimeType);
    }

}
