/**
 * IHash
 * 
 * An interface for each hash function to implement
 * Copyright (c) 2007 Henri Torgemane
 * 
 * See LICENSE.txt for full license information.
 */
package com.hurlant.crypto.hash;


import com.hurlant.util.ByteArray;

interface IHash
{

    function getInputSize() : Int;
    function getHashSize() : Int;
    function hash(src : ByteArray) : ByteArray;
    function toString() : String;
    function getPadSize() : Int;
}
