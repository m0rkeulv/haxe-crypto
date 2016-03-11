/**
 * ECBMode
 * 
 * An ActionScript 3 implementation of the ECB confidentiality mode
 * Copyright (c) 2007 Henri Torgemane
 * 
 * See LICENSE.txt for full license information.
 */
package com.hurlant.crypto.symmetric;

import com.hurlant.crypto.symmetric.ICipher;
import com.hurlant.crypto.symmetric.IMode;
import com.hurlant.crypto.symmetric.IPad;
import com.hurlant.crypto.symmetric.ISymmetricKey;
import com.hurlant.crypto.symmetric.PKCS5;
import nme.errors.Error;

import com.hurlant.util.ByteArray;
import com.hurlant.util.Memory;

/**
	 * ECB mode.
	 * This uses a padding and a symmetric key.
	 * If no padding is given, PKCS#5 is used.
	 */
class ECBMode implements IMode implements ICipher
{
    private var key : ISymmetricKey;
    private var padding : IPad;
    
    public function new(key : ISymmetricKey, padding : IPad = null)
    {
        this.key = key;
        if (padding == null) {
            padding = new PKCS5(key.getBlockSize());
        }
        else {
            padding.setBlockSize(key.getBlockSize());
        }
        this.padding = padding;
    }
    
    public function getBlockSize() : Int{
        return key.getBlockSize();
    }
    
    public function encrypt(src : ByteArray) : Void{
        padding.pad(src);
        src.position = 0;
        var blockSize : Int = key.getBlockSize();
        var tmp : ByteArray = new ByteArray();
        var dst : ByteArray = new ByteArray();
        var i : Int = 0;
        while (i < src.length){
            tmp.length = 0;
            src.readBytes(tmp, 0, blockSize);
            key.encrypt(tmp);
            dst.writeBytes(tmp);
            i += blockSize;
        }
        src.length = 0;
        src.writeBytes(dst);
    }
    public function decrypt(src : ByteArray) : Void{
        src.position = 0;
        var blockSize : Int = key.getBlockSize();
        
        // sanity check.
        if (src.length % blockSize != 0) {
            throw new Error("ECB mode cipher length must be a multiple of blocksize " + blockSize);
        }
        
        var tmp : ByteArray = new ByteArray();
        var dst : ByteArray = new ByteArray();
        var i : Int = 0;
        while (i < src.length){
            tmp.length = 0;
            src.readBytes(tmp, 0, blockSize);
            
            key.decrypt(tmp);
            dst.writeBytes(tmp);
            i += blockSize;
        }
        padding.unpad(dst);
        src.length = 0;
        src.writeBytes(dst);
    }
    public function dispose() : Void{
        key.dispose();
        key = null;
        padding = null;
        Memory.gc();
    }
    public function toString() : String{
        return Std.string(key) + "-ecb";
    }
}
