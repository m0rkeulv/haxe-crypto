package com.hurlant.util.asn1.parser;

import com.hurlant.util.asn1.parser.UTF8StringType;

/**
 * Class for utf8String
 */
@:final class ClassForUtf8String
{
    import com.hurlant.util.asn1.type.UTF8StringType;
    
    public function utf8String(size : Int = Int.MAX_VALUE, size2 : Int = 0) : UTF8StringType{
        return new UTF8StringType(size, size2);
    }

    public function new()
    {
    }
}
