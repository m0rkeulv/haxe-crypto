package com.hurlant.util.asn1.parser;


/**
 * Class for implicitTag
 */
@:final class ClassForImplicitTag
{
    import com.hurlant.util.asn1.type.ASN1Type;
    
    public function implicitTag(v : Int, c : Int, o : ASN1Type) : ASN1Type{
        o = o.clone();
        o.implicitTag = v;
        o.implicitClass = c;
        return o;
    }

    public function new()
    {
    }
}
