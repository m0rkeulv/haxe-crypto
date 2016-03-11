package com.hurlant.tests;


/**
 * Class for assert
 */
@:final class ClassForAssert
{
    
    /**
	 * Shorthand assertion handler
	 */
    public function assert() : Void{
        if (args.length == 1) {
            Assert.assertTrue(args[0]);
        }
        else {
            Assert.assertStrictlyEquals.apply(null, args);
        }
    }

    public function new()
    {
    }
}


