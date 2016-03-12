package com.hurlant.util;
class Std2 {
    static private var _C0 = '0'.charCodeAt(0);
    static private var _C9 = '9'.charCodeAt(0);
    static private var _Cla = 'a'.charCodeAt(0);
    static private var _Clz = 'z'.charCodeAt(0);
    static private var _UA = 'A'.charCodeAt(0);
    static private var _UZ = 'Z'.charCodeAt(0);
    static private var DIGITS = '0123456789abcdefghijklmnopqrstuvwxyz';

    static public function getDigit(charCode:Int):Int {
        if (charCode >=_C0 && charCode <= _C9) return charCode - _C0;
        if (charCode >=_Cla && charCode <= _Clz) return (charCode - _Cla) + 10;
        if (charCode >=_UA && charCode <= _UZ) return (charCode - _UA) + 10;
        return -1;
    }

    static public function parseHex(value:String):UInt {
        var out:Int = 0;
        //trace(value);
        for (n in 0 ... value.length) {
            var c = value.charAt(n);
            var cc = value.charCodeAt(n);
            var digit = getDigit(cc);
            if (digit < 0 || digit >= 16) throw new Error('Invalid digit $digit');

            out = out << 4;
            out |= digit;
        }
        return out;
    }

    static public function parseInt(value:String, radix:Int = 10):Int {
        if (value.substr(0, 1) == '-') return -parseInt(value.substr(1), radix);
        if (radix == 16) return parseHex(value);
        var out:Int = 0;
        //trace(value);
        for (n in 0 ... value.length) {
            var c = value.charAt(n);
            var cc = value.charCodeAt(n);
            var digit = getDigit(cc);
            if (digit < 0 || digit >= radix) throw new Error('Invalid digit $digit');

            out *= radix;
            out += digit;
        }
        return out;
    }

    static public function toStringHex(value:Int):String {
        if (value == 0) return '0';
        var out = '';
        while (value != 0) {
            var c = DIGITS.charAt(value & 0xF);
            out = c + out;
            value = value >>> 4;
        }
        return out;
    }

    static public function string(value:Int, radix:Int = 10):String {
        if (value < 0) return '-' + string(-value, radix);
        if (value == 0) return '0';
        var out = '';
        while (value > 0) {
            var c = DIGITS.charAt(value % radix);
            out = c + out;
            value = Std.int(value / radix);
        }
        return out;
    }

    static public function min3(a:Float, b:Float, c:Float):Float {
        return Math.min(Math.min(a, b), c);
    }

    static public function bswap32(a:Int):Int {
        return ((a & 0xFF) << 24) | ((a & 0x0000ff00) << 8) | ((a & 0x00ff0000) >>> 8) | ((a >>> 24) & 0xFF);
    }

    static public function bswap16(value:Int):Int {
        return ((value & 0xFF) << 8) | ((value >>> 8) & 0xFF);
    }
}
