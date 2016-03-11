package com.hurlant.util.asn1.parser;

import com.hurlant.util.asn1.parser.IA5StringType;

/**
 * Class for ia5String
 */
@:final class ClassForIa5String
{
    import com.hurlant.util.asn1.type.IA5StringType;
    
    public function ia5String(size : Int = Int.MAX_VALUE, size2 : Int = 0) : IA5StringType{
        return new IA5StringType(size, size2);
    }

    public function new()
    {
    }
}
