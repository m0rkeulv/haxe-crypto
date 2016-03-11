/**
 * TLSError
 * 
 * A error that can be thrown when something wrong happens in the TLS protocol.
 * This is handled in TLSEngine by generating a TLS ALERT as appropriate.
 * Copyright (c) 2007 Henri Torgemane
 * 
 * See LICENSE.txt for full license information.
 */
package com.hurlant.crypto.tls;

import com.hurlant.util.Error;

class TLSError extends Error
{
    public static inline var close_notify : Int = 0;
    public static inline var unexpected_message : Int = 10;
    public static inline var bad_record_mac : Int = 20;
    public static inline var decryption_failed : Int = 21;
    public static inline var record_overflow : Int = 22;
    public static inline var decompression_failure : Int = 30;
    public static inline var handshake_failure : Int = 40;
    public static inline var bad_certificate : Int = 42;
    public static inline var unsupported_certificate : Int = 43;
    public static inline var certificate_revoked : Int = 44;
    public static inline var certificate_expired : Int = 45;
    public static inline var certificate_unknown : Int = 46;
    public static inline var illegal_parameter : Int = 47;
    public static inline var unknown_ca : Int = 48;
    public static inline var access_denied : Int = 49;
    public static inline var decode_error : Int = 50;
    public static inline var decrypt_error : Int = 51;
    public static inline var protocol_version : Int = 70;
    public static inline var insufficient_security : Int = 71;
    public static inline var internal_error : Int = 80;
    public static inline var user_canceled : Int = 90;
    public static inline var no_renegotiation : Int = 100;
    
    public function new(message : String, id : Int)
    {
        super(message, id);
    }
}
