package com.hurlant.util.asn1.parser;


/**
 * Class for sequenceOf
 */
@:final class ClassForSequenceOf
{
    import com.hurlant.util.asn1.type.ASN1Type;
    import com.hurlant.util.asn1.type.SequenceType;
    
    public function sequenceOf(t : ASN1Type, min : Int = Int.MIN_VALUE, max : Int = Int.MAX_VALUE) : ASN1Type{
        return new SequenceType(t);
    }

    public function new()
    {
    }
}
