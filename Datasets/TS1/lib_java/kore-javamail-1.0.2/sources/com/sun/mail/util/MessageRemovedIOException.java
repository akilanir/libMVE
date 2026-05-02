package com.sun.mail.util;

import java.io.IOException;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/util/MessageRemovedIOException.class */
public class MessageRemovedIOException extends IOException {
    private static final long serialVersionUID = 4280468026581616424L;

    public MessageRemovedIOException() {
    }

    public MessageRemovedIOException(String s) {
        super(s);
    }
}
