package cz.msebera.android.httpclient.impl.io;

import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.io.SessionOutputBuffer;
import cz.msebera.android.httpclient.message.LineFormatter;
import java.io.IOException;

@NotThreadSafe
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/io/DefaultHttpResponseWriter.class */
public class DefaultHttpResponseWriter extends AbstractMessageWriter<HttpResponse> {
    public DefaultHttpResponseWriter(SessionOutputBuffer buffer, LineFormatter formatter) {
        super(buffer, formatter);
    }

    public DefaultHttpResponseWriter(SessionOutputBuffer buffer) {
        super(buffer, null);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // cz.msebera.android.httpclient.impl.io.AbstractMessageWriter
    public void writeHeadLine(HttpResponse message) throws IOException {
        this.lineFormatter.formatStatusLine(this.lineBuf, message.getStatusLine());
        this.sessionBuffer.writeLine(this.lineBuf);
    }
}
