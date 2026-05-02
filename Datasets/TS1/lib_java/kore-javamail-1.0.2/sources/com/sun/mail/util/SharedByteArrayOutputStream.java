package com.sun.mail.util;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import korex.mail.util.SharedByteArrayInputStream;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/util/SharedByteArrayOutputStream.class */
public class SharedByteArrayOutputStream extends ByteArrayOutputStream {
    public SharedByteArrayOutputStream(int size) {
        super(size);
    }

    public InputStream toStream() {
        return new SharedByteArrayInputStream(this.buf, 0, this.count);
    }
}
