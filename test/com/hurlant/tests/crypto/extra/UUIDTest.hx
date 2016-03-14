package com.hurlant.tests.crypto.extra;

import com.hurlant.crypto.prng.RandomSequenceMock;
import com.hurlant.util.ByteArray;
import haxe.Int32;
import com.hurlant.tests.BaseTestCase;
import com.hurlant.util.Hex;
import com.hurlant.crypto.extra.UUID;
import com.hurlant.crypto.extra.UUID.Variant;
class UUIDTest extends BaseTestCase {
    public function test_simple() {
        // xxxxxxxx-xxxx-Mxxx-Nxxx-xxxxxxxxxxxx

        var exampleUuid = UUID.fromString("de305d54-75b4-431b-adb2-eb6b9e546014");
        //var exampleUuid2 = UUID.fromString("f47ac10b-58cc-4372-a567-0e02b2c3d479");
        //var exampleUuid2 = UUID.fromString("6ba7b814-9dad-11d1-80b4-00c04fd430c8");
        var exampleUuid2 = UUID.fromString("727efc97-ca2c-46a3-aa64-f47c421aac65");
        assertEquals('6ba7b814-9dad-11d1-80b4-00c04fd430c8', UUID.fromParts(0x6ba7b814, 0x9dad, 0x11d1, 0x80, 0xb4, 0x00, 0xc0, 0x4f, 0xd4, 0x30, 0xc8).toString());

        assertEquals('00112233-4455-6677-8899-aabbccddeeff', new UUID(Hex.toArray('00112233445566778899AABBCCDDEEFF')).toString());
        assertEquals('de305d54-75b4-431b-adb2-eb6b9e546014', exampleUuid.toString());
        assertEquals(
            '' + [0xde, 0x30, 0x5d, 0x54, 0x75, 0xb4, 0x43, 0x1b, 0xad, 0xb2, 0xeb, 0x6b, 0x9e, 0x54, 0x60, 0x14],
            '' + exampleUuid.getInts()
        );
        assertEquals(Variant.RFC4122, exampleUuid2.getVariant());
        assertEquals(4, exampleUuid2.getVersion());

        var random00 = UUID.generateRandom(RandomSequenceMock.byte(0x00));
        var randomFF = UUID.generateRandom(RandomSequenceMock.byte(0xFF));

        assertEquals(Variant.RFC4122, random00.getVariant());
        assertEquals(Variant.RFC4122, randomFF.getVariant());

        assertEquals(4, random00.getVersion());
        assertEquals(4, randomFF.getVersion());

        assertEquals('00000000-0000-4000-8000-000000000000', random00.toString());
        assertEquals('ffffffff-ffff-4fff-bfff-ffffffffffff', randomFF.toString());
    }
}
