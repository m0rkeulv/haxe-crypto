/**
 * IPRNG
 * 
 * An interface for classes that can be used a pseudo-random number generators
 * Copyright (c) 2007 Henri Torgemane
 * 
 * See LICENSE.txt for full license information.
 */
package com.hurlant.crypto.prng;


import com.hurlant.util.ByteArray;

interface IPRNG
{

    function getPoolSize() : Int;
    function init(key : ByteArray) : Void;
    function next() : Int;
    function dispose() : Void;
    function toString() : String;
}
