package com.hurlant.util;

import haxe.io.Bytes;
abstract ByteArray(ByteArrayData) to ByteArrayData from ByteArrayData {
    public var position(get, set):Int;
    public var length(get, set):Int;
    public var bytesAvailable(get, never):Int;
    public var endian(get, set):Endian;

    public function new() { this = new ByteArrayData(); }

    public function readBytes(output:ByteArray, offset:Int, length:Int) { return this.readBytes(output, offset, length); }

    public function readMultiByte(length:Int, encoding:String):String {
        return this.readMultiByte(length, encoding);
    }

    public function writeMultiByte(str:String, encoding:String) {
        return this.writeMultiByte(str, encoding);
    }

    public function readUnsignedInt():UInt {
        return this.readUnsignedInt();
    }

    public function readUnsignedByte():Int {
        return this.readUnsignedByte();
    }

    public function writeUTF(str:String) {
        return this.writeUTF(str);
    }

    public function writeUTFBytes(str:String) {
        return this.writeUTFBytes(str);
    }

    public function writeByte(value:Int) {
        return this.writeByte(value);
    }

    public function writeBytes(input:ByteArray, offset:Int = -1, length:Int = -1) {
        return this.writeBytes(input, offset, length);
    }

    public function readUTFBytes(length:Int):String {
        return this.readUTFBytes(length);
    }

    public function writeUnsignedByte(value:Int) {
        return this.writeUnsignedByte(value);
    }

    public function writeUnsignedInt(value:Int) {
        return this.writeUnsignedInt(value);
    }

    private function get_endian():Endian {
        return this.endian;
    }

    private function get_position():Int {
        return this.position;
    }

    private function get_length():Int {
        return this.length;
    }

    private function get_bytesAvailable():Int {
        return this.length - this.position;
    }

    private function set_endian(value:Endian):Endian {
        return this.endian = value;
    }

    private function set_position(value:Int):Int {
        return this.position = value;
    }

    private function set_length(value:Int):Int {
        return this.length = value;
    }

    @:arrayAccess public function get(index:Int):Int { return this.get(index); }
    @:arrayAccess public function set(index:Int, value:Int):Int { return this.set(index, value); }
}

class ByteArrayData implements IDataOutput implements IDataInput {
    public var position(get, set):Int;
    public var length(get, set):Int;
    public var endian:Endian = Endian.BIG_ENDIAN;
    private var _data:Bytes = Bytes.alloc(16);
    private var _length:Int = 0;
    private var _position:Int = 0;

    public function new() {
    }

    private function ensureLength(elength:Int) {
        if (_data.length < elength) {
            var newlength = Std.int(Math.max(_data.length * 2, elength));
            var oldData = _data;
            _data = Bytes.alloc(newlength);
            _data.blit(0, oldData, 0, oldData.length);
        }
        this._length = elength;
    }

    public function readBytes(output:ByteArray, offset:Int, length:Int) {
        throw new Error('Not implemented');
    }

    public function readUTFBytes(length:Int):String {
        throw new Error('Not implemented');
    }

    public function readMultiByte(length:Int, encoding:String):String {
        throw new Error('Not implemented');
    }

    public function readUnsignedByte():Int {
        return get(this.getUpdatePos(1)) & 0xFF;
    }

    public function readUnsignedInt():UInt {
        return bswap32Endian(this._data.getInt32(getUpdatePos(4)));
    }

    public function set(index:Int, value:Int):Int {
        ensureLength(index + 1);
        this._data.set(index, value);
        return value;
    }

    public function get(index:Int):Int {
        ensureLength(index + 1);
        return this._data.get(index);
    }

    public function writeUTF(str:String) {
        throw new Error('Not implemented');
    }

    public function writeUTFBytes(str:String) {
        throw new Error('Not implemented');
    }

    public function writeMultiByte(str:String, encoding:String) {
        for (n in 0 ... str.length) {
            writeByte(str.charCodeAt(n));
        }
    }

    public function writeByte(value:Int) {
        writeUnsignedByte(value);
    }

    public function writeBytes(input:ByteArray, offset:Int = -1, length:Int = -1) {
        throw new Error('Not implemented');
    }

    public function writeUnsignedByte(value:Int) {
        this._data.set(getUpdatePos(1), value);
    }

    public function writeUnsignedInt(value:Int) {
        this._data.setInt32(getUpdatePos(1), bswap32Endian(value));
    }

    private function get_position():Int {
        return _position;
    }

    private function get_length():Int {
        return this._length;
    }

    private function set_position(value:Int):Int {
        return _position = value;
    }

    private function set_length(value:Int):Int {
        ensureLength(value);
        return this._length = value;
    }

    private function getUpdatePos(count:Int):Int {
        ensureLength(this._position + count);
        var out = this._position;
        this._position += count;
        return out;
    }

    private function bswap32Endian(value:Int):Int {
        return (this.endian == Endian.BIG_ENDIAN) ? bswap32(value) : value;
    }

    private function bswap32(a:Int):Int {
        return (a << 24) | ((a & 0x0000ff00) << 8) | ((a & 0x00ff0000) >> 8) | (a >> 24);
    }

    private function bswap16Endian(value:Int):Int {
        return (this.endian == Endian.BIG_ENDIAN) ? bswap16(value) : value;
    }

    private function bswap16(value:Int):Int {
        return ((value & 0xFF) << 8) | ((value >> 8) & 0xFF);
    }
}
