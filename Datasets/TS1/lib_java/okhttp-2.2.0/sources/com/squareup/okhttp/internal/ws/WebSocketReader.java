package com.squareup.okhttp.internal.ws;

import com.squareup.okhttp.internal.ws.WebSocket;
import java.io.EOFException;
import java.io.IOException;
import java.net.ProtocolException;
import okio.Buffer;
import okio.BufferedSource;
import okio.Okio;
import okio.Source;
import okio.Timeout;

/*  JADX ERROR: NullPointerException in pass: ClassModifier
    java.lang.NullPointerException: Cannot invoke "java.util.List.forEach(java.util.function.Consumer)" because "blocks" is null
    	at jadx.core.utils.BlockUtils.collectAllInsns(BlockUtils.java:1029)
    	at jadx.core.dex.visitors.ClassModifier.removeBridgeMethod(ClassModifier.java:245)
    	at jadx.core.dex.visitors.ClassModifier.removeSyntheticMethods(ClassModifier.java:160)
    	at java.base/java.util.ArrayList.forEach(ArrayList.java:1511)
    	at jadx.core.dex.visitors.ClassModifier.visit(ClassModifier.java:65)
    */
/* loaded from: okhttp-2.2.0.jar:com/squareup/okhttp/internal/ws/WebSocketReader.class */
public final class WebSocketReader {
    private final boolean isClient;
    private final BufferedSource source;
    private final WebSocketListener listener;
    private final FrameCallback frameCallback;
    private boolean closed;
    private boolean messageClosed;
    private int opcode;
    private long frameLength;
    private long frameBytesRead;
    private boolean isFinalFrame;
    private boolean isControlFrame;
    private boolean isMasked;
    private final Source framedMessageSource = new FramedMessageSource();
    private final byte[] maskKey = new byte[4];
    private final byte[] maskBuffer = new byte[2048];

    /* loaded from: okhttp-2.2.0.jar:com/squareup/okhttp/internal/ws/WebSocketReader$FrameCallback.class */
    public interface FrameCallback {
        void onPing(Buffer buffer);

        void onClose(Buffer buffer) throws IOException;
    }

    /*  JADX ERROR: Failed to decode insn: 0x0002: MOVE_MULTI
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
        	at jadx.core.ProcessClass.process(ProcessClass.java:69)
        	at jadx.core.ProcessClass.generateCode(ProcessClass.java:117)
        	at jadx.core.dex.nodes.ClassNode.generateClassCode(ClassNode.java:401)
        	at jadx.core.dex.nodes.ClassNode.decompile(ClassNode.java:389)
        	at jadx.core.dex.nodes.ClassNode.getCode(ClassNode.java:339)
        */
    static /* synthetic */ long access$302(com.squareup.okhttp.internal.ws.WebSocketReader r6, long r7) {
        /*
            r0 = r6
            r1 = r7
            // decode failed: arraycopy: source index -1 out of bounds for object array[6]
            r0.frameBytesRead = r1
            return r-1
        */
        throw new UnsupportedOperationException("Method not decompiled: com.squareup.okhttp.internal.ws.WebSocketReader.access$302(com.squareup.okhttp.internal.ws.WebSocketReader, long):long");
    }

    public WebSocketReader(boolean isClient, BufferedSource source, WebSocketListener listener, FrameCallback frameCallback) {
        if (source == null) {
            throw new NullPointerException("source");
        }
        if (listener == null) {
            throw new NullPointerException("listener");
        }
        if (frameCallback == null) {
            throw new NullPointerException("frameCallback");
        }
        this.isClient = isClient;
        this.source = source;
        this.listener = listener;
        this.frameCallback = frameCallback;
    }

    public void readMessage() throws IOException {
        WebSocket.PayloadType type;
        readUntilNonControlFrame();
        if (this.closed) {
            return;
        }
        switch (this.opcode) {
            case 1:
                type = WebSocket.PayloadType.TEXT;
                break;
            case 2:
                type = WebSocket.PayloadType.BINARY;
                break;
            default:
                throw new IllegalStateException("Unknown opcode: " + Integer.toHexString(this.opcode));
        }
        this.messageClosed = false;
        this.listener.onMessage(Okio.buffer(this.framedMessageSource), type);
        if (!this.messageClosed) {
            throw new IllegalStateException("Listener failed to call close on message payload.");
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void readUntilNonControlFrame() throws IOException {
        while (!this.closed) {
            readHeader();
            if (this.isControlFrame) {
                readControlFrame();
            } else {
                return;
            }
        }
    }

    private void readHeader() throws IOException {
        if (this.closed) {
            throw new IllegalStateException("Closed");
        }
        int b0 = this.source.readByte() & 255;
        this.opcode = b0 & 15;
        this.isFinalFrame = (b0 & 128) != 0;
        this.isControlFrame = (b0 & 8) != 0;
        if (this.isControlFrame && !this.isFinalFrame) {
            throw new ProtocolException("Control frames must be final.");
        }
        boolean reservedFlag1 = (b0 & 64) != 0;
        boolean reservedFlag2 = (b0 & 32) != 0;
        boolean reservedFlag3 = (b0 & 16) != 0;
        if (reservedFlag1 || reservedFlag2 || reservedFlag3) {
            throw new ProtocolException("Reserved flags are unsupported.");
        }
        int b1 = this.source.readByte() & 255;
        this.isMasked = (b1 & 128) != 0;
        if (this.isMasked == this.isClient) {
            throw new ProtocolException("Client-sent frames must be masked. Server sent must not.");
        }
        this.frameLength = b1 & 127;
        if (this.frameLength == 126) {
            this.frameLength = this.source.readShort();
        } else if (this.frameLength == 127) {
            this.frameLength = this.source.readLong();
        }
        this.frameBytesRead = 0L;
        if (this.isControlFrame && this.frameLength > 125) {
            throw new ProtocolException("Control frame must be less than 125B.");
        }
        if (this.isMasked) {
            this.source.readFully(this.maskKey);
        }
    }

    private void readControlFrame() throws IOException {
        Buffer buffer = null;
        if (this.frameBytesRead < this.frameLength) {
            buffer = new Buffer();
            if (this.isClient) {
                this.source.readFully(buffer, this.frameLength);
            } else {
                while (this.frameBytesRead < this.frameLength) {
                    int toRead = (int) Math.min(this.frameLength - this.frameBytesRead, this.maskBuffer.length);
                    int read = this.source.read(this.maskBuffer, 0, toRead);
                    if (read == -1) {
                        throw new EOFException();
                    }
                    Protocol.toggleMask(this.maskBuffer, read, this.maskKey, this.frameBytesRead);
                    buffer.write(this.maskBuffer, 0, read);
                    this.frameBytesRead += read;
                }
            }
        }
        switch (this.opcode) {
            case 8:
                this.frameCallback.onClose(buffer != null ? buffer.clone() : null);
                this.closed = true;
                int code = 0;
                String reason = "";
                if (buffer != null) {
                    code = buffer.readShort();
                    reason = buffer.readUtf8();
                }
                this.listener.onClose(code, reason);
                return;
            case 9:
                this.frameCallback.onPing(buffer);
                return;
            case 10:
                return;
            default:
                throw new IllegalStateException("Unknown control opcode: " + Integer.toHexString(this.opcode));
        }
    }

    /* loaded from: okhttp-2.2.0.jar:com/squareup/okhttp/internal/ws/WebSocketReader$FramedMessageSource.class */
    private final class FramedMessageSource implements Source {
        private FramedMessageSource() {
        }

        /* JADX WARN: Failed to check method for inline after forced processcom.squareup.okhttp.internal.ws.WebSocketReader.access$302(com.squareup.okhttp.internal.ws.WebSocketReader, long):long */
        public long read(Buffer sink, long byteCount) throws IOException {
            long read;
            if (WebSocketReader.this.closed) {
                throw new IOException("Closed");
            }
            if (WebSocketReader.this.messageClosed) {
                throw new IllegalStateException("Closed");
            }
            if (WebSocketReader.this.frameBytesRead == WebSocketReader.this.frameLength) {
                if (WebSocketReader.this.isFinalFrame) {
                    return -1L;
                }
                WebSocketReader.this.readUntilNonControlFrame();
                if (WebSocketReader.this.opcode != 0) {
                    throw new ProtocolException("Expected continuation opcode. Got: " + Integer.toHexString(WebSocketReader.this.opcode));
                }
            }
            long toRead = Math.min(byteCount, WebSocketReader.this.frameLength - WebSocketReader.this.frameBytesRead);
            if (!WebSocketReader.this.isMasked) {
                read = WebSocketReader.this.source.read(sink, toRead);
                if (read == -1) {
                    throw new EOFException();
                }
            } else {
                read = WebSocketReader.this.source.read(WebSocketReader.this.maskBuffer, 0, (int) Math.min(toRead, WebSocketReader.this.maskBuffer.length));
                if (read == -1) {
                    throw new EOFException();
                }
                Protocol.toggleMask(WebSocketReader.this.maskBuffer, read, WebSocketReader.this.maskKey, WebSocketReader.this.frameBytesRead);
                sink.write(WebSocketReader.this.maskBuffer, 0, (int) read);
            }
            WebSocketReader.access$302(WebSocketReader.this, WebSocketReader.this.frameBytesRead + read);
            return read;
        }

        public Timeout timeout() {
            return WebSocketReader.this.source.timeout();
        }

        public void close() throws IOException {
            if (WebSocketReader.this.messageClosed) {
                return;
            }
            WebSocketReader.this.messageClosed = true;
            if (WebSocketReader.this.closed) {
                return;
            }
            WebSocketReader.this.source.skip(WebSocketReader.this.frameLength - WebSocketReader.this.frameBytesRead);
            while (!WebSocketReader.this.isFinalFrame) {
                WebSocketReader.this.readUntilNonControlFrame();
                WebSocketReader.this.source.skip(WebSocketReader.this.frameLength);
            }
        }
    }
}
