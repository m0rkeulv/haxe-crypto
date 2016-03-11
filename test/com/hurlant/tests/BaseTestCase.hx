package com.hurlant.tests;

import com.hurlant.util.Error;
class BaseTestCase extends haxe.unit.TestCase {
    public function new() {
        super();
    }

    public inline function assert(a:Dynamic, ?b:Dynamic) {
        if (b == null) {
            assertEquals(a, true);
        } else {
            assertEquals(a, b);
        }

        /*
        if (args.length == 1) {
            Assert.assertTrue(args[0]);
        }
        else {
            Assert.assertStrictlyEquals.apply(null, args);
        }
        */
    }

    public function fail(msg : String) : Void{
        //Assert.fail(msg);
        throw new Error('Not implemented!');
    }
}