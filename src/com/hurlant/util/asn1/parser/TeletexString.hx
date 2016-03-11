package com.hurlant.util.asn1.parser;

import com.hurlant.util.asn1.parser.TeletexStringType;

/**
 * Class for teletexString
 */
@:final class ClassForTeletexString
{
    import com.hurlant.util.asn1.type.ASN1Type;
    import com.hurlant.util.asn1.type.TeletexStringType;
    
    public function teletexString(size : Int = Int.MAX_VALUE, size2 : Int = 0) : ASN1Type{
        return new TeletexStringType(size, size2);
    }

    public function new()
    {
    }
}
