package com.hurlant.util.asn1.parser;

import com.hurlant.util.asn1.parser.UniversalStringType;

/**
 * Class for universalString
 */
@:final class ClassForUniversalString
{
    import com.hurlant.util.asn1.type.UniversalStringType;
    
    public function universalString(size : Int = Int.MAX_VALUE, size2 : Int = 0) : UniversalStringType{
        return new UniversalStringType(size, size2);
    }

    public function new()
    {
    }
}
