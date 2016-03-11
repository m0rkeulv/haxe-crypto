package com.hurlant.util.asn1.parser;

import com.hurlant.util.asn1.parser.SequenceType;

/**
 * Class for sequence
 */
@:final class ClassForSequence
{
    import com.hurlant.util.asn1.type.ASN1Type;
    import com.hurlant.util.asn1.type.SequenceType;
    
    public function sequence() : ASN1Type{
        var a : Array<Dynamic> = [];
        for (i in 0...p.length){
            a[i] = p[i];
        }
        return new SequenceType(a);
    }

    public function new()
    {
    }
}
