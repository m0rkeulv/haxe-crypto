/**
 * PKCS5
 * 
 * A padding implementation of PKCS5.
 * Copyright (c) 2007 Henri Torgemane
 * 
 * See LICENSE.txt for full license information.
 */
package com.hurlant.crypto.symmetric;

import haxe.Int32;
import com.hurlant.util.Error;

import com.hurlant.util.ByteArray;

class PKCS5 implements IPad {
    private var blockSize:Int32;

    public function new(blockSize:Int32 = 0) {
        this.blockSize = blockSize;
    }

    public function pad(a:ByteArray):Void {
        var c:Int32 = blockSize - a.length % blockSize;
        for (i in 0...c) a[a.length] = c;
    }

    public function unpad(a:ByteArray):Void {
        var c:Int32 = a.length % blockSize;
        if (c != 0) throw new Error("PKCS#5::unpad: ByteArray.length isn't a multiple of the blockSize");
        c = a[a.length - 1];
        var i:Int32 = c;
        while (i > 0) {
            var v:Int32 = a[a.length - 1];
            a.length = a.length - 1;
            if (c != v) throw new Error("PKCS#5:unpad: Invalid padding value. expected [" + c + "], found [" + v + "]");
            i--;
        } // that is all.
    }

    public function setBlockSize(bs:Int32):Void {
        blockSize = bs;
    }
}
