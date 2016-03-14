package com.hurlant.util;
import haxe.Int32;
class System {
    // @TODO: IMPORTANT!!
    /**
     * Gather anything we have that isn't entirely predictable:
     *  - memory used
     *  - system capabilities
     *  - timing stuff
     *  - installed fonts
     */
    static public function getSecureRandomBytes(length:Int32):ByteArray {
        /*
        var r:uint = uint(new Date().time);
        this.buff.writeUnsignedInt(System.totalMemory ^ r);
        this.buff.writeInt(getTimer() ^ r);
        this.buff.writeDouble(Math.random() * r);
         */
        // @TODO!!!
        var ba = new ByteArray();
        for (n in 0 ... length) {
            ba.writeByte(Std.random(256));
        }
        ba.position = 0;
        return ba;
    }
}
