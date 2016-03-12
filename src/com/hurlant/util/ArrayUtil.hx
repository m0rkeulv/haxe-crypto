package com.hurlant.util;
import com.hurlant.crypto.prng.Random;
class ArrayUtil {
    public static function equals(a1:ByteArray, a2:ByteArray):Bool {
        if (a1.length != a2.length) return false;
        for (i in 0 ... a1.length) if (a1.get(i) != a2.get(i)) return false;
        return true;
    }

    public static function disposeArray(k:Array<Dynamic>) {
        var r = new Random();
        for (i in 0...k.length) k[i] = r.nextByte();
    }
}
