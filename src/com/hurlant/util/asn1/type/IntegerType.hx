package com.hurlant.util.asn1.type;



import com.hurlant.math.BigInteger;

import flash.net.RegisterClassAlias;
import com.hurlant.util.ByteArray;

class IntegerType extends ASN1Type
{
    
    public function new()
    {
        super(ASN1Type.INTEGER);
    }
    
    /**
		 * 
		 * @param s
		 * @param length
		 * @return a BigInteger or a int, if it fits within one. 
		 * 
		 */
    override private function fromDERContent(s : ByteArray, length : Int) : Dynamic{
        var p : Int = s.position;
        var left : Int = length;
        var b : ByteArray = new ByteArray();
        s.readBytes(b, 0, length);
        b.position = 0;
        var i : BigInteger = new BigInteger(b);
        // return a primitive type if it fits within one
        if (i.bitLength() < 31) {
            return i.intValue();
        }
        else {
            return i;
        }
    }
    private static var init = {
        registerClassAlias("com.hurlant.util.asn1.IntegerType", IntegerType);
    }

}

