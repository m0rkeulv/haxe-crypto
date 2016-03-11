package com.hurlant.util.asn1.parser;

import com.hurlant.util.asn1.parser.IntegerType;

/**
 * Class for integer
 */
@:final class ClassForInteger
{
    import com.hurlant.util.asn1.type.ASN1Type;
    import com.hurlant.util.asn1.type.IntegerType;
    
    public function integer() : ASN1Type{
        return new IntegerType();
    }

    public function new()
    {
    }
}
