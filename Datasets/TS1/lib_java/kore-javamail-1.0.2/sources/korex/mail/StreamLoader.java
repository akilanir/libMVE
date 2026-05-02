package korex.mail;

import java.io.IOException;
import java.io.InputStream;

/* compiled from: Session.java */
/* loaded from: kore-javamail-1.0.2.jar:korex/mail/StreamLoader.class */
interface StreamLoader {
    void load(InputStream inputStream) throws IOException;
}
