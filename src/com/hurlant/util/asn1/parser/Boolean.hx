package com.hurlant.util.asn1.parser;

import com.hurlant.util.asn1.parser.BooleanType;

/**
 * Class for boolean
 */
@:final class ClassForBoolean
{
    import com.hurlant.util.asn1.type.ASN1Type;
    import com.hurlant.util.asn1.type.BooleanType;
    
    public function Bool() : ASN1Type{
        return new BooleanType();
    }

    public function new()
    {
    }
}
