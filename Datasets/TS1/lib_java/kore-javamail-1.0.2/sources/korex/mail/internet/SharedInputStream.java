package korex.mail.internet;

import java.io.InputStream;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/internet/SharedInputStream.class */
public interface SharedInputStream {
    long getPosition();

    InputStream newStream(long j, long j2);
}
