package com.hurlant.util.asn1.parser;

import com.hurlant.util.asn1.parser.ChoiceType;

/**
 * Class for choice
 */
@:final class ClassForChoice
{
    import com.hurlant.util.asn1.type.ASN1Type;
    import com.hurlant.util.asn1.type.ChoiceType;
    
    public function choice() : ASN1Type{
        var a : Array<Dynamic> = [];
        for (i in 0...p.length){
            a[i] = p[i];
        }
        return new ChoiceType(a);
    }

    public function new()
    {
    }
}
