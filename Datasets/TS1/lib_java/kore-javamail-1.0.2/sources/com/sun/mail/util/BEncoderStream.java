package com.sun.mail.util;

import java.io.OutputStream;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/util/BEncoderStream.class */
public class BEncoderStream extends BASE64EncoderStream {
    public BEncoderStream(OutputStream out) {
        super(out, Integer.MAX_VALUE);
    }

    public static int encodedLength(byte[] b) {
        return ((b.length + 2) / 3) * 4;
    }
}
