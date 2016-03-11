package com.hurlant.util.asn1.type;

import com.hurlant.util.Error;

import com.hurlant.util.ByteArray;

class SequenceType extends ASN1Type {
    public var children:Array<Dynamic>;
    public var childType:ASN1Type;

    public function new(p:Dynamic = null) {
        super(ASN1Type.SEQUENCE);
        if (Std.is(p, Array)) {
            children = try cast(p, Array</*AS3HX WARNING no type*/>) catch(e:Dynamic) null;
        }
        else {
            childType = try cast(p, ASN1Type) catch (e:Dynamic) null;
        }
    }

    override private function fromDERContent(s:ByteArray, length:Int):Dynamic {
        var p:Int = s.position;
        var left:Int = length;
        var val:Dynamic;
        var v:Dynamic; // v=individual children, val=entire sequence
        if (children != null) {
            // sequence
            val = { };
            for (i in 0...children.length) {
                for (name in Reflect.fields(children[i])) {
                    var pp:Int = s.position;
                    left = length - pp + p;
                    var child:ASN1Type = children[i][name];
                    v = child.fromDER(s, left);
                    if (v == null) {
                        if (child.optional) {
                            // do nothing. it's okay not to find it.

                        }
                        else {
                            s.position = p;
                            return null;
                        }
                    }
                    else {
                        Reflect.setField(val, name, v);
                        if (child.extract) {
                            var bin:ByteArray = new ByteArray();
                            bin.writeBytes(s, pp, s.position - pp);
                            val[name + "_bin"] = bin;
                        }
                    }
                }
            }
            return val;
        }
        else {
            // sequenceOf
            val = [];
            while (left > 0) {
                v = childType.fromDER(s, left);
                if (v == null) {
                    throw new Error("couldn't parse DER stream.");
                }
                else {
                    val.push(v);
                }
                left = length - s.position + p;
            }
            return val;
        }
    }
}
