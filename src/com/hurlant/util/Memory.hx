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

class Memory {
    public static var used(get, never):Int;

    public static function gc():Void {
    }

    private static function get_used():Int {
        //return System.totalMemory;
        return 0;
    }
}
