package com.hurlant.util.asn1.type;


import flash.net.RegisterClassAlias;
import com.hurlant.util.ByteArray;

class UTCTimeType extends ASN1Type
{
    
    
    public function new()
    {
        super(ASN1Type.UTC_TIME);
    }
    
    override private function fromDERContent(s : ByteArray, length : Int) : Dynamic{
        // XXX insufficient
        var str : String = s.readMultiByte(length, "US-ASCII");
        
        var year : Int = parseInt(str.substr(0, 2));
        if (year < 50) {
            year += 2000;
        }
        else {
            year += 1900;
        }
        var month : Int = parseInt(str.substr(2, 2));
        var day : Int = parseInt(str.substr(4, 2));
        var hour : Int = parseInt(str.substr(6, 2));
        var minute : Int = parseInt(str.substr(8, 2));
        // XXX this could be off by up to a day. parse the rest. someday.
        return new Date(year, month - 1, day, hour, minute);
    }
    private static var init = {
        registerClassAlias("com.hurlant.util.asn1.UTCTime", UTCTimeType);
    }

}
