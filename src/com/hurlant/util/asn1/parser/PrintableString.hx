package com.hurlant.util.asn1.parser;

import com.hurlant.util.asn1.parser.PrintableStringType;

/**
 * Class for printableString
 */
@:final class ClassForPrintableString
{
    import com.hurlant.util.asn1.type.ASN1Type;
    import com.hurlant.util.asn1.type.PrintableStringType;
    
    public function printableString(size : Int = Int.MAX_VALUE, size2 : Int = 0) : ASN1Type{
        return new PrintableStringType(size, size2);
    }

    public function new()
    {
    }
}
