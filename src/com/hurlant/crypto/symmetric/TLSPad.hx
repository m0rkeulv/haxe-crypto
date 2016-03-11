/**
 * TLSPad
 * 
 * A padding implementation used by TLS
 * Copyright (c) 2007 Henri Torgemane
 * 
 * See LICENSE.txt for full license information.
 */
package com.hurlant.crypto.symmetric;



import com.hurlant.util.ByteArray;

class TLSPad implements IPad
{
    private var blockSize : Int;
    
    public function new(blockSize : Int = 0)
    {
        this.blockSize = blockSize;
    }
    public function pad(a : ByteArray) : Void{
        var c : Int = blockSize - (a.length + 1) % blockSize;
        for (i in 0...c + 1){
            a[a.length] = c;
        }
    }
    public function unpad(a : ByteArray) : Void{
        var c : Int = a.length % blockSize;
        if (c != 0)             throw new TLSError("TLSPad::unpad: ByteArray.length isn't a multiple of the blockSize", TLSError.bad_record_mac);
        c = a[a.length - 1];
        var i : Int = c;
        while (i > 0){
            var v : Int = a[a.length - 1];
            a.length--;
            if (c != v)                 throw new TLSError("TLSPad:unpad: Invalid padding value. expected [" + c + "], found [" + v + "]", TLSError.bad_record_mac);
            i--;
        }
        a.length--;
    }
    public function setBlockSize(bs : Int) : Void{
        blockSize = bs;
    }
}
