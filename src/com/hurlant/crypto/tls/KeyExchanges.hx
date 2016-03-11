/**
 * KeyExchanges
 * 
 * An enumeration of key exchange methods defined by TLS
 * ( right now, only RSA is actually implemented )
 * Copyright (c) 2007 Henri Torgemane
 * 
 * See LICENSE.txt for full license information.
 */
package com.hurlant.crypto.tls;


class KeyExchanges
{
    public static inline var NULL : Int = 0;
    public static inline var RSA : Int = 1;
    public static inline var DH_DSS : Int = 2;
    public static inline var DH_RSA : Int = 3;
    public static inline var DHE_DSS : Int = 4;
    public static inline var DHE_RSA : Int = 5;
    public static inline var DH_anon : Int = 6;
    
    public static function useRSA(p : Int) : Bool{
        return (p == RSA);
    }

    public function new()
    {
    }
}
