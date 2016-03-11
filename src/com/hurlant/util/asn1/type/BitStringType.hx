package com.hurlant.util.asn1.type;


import flash.net.RegisterClassAlias;
import com.hurlant.util.ByteArray;

class BitStringType extends ASN1Type
{
    
    
    public function new()
    {
        super(ASN1Type.BIT_STRING);
    }
    
    override private function fromDERContent(s : ByteArray, length : Int) : Dynamic{
        // structure: one byte telling us how many bits of padding we have
        //            length-1 bytes of actual data.
        // I don't really feel like dealing with bitstrings that don't fit exactly in bytes, though. XXX
        s.readUnsignedByte();  // I could assert if this is not zero, at least. FIXME  
        var b : ByteArray = new ByteArray();
        s.readBytes(b, 0, length - 1);
        return b;
    }
    private static var init = {
        registerClassAlias("com.hurlant.util.asn1.BitStringType", BitStringType);
    }

}
