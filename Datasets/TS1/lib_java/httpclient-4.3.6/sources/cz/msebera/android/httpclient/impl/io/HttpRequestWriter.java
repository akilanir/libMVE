package cz.msebera.android.httpclient.impl.io;

import cz.msebera.android.httpclient.HttpRequest;
import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.io.SessionOutputBuffer;
import cz.msebera.android.httpclient.message.LineFormatter;
import cz.msebera.android.httpclient.params.HttpParams;
import java.io.IOException;

@NotThreadSafe
@Deprecated
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/io/HttpRequestWriter.class */
public class HttpRequestWriter extends AbstractMessageWriter<HttpRequest> {
    public HttpRequestWriter(SessionOutputBuffer buffer, LineFormatter formatter, HttpParams params) {
        super(buffer, formatter, params);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // cz.msebera.android.httpclient.impl.io.AbstractMessageWriter
    public void writeHeadLine(HttpRequest message) throws IOException {
        this.lineFormatter.formatRequestLine(this.lineBuf, message.getRequestLine());
        this.sessionBuffer.writeLine(this.lineBuf);
    }
}
