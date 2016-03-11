package com.hurlant.util.asn1.type;


class TeletexStringType extends StringType {
    public function new(size1:Int = Int.MAX_VALUE, size2:Int = 0) {
        super(ASN1Type.TELETEX_STRING, size1, size2);
    }
}
