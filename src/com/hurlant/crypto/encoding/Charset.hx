package com.hurlant.crypto.encoding;

import haxe.io.Bytes;

interface Charset {
    function encode(str:String):Bytes;
    function decode(str:Bytes):String;
}