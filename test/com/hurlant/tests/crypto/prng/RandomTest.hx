package com.hurlant.tests.crypto.prng;

import com.hurlant.crypto.prng.SecureRandom;
import com.hurlant.tests.BaseTestCase;

class RandomTest extends BaseTestCase {
    public function test_random() {
        var data1 = SecureRandom.getSecureRandomBytes(16);
        var data2 = SecureRandom.getSecureRandomBytes(16);
        assert(16, data1.length);
        assert(16, data2.length);
        var equalsCount = 0;
        for (n in 0 ... data1.length) {
            if (data1.get(n) == data2.get(n)) equalsCount++;
        }
        assert(equalsCount != data1.length);
    }
}