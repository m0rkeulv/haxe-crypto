/**
 * ARC4Test
 *
 * A test class for ARC4
 * Copyright (c) 2007 Henri Torgemane
 *
 * See LICENSE.txt for full license information.
 */
package com.hurlant.tests.crypto.prng;


import com.hurlant.tests.*;

import com.hurlant.crypto.prng.ARC4;
import com.hurlant.util.Hex;

import com.hurlant.util.ByteArray;

class ARC4Test extends BaseTestCase {
    /**
     * Sad test vectors pilfered from
     * http://en.wikipedia.org/wiki/RC4
     */
    public function test_vectors() {
        var keys = [
            Hex.fromString("Key"),
            Hex.fromString("Wiki"),
            Hex.fromString("Secret")
        ];

        var pts = [
            Hex.fromString("Plaintext"),
            Hex.fromString("pedia"),
            Hex.fromString("Attack at dawn")
        ];

        var cts = [
            "BBF316E8D940AF0AD3",
            "1021BF0420",
            "45A01F645FC35B383552544B9BF5"
        ];

        for (i in 0 ... keys.length) {
            var key = Hex.toArray(keys[i]);
            var pt = Hex.toArray(pts[i]);
            var rc4 = new ARC4(key);
            rc4.encrypt(pt);
            var out = Hex.fromArray(pt).toUpperCase();
            assert(cts[i], out);
            // now go back to plaintext
            rc4.init(key);
            rc4.decrypt(pt);
            out = Hex.fromArray(pt);
            assert(pts[i], out);
        }
    }
}


