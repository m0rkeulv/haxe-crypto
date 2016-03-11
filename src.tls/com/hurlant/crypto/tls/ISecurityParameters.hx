/**
 * ISecurityParameters
 * 
 * This class encapsulates all the security parameters that get negotiated
 * during the TLS handshake. It also holds all the key derivation methods.
 * Copyright (c) 2007 Henri Torgemane
 * 
 * See LICENSE.txt for full license information.
 */
package


import com.hurlant.util.ByteArray;

interface ISecurityParameters
{
    
    var version(get, never) : Int;    
    var useRSA(get, never) : Bool;

    function reset() : Void;
    function getBulkCipher() : Int;
    function getCipherType() : Int;
    function getMacAlgorithm() : Int;
    function setCipher(cipher : Int) : Void;
    function setCompression(algo : Int) : Void;
    function setPreMasterSecret(secret : ByteArray) : Void;
    function setClientRandom(secret : ByteArray) : Void;
    function setServerRandom(secret : ByteArray) : Void;
    function computeVerifyData(side : Int, handshakeMessages : ByteArray) : ByteArray;
    function computeCertificateVerify(side : Int, handshakeRecords : ByteArray) : ByteArray;
    function getConnectionStates() : Dynamic;
}
