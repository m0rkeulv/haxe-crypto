package com.hurlant.util.asn1.parser;


/**
 * Class for explicitTag
 */
@:final class ClassForExplicitTag
{
    import com.hurlant.util.asn1.type.ASN1Type;
    
    public function explicitTag(v : Int, c : Int, o : ASN1Type) : ASN1Type{
        o = o.clone();
        o.explicitTag = v;
        o.explicitClass = c;
        return o;
    }

    public function new()
    {
    }
}
