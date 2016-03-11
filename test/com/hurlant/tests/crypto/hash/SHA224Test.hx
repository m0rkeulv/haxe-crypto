/**
 * SHA224Test
 *
 * A test class for SHA224
 * Copyright (c) 2007 Henri Torgemane
 *
 * See LICENSE.txt for full license information.
 */
package com.hurlant.tests.crypto.hash;



import com.hurlant.tests.*;

import com.hurlant.crypto.hash.SHA224;
import com.hurlant.util.Hex;

import com.hurlant.util.ByteArray;

class SHA224Test
{
    
    /**
		 * Test vectors courtesy of
		 * http://www.ietf.org/rfc/rfc3874.txt
		 */
    @:meta(Test())

    public function sha224() : Void{
        var srcs : Array<Dynamic> = [
        Hex.fromString("abc"), 
        Hex.fromString("abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq")];
        var hashes : Array<Dynamic> = [
        "23097d223405d8228642a477bda255b32aadbce4bda0b3f7e36c9da7", 
        "75388b16512776cc5dba5da1fd890150b0c6455cb4f58b1952522525"];
        
        var sha224 : SHA224 = new SHA224();
        for (i in 0...srcs.length){
            var src : ByteArray = Hex.toArray(srcs[i]);
            var digest : ByteArray = sha224.hash(src);
            assert(Hex.fromArray(digest), hashes[i]);
        }
    }
    
    @:meta(Test())

    public function longSha224() : Void{
        var src : ByteArray = new ByteArray();
        var a : Int = "a".charCodeAt(0);
        for (i in 0...1e6){
            src[i] = a;
        }
        var sha224 : SHA224 = new SHA224();
        var digest : ByteArray = sha224.hash(src);
        var hash : String = "20794655980c91d8bbb4c1ea97618a4bf03f42581948b2ee4ee7ad67";
        assert(Hex.fromArray(digest), hash);
    }

    public function new()
    {
    }
}


