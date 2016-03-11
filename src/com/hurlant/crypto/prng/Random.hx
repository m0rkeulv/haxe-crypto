/**
 * Random
 * 
 * An ActionScript 3 implementation of a Random Number Generator
 * Copyright (c) 2007 Henri Torgemane
 * 
 * Derived from:
 * 		The jsbn library, Copyright (c) 2003-2005 Tom Wu
 * 
 * See LICENSE.txt for full license information.
 */
package com.hurlant.crypto.prng;

import com.hurlant.crypto.prng.Prng;

import com.hurlant.util.ByteArray;
import com.hurlant.util.Memory;
import flash.system.System;
import flash.system.Capabilities;

import flash.text.Font;

class Random
{
    private var state : IPRNG;
    private var ready : Bool = false;
    private var pool : ByteArray;
    private var psize : Int;
    private var pptr : Int;
    private var seeded : Bool = false;
    
    public function new(prng : Class<Dynamic> = null)
    {
        if (prng == null)             prng = ARC4;
        state = try cast(Type.createInstance(prng, []), IPRNG) catch(e:Dynamic) null;
        psize = state.getPoolSize();
        pool = new ByteArray();
        pptr = 0;
        while (pptr < psize){
            var t : Int = 65536 * Math.random();
            pool[pptr++] = t >>> 8;
            pool[pptr++] = t & 255;
        }
        pptr = 0;
        seed();
    }
    
    public function seed(x : Int = 0) : Void{
        if (x == 0) {
            x = Date.now().getTime();
        }
        pool[pptr++] ^= x & 255;
        pool[pptr++] ^= (x >> 8) & 255;
        pool[pptr++] ^= (x >> 16) & 255;
        pool[pptr++] ^= (x >> 24) & 255;
        pptr %= psize;
        seeded = true;
    }
    
    /**
		 * Gather anything we have that isn't entirely predictable:
		 *  - memory used
		 *  - system capabilities
		 *  - timing stuff
		 *  - installed fonts
		 */
    public function autoSeed() : Void{
        var b : ByteArray = new ByteArray();
        b.writeUnsignedInt(System.totalMemory);
        b.writeUTF(Capabilities.serverString);
        b.writeUnsignedInt(Math.round(haxe.Timer.stamp() * 1000));
        b.writeUnsignedInt((Date.now()).getTime());
        var a : Array<Dynamic> = Font.enumerateFonts(true);
        for (f in a){
            b.writeUTF(f.fontName);
            b.writeUTF(f.fontStyle);
            b.writeUTF(f.fontType);
        }
        b.position = 0;
        while (b.bytesAvailable >= 4){
            seed(b.readUnsignedInt());
        }
    }
    
    
    public function nextBytes(buffer : ByteArray, length : Int) : Void{
        while (length--){
            buffer.writeByte(nextByte());
        }
    }
    public function nextByte() : Int{
        if (!ready) {
            if (!seeded) {
                autoSeed();
            }
            state.init(pool);
            pool.length = 0;
            pptr = 0;
            ready = true;
        }
        return state.next();
    }
    public function dispose() : Void{
        for (i in 0...pool.length){
            pool[i] = Math.random() * 256;
        }
        pool.length = 0;
        pool = null;
        state.dispose();
        state = null;
        psize = 0;
        pptr = 0;
        Memory.gc();
    }
    public function toString() : String{
        return "random-" + Std.string(state);
    }
}

