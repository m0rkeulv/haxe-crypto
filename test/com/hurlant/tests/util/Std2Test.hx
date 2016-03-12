package com.hurlant.tests.util;

import com.hurlant.util.Endian;
import com.hurlant.util.ByteArray;
import com.hurlant.util.Std2;
class Std2Test extends BaseTestCase {
    public function new() { super(); }

    public function test_parseInt() {
        assertEquals(255, Std2.parseInt('FF', 16));
        assertEquals(-255, Std2.parseInt('-FF', 16));
        assertEquals(0x12, Std2.parseInt('12', 16));
        /*
        assertEquals(0x12345678, Std2.parseInt('12345678', 16));
        assertEquals(0x9abcdef0, Std2.parseInt('9abcdef0', 16));
        assertEquals(0xABCDEF, Std2.parseInt('ABCDEF', 16));
        */
        assertEquals(Std.int(0x12345678), Std2.parseHex('12345678'));
        assertEquals(Std.int(0x9abcdef0), Std2.parseInt('9abcdef0', 16));
        assertEquals(Std.int(0x9abcdef0), Std2.parseHex('9abcdef0'));
        assertEquals(Std.int(0xABCDEF), Std2.parseHex('ABCDEF'));
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

    public function test_byteArray2() {
        var ba = new ByteArray();
        ba.endian = Endian.BIG_ENDIAN;
        ba.writeByte(0x11);
        ba.writeByte(0x22);
        ba.writeByte(0x33);
        ba.writeByte(0x44);
        ba.writeByte(0x55);
        ba.position = 1;
        assertEquals(0x22334455, ba.readUnsignedInt());
        ba.position = 1;
        ba.endian = Endian.LITTLE_ENDIAN;
        assertEquals(0x55443322, ba.readUnsignedInt());
    }

    public function test_byteArray3() {
        var ba = new ByteArray();
        ba[ba.length] = 0xFF;
        ba[ba.length] = 0x22;
        assertEquals(0, ba.position);
        assertEquals(2, ba.length);
        assertEquals(0xFF, ba[0]);
        assertEquals(0x22, ba[1]);
    }

    public function test_bswap() {
        assertEquals(0x11223344, Std2.bswap32(0x44332211));
        assertEquals(0x112233FF, Std2.bswap32(0xFF332211));
        assertEquals(0xF4F3F2F1, Std2.bswap32(0xF1F2F3F4));
        assertEquals(0x1122, Std2.bswap16(0x2211));
        assertEquals(0x11FF, Std2.bswap16(0xFF11));
    }
}