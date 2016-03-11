/**
 * HexTest
 *
 * Tests for hex utility
 *
 * @author	Tim Kurvers <tim@moonsphere.net>
 */
package com.hurlant.tests.util;



import com.hurlant.tests.*;
import com.hurlant.util.ArrayUtil;
import com.hurlant.util.Hex;

import com.hurlant.util.ByteArray;

class HexTest extends BaseTestCase
{
    
    @:meta(Test())

    public function toArray() : Void{
        var ba : ByteArray = new ByteArray();
        ba.writeByte(0x00);
        ba.writeByte(0xBA);
        ba.writeByte(0xDA);
        ba.writeByte(0x55);
        ba.writeByte(0x00);
        
        // Varied casing
        assert(ArrayUtil.equals(Hex.toArray("00bada5500"), ba));
        assert(ArrayUtil.equals(Hex.toArray("00BADA5500"), ba));
        
        // Without first nibble
        assert(ArrayUtil.equals(Hex.toArray("0BADA5500"), ba));
        
        // Prefixed
        assert(ArrayUtil.equals(Hex.toArray("0x00BADA5500"), ba));
        
        // Colon-laced
        assert(ArrayUtil.equals(Hex.toArray("00:BA:DA:55:00"), ba));
        
        // Whitespaced
        assert(ArrayUtil.equals(Hex.toArray("00 BA DA 55 00"), ba));
    }
    
    @:meta(Test())

    public function fromArray() : Void{
        var ba : ByteArray = new ByteArray();
        ba.writeByte(0x00);
        ba.writeByte(0xBA);
        ba.writeByte(0xDA);
        ba.writeByte(0x55);
        ba.writeByte(0x00);
        
        assert(Hex.fromArray(ba), "00bada5500");
    }
    
    @:meta(Test())

    public function toString() : Void{
        assert(Std.string(Hex), "as3crypto");
        
        assert(Std.string(Hex), "⸮");
        assert(Hex.toRawString("e2b8ae"), "â¸®");
    }
    
    @:meta(Test())

    public function fromString() : Void{
        assert(Hex.fromString("as3crypto"), "61733363727970746f");
        
        assert(Hex.fromString("⸮"), "e2b8ae");
        assert(Hex.fromRawString("â¸®"), "e2b8ae");
    }

    public function new()
    {
        super();
    }
}


