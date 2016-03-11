/**
 * ByteString
 * 
 * An ASN1 type for a ByteString, represented with a ByteArray
 * Copyright (c) 2007 Henri Torgemane
 * 
 * See LICENSE.txt for full license information.
 */
package com.hurlant.util.der;

import com.hurlant.util.der.IAsn1Type;

import com.hurlant.util.ByteArray;
import com.hurlant.util.Hex;

class ByteString extends ByteArray implements IAsn1Type
{
    private var type : Int;
    private var len : Int;
    
    public function new(type : Int = 0x04, length : Int = 0x00)
    {
        super();
        this.type = type;
        this.len = length;
    }
    
    public function getLength() : Int
    {
        return len;
    }
    
    public function getType() : Int
    {
        return type;
    }
    
    public function toDER() : ByteArray{
        return DER.wrapDER(type, this);
    }
    
    override public function toString() : String{
        return DER.indent + "ByteString[" + type + "][" + len + "][" + Hex.fromArray(this) + "]";
    }
}
