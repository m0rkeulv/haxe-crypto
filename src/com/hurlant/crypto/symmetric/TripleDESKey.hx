/**
 * TripleDESKey
 * 
 * An Actionscript 3 implementation of Triple DES
 * Copyright (c) 2007 Henri Torgemane
 * 
 * Derived from:
 * 		The Bouncy Castle Crypto package, 
 * 		Copyright (c) 2000-2004 The Legion Of The Bouncy Castle
 * 		(http://www.bouncycastle.org)
 * 
 * See LICENSE.txt for full license information.
 */
package com.hurlant.crypto.symmetric;


import com.hurlant.util.ByteArray;
import com.hurlant.util.Memory;

class TripleDESKey extends DESKey
{
    private var encKey2 : Array<Dynamic>;
    private var encKey3 : Array<Dynamic>;
    private var decKey2 : Array<Dynamic>;
    private var decKey3 : Array<Dynamic>;
    
    /**
		 * This supports 2TDES and 3TDES.
		 * If the key passed is 128 bits, 2TDES is used.
		 * If the key has 192 bits, 3TDES is used.
		 * Other key lengths give "undefined" results.
		 */
    public function new(key : ByteArray)
    {
        super(key);
        encKey2 = generateWorkingKey(false, key, 8);
        decKey2 = generateWorkingKey(true, key, 8);
        if (key.length > 16) {
            encKey3 = generateWorkingKey(true, key, 16);
            decKey3 = generateWorkingKey(false, key, 16);
        }
        else {
            encKey3 = encKey;
            decKey3 = decKey;
        }
    }
    
    override public function dispose() : Void
    {
        super.dispose();
        var i : Int = 0;
        if (encKey2 != null) {
            for (i in 0...encKey2.length){encKey2[i] = 0;
            }
            encKey2 = null;
        }
        if (encKey3 != null) {
            for (i in 0...encKey3.length){encKey3[i] = 0;
            }
            encKey3 = null;
        }
        if (decKey2 != null) {
            for (i in 0...decKey2.length){decKey2[i] = 0;
            }
            decKey2 = null;
        }
        if (decKey3 != null) {
            for (i in 0...decKey3.length){decKey3[i] = 0;
            }
            decKey3 = null;
        }
        Memory.gc();
    }
    
    override public function encrypt(block : ByteArray, index : Int = 0) : Void
    {
        desFunc(encKey, block, index, block, index);
        desFunc(encKey2, block, index, block, index);
        desFunc(encKey3, block, index, block, index);
    }
    
    override public function decrypt(block : ByteArray, index : Int = 0) : Void
    {
        desFunc(decKey3, block, index, block, index);
        desFunc(decKey2, block, index, block, index);
        desFunc(decKey, block, index, block, index);
    }
    
    override public function toString() : String{
        return "3des";
    }
}
