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

    static public function secureDisposeByteArray(ba:ByteArray) {
        // @TODO: Not use ByteArray, since ByteArray can grow and it realloc buffers copying content
        // @TODO: Instead allocate a fixed size buffer
        for (i in 0...ba.length) ba[i] = Std.random(256);
        ba.length = 0;
    }
}
