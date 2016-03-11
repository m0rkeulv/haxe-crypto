/**
 * Memory
 * 
 * A class with a few memory-management methods, as much as 
 * such a thing exists in a Flash player.
 * Copyright (c) 2007 Henri Torgemane
 * 
 * See LICENSE.txt for full license information.
 */
package com.hurlant.util;


import flash.net.LocalConnection;
import flash.system.System;

class Memory
{
    public static var used(get, never) : Int;

    public static function gc() : Void{
        // force a GC
        try{
            new LocalConnection().connect("foo");
            new LocalConnection().connect("foo");
        }        catch (e : Dynamic){ };
    }
    private static function get_Used() : Int{
        return System.totalMemory;
    }

    public function new()
    {
    }
}
