/**
 * MACs
 * 
 * An enumeration of MACs implemented for TLS 1.0/SSL 3.0
 * Copyright (c) 2007 Henri Torgemane
 * 
 * See LICENSE.txt for full license information.
 */
package


import com.hurlant.crypto.Crypto;
import com.hurlant.crypto.hash.HMAC;
import com.hurlant.crypto.hash.MAC;

class MACs
{
    public static inline var NULL : Int = 0;
    public static inline var MD5 : Int = 1;
    public static inline var SHA1 : Int = 2;
    
    public static function getHashSize(hash : Int) : Int{
        return [0, 16, 20][hash];
    }
    
    public static function getPadSize(hash : Int) : Int{
        return [0, 48, 40][hash];
    }
    
    public static function getHMAC(hash : Int) : HMAC{
        if (hash == NULL)             return null;
        return Crypto.getHMAC(["", "md5", "sha1"][hash]);
    }
    
    public static function getMAC(hash : Int) : MAC{
        return Crypto.getMAC(["", "md5", "sha1"][hash]);
    }

    public function new()
    {
    }
}
