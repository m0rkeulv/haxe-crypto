package com.hurlant.util.asn1.type;

import com.hurlant.util.asn1.type.StringType;

class PrintableStringType extends StringType {
    public function new(size1:Int = Int.MAX_VALUE, size2:Int = 0) {
        super(ASN1Type.PRINTABLE_STRING, size1, size2);
    }
}
