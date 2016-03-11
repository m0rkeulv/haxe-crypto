/**
 * BigIntegerTest
 *
 * A test class for BigInteger
 * Copyright (c) 2007 Henri Torgemane
 *
 * See LICENSE.txt for full license information.
 */
package com.hurlant.tests.math;



import com.hurlant.tests.*;

import com.hurlant.math.BigInteger;

import com.hurlant.util.ByteArray;

class BigIntegerTest extends BaseTestCase
{
    
    @:meta(Test())

    public function add() : Void{
        var n1 : BigInteger = BigInteger.nbv(25);
        var n2 : BigInteger = BigInteger.nbv(1002);
        var n3 : BigInteger = n1.add(n2);
        assert(n3.valueOf(), 1027);
        
        var p : BigInteger = new BigInteger("e564d8b801a61f47", 16, true);
        var xp : BigInteger = new BigInteger("99246db2a3507fa", 16, true);
        
        xp = xp.add(p);
        
        assert(Std.string(xp), "eef71f932bdb2741");
    }
    
    @:meta(Test())

    public function signed() : Void{
        var i1 : BigInteger = new BigInteger("1");
        var i2 : BigInteger = new BigInteger("2");
        var i3 : BigInteger = i1.subtract(i2);
        var arr_i3 : ByteArray = i3.toByteArray();  // FF  
        var i4 : BigInteger = new BigInteger(arr_i3);
        var arr_i4 : ByteArray = i4.toByteArray();  // FF  
        assert(arr_i3.length, 1);
        assert(arr_i4.length, 1);
        assert(i3.equals(i4));
    }
    
    @:meta(Test())

    public function signed2() : Void{
        var i1 : BigInteger = BigInteger.nbv(-13);
        assert(i1.valueOf(), -13);
    }
    
    @:meta(Test())

    public function toAndFromString() : Void{
        var a : BigInteger;
        
        a = new BigInteger("1", 10);
        assert(Std.string(a), "1");
        
        a = new BigInteger("112374128763487126349871263984761238", 10);
        assert(Std.string(a), "112374128763487126349871263984761238");
        
        a = new BigInteger("0", 10);
        assert(Std.string(a), "0");
        
        a = new BigInteger("-1", 10);
        assert(Std.string(a), "-1");
        
        a = new BigInteger("-987341928347812763498237649812763498172634", 10);
        assert(Std.string(a), "-987341928347812763498237649812763498172634");
        
        a = new BigInteger("0xffff", 16, true);
        assert(Std.string(a), "65535");
        assert(Std.string(a), "ffff");
    }
    
    @:meta(Test())

    public function compareTo() : Void{
        var a : BigInteger;
        var b : BigInteger;
        
        a = new BigInteger("983741897234", 10);
        b = new BigInteger("123981238416", 10);
        assert(a.compareTo(b) > 0);
        
        a = new BigInteger("-1", 10);
        b = new BigInteger("1", 10);
        assert(a.compareTo(b) < 0);
        
        a = new BigInteger("1", 10);
        b = new BigInteger("-1", 10);
        assert(a.compareTo(b) > 0);
        
        a = new BigInteger("1", 10);
        b = new BigInteger("1", 10);
        assert(a.compareTo(b), 0);
        
        a = new BigInteger("0", 10);
        b = new BigInteger("0", 10);
        assert(a.compareTo(b), 0);
        
        a = new BigInteger("-12461273864", 10);
        b = new BigInteger("29138479128374", 10);
        assert(a.compareTo(b) < 0);
        
        a = new BigInteger("9223372036854775807", 10);
        b = new BigInteger("-9223372036854775808", 10);
        assert(a.compareTo(b) > 0);
        
        a = new BigInteger("-1", 10);
        b = new BigInteger("-9223372036854775808", 10);
        assert(a.compareTo(b) > 0);
        
        a = new BigInteger("-1", 10);
        b = new BigInteger("9223372036854775807", 10);
        assert(a.compareTo(b) < 0);
    }
    
    @:meta(Test())

    public function toAndFromByteArray() : Void{
        var a : BigInteger;
        var b : ByteArray;
        a = new BigInteger("0", 10);
        b = a.toByteArray();
        b.position = 0;
        assert(Std.string(new BigInteger(b, 0)), "0");
        
        a = new BigInteger("1", 10);
        b = a.toByteArray();
        b.position = 0;
        assert(Std.string(new BigInteger(b, 0)), "1");
        
        a = new BigInteger("-1", 10);
        b = a.toByteArray();
        b.position = 0;
        assert(Std.string(new BigInteger(b, 0)), "-1");
        
        a = new BigInteger("123469827364987236498234", 10);
        b = a.toByteArray();
        b.position = 0;
        assert(Std.string(new BigInteger(b, 0)), "123469827364987236498234");
        
        a = new BigInteger("-298471293048701923847", 10);
        b = a.toByteArray();
        b.position = 0;
        assert(Std.string(new BigInteger(b, 0)), "-298471293048701923847");
    }

    public function new()
    {
    }
}


