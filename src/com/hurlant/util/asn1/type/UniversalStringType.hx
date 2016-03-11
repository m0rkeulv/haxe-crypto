package com.hurlant.util.asn1.type;


import flash.net.RegisterClassAlias;

class UniversalStringType extends StringType
{
    
    
    public function new(size1 : Int = Int.MAX_VALUE, size2 : Int = 0)
    {
        super(ASN1Type.UNIVERSAL_STRING, size1, size2);
    }
    private static var init = {
        registerClassAlias("com.hurlant.util.asn1.UniversalStringType", UniversalStringType);
    }

}
