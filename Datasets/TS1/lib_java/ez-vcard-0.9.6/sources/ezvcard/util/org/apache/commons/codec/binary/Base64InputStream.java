package ezvcard.util.org.apache.commons.codec.binary;

import java.io.InputStream;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/util/org/apache/commons/codec/binary/Base64InputStream.class */
public class Base64InputStream extends BaseNCodecInputStream {
    public Base64InputStream(InputStream in) {
        this(in, false);
    }

    public Base64InputStream(InputStream in, boolean doEncode) {
        super(in, new Base64(false), doEncode);
    }

    public Base64InputStream(InputStream in, boolean doEncode, int lineLength, byte[] lineSeparator) {
        super(in, new Base64(lineLength, lineSeparator), doEncode);
    }
}
