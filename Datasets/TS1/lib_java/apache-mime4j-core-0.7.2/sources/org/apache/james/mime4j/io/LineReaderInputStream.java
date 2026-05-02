package org.apache.james.mime4j.io;

import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import org.apache.james.mime4j.util.ByteArrayBuffer;

/* loaded from: apache-mime4j-core-0.7.2.jar:org/apache/james/mime4j/io/LineReaderInputStream.class */
public abstract class LineReaderInputStream extends FilterInputStream {
    public abstract int readLine(ByteArrayBuffer byteArrayBuffer) throws MaxLineLimitException, IOException;

    public abstract boolean unread(ByteArrayBuffer byteArrayBuffer);

    protected LineReaderInputStream(InputStream in) {
        super(in);
    }
}
