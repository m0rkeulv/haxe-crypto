package com.hurlant.tests.util;

import com.hurlant.util.Std2;
class Std2Test extends BaseTestCase {
    public function new() { super(); }

    public function test_parseInt() {
        assertEquals(255, Std2.parseInt('FF', 16));
        assertEquals(-255, Std2.parseInt('-FF', 16));
    }
}