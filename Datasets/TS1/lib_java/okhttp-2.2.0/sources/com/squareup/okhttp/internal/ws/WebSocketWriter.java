package com.squareup.okhttp.internal.ws;

import com.squareup.okhttp.internal.ws.WebSocket;
import java.io.IOException;
import java.util.Random;
import okio.Buffer;
import okio.BufferedSink;
import okio.BufferedSource;
import okio.Okio;
import okio.Sink;
import okio.Timeout;

/* loaded from: okhttp-2.2.0.jar:com/squareup/okhttp/internal/ws/WebSocketWriter.class */
public final class WebSocketWriter {
    private final boolean isClient;
    private final BufferedSink sink;
    private final Random random;
    private boolean closed;
    private boolean activeWriter;
    private final FrameSink frameSink = new FrameSink();
    private final byte[] maskKey = new byte[4];
    private final byte[] maskBuffer = new byte[2048];

    public WebSocketWriter(boolean isClient, BufferedSink sink, Random random) {
        if (sink == null) {
            throw new NullPointerException("sink");
        }
        if (random == null) {
            throw new NullPointerException("random");
        }
        this.isClient = isClient;
        this.sink = sink;
        this.random = random;
    }

    public boolean isClosed() {
        return this.closed;
    }

    public void writePing(Buffer payload) throws IOException {
        if (this.closed) {
            throw new IllegalStateException("Closed");
        }
        synchronized (this.sink) {
            writeControlFrame(9, payload);
        }
    }

    public void writePong(Buffer payload) throws IOException {
        if (this.closed) {
            throw new IllegalStateException("Closed");
        }
        synchronized (this.sink) {
            writeControlFrame(10, payload);
        }
    }

    public void writeClose(int code, String reason) throws IOException {
        if (this.closed) {
            throw new IllegalStateException("Closed");
        }
        Buffer payload = null;
        if (code != 0) {
            if (code < 1000 || code >= 5000) {
                throw new IllegalArgumentException("Code must be in range [1000,5000).");
            }
            payload = new Buffer();
            payload.writeShort(code);
            if (reason != null) {
                payload.writeUtf8(reason);
            }
        } else if (reason != null) {
            throw new IllegalArgumentException("Code required to include reason.");
        }
        writeClose(payload);
    }

    public void writeClose(Buffer payload) throws IOException {
        synchronized (this.sink) {
            writeControlFrame(8, payload);
            this.closed = true;
        }
    }

    private void writeControlFrame(int opcode, Buffer payload) throws IOException {
        int length = 0;
        if (payload != null) {
            length = (int) payload.size();
            if (length > 125) {
                throw new IllegalArgumentException("Control frame payload must be less than 125B.");
            }
        }
        int b0 = 128 | opcode;
        this.sink.writeByte(b0);
        int b1 = length;
        if (this.isClient) {
            this.sink.writeByte(b1 | 128);
            this.random.nextBytes(this.maskKey);
            this.sink.write(this.maskKey);
            if (payload != null) {
                writeAllMasked(payload, length);
            }
        } else {
            this.sink.writeByte(b1);
            if (payload != null) {
                this.sink.writeAll(payload);
            }
        }
        this.sink.flush();
    }

    public BufferedSink newMessageSink(WebSocket.PayloadType type) {
        if (type == null) {
            throw new NullPointerException("type == null");
        }
        if (this.closed) {
            throw new IllegalStateException("Closed");
        }
        if (this.activeWriter) {
            throw new IllegalStateException("Another message writer is active. Did you call close()?");
        }
        this.activeWriter = true;
        this.frameSink.payloadType = type;
        this.frameSink.isFirstFrame = true;
        return Okio.buffer(this.frameSink);
    }

    public void sendMessage(WebSocket.PayloadType type, Buffer payload) throws IOException {
        if (type == null) {
            throw new NullPointerException("type == null");
        }
        if (payload == null) {
            throw new NullPointerException("payload == null");
        }
        if (this.closed) {
            throw new IllegalStateException("Closed");
        }
        if (this.activeWriter) {
            throw new IllegalStateException("A message writer is active. Did you call close()?");
        }
        writeFrame(type, payload, payload.size(), true, true);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:17:0x0082 A[Catch: all -> 0x0133, TryCatch #0 {, blocks: (B:14:0x0064, B:15:0x006c, B:17:0x0082, B:20:0x009d, B:25:0x00fb, B:27:0x0102, B:29:0x0124, B:30:0x012f, B:28:0x0119, B:23:0x00bb, B:24:0x00dd), top: B:38:0x0064 }] */
    /* JADX WARN: Removed duplicated region for block: B:20:0x009d A[Catch: all -> 0x0133, TryCatch #0 {, blocks: (B:14:0x0064, B:15:0x006c, B:17:0x0082, B:20:0x009d, B:25:0x00fb, B:27:0x0102, B:29:0x0124, B:30:0x012f, B:28:0x0119, B:23:0x00bb, B:24:0x00dd), top: B:38:0x0064 }] */
    /* JADX WARN: Removed duplicated region for block: B:21:0x00b3  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0102 A[Catch: all -> 0x0133, TryCatch #0 {, blocks: (B:14:0x0064, B:15:0x006c, B:17:0x0082, B:20:0x009d, B:25:0x00fb, B:27:0x0102, B:29:0x0124, B:30:0x012f, B:28:0x0119, B:23:0x00bb, B:24:0x00dd), top: B:38:0x0064 }] */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0119 A[Catch: all -> 0x0133, TryCatch #0 {, blocks: (B:14:0x0064, B:15:0x006c, B:17:0x0082, B:20:0x009d, B:25:0x00fb, B:27:0x0102, B:29:0x0124, B:30:0x012f, B:28:0x0119, B:23:0x00bb, B:24:0x00dd), top: B:38:0x0064 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void writeFrame(com.squareup.okhttp.internal.ws.WebSocket.PayloadType r6, okio.Buffer r7, long r8, boolean r10, boolean r11) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 316
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.squareup.okhttp.internal.ws.WebSocketWriter.writeFrame(com.squareup.okhttp.internal.ws.WebSocket$PayloadType, okio.Buffer, long, boolean, boolean):void");
    }

    private void writeAllMasked(BufferedSource source, long byteCount) throws IOException {
        long j = 0;
        while (true) {
            long written = j;
            if (written < byteCount) {
                int toRead = (int) Math.min(byteCount, this.maskBuffer.length);
                int read = source.read(this.maskBuffer, 0, toRead);
                if (read == -1) {
                    throw new AssertionError();
                }
                Protocol.toggleMask(this.maskBuffer, read, this.maskKey, written);
                this.sink.write(this.maskBuffer, 0, read);
                j = written + read;
            } else {
                return;
            }
        }
    }

    /* loaded from: okhttp-2.2.0.jar:com/squareup/okhttp/internal/ws/WebSocketWriter$FrameSink.class */
    private final class FrameSink implements Sink {
        private WebSocket.PayloadType payloadType;
        private boolean isFirstFrame;

        private FrameSink() {
        }

        public void write(Buffer source, long byteCount) throws IOException {
            WebSocketWriter.this.writeFrame(this.payloadType, source, byteCount, this.isFirstFrame, false);
            this.isFirstFrame = false;
        }

        public void flush() throws IOException {
            synchronized (WebSocketWriter.this.sink) {
                WebSocketWriter.this.sink.flush();
            }
        }

        public Timeout timeout() {
            return WebSocketWriter.this.sink.timeout();
        }

        public void close() throws IOException {
            synchronized (WebSocketWriter.this.sink) {
                WebSocketWriter.this.sink.writeByte(128);
                if (WebSocketWriter.this.isClient) {
                    WebSocketWriter.this.sink.writeByte(128 | 0);
                    WebSocketWriter.this.random.nextBytes(WebSocketWriter.this.maskKey);
                    WebSocketWriter.this.sink.write(WebSocketWriter.this.maskKey);
                } else {
                    WebSocketWriter.this.sink.writeByte(0);
                }
                WebSocketWriter.this.sink.flush();
            }
            WebSocketWriter.this.activeWriter = false;
        }
    }
}
