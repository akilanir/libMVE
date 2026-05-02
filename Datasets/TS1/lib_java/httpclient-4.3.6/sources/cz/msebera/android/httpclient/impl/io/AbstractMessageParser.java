package cz.msebera.android.httpclient.impl.io;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HttpException;
import cz.msebera.android.httpclient.HttpMessage;
import cz.msebera.android.httpclient.ParseException;
import cz.msebera.android.httpclient.ProtocolException;
import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.config.MessageConstraints;
import cz.msebera.android.httpclient.io.HttpMessageParser;
import cz.msebera.android.httpclient.io.SessionInputBuffer;
import cz.msebera.android.httpclient.message.BasicLineParser;
import cz.msebera.android.httpclient.message.LineParser;
import cz.msebera.android.httpclient.params.HttpParamConfig;
import cz.msebera.android.httpclient.params.HttpParams;
import cz.msebera.android.httpclient.util.Args;
import cz.msebera.android.httpclient.util.CharArrayBuffer;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@NotThreadSafe
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/io/AbstractMessageParser.class */
public abstract class AbstractMessageParser<T extends HttpMessage> implements HttpMessageParser<T> {
    private static final int HEAD_LINE = 0;
    private static final int HEADERS = 1;
    private final SessionInputBuffer sessionBuffer;
    private final MessageConstraints messageConstraints;
    private final List<CharArrayBuffer> headerLines;
    protected final LineParser lineParser;
    private int state;
    private T message;

    protected abstract T parseHead(SessionInputBuffer sessionInputBuffer) throws IOException, HttpException, ParseException;

    @Deprecated
    public AbstractMessageParser(SessionInputBuffer buffer, LineParser parser, HttpParams params) {
        Args.notNull(buffer, "Session input buffer");
        Args.notNull(params, "HTTP parameters");
        this.sessionBuffer = buffer;
        this.messageConstraints = HttpParamConfig.getMessageConstraints(params);
        this.lineParser = parser != null ? parser : BasicLineParser.INSTANCE;
        this.headerLines = new ArrayList();
        this.state = 0;
    }

    public AbstractMessageParser(SessionInputBuffer buffer, LineParser lineParser, MessageConstraints constraints) {
        this.sessionBuffer = (SessionInputBuffer) Args.notNull(buffer, "Session input buffer");
        this.lineParser = lineParser != null ? lineParser : BasicLineParser.INSTANCE;
        this.messageConstraints = constraints != null ? constraints : MessageConstraints.DEFAULT;
        this.headerLines = new ArrayList();
        this.state = 0;
    }

    public static Header[] parseHeaders(SessionInputBuffer inbuffer, int maxHeaderCount, int maxLineLen, LineParser parser) throws HttpException, IOException {
        List<CharArrayBuffer> headerLines = new ArrayList<>();
        return parseHeaders(inbuffer, maxHeaderCount, maxLineLen, parser != null ? parser : BasicLineParser.INSTANCE, headerLines);
    }

    /* JADX WARN: Code restructure failed: missing block: B:42:0x0102, code lost:
    
        r0 = new cz.msebera.android.httpclient.Header[r10.size()];
        r14 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x011a, code lost:
    
        if (r14 >= r10.size()) goto L67;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x011d, code lost:
    
        r0 = r10.get(r14);
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x012b, code lost:
    
        r0[r14] = r9.parseHeader(r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x013b, code lost:
    
        r16 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x0149, code lost:
    
        throw new cz.msebera.android.httpclient.ProtocolException(r16.getMessage());
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x014a, code lost:
    
        r14 = r14 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:52:0x0152, code lost:
    
        return r0;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static cz.msebera.android.httpclient.Header[] parseHeaders(cz.msebera.android.httpclient.io.SessionInputBuffer r6, int r7, int r8, cz.msebera.android.httpclient.message.LineParser r9, java.util.List<cz.msebera.android.httpclient.util.CharArrayBuffer> r10) throws cz.msebera.android.httpclient.HttpException, java.io.IOException {
        /*
            Method dump skipped, instructions count: 339
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: cz.msebera.android.httpclient.impl.io.AbstractMessageParser.parseHeaders(cz.msebera.android.httpclient.io.SessionInputBuffer, int, int, cz.msebera.android.httpclient.message.LineParser, java.util.List):cz.msebera.android.httpclient.Header[]");
    }

    @Override // cz.msebera.android.httpclient.io.HttpMessageParser
    public T parse() throws IOException, HttpException {
        switch (this.state) {
            case 0:
                try {
                    this.message = (T) parseHead(this.sessionBuffer);
                    this.state = 1;
                    break;
                } catch (ParseException e) {
                    throw new ProtocolException(e.getMessage(), e);
                }
            case 1:
                break;
            default:
                throw new IllegalStateException("Inconsistent parser state");
        }
        this.message.setHeaders(parseHeaders(this.sessionBuffer, this.messageConstraints.getMaxHeaderCount(), this.messageConstraints.getMaxLineLength(), this.lineParser, this.headerLines));
        T t = this.message;
        this.message = null;
        this.headerLines.clear();
        this.state = 0;
        return t;
    }
}
