package com.hurlant.crypto.encoding;

import haxe.io.Bytes;
import com.hurlant.util.ByteArray;
class UTF8 implements Charset {
    public function new() {
    }

    public function encode(str:String):Bytes {
        var out = new ByteArray();
        for (n in 0 ... str.length) {
            var c = str.charCodeAt(n);
            if ((c & 0xFFFFFF80) == 0) { // 1-byte sequence
                out.writeByte(c);
            } else if ((c & 0xFFFFF800) == 0) { // 2-byte sequence
                out.writeByte(((c >> 6) & 0x1F) | 0xC0);
                out.writeByte(((c >> 0) & 0x3F) | 0x80);
            } else if ((c & 0xFFFF0000) == 0) { // 3-byte sequence
                //checkScalarValue(codePoint);
                out.writeByte((((c >> 12) & 0x0F) | 0xE0));
                out.writeByte((((c >>  6) & 0x3F) | 0x80));
                out.writeByte((((c >>  0) & 0x3F) | 0x80));
            } else if ((c & 0xFFE00000) == 0) { // 4-byte sequence
                out.writeByte((((c >> 18) & 0x07) | 0xF0));
                out.writeByte((((c >> 12) & 0x3F) | 0x80));
                out.writeByte((((c >>  6) & 0x3F) | 0x80));
                out.writeByte((((c >>  0) & 0x3F) | 0x80));
            }
        }
        out.position = 0;
        return out;
    }

    public function decode(str:Bytes):String {
        throw 'Not implemented!';
    }
}