/**
 * PrintableString
 * 
 * An ASN1 type for a PrintableString, held within a String
 * Copyright (c) 2007 Henri Torgemane
 * 
 * See LICENSE.txt for full license information.
 */
package com.hurlant.util.der;


import com.hurlant.util.ByteArray;

class PrintableString implements IAsn1Type
{
    private var type : Int;
    private var len : Int;
    private var str : String;
    
    public function new(type : Int, length : Int)
    {
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
    
    public function setString(s : String) : Void{
        str = s;
    }
    public function getString() : String{
        return str;
    }
    
    public function toString() : String{
        return DER.indent + str;
    }
    
    public function toDER() : ByteArray{
        return null;
    }
}
