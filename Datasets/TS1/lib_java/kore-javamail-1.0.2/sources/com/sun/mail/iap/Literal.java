package com.sun.mail.iap;

import java.io.IOException;
import java.io.OutputStream;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/iap/Literal.class */
public interface Literal {
    int size();

    void writeTo(OutputStream outputStream) throws IOException;
}
