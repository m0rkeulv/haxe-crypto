/**
 * IConnectionState
 * 
 * Interface for TLS/SSL Connection states.
 * 
 * See LICENSE.txt for full license information.
 */
package com.hurlant.crypto.tls;


import com.hurlant.util.ByteArray;
interface IConnectionState
{

    function decrypt(type : Int, length : Int, p : ByteArray) : ByteArray;
    function encrypt(type : Int, p : ByteArray) : ByteArray;
}
