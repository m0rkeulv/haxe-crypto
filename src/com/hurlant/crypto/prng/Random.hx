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

import com.hurlant.util.ArrayUtil;
import com.hurlant.util.ByteArray;
import com.hurlant.util.Memory;
import com.hurlant.util.System;

class Random {
    private var state:IPRNG;
    private var ready:Bool = false;
    private var pool:ByteArray;
    private var psize:Int;
    private var pptr:Int;
    private var seeded:Bool = false;

    public function new(prng:Class<Dynamic> = null) {
        if (prng == null) prng = ARC4;
        state = try cast(Type.createInstance(prng, []), IPRNG) catch (e:Dynamic) null;
        psize = state.getPoolSize();
        pool = new ByteArray();
        pptr = 0;
        while (pptr < psize) {
            var t:Int = Std.random(65536);
            pool[pptr++] = (t >>> 8) & 0xFF;
            pool[pptr++] = (t >>> 0) & 0xFF;
        }
        pptr = 0;
        seed();
    }

    public function seed(x:Int = 0):Void {
        if (x == 0) x = Std.int(Date.now().getTime());
        pool[pptr++] ^= (x >>  0) & 0xFF;
        pool[pptr++] ^= (x >>  8) & 0xFF;
        pool[pptr++] ^= (x >> 16) & 0xFF;
        pool[pptr++] ^= (x >> 24) & 0xFF;
        pptr %= psize;
        seeded = true;
    }

    public function autoSeed():Void {
        // @TODO: Provide real seed stuff
        var data = System.getSecureRandomBytes(512);
        while (data.bytesAvailable >= 4) seed(data.readUnsignedInt());
    }

    public function nextBytes(buffer:ByteArray, length:Int):Void {
        while (length-- > 0) {
            buffer.writeByte(nextByte());
        }
    }

    public function nextByte():Int {
        if (!ready) {
            if (!seeded) autoSeed();
            state.init(pool);
            pool.length = 0;
            pptr = 0;
            ready = true;
        }
        return state.next();
    }

    public function dispose():Void {
        ArrayUtil.secureDisposeByteArray(pool);
        pool = null;
        state.dispose();
        state = null;
        psize = 0;
        pptr = 0;
        Memory.gc();
    }

    public function toString():String {
        return "random-" + state.toString();
    }
}

