/**
 * BigIntegerTest
 *
 * A test class for BigInteger
 * Copyright (c) 2007 Henri Torgemane
 *
 * See LICENSE.txt for full license information.
 */
package com.hurlant.tests.math;


import com.hurlant.util.Std2;
import com.hurlant.tests.*;

import com.hurlant.math.BigInteger;

import com.hurlant.util.ByteArray;

class BigIntegerTest extends BaseTestCase {
    public function test_add():Void {
//		trace("test_add");
        var n1 = BigInteger.nbv(25);
        var n2 = BigInteger.nbv(1002);
        var n3 = n1.add(n2);
        assert(n3.valueOf(), 1027);

        var p = new BigInteger("e564d8b801a61f47", 16, true);
        var xp = new BigInteger("99246db2a3507fa", 16, true);

        xp = xp.add(p);

        assert(xp.toString(16), "eef71f932bdb2741");
    }

    public function test_signed():Void {
//		trace("test_signed");
        var i1 = new BigInteger("1");
        var i2 = new BigInteger("2");
        var i3 = i1.subtract(i2);
        var arr_i3 = i3.toByteArray(); // FF
        var i4 = new BigInteger(arr_i3);
        var arr_i4 = i4.toByteArray(); // FF
        assert(arr_i3.length, 1);
        assert(arr_i4.length, 1);
        assert(i3.equals(i4));

        assertEquals(false, new BigInteger("1").isEven());
        assertEquals(true, new BigInteger("2").isEven());
        assertEquals(false, new BigInteger("1000000000000000011111111111111111111111111111111110000000000000000000000000000000000000000000001").isEven());
        assertEquals(true, new BigInteger("100000000000000111111111111111111111111111111111110000000000000000000000000000000000000000000000").isEven());
    }

    public function test_signed2():Void {
//		trace("test_signed2");
        assert(BigInteger.nbv(-13).valueOf(), -13);
        assert(BigInteger.nbv(0).valueOf(), 0);
        assert(BigInteger.nbv(13).valueOf(), 13);

        assert(BigInteger.nbv(-13).sigNum(), -1);
        assert(BigInteger.nbv(0).sigNum(), 0);
        assert(BigInteger.nbv(13).sigNum(), 1);
    }

    public function test_subtract():Void {
//		trace("test_subtract");
        var res = BigInteger.nbv(0);
        var one = BigInteger.nbv(16);
        var out = res.subtract(one);
        assert(out.valueOf(), -16);
        assert(out.sigNum(), -1);
    }

    public function test_multiplyMod():Void {
//		trace("test_multiplyMod");
        var a = BigInteger.nbv(100000000);
        var b = BigInteger.nbv(100000000);
        var c = a.multiply(b);
		assertEquals('100000000', a.toString(10)); //simple check
		assertEquals('100', BigInteger.nbv(10).multiply(BigInteger.nbv(10)).toString(10)); //another simple check
        assertEquals('2386f26fc10000', c.toString(16)); //2386f26fc10000
/*
		var x = new BigInteger();
		var y = new BigInteger();
		var z = BigInteger.nbv(299);

		trace("******************");
		z.divRemTo(BigInteger.nbv(100), x, y, true);
		trace(z.toString(10));
		trace(x.toString(10));
		trace(y.toString(10));
		trace("******************");
		trace(z.modPow(BigInteger.nbv(2), BigInteger.nbv(100)).toString(10)); //must be 1
*/		
		assertEquals('99', c.add(BigInteger.nbv(299)).mod(BigInteger.nbv(100)).toString(10));
    }

    public function test_pow():Void {
//		trace("test_pow");
		var a = new BigInteger("0xffff", 16, true);
        assertEquals('1024', BigInteger.nbv(2).pow(10).toString(10));
    }

    public function test_square():Void {
// 		trace("test_square");
		assertEquals('256', BigInteger.nbv(16).square().toString(10));
        assertEquals('2386f26fc10000', BigInteger.nbv(100000000).square().toString(16));
	    assertEquals('fffffffffffffffe0000000000000001', (new BigInteger("0xffffffffffffffff", 16, true)).square().toString(16));
    }

    public function test_toAndFromString():Void {
// 		trace("test_toAndFromString");
       var a:BigInteger;

        a = new BigInteger("1", 10);
        assert(a.toString(10), "1");

        a = new BigInteger("112374128763487126349871263984761238", 10);
        assert(a.toString(10), "112374128763487126349871263984761238");

        a = new BigInteger("0", 10);
        assert(a.toString(10), "0");

        a = new BigInteger("0xffff", 16, true);
        assert(a.toString(10), "65535");
        assert(a.toString(16), "ffff");

        a = new BigInteger("-1", 10);
        assert(a.toString(10), "-1");

        assert(new BigInteger("-1", 10).sigNum(), -1);
        assert(new BigInteger("1", 10).sigNum(), 1);
        assert(new BigInteger("0", 10).sigNum(), 0);

        a = new BigInteger("-987341928347812763498237649812763498172634", 10);
        assert(a.toString(10), "-987341928347812763498237649812763498172634");
    }

    public function test_compareTo():Void {
// 		trace("test_compareTo");
       var a:BigInteger;
        var b:BigInteger;

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

    public function test_toAndFromByteArray():Void {
//		trace("test_toAndFromByteArray");
        var a:BigInteger;
        var b:ByteArray;
        a = new BigInteger("0", 10);
        b = a.toByteArray();
        b.position = 0;
        assert(new BigInteger(b, 0).toString(10), "0");

        a = new BigInteger("1", 10);
        b = a.toByteArray();
        b.position = 0;
        assert((new BigInteger(b, 0)).toString(10), "1");

        a = new BigInteger("-1", 10);
        b = a.toByteArray();
        b.position = 0;
        assert((new BigInteger(b, 0)).toString(10), "-1");

        a = new BigInteger("123469827364987236498234", 10);
        b = a.toByteArray();
        b.position = 0;
        assert((new BigInteger(b, 0)).toString(10), "123469827364987236498234");

        a = new BigInteger("-298471293048701923847", 10);
        b = a.toByteArray();
        b.position = 0;
        assert((new BigInteger(b, 0)).toString(10), "-298471293048701923847");
    }
	
}
