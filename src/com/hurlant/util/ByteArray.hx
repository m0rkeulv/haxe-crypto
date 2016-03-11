package com.hurlant.util;

abstract ByteArray(ByteArrayData) to ByteArrayData from ByteArrayData {
    public var position(get, set):Int;
    public var length(get, set):Int;
    public var bytesAvailable(get, never):Int;
    public var endian(get, set):Endian;

    public function new() { this = new ByteArrayData(); }

    public function readBytes(output:ByteArray, offset:Int, length:Int) { return this.readBytes(output, offset, length); }

    public function readMultiByte(length:Int, encoding:String):String {
        throw new Error('Not implemented');
    }

    public function readUnsignedInt():Int {
        throw new Error('Not implemented');
    }

    public function readUnsignedByte():Int {
        throw new Error('Not implemented');
    }

    public function writeUTF(str:String) {
        throw new Error('Not implemented');
    }

    public function writeUTFBytes(str:String) {
        throw new Error('Not implemented');
    }

    public function writeByte(value:Int) {
        throw new Error('Not implemented');
    }

    public function writeBytes(input:ByteArray, offset:Int = -1, length:Int = -1) {
        throw new Error('Not implemented');
    }

    public function writeUnsignedByte(value:Int) {
        throw new Error('Not implemented');
    }

    public function writeUnsignedInt(value:Int) {
        throw new Error('Not implemented');
    }

    private function get_endian():Endian {
        throw new Error('Not implemented');
    }

    private function get_position():Int {
        throw new Error('Not implemented');
    }

    private function get_length():Int {
        throw new Error('Not implemented');
    }

    private function get_bytesAvailable():Int {
        return this.length - this.position;
    }

    private function set_endian(value:Endian):Endian {
        throw new Error('Not implemented');
    }

    private function set_position(value:Int):Int {
        throw new Error('Not implemented');
    }

    private function set_length(value:Int):Int {
        throw new Error('Not implemented');
    }

    @:arrayAccess public function get(index:Int):Int { return this.get(index); }
    @:arrayAccess public function set(index:Int, value:Int):Int { return this.set(index, value); }
}

class ByteArrayData implements IDataOutput implements IDataInput {
    public var position(get, set):Int;
    public var length(get, set):Int;
    public var endian:Endian = Endian.BIG_ENDIAN;

    public function new() {
    }

    public function readBytes(output:ByteArray, offset:Int, length:Int) {
        throw new Error('Not implemented');
    }

    public function readMultiByte(length:Int, encoding:String):String {
        throw new Error('Not implemented');
    }

    public function set(index:Int, value:Int) {
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

    public function writeBytes(input:ByteArray) {
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

    private function set_position(value:Int):Int {
        throw new Error('Not implemented');
    }

    private function set_length(value:Int):Int {
        throw new Error('Not implemented');
    }
}
