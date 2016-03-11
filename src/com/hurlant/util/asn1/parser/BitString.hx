package com.hurlant.util.asn1.parser;

import com.hurlant.util.asn1.parser.BitStringType;

/**
 * Class for bitString
 */
@:final class ClassForBitString
{
    import com.hurlant.util.asn1.type.ASN1Type;
    import com.hurlant.util.asn1.type.BitStringType;
    
    public function bitString() : ASN1Type{
        return new BitStringType();
    }

    public function new()
    {
    }
}
