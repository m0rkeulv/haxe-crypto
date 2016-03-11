package com.hurlant.util.asn1.parser;

import com.hurlant.util.asn1.parser.BMPStringType;

/**
 * Class for bmpString
 */
@:final class ClassForBmpString
{
    import com.hurlant.util.asn1.type.BMPStringType;
    
    public function bmpString(size : Int = Int.MAX_VALUE, size2 : Int = 0) : BMPStringType{
        return new BMPStringType(size, size2);
    }

    public function new()
    {
    }
}
