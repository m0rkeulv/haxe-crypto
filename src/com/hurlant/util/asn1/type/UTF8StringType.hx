package com.hurlant.util.asn1.type;


class UTF8StringType extends StringType {
    public function new(size1:Int = Int.MAX_VALUE, size2:Int = 0) {
        super(ASN1Type.UTF8STRING, size1, size2);
    }
}
