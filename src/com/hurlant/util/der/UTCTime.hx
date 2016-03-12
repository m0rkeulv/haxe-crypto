/**
 * UTCTime
 * 
 * An ASN1 type for UTCTime, represented as a Date
 * Copyright (c) 2007 Henri Torgemane
 * 
 * See LICENSE.txt for full license information.
 */
package com.hurlant.util.der;


import haxe.Int32;
import com.hurlant.util.ByteArray;

class UTCTime implements IAsn1Type {
    private var type:Int32;
    private var len:Int32;
    public var date:Date;

    public function new(type:Int32, len:Int32) {
        this.type = type;
        this.len = len;
    }

    public function getLength():Int32 {
        return len;
    }

    public function getType():Int32 {
        return type;
    }

    public function setUTCTime(str:String):Void {

        var year:Int32 = Std2.parseInt(str.substr(0, 2));
        if (year < 50) {
            year += 2000;
        }
        else {
            year += 1900;
        }
        var month:Int32 = Std2.parseInt(str.substr(2, 2));
        var day:Int32 = Std2.parseInt(str.substr(4, 2));
        var hour:Int32 = Std2.parseInt(str.substr(6, 2));
        var minute:Int32 = Std2.parseInt(str.substr(8, 2));
        // XXX this could be off by up to a day. parse the rest. someday.
        date = new Date(year, month - 1, day, hour, minute, 0);
    }


    public function toString():String {
        return DER.indent + "UTCTime[" + type + "][" + len + "][" + date + "]";
    }

    public function toDER():ByteArray {
        return null;
    }
}
