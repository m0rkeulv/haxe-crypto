package com.hurlant.tests.util;

import com.hurlant.util.ByteArray;
import com.hurlant.util.Std2;
class Std2Test extends BaseTestCase {
    public function new() { super(); }

    public function test_parseInt() {
        assertEquals(255, Std2.parseInt('FF', 16));
        assertEquals(-255, Std2.parseInt('-FF', 16));
    }

    public function test_byteArray() {
        var ba = new ByteArray();
        assertEquals(0, ba.length);
        assertEquals(0, ba.position);
        assertEquals(0, ba.bytesAvailable);
        ba.writeUnsignedInt(0x12345678);
        assertEquals(0x12, ba[0]);
        assertEquals(0x34, ba[1]);
        assertEquals(0x56, ba[2]);
        assertEquals(0x78, ba[3]);
        assertEquals(4, ba.length);
        assertEquals(4, ba.position);
        assertEquals(0, ba.bytesAvailable);
        ba.writeMultiByte('test', 'ascii');
        assertEquals('t'.charCodeAt(0), ba[4]);
        assertEquals('e'.charCodeAt(0), ba[5]);
        assertEquals('s'.charCodeAt(0), ba[6]);
        assertEquals('t'.charCodeAt(0), ba[7]);
        assertEquals(8, ba.length);
        assertEquals(8, ba.position);
        assertEquals(0, ba.bytesAvailable);
    }
}