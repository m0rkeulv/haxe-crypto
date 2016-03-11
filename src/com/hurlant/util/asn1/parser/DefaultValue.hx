package com.hurlant.util.asn1.parser;


/**
 * Class for defaultValue
 */
@:final class ClassForDefaultValue
{
    import com.hurlant.util.asn1.type.ASN1Type;
    
    public function defaultValue(value : Dynamic, o : ASN1Type) : ASN1Type{
        o = o.clone();
        o.defaultValue = value;
        return o;
    }

    public function new()
    {
    }
}
