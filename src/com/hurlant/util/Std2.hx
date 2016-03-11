package com.hurlant.util;
class Std2 {
    static public function parseInt(value:String, radix:Int = 10):Int {
        throw new Error('Not implemented');
    }

    static public function min3(a:Float, b:Float, c:Float):Float {
        return Math.min(Math.min(a, b), c);
    }
}
