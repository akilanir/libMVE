package com.sun.mail.util;

import java.io.InputStream;
import korex.mail.MessagingException;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/util/ReadableMime.class */
public interface ReadableMime {
    InputStream getMimeStream() throws MessagingException;
}
