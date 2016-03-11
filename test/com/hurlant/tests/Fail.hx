package com.hurlant.tests;


/**
 * Class for fail
 */
@:final class ClassForFail
{
    
    import org.flexunit.Assert;
    
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


