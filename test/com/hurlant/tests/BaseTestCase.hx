package com.hurlant.tests;

class BaseTestCase extends haxe.unit.TestCase {
    public inline function assert(a:Dynamic, b:Dynamic) {
        assertEquals(a, b);
    }
}