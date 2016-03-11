/**
 * Integer
 * 
 * An ASN1 type for an Integer, represented with a BigInteger
 * Copyright (c) 2007 Henri Torgemane
 * 
 * See LICENSE.txt for full license information.
 */
package com.hurlant.util.der;


import com.hurlant.math.BigInteger;
import com.hurlant.util.ByteArray;

class Integer extends BigInteger implements IAsn1Type {
    private var type:Int;
    private var len:Int;

    public function new(type:Int, length:Int, b:ByteArray) {
        this.type = type;
        this.len = length;
        super(b);
    }

    public function getLength():Int {
        return len;
    }

    public function getType():Int {
        return type;
    }

    override public function toString(radix:Float = 0):String {
        return DER.indent + "Integer[" + type + "][" + len + "][" + super.toString(16) + "]";
    }

    public function toDER():ByteArray {
        return null;
    }
}
