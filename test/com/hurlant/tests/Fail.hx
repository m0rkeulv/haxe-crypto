package com.hurlant.tests;

import org.flexunit.Assert;

/**
 * Class for fail
 */
@:final class ClassForFail
{
    
    /**
	 * Shorthand failure counterpart to the assert() method
	 */
    public function fail(msg : String) : Void{
        Assert.fail(msg);
    }

    public function new()
    {
    }
}


