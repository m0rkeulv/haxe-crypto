package com.hurlant.tests;

import haxe.PosInfos;
import com.hurlant.util.Error;
class BaseTestCase extends haxe.unit.TestCase {
    public function new() {
        super();
    }

    public inline function assert(a:Dynamic, ?b:Dynamic, ?pos:PosInfos) {
        if (b == null) {
            assertEquals(a, true, pos);
        } else {
            assertEquals(a, b, pos);
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