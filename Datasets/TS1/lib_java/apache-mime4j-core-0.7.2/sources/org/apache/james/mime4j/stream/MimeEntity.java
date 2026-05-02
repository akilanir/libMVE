package org.apache.james.mime4j.stream;

import java.io.IOException;
import java.io.InputStream;
import org.apache.james.mime4j.MimeException;
import org.apache.james.mime4j.codec.Base64InputStream;
import org.apache.james.mime4j.codec.DecodeMonitor;
import org.apache.james.mime4j.codec.QuotedPrintableInputStream;
import org.apache.james.mime4j.io.BufferedLineReaderInputStream;
import org.apache.james.mime4j.io.EOLConvertingInputStream;
import org.apache.james.mime4j.io.LimitedInputStream;
import org.apache.james.mime4j.io.LineNumberSource;
import org.apache.james.mime4j.io.LineReaderInputStream;
import org.apache.james.mime4j.io.LineReaderInputStreamAdaptor;
import org.apache.james.mime4j.io.MaxHeaderLimitException;
import org.apache.james.mime4j.io.MaxLineLimitException;
import org.apache.james.mime4j.io.MimeBoundaryInputStream;
import org.apache.james.mime4j.util.ByteArrayBuffer;
import org.apache.james.mime4j.util.CharsetUtil;
import org.apache.james.mime4j.util.MimeUtil;

/* loaded from: apache-mime4j-core-0.7.2.jar:org/apache/james/mime4j/stream/MimeEntity.class */
class MimeEntity implements EntityStateMachine {
    private final EntityState endState;
    private final MimeConfig config;
    private final DecodeMonitor monitor;
    private final FieldBuilder fieldBuilder;
    private final BodyDescriptorBuilder bodyDescBuilder;
    private final ByteArrayBuffer linebuf;
    private final LineNumberSource lineSource;
    private final BufferedLineReaderInputStream inbuffer;
    private EntityState state;
    private int lineCount;
    private boolean endOfHeader;
    private int headerCount;
    private Field field;
    private BodyDescriptor body;
    private RecursionMode recursionMode;
    private MimeBoundaryInputStream currentMimePartStream;
    private LineReaderInputStreamAdaptor dataStream;
    private byte[] tmpbuf;

    MimeEntity(LineNumberSource lineSource, InputStream instream, MimeConfig config, EntityState startState, EntityState endState, DecodeMonitor monitor, FieldBuilder fieldBuilder, BodyDescriptorBuilder bodyDescBuilder) {
        this.config = config;
        this.state = startState;
        this.endState = endState;
        this.monitor = monitor;
        this.fieldBuilder = fieldBuilder;
        this.bodyDescBuilder = bodyDescBuilder;
        this.linebuf = new ByteArrayBuffer(64);
        this.lineCount = 0;
        this.endOfHeader = false;
        this.headerCount = 0;
        this.lineSource = lineSource;
        this.inbuffer = new BufferedLineReaderInputStream(instream, 4096, config.getMaxLineLen());
        this.dataStream = new LineReaderInputStreamAdaptor(this.inbuffer, config.getMaxLineLen());
    }

    MimeEntity(LineNumberSource lineSource, InputStream instream, MimeConfig config, EntityState startState, EntityState endState, BodyDescriptorBuilder bodyDescBuilder) {
        this(lineSource, instream, config, startState, endState, config.isStrictParsing() ? DecodeMonitor.STRICT : DecodeMonitor.SILENT, new DefaultFieldBuilder(config.getMaxHeaderLen()), bodyDescBuilder);
    }

    MimeEntity(LineNumberSource lineSource, InputStream instream, MimeConfig config, BodyDescriptorBuilder bodyDescBuilder) {
        this(lineSource, instream, config, EntityState.T_START_MESSAGE, EntityState.T_END_MESSAGE, config.isStrictParsing() ? DecodeMonitor.STRICT : DecodeMonitor.SILENT, new DefaultFieldBuilder(config.getMaxHeaderLen()), bodyDescBuilder);
    }

    MimeEntity(LineNumberSource lineSource, InputStream instream, FieldBuilder fieldBuilder, BodyDescriptorBuilder bodyDescBuilder) {
        this(lineSource, instream, new MimeConfig(), EntityState.T_START_MESSAGE, EntityState.T_END_MESSAGE, DecodeMonitor.SILENT, fieldBuilder, bodyDescBuilder);
    }

    MimeEntity(LineNumberSource lineSource, InputStream instream, BodyDescriptorBuilder bodyDescBuilder) {
        this(lineSource, instream, new MimeConfig(), EntityState.T_START_MESSAGE, EntityState.T_END_MESSAGE, DecodeMonitor.SILENT, new DefaultFieldBuilder(-1), bodyDescBuilder);
    }

    @Override // org.apache.james.mime4j.stream.EntityStateMachine
    public EntityState getState() {
        return this.state;
    }

    public RecursionMode getRecursionMode() {
        return this.recursionMode;
    }

    @Override // org.apache.james.mime4j.stream.EntityStateMachine
    public void setRecursionMode(RecursionMode recursionMode) {
        this.recursionMode = recursionMode;
    }

    public void stop() {
        this.inbuffer.truncate();
    }

    private int getLineNumber() {
        if (this.lineSource == null) {
            return -1;
        }
        return this.lineSource.getLineNumber();
    }

    private LineReaderInputStream getDataStream() {
        return this.dataStream;
    }

    protected String message(Event event) {
        String message;
        if (event == null) {
            message = "Event is unexpectedly null.";
        } else {
            message = event.toString();
        }
        int lineNumber = getLineNumber();
        if (lineNumber <= 0) {
            return message;
        }
        return "Line " + lineNumber + ": " + message;
    }

    protected void monitor(Event event) throws MimeException, IOException {
        if (this.monitor.isListening()) {
            String message = message(event);
            if (this.monitor.warn(message, "ignoring")) {
                throw new MimeParseEventException(event);
            }
        }
    }

    private void readRawField() throws IOException, MimeException {
        int ch;
        if (this.endOfHeader) {
            throw new IllegalStateException();
        }
        LineReaderInputStream instream = getDataStream();
        while (true) {
            try {
                if (this.linebuf.length() > 0) {
                    this.fieldBuilder.append(this.linebuf);
                }
                this.linebuf.clear();
                if (instream.readLine(this.linebuf) == -1) {
                    monitor(Event.HEADERS_PREMATURE_END);
                    this.endOfHeader = true;
                    break;
                }
                int len = this.linebuf.length();
                if (len > 0 && this.linebuf.byteAt(len - 1) == 10) {
                    len--;
                }
                if (len > 0 && this.linebuf.byteAt(len - 1) == 13) {
                    len--;
                }
                if (len == 0) {
                    this.endOfHeader = true;
                    break;
                }
                this.lineCount++;
                if (this.lineCount > 1 && (ch = this.linebuf.byteAt(0)) != 32 && ch != 9) {
                    break;
                }
            } catch (MaxLineLimitException e) {
                throw new MimeException(e);
            }
        }
    }

    protected boolean nextField() throws MimeException, IOException {
        RawField rawfield;
        int maxHeaderCount = this.config.getMaxHeaderCount();
        while (!this.endOfHeader) {
            if (maxHeaderCount > 0 && this.headerCount >= maxHeaderCount) {
                throw new MaxHeaderLimitException("Maximum header limit exceeded");
            }
            this.headerCount++;
            this.fieldBuilder.reset();
            readRawField();
            try {
                rawfield = this.fieldBuilder.build();
            } catch (MimeException e) {
                monitor(Event.INVALID_HEADER);
                if (this.config.isMalformedHeaderStartsBody()) {
                    LineReaderInputStream instream = getDataStream();
                    ByteArrayBuffer buf = this.fieldBuilder.getRaw();
                    if (buf == null || !instream.unread(buf)) {
                        throw new MimeParseEventException(Event.INVALID_HEADER);
                    }
                    return false;
                }
            }
            if (rawfield != null) {
                if (rawfield.getDelimiterIdx() != rawfield.getName().length()) {
                    monitor(Event.OBSOLETE_HEADER);
                }
                Field parsedField = this.bodyDescBuilder.addField(rawfield);
                this.field = parsedField != null ? parsedField : rawfield;
                return true;
            }
        }
        return false;
    }

    @Override // org.apache.james.mime4j.stream.EntityStateMachine
    public EntityStateMachine advance() throws IOException, MimeException {
        switch (AnonymousClass1.$SwitchMap$org$apache$james$mime4j$stream$EntityState[this.state.ordinal()]) {
            case EOLConvertingInputStream.CONVERT_CR /* 1 */:
                this.state = EntityState.T_START_HEADER;
                return null;
            case EOLConvertingInputStream.CONVERT_LF /* 2 */:
                this.state = EntityState.T_START_HEADER;
                return null;
            case EOLConvertingInputStream.CONVERT_BOTH /* 3 */:
                this.bodyDescBuilder.reset();
            case 4:
                this.state = nextField() ? EntityState.T_FIELD : EntityState.T_END_HEADER;
                return null;
            case 5:
                this.body = this.bodyDescBuilder.build();
                String mimeType = this.body.getMimeType();
                if (this.recursionMode == RecursionMode.M_FLAT) {
                    this.state = EntityState.T_BODY;
                    return null;
                }
                if (MimeUtil.isMultipart(mimeType)) {
                    this.state = EntityState.T_START_MULTIPART;
                    clearMimePartStream();
                    return null;
                }
                if (this.recursionMode != RecursionMode.M_NO_RECURSE && MimeUtil.isMessage(mimeType)) {
                    this.state = EntityState.T_BODY;
                    return nextMessage();
                }
                this.state = EntityState.T_BODY;
                return null;
            case 6:
                if (this.dataStream.isUsed()) {
                    advanceToBoundary();
                    this.state = EntityState.T_END_MULTIPART;
                    return null;
                }
                createMimePartStream();
                this.state = EntityState.T_PREAMBLE;
                boolean empty = this.currentMimePartStream.isEmptyStream();
                if (!empty) {
                    return null;
                }
            case 7:
                advanceToBoundary();
                if (this.currentMimePartStream.eof() && !this.currentMimePartStream.isLastPart()) {
                    monitor(Event.MIME_BODY_PREMATURE_END);
                } else if (!this.currentMimePartStream.isLastPart()) {
                    clearMimePartStream();
                    createMimePartStream();
                    return nextMimeEntity();
                }
                boolean empty2 = this.currentMimePartStream.isFullyConsumed();
                clearMimePartStream();
                this.state = EntityState.T_EPILOGUE;
                if (!empty2) {
                    return null;
                }
                break;
            case 8:
                this.state = EntityState.T_END_MULTIPART;
                return null;
            case CharsetUtil.HT /* 9 */:
            case CharsetUtil.LF /* 10 */:
                this.state = this.endState;
                return null;
            default:
                if (this.state == this.endState) {
                    this.state = EntityState.T_END_OF_STREAM;
                    return null;
                }
                throw new IllegalStateException("Invalid state: " + stateToString(this.state));
        }
    }

    private void createMimePartStream() throws MimeException, IOException {
        String boundary = this.body.getBoundary();
        try {
            this.currentMimePartStream = new MimeBoundaryInputStream(this.inbuffer, boundary, this.config.isStrictParsing());
            this.dataStream = new LineReaderInputStreamAdaptor(this.currentMimePartStream, this.config.getMaxLineLen());
        } catch (IllegalArgumentException e) {
            throw new MimeException(e.getMessage(), e);
        }
    }

    private void clearMimePartStream() {
        this.currentMimePartStream = null;
        this.dataStream = new LineReaderInputStreamAdaptor(this.inbuffer, this.config.getMaxLineLen());
    }

    private void advanceToBoundary() throws IOException {
        if (!this.dataStream.eof()) {
            if (this.tmpbuf == null) {
                this.tmpbuf = new byte[2048];
            }
            InputStream instream = getLimitedContentStream();
            while (instream.read(this.tmpbuf) != -1) {
            }
        }
    }

    private EntityStateMachine nextMessage() {
        InputStream instream = this.currentMimePartStream != null ? this.currentMimePartStream : this.inbuffer;
        return nextMimeEntity(EntityState.T_START_MESSAGE, EntityState.T_END_MESSAGE, decodedStream(instream));
    }

    private InputStream decodedStream(InputStream instream) {
        String transferEncoding = this.body.getTransferEncoding();
        if (MimeUtil.isBase64Encoding(transferEncoding)) {
            instream = new Base64InputStream(instream, this.monitor);
        } else if (MimeUtil.isQuotedPrintableEncoded(transferEncoding)) {
            instream = new QuotedPrintableInputStream(instream, this.monitor);
        }
        return instream;
    }

    private EntityStateMachine nextMimeEntity() {
        return nextMimeEntity(EntityState.T_START_BODYPART, EntityState.T_END_BODYPART, this.currentMimePartStream);
    }

    private EntityStateMachine nextMimeEntity(EntityState startState, EntityState endState, InputStream instream) {
        if (this.recursionMode == RecursionMode.M_RAW) {
            RawEntity message = new RawEntity(instream);
            return message;
        }
        MimeEntity mimeentity = new MimeEntity(this.lineSource, instream, this.config, startState, endState, this.monitor, this.fieldBuilder, this.bodyDescBuilder.newChild());
        mimeentity.setRecursionMode(this.recursionMode);
        return mimeentity;
    }

    private InputStream getLimitedContentStream() {
        long maxContentLimit = this.config.getMaxContentLen();
        if (maxContentLimit >= 0) {
            return new LimitedInputStream(this.dataStream, maxContentLimit);
        }
        return this.dataStream;
    }

    @Override // org.apache.james.mime4j.stream.EntityStateMachine
    public BodyDescriptor getBodyDescriptor() {
        switch (AnonymousClass1.$SwitchMap$org$apache$james$mime4j$stream$EntityState[getState().ordinal()]) {
            case 6:
            case 7:
            case 8:
            case CharsetUtil.HT /* 9 */:
            case 11:
                return this.body;
            case CharsetUtil.LF /* 10 */:
            default:
                throw new IllegalStateException("Invalid state :" + stateToString(this.state));
        }
    }

    @Override // org.apache.james.mime4j.stream.EntityStateMachine
    public Field getField() {
        switch (getState()) {
            case T_FIELD:
                return this.field;
            default:
                throw new IllegalStateException("Invalid state :" + stateToString(this.state));
        }
    }

    @Override // org.apache.james.mime4j.stream.EntityStateMachine
    public InputStream getContentStream() {
        switch (AnonymousClass1.$SwitchMap$org$apache$james$mime4j$stream$EntityState[this.state.ordinal()]) {
            case 6:
            case 7:
            case 8:
            case CharsetUtil.HT /* 9 */:
                return getLimitedContentStream();
            default:
                throw new IllegalStateException("Invalid state: " + stateToString(this.state));
        }
    }

    @Override // org.apache.james.mime4j.stream.EntityStateMachine
    public InputStream getDecodedContentStream() throws IllegalStateException {
        return decodedStream(getContentStream());
    }

    public String toString() {
        return getClass().getName() + " [" + stateToString(this.state) + "][" + this.body.getMimeType() + "][" + this.body.getBoundary() + "]";
    }

    public static final String stateToString(EntityState state) {
        String result;
        switch (AnonymousClass1.$SwitchMap$org$apache$james$mime4j$stream$EntityState[state.ordinal()]) {
            case EOLConvertingInputStream.CONVERT_CR /* 1 */:
                result = "Start message";
                break;
            case EOLConvertingInputStream.CONVERT_LF /* 2 */:
                result = "Start bodypart";
                break;
            case EOLConvertingInputStream.CONVERT_BOTH /* 3 */:
                result = "Start header";
                break;
            case 4:
                result = "Field";
                break;
            case 5:
                result = "End header";
                break;
            case 6:
                result = "Start multipart";
                break;
            case 7:
                result = "Preamble";
                break;
            case 8:
                result = "Epilogue";
                break;
            case CharsetUtil.HT /* 9 */:
                result = "Body";
                break;
            case CharsetUtil.LF /* 10 */:
                result = "End multipart";
                break;
            case 11:
                result = "End of stream";
                break;
            case 12:
                result = "End message";
                break;
            case CharsetUtil.CR /* 13 */:
                result = "Raw entity";
                break;
            case 14:
                result = "End bodypart";
                break;
            default:
                result = "Unknown";
                break;
        }
        return result;
    }
}
