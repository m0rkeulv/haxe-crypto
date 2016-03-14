package com.hurlant.util;
import haxe.Int32;
class CType {
    static public var DIGIT_0 = '0'.charCodeAt(0);
    static public var DIGIT_9 = '9'.charCodeAt(0);
    static public var LOWER_A = 'a'.charCodeAt(0);
    static public var LOWER_Z = 'z'.charCodeAt(0);
    static public var UPPER_A = 'A'.charCodeAt(0);
    static public var UPPER_Z = 'Z'.charCodeAt(0);
    static public var DIGITS = '0123456789abcdefghijklmnopqrstuvwxyz';

    static public function getDigit(charCode:Int32):Int32 {
        if (isDigit(charCode)) return (charCode - DIGIT_0) + 0;
        if (isLowerAlpha(charCode)) return (charCode - LOWER_A) + 10;
        if (isUpperAlpha(charCode)) return (charCode - UPPER_A) + 10;
        return -1;
    }

    static public function isDigit(charCode:Int32):Bool {
        return (charCode >= DIGIT_0 && charCode <= DIGIT_9);
    }

    static public function isAlpha(charCode:Int32):Bool {
        return isUpperAlpha(charCode) || isLowerAlpha(charCode);
    }

    static public function isUpperAlpha(charCode:Int32):Bool {
        return ((charCode >= UPPER_A) && (charCode <= UPPER_Z));
    }

    static public function isLowerAlpha(charCode:Int32):Bool {
        return ((charCode >= LOWER_A) && (charCode <= LOWER_Z));
    }
}