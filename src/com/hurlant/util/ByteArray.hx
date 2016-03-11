package com.hurlant.util;
class ByteArray {
    public var position(get, set):Int;
    public var length(get, set):Int;
    public var endian:Endian = Endian.BIG_ENDIAN;

    public function new() {
    }

    public function readBytes(output:ByteArray, offset:Int, length:Int) {
        throw new Error('Not implemented');
    }

    public function get(index:Int) {
        throw new Error('Not implemented');
    }

    public function writeUTF(str:String) {
        throw new Error('Not implemented');
    }

    public function writeByte(value:Int) {
        throw new Error('Not implemented');
    }

    public function writeUnsignedByte(value:Int) {
        throw new Error('Not implemented');
    }

    public function writeUnsignedInt(value:Int) {
        throw new Error('Not implemented');
    }

    private function get_position():Int {
        throw new Error('Not implemented');
    }

    private function get_length():Int {
        throw new Error('Not implemented');
    }

    private function set_position(value:Int) {
        throw new Error('Not implemented');
    }

    private function set_length(value:Int) {
        throw new Error('Not implemented');
    }
}
