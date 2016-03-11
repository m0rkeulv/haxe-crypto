/**
 * BulkCiphers
 * 
 * An enumeration of bulk ciphers available for TLS, along with their properties,
 * with a few convenience methods to go with it.
 * Copyright (c) 2007 Henri Torgemane
 * 
 * See LICENSE.txt for full license information.
 */
package com.hurlant.crypto.tls;

import com.hurlant.util.Error;

import com.hurlant.crypto.Crypto;
import com.hurlant.util.ByteArray;
import com.hurlant.crypto.symmetric.ICipher;
import com.hurlant.crypto.symmetric.TLSPad;
import com.hurlant.crypto.symmetric.SSLPad;

class BulkCiphers
{
    public static inline var STREAM_CIPHER : Int = 0;
    public static inline var BLOCK_CIPHER : Int = 1;
    
    public static inline var NULL : Int = 0;
    public static inline var RC4_40 : Int = 1;
    public static inline var RC4_128 : Int = 2;
    public static inline var RC2_CBC_40 : Int = 3;  // XXX I don't have that one.  
    public static inline var DES_CBC : Int = 4;
    public static inline var DES3_EDE_CBC : Int = 5;
    public static inline var DES40_CBC : Int = 6;
    public static inline var IDEA_CBC : Int = 7;  // XXX I don't have that one.  
    public static inline var AES_128 : Int = 8;
    public static inline var AES_256 : Int = 9;
    
    private static var algos : Array<Dynamic> = 
        ["", "rc4", "rc4", "", "des-cbc", "3des-cbc", "des-cbc", "", "aes", "aes"];
    
    private static var _props : Array<Dynamic>;
    
    
    private static function init() : Void{
        _props = [];
        _props[NULL] = new BulkCiphers(STREAM_CIPHER, 0, 0, 0, 0, 0);
        _props[RC4_40] = new BulkCiphers(STREAM_CIPHER, 5, 16, 40, 0, 0);
        _props[RC4_128] = new BulkCiphers(STREAM_CIPHER, 16, 16, 128, 0, 0);
        _props[RC2_CBC_40] = new BulkCiphers(BLOCK_CIPHER, 5, 16, 40, 8, 8);
        _props[DES_CBC] = new BulkCiphers(BLOCK_CIPHER, 8, 8, 56, 8, 8);
        _props[DES3_EDE_CBC] = new BulkCiphers(BLOCK_CIPHER, 24, 24, 168, 8, 8);
        _props[DES40_CBC] = new BulkCiphers(BLOCK_CIPHER, 5, 8, 40, 8, 8);
        _props[IDEA_CBC] = new BulkCiphers(BLOCK_CIPHER, 16, 16, 128, 8, 8);
        _props[AES_128] = new BulkCiphers(BLOCK_CIPHER, 16, 16, 128, 16, 16);
        _props[AES_256] = new BulkCiphers(BLOCK_CIPHER, 32, 32, 256, 16, 16);
    }
    
    private static function getProp(cipher : Int) : BulkCiphers{
        var p : BulkCiphers = _props[cipher];
        if (p == null) {
            throw new Error("Unknown bulk cipher " + Std.string(cipher));
        }
        return p;
    }
    public static function getType(cipher : Int) : Int{
        return getProp(cipher).type;
    }
    public static function getKeyBytes(cipher : Int) : Int{
        return getProp(cipher).keyBytes;
    }
    public static function getExpandedKeyBytes(cipher : Int) : Int{
        return getProp(cipher).expandedKeyBytes;
    }
    public static function getEffectiveKeyBits(cipher : Int) : Int{
        return getProp(cipher).effectiveKeyBits;
    }
    public static function getIVSize(cipher : Int) : Int{
        return getProp(cipher).IVSize;
    }
    public static function getBlockSize(cipher : Int) : Int{
        return getProp(cipher).blockSize;
    }
    public static function getCipher(cipher : Int, key : ByteArray, proto : Int) : ICipher{
        if (proto == TLSSecurityParameters.PROTOCOL_VERSION) {
            return Crypto.getCipher(algos[cipher], key, new TLSPad());
        }
        else {
            return Crypto.getCipher(algos[cipher], key, new SSLPad());
        }
    }
    
    
    private var type : Int;
    private var keyBytes : Int;
    private var expandedKeyBytes : Int;
    private var effectiveKeyBits : Int;
    private var IVSize : Int;
    private var blockSize : Int;
    
    public function new(t : Int, kb : Int, ekb : Int, fkb : Int, ivs : Int, bs : Int)
    {
        type = t;
        keyBytes = kb;
        expandedKeyBytes = ekb;
        effectiveKeyBits = fkb;
        IVSize = ivs;
        blockSize = bs;
    }
    private static var init = {
        init();
    }

}

