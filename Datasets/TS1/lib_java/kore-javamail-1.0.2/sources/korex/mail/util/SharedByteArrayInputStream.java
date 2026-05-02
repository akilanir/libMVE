package korex.mail.util;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import korex.mail.internet.SharedInputStream;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/util/SharedByteArrayInputStream.class */
public class SharedByteArrayInputStream extends ByteArrayInputStream implements SharedInputStream {
    protected int start;

    public SharedByteArrayInputStream(byte[] buf) {
        super(buf);
        this.start = 0;
    }

    public SharedByteArrayInputStream(byte[] buf, int offset, int length) {
        super(buf, offset, length);
        this.start = 0;
        this.start = offset;
    }

    @Override // korex.mail.internet.SharedInputStream
    public long getPosition() {
        return this.pos - this.start;
    }

    @Override // korex.mail.internet.SharedInputStream
    public InputStream newStream(long start, long end) {
        if (start < 0) {
            throw new IllegalArgumentException("start < 0");
        }
        if (end == -1) {
            end = this.count - this.start;
        }
        return new SharedByteArrayInputStream(this.buf, this.start + ((int) start), (int) (end - start));
    }
}
