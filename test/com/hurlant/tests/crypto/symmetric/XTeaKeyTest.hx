/**
 * XTeaKeyTest
 *
 * A test class for XTeaKey
 * Copyright (c) 2007 Henri Torgemane
 *
 * See LICENSE.txt for full license information.
 */
package com.hurlant.tests.crypto.symmetric;



import com.hurlant.tests.*;

import com.hurlant.crypto.symmetric.XTeaKey;
import com.hurlant.util.Hex;

import com.hurlant.util.ByteArray;

class XTeaKeyTest
{
    
    @:meta(Test())

    public function getBlockSize() : Void{
        var tea : XTeaKey = new XTeaKey(Hex.toArray("deadbabecafebeefdeadbabecafebeef"));
        assert(tea.getBlockSize(), 8);
    }
    
    @:meta(Test())

    public function vectors() : Void{
        // blah.
        // can't find working test vectors.
        // algorithms should not get published without vectors :(
        var keys : Array<Dynamic> = [
        "00000000000000000000000000000000", 
        "2b02056806144976775d0e266c287843"];
        var pts : Array<Dynamic> = [
        "0000000000000000", 
        "74657374206d652e"];
        var cts : Array<Dynamic> = [
        "2dc7e8d3695b0538", 
        "7909582138198783"];
        // self-fullfilling vectors.
        // oh well, at least I can decrypt what I produce. :(
        
        for (i in 0...keys.length){
            var key : ByteArray = Hex.toArray(keys[i]);
            var pt : ByteArray = Hex.toArray(pts[i]);
            var tea : XTeaKey = new XTeaKey(key);
            tea.encrypt(pt);
            var out : String = Hex.fromArray(pt);
            assert(cts[i], out);
            // now go back to plaintext.
            pt.position = 0;
            tea.decrypt(pt);
            out = Hex.fromArray(pt);
            assert(pts[i], out);
        }
    }

    public function new()
    {
    }
}


