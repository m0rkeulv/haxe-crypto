/**
 * XTeaKey
 * 
 * An ActionScript 3 implementation of the XTea algorithm
 * Copyright (c) 2007 Henri Torgemane
 * 
 * See LICENSE.txt for full license information.
 */
package com.hurlant.crypto.symmetric;


import com.hurlant.util.Std2;
import com.hurlant.crypto.prng.Random;
import com.hurlant.util.Memory;

import com.hurlant.util.ByteArray;


class XTeaKey implements ISymmetricKey
{
    public var NUM_ROUNDS : Int = 64;
    private var k : Array<Dynamic>;
    
    public function new(a : ByteArray)
    {
        a.position = 0;
        k = [a.readUnsignedInt(), a.readUnsignedInt(), a.readUnsignedInt(), a.readUnsignedInt()];
    }
    /**
		 * K is an hex string with 32 digits.
		 */
    public static function parseKey(K : String) : XTeaKey{
        var a : ByteArray = new ByteArray();
        a.writeUnsignedInt(Std2.parseInt(K.substr(0, 8), 16));
        a.writeUnsignedInt(Std2.parseInt(K.substr(8, 8), 16));
        a.writeUnsignedInt(Std2.parseInt(K.substr(16, 8), 16));
        a.writeUnsignedInt(Std2.parseInt(K.substr(24, 8), 16));
        a.position = 0;
        return new XTeaKey(a);
    }
    
    public function getBlockSize() : Int{
        return 8;
    }
    
    public function encrypt(block : ByteArray, index : Int = 0) : Void{
        block.position = index;
        var v0 : Int = block.readUnsignedInt();
        var v1 : Int = block.readUnsignedInt();
        var i : Int;
        var sum : Int = 0;
        var delta : Int = 0x9E3779B9;
        for (i in 0...NUM_ROUNDS){
            v0 += (((v1 << 4) ^ (v1 >> 5)) + v1) ^ (sum + k[sum & 3]);
            sum += delta;
            v1 += (((v0 << 4) ^ (v0 >> 5)) + v0) ^ (sum + k[(sum >> 11) & 3]);
        }
        block.position -= 8;
        block.writeUnsignedInt(v0);
        block.writeUnsignedInt(v1);
    }
    
    public function decrypt(block : ByteArray, index : Int = 0) : Void{
        block.position = index;
        var v0 : Int = block.readUnsignedInt();
        var v1 : Int = block.readUnsignedInt();
        var i : Int;
        var delta : Int = 0x9E3779B9;
        var sum : Int = delta * NUM_ROUNDS;
        for (i in 0...NUM_ROUNDS){
            v1 -= (((v0 << 4) ^ (v0 >> 5)) + v0) ^ (sum + k[(sum >> 11) & 3]);
            sum -= delta;
            v0 -= (((v1 << 4) ^ (v1 >> 5)) + v1) ^ (sum + k[sum & 3]);
        }
        block.position -= 8;
        block.writeUnsignedInt(v0);
        block.writeUnsignedInt(v1);
    }
    
    public function dispose() : Void{
        //private var k:Array;
        var r : Random = new Random();
        for (i in 0...k.length){
            k[i] = r.nextByte();
        }
        k = null;
        Memory.gc();
    }
    
    public function toString() : String{
        return "xtea";
    }
}


