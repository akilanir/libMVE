package org.apache.http.impl.io;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.apache.http.Header;
import org.apache.http.HttpException;
import org.apache.http.HttpMessage;
import org.apache.http.ParseException;
import org.apache.http.ProtocolException;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.io.HttpMessageParser;
import org.apache.http.io.SessionInputBuffer;
import org.apache.http.message.BasicLineParser;
import org.apache.http.message.LineParser;
import org.apache.http.params.CoreConnectionPNames;
import org.apache.http.params.HttpParams;
import org.apache.http.util.CharArrayBuffer;

@NotThreadSafe
/* loaded from: httpcore-4.2.1.jar:org/apache/http/impl/io/AbstractMessageParser.class */
public abstract class AbstractMessageParser<T extends HttpMessage> implements HttpMessageParser<T> {
    private static final int HEAD_LINE = 0;
    private static final int HEADERS = 1;
    private final SessionInputBuffer sessionBuffer;
    private final int maxHeaderCount;
    private final int maxLineLen;
    private final List<CharArrayBuffer> headerLines;
    protected final LineParser lineParser;
    private int state;
    private T message;

    protected abstract T parseHead(SessionInputBuffer sessionInputBuffer) throws IOException, HttpException, ParseException;

    public AbstractMessageParser(SessionInputBuffer buffer, LineParser parser, HttpParams params) {
        if (buffer == null) {
            throw new IllegalArgumentException("Session input buffer may not be null");
        }
        if (params == null) {
            throw new IllegalArgumentException("HTTP parameters may not be null");
        }
        this.sessionBuffer = buffer;
        this.maxHeaderCount = params.getIntParameter(CoreConnectionPNames.MAX_HEADER_COUNT, -1);
        this.maxLineLen = params.getIntParameter(CoreConnectionPNames.MAX_LINE_LENGTH, -1);
        this.lineParser = parser != null ? parser : BasicLineParser.DEFAULT;
        this.headerLines = new ArrayList();
        this.state = HEAD_LINE;
    }

    public static Header[] parseHeaders(SessionInputBuffer inbuffer, int maxHeaderCount, int maxLineLen, LineParser parser) throws HttpException, IOException {
        if (parser == null) {
            parser = BasicLineParser.DEFAULT;
        }
        List<CharArrayBuffer> headerLines = new ArrayList<>();
        return parseHeaders(inbuffer, maxHeaderCount, maxLineLen, parser, headerLines);
    }

    /* JADX WARN: Code restructure failed: missing block: B:54:0x0117, code lost:
    
        r0 = new org.apache.http.Header[r10.size()];
        r14 = org.apache.http.impl.io.AbstractMessageParser.HEAD_LINE;
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:0x012f, code lost:
    
        if (r14 >= r10.size()) goto L79;
     */
    /* JADX WARN: Code restructure failed: missing block: B:57:0x0132, code lost:
    
        r0 = r10.get(r14);
     */
    /* JADX WARN: Code restructure failed: missing block: B:58:0x0140, code lost:
    
        r0[r14] = r9.parseHeader(r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:59:0x0150, code lost:
    
        r16 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:61:0x015e, code lost:
    
        throw new org.apache.http.ProtocolException(r16.getMessage());
     */
    /* JADX WARN: Code restructure failed: missing block: B:62:0x015f, code lost:
    
        r14 = r14 + org.apache.http.impl.io.AbstractMessageParser.HEADERS;
     */
    /* JADX WARN: Code restructure failed: missing block: B:64:0x0167, code lost:
    
        return r0;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static org.apache.http.Header[] parseHeaders(org.apache.http.io.SessionInputBuffer r6, int r7, int r8, org.apache.http.message.LineParser r9, java.util.List<org.apache.http.util.CharArrayBuffer> r10) throws org.apache.http.HttpException, java.io.IOException {
        /*
            Method dump skipped, instructions count: 360
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.http.impl.io.AbstractMessageParser.parseHeaders(org.apache.http.io.SessionInputBuffer, int, int, org.apache.http.message.LineParser, java.util.List):org.apache.http.Header[]");
    }

    @Override // org.apache.http.io.HttpMessageParser
    public T parse() throws IOException, HttpException {
        switch (this.state) {
            case HEAD_LINE /* 0 */:
                try {
                    this.message = (T) parseHead(this.sessionBuffer);
                    this.state = HEADERS;
                    break;
                } catch (ParseException e) {
                    throw new ProtocolException(e.getMessage(), e);
                }
            case HEADERS /* 1 */:
                break;
            default:
                throw new IllegalStateException("Inconsistent parser state");
        }
        this.message.setHeaders(parseHeaders(this.sessionBuffer, this.maxHeaderCount, this.maxLineLen, this.lineParser, this.headerLines));
        T t = this.message;
        this.message = null;
        this.headerLines.clear();
        this.state = HEAD_LINE;
        return t;
    }
}
