package com.hurlant.crypto.encoding;

class Charsets {
    static public var UTF8(default, null):Charset = new UTF8();

    static public function fromString(name:String):Charset {
        return switch (StringTools.replace(name.toLowerCase(), '-', '')) {
            case 'utf8': UTF8;
            default: throw 'Not supported encoding $name';
        }
    }
}