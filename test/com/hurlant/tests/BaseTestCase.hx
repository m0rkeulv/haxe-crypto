package com.hurlant.tests;

import haxe.PosInfos;
import com.hurlant.util.Error;
class BaseTestCase extends haxe.unit.TestCase {
    public function new() {
        super();
    }

    public inline function assert(a:Dynamic, ?b:Dynamic, ?pos:PosInfos) {
        if (b == null) {
            assertEquals(true, a, pos);
        } else {
            assertEquals(b, a, pos);
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