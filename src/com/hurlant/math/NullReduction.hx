package com.hurlant.math;



/**
	 * A "null" reducer
	 */
class NullReduction implements IReduction
{
    public function revert(x : BigInteger) : BigInteger
    {
        return x;
    }
    
    public function mulTo(x : BigInteger, y : BigInteger, r : BigInteger) : Void
    {
        x.multiplyTo(y, r);
    }
    
    public function sqrTo(x : BigInteger, r : BigInteger) : Void
    {
        x.squareTo(r);
    }
    
    public function convert(x : BigInteger) : BigInteger
    {
        return x;
    }
    
    public function reduce(x : BigInteger) : Void
    {
        
    }

    public function new()
    {
    }
}
