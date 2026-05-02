package ezvcard.util.org.apache.commons.codec.net;

import ezvcard.util.org.apache.commons.codec.DecoderException;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/util/org/apache/commons/codec/net/Utils.class */
class Utils {
    Utils() {
    }

    static int digit16(byte b) throws DecoderException {
        int i = Character.digit((char) b, 16);
        if (i == -1) {
            throw new DecoderException("Invalid URL encoding: not a valid digit (radix 16): " + ((int) b));
        }
        return i;
    }
}
