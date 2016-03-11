package com.hurlant.util.asn1.parser;

import com.hurlant.util.asn1.parser.SetType;

/**
 * Class for setOf
 */
@:final class ClassForSetOf
{
    import com.hurlant.util.asn1.type.ASN1Type;
    import com.hurlant.util.asn1.type.SetType;
    
    public function setOf(type : ASN1Type, min : Int = Int.MIN_VALUE, max : Int = Int.MAX_VALUE) : ASN1Type{
        return new SetType(type);
    }

    public function new()
    {
    }
}
