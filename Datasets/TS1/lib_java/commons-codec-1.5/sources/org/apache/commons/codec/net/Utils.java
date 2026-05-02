package org.apache.commons.codec.net;

import org.apache.commons.codec.DecoderException;

/* loaded from: commons-codec-1.5.jar:org/apache/commons/codec/net/Utils.class */
class Utils {
    Utils() {
    }

    static int digit16(byte b) throws DecoderException {
        int i = Character.digit((char) b, 16);
        if (i == -1) {
            throw new DecoderException(new StringBuffer().append("Invalid URL encoding: not a valid digit (radix 16): ").append((int) b).toString());
        }
        return i;
    }
}
