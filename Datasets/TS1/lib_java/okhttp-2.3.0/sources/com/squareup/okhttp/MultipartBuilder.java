package com.squareup.okhttp;

import com.squareup.okhttp.internal.Util;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import okio.Buffer;
import okio.BufferedSink;
import okio.ByteString;

/* loaded from: okhttp-2.3.0.jar:com/squareup/okhttp/MultipartBuilder.class */
public final class MultipartBuilder {
    public static final MediaType MIXED = MediaType.parse("multipart/mixed");
    public static final MediaType ALTERNATIVE = MediaType.parse("multipart/alternative");
    public static final MediaType DIGEST = MediaType.parse("multipart/digest");
    public static final MediaType PARALLEL = MediaType.parse("multipart/parallel");
    public static final MediaType FORM = MediaType.parse("multipart/form-data");
    private static final byte[] COLONSPACE = {58, 32};
    private static final byte[] CRLF = {13, 10};
    private static final byte[] DASHDASH = {45, 45};
    private final ByteString boundary;
    private MediaType type;
    private final List<Headers> partHeaders;
    private final List<RequestBody> partBodies;

    public MultipartBuilder() {
        this(UUID.randomUUID().toString());
    }

    public MultipartBuilder(String boundary) {
        this.type = MIXED;
        this.partHeaders = new ArrayList();
        this.partBodies = new ArrayList();
        this.boundary = ByteString.encodeUtf8(boundary);
    }

    public MultipartBuilder type(MediaType type) {
        if (type == null) {
            throw new NullPointerException("type == null");
        }
        if (!type.type().equals("multipart")) {
            throw new IllegalArgumentException("multipart != " + type);
        }
        this.type = type;
        return this;
    }

    public MultipartBuilder addPart(RequestBody body) {
        return addPart(null, body);
    }

    public MultipartBuilder addPart(Headers headers, RequestBody body) {
        if (body == null) {
            throw new NullPointerException("body == null");
        }
        if (headers != null && headers.get("Content-Type") != null) {
            throw new IllegalArgumentException("Unexpected header: Content-Type");
        }
        if (headers != null && headers.get("Content-Length") != null) {
            throw new IllegalArgumentException("Unexpected header: Content-Length");
        }
        this.partHeaders.add(headers);
        this.partBodies.add(body);
        return this;
    }

    private static StringBuilder appendQuotedString(StringBuilder target, String key) {
        target.append('\"');
        int len = key.length();
        for (int i = 0; i < len; i++) {
            char ch = key.charAt(i);
            switch (ch) {
                case '\n':
                    target.append("%0A");
                    break;
                case '\r':
                    target.append("%0D");
                    break;
                case '\"':
                    target.append("%22");
                    break;
                default:
                    target.append(ch);
                    break;
            }
        }
        target.append('\"');
        return target;
    }

    public MultipartBuilder addFormDataPart(String name, String value) {
        return addFormDataPart(name, null, RequestBody.create((MediaType) null, value));
    }

    public MultipartBuilder addFormDataPart(String name, String filename, RequestBody value) {
        if (name == null) {
            throw new NullPointerException("name == null");
        }
        StringBuilder disposition = new StringBuilder("form-data; name=");
        appendQuotedString(disposition, name);
        if (filename != null) {
            disposition.append("; filename=");
            appendQuotedString(disposition, filename);
        }
        return addPart(Headers.of("Content-Disposition", disposition.toString()), value);
    }

    public RequestBody build() {
        if (this.partHeaders.isEmpty()) {
            throw new IllegalStateException("Multipart body must have at least one part.");
        }
        return new MultipartRequestBody(this.type, this.boundary, this.partHeaders, this.partBodies);
    }

    /* loaded from: okhttp-2.3.0.jar:com/squareup/okhttp/MultipartBuilder$MultipartRequestBody.class */
    private static final class MultipartRequestBody extends RequestBody {
        private final ByteString boundary;
        private final MediaType contentType;
        private final List<Headers> partHeaders;
        private final List<RequestBody> partBodies;
        private long contentLength = -1;

        /*  JADX ERROR: Failed to decode insn: 0x0016: MOVE_MULTI
            java.lang.ArrayIndexOutOfBoundsException: arraycopy: source index -1 out of bounds for object array[6]
            	at java.base/java.lang.System.arraycopy(Native Method)
            	at jadx.plugins.input.java.data.code.StackState.insert(StackState.java:52)
            	at jadx.plugins.input.java.data.code.CodeDecodeState.insert(CodeDecodeState.java:137)
            	at jadx.plugins.input.java.data.code.JavaInsnsRegister.dup2x1(JavaInsnsRegister.java:313)
            	at jadx.plugins.input.java.data.code.JavaInsnData.decode(JavaInsnData.java:46)
            	at jadx.core.dex.instructions.InsnDecoder.lambda$process$0(InsnDecoder.java:50)
            	at jadx.plugins.input.java.data.code.JavaCodeReader.visitInstructions(JavaCodeReader.java:85)
            	at jadx.core.dex.instructions.InsnDecoder.process(InsnDecoder.java:46)
            	at jadx.core.dex.nodes.MethodNode.load(MethodNode.java:157)
            	at jadx.core.dex.nodes.ClassNode.load(ClassNode.java:458)
            	at jadx.core.dex.nodes.ClassNode.load(ClassNode.java:464)
            	at jadx.core.ProcessClass.process(ProcessClass.java:69)
            	at jadx.core.ProcessClass.generateCode(ProcessClass.java:117)
            	at jadx.core.dex.nodes.ClassNode.generateClassCode(ClassNode.java:401)
            	at jadx.core.dex.nodes.ClassNode.decompile(ClassNode.java:389)
            	at jadx.core.dex.nodes.ClassNode.getCode(ClassNode.java:339)
            */
        @Override // com.squareup.okhttp.RequestBody
        public long contentLength() throws java.io.IOException {
            /*
                r6 = this;
                r0 = r6
                long r0 = r0.contentLength
                r7 = r0
                r0 = r7
                r1 = -1
                int r0 = (r0 > r1 ? 1 : (r0 == r1 ? 0 : -1))
                if (r0 == 0) goto Lf
                r0 = r7
                return r0
                r0 = r6
                r1 = r6
                r2 = 0
                r3 = 1
                long r1 = r1.writeOrCountBytes(r2, r3)
                // decode failed: arraycopy: source index -1 out of bounds for object array[6]
                r0.contentLength = r1
                return r-1
            */
            throw new UnsupportedOperationException("Method not decompiled: com.squareup.okhttp.MultipartBuilder.MultipartRequestBody.contentLength():long");
        }

        public MultipartRequestBody(MediaType type, ByteString boundary, List<Headers> partHeaders, List<RequestBody> partBodies) {
            if (type == null) {
                throw new NullPointerException("type == null");
            }
            this.boundary = boundary;
            this.contentType = MediaType.parse(type + "; boundary=" + boundary.utf8());
            this.partHeaders = Util.immutableList(partHeaders);
            this.partBodies = Util.immutableList(partBodies);
        }

        @Override // com.squareup.okhttp.RequestBody
        public MediaType contentType() {
            return this.contentType;
        }

        private long writeOrCountBytes(BufferedSink sink, boolean countBytes) throws IOException {
            long byteCount = 0;
            BufferedSink bufferedSink = null;
            if (countBytes) {
                BufferedSink buffer = new Buffer();
                bufferedSink = buffer;
                sink = buffer;
            }
            int partCount = this.partHeaders.size();
            for (int p = 0; p < partCount; p++) {
                Headers headers = this.partHeaders.get(p);
                RequestBody body = this.partBodies.get(p);
                sink.write(MultipartBuilder.DASHDASH);
                sink.write(this.boundary);
                sink.write(MultipartBuilder.CRLF);
                if (headers != null) {
                    int headerCount = headers.size();
                    for (int h = 0; h < headerCount; h++) {
                        sink.writeUtf8(headers.name(h)).write(MultipartBuilder.COLONSPACE).writeUtf8(headers.value(h)).write(MultipartBuilder.CRLF);
                    }
                }
                MediaType contentType = body.contentType();
                if (contentType != null) {
                    sink.writeUtf8("Content-Type: ").writeUtf8(contentType.toString()).write(MultipartBuilder.CRLF);
                }
                long contentLength = body.contentLength();
                if (contentLength != -1) {
                    sink.writeUtf8("Content-Length: ").writeDecimalLong(contentLength).write(MultipartBuilder.CRLF);
                } else if (countBytes) {
                    bufferedSink.clear();
                    return -1L;
                }
                sink.write(MultipartBuilder.CRLF);
                if (countBytes) {
                    byteCount += contentLength;
                } else {
                    this.partBodies.get(p).writeTo(sink);
                }
                sink.write(MultipartBuilder.CRLF);
            }
            sink.write(MultipartBuilder.DASHDASH);
            sink.write(this.boundary);
            sink.write(MultipartBuilder.DASHDASH);
            sink.write(MultipartBuilder.CRLF);
            if (countBytes) {
                byteCount += bufferedSink.size();
                bufferedSink.clear();
            }
            return byteCount;
        }

        @Override // com.squareup.okhttp.RequestBody
        public void writeTo(BufferedSink sink) throws IOException {
            writeOrCountBytes(sink, false);
        }
    }
}
