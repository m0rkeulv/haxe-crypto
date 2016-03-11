package com.hurlant.util.asn1.parser;

import com.hurlant.util.asn1.parser.UTCTimeType;

/**
 * Class for utcTime
 */
@:final class ClassForUtcTime
{
    import com.hurlant.util.asn1.type.UTCTimeType;
    
    
    public function utcTime() : UTCTimeType{
        return new UTCTimeType();
    }

    public function new()
    {
    }
}
