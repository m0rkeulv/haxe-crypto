package com.hurlant.util.asn1.parser;

import com.hurlant.util.asn1.parser.OIDType;

/**
 * Class for oid
 */
@:final class ClassForOid
{
    import com.hurlant.util.asn1.type.OIDType;
    
    public function oid() : OIDType{
        var s : String = p.length > (0) ? p.join(".") : null;
        return new OIDType(s);
    }

    public function new()
    {
    }
}
