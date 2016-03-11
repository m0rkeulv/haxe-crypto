package com.hurlant.util.asn1.type;


import flash.net.RegisterClassAlias;
import com.hurlant.util.ByteArray;

class StringType extends ASN1Type
{
    
    
    public var size1 : Int;public var size2 : Int;
    
    public function new(tag : Int, size1 : Int = Int.MAX_VALUE, size2 : Int = 0)
    {
        super(tag);
        this.size1 = size1;
        this.size2 = size2;
    }
    
    override private function fromDERContent(s : ByteArray, length : Int) : Dynamic{
        // XXX insufficient
        var str : String = s.readMultiByte(length, "US-ASCII");
        return str;
    }
    private static var init = {
        registerClassAlias("com.hurlant.util.asn1.StringType", StringType);
    }

}
