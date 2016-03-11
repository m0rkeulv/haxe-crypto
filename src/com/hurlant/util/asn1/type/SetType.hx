package com.hurlant.util.asn1.type;

import com.hurlant.util.Error;

import com.hurlant.util.ByteArray;

class SetType extends ASN1Type {
    public var childType:ASN1Type;

    public function new(p:ASN1Type = null) {
        super(ASN1Type.SET);
        childType = p;
    }

    override private function fromDERContent(s:ByteArray, length:Int):Dynamic {
        var p:Int = s.position;
        var left:Int = length;
        var val:Array<Dynamic>;
        var v:Dynamic; // v=individual children, val=entire set
        val = []; // unordered in theory, but this will do.
        while (left > 0) {
            v = childType.fromDER(s, left);
            if (v == null) {
                throw new Error("couldn't parse DER stream.");
            }
            else {
                val.push(v);
            }
            left = length - s.position + p;
        }
        return val;
    }
}
