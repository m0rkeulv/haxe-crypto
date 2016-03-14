package com.hurlant.tests.crypto.extra;

import com.hurlant.crypto.extra.ROT13;
import com.hurlant.tests.BaseTestCase;

class ROT13Test extends BaseTestCase {
    public function test_rot13() {
        assertEquals('Uryyb jbeyq!', ROT13.encodeString('Hello world!'));
    }
}