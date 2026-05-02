package com.squareup.okhttp.internal.ws;

import com.squareup.okhttp.Call;
import com.squareup.okhttp.Connection;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Response;
import com.squareup.okhttp.internal.Internal;
import com.squareup.okhttp.internal.NamedRunnable;
import com.squareup.okhttp.internal.Util;
import com.squareup.okhttp.internal.ws.WebSocketReader;
import java.io.IOException;
import java.net.ProtocolException;
import java.net.Socket;
import java.security.SecureRandom;
import java.util.Collections;
import java.util.Random;
import java.util.concurrent.Executor;
import java.util.concurrent.LinkedBlockingDeque;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import okio.Buffer;
import okio.BufferedSink;
import okio.BufferedSource;
import okio.ByteString;
import okio.Okio;

/* loaded from: okhttp-2.2.0.jar:com/squareup/okhttp/internal/ws/WebSocket.class */
public final class WebSocket {
    private static final String ACCEPT_MAGIC = "258EAFA5-E914-47DA-95CA-C5AB0DC85B11";
    private static final int CLOSE_PROTOCOL_EXCEPTION = 1002;
    private final OkHttpClient client;
    private final Request request;
    private final Random random;
    private final String key;
    private final Executor pongExecutor;
    private volatile boolean writerClosed;
    private volatile boolean readerClosed;
    private final Object closeLock = new Object();
    private boolean connected;
    private Connection connection;
    private WebSocketWriter writer;

    /* loaded from: okhttp-2.2.0.jar:com/squareup/okhttp/internal/ws/WebSocket$PayloadType.class */
    public enum PayloadType {
        TEXT,
        BINARY
    }

    public static WebSocket newWebSocket(OkHttpClient client, Request request) {
        OkHttpClient client2 = client.m9clone();
        client2.setProtocols(Collections.singletonList(com.squareup.okhttp.Protocol.HTTP_1_1));
        return new WebSocket(client2, request, new SecureRandom());
    }

    WebSocket(OkHttpClient client, Request request, Random random) {
        String httpUrl;
        this.client = client;
        this.random = random;
        ThreadPoolExecutor pongExecutor = new ThreadPoolExecutor(1, 1, 1L, TimeUnit.SECONDS, new LinkedBlockingDeque());
        pongExecutor.allowCoreThreadTimeOut(true);
        this.pongExecutor = pongExecutor;
        if (!"GET".equals(request.method())) {
            throw new IllegalArgumentException("Request must be GET: " + request.method());
        }
        String url = request.urlString();
        if (url.startsWith("ws://")) {
            httpUrl = "http://" + url.substring(5);
        } else if (url.startsWith("wss://")) {
            httpUrl = "https://" + url.substring(6);
        } else if (url.startsWith("http://") || url.startsWith("https://")) {
            httpUrl = url;
        } else {
            throw new IllegalArgumentException("Request url must use 'ws', 'wss', 'http', or 'https' scheme: " + url);
        }
        byte[] nonce = new byte[16];
        random.nextBytes(nonce);
        this.key = ByteString.of(nonce).base64();
        this.request = request.newBuilder().url(httpUrl).header("Upgrade", "websocket").header("Connection", "Upgrade").header("Sec-WebSocket-Key", this.key).header("Sec-WebSocket-Version", "13").build();
    }

    public Request request() {
        return this.request;
    }

    public Response connect(WebSocketListener listener) throws IOException {
        if (this.connected) {
            throw new IllegalStateException("Already connected");
        }
        if (this.writerClosed) {
            throw new IllegalStateException("Closed");
        }
        Call call = Internal.instance.newCall(this.client, this.request);
        Response response = Internal.instance.callGetResponse(call, true);
        if (response.code() != 101) {
            Internal.instance.callEngineReleaseConnection(call);
        } else {
            String headerConnection = response.header("Connection");
            if (!"Upgrade".equalsIgnoreCase(headerConnection)) {
                throw new ProtocolException("Expected 'Connection' header value 'Upgrade' but was: " + headerConnection);
            }
            String headerUpgrade = response.header("Upgrade");
            if (!"websocket".equalsIgnoreCase(headerUpgrade)) {
                throw new ProtocolException("Expected 'Upgrade' header value 'websocket' but was: " + headerUpgrade);
            }
            String headerAccept = response.header("Sec-WebSocket-Accept");
            String acceptExpected = Util.shaBase64(this.key + ACCEPT_MAGIC);
            if (!acceptExpected.equals(headerAccept)) {
                throw new ProtocolException("Expected 'Sec-WebSocket-Accept' header value '" + acceptExpected + "' but was: " + headerAccept);
            }
            this.connection = Internal.instance.callEngineGetConnection(call);
            if (!Internal.instance.connectionClearOwner(this.connection)) {
                throw new IllegalStateException("Unable to take ownership of connection.");
            }
            Internal.instance.connectionSetOwner(this.connection, this);
            this.connected = true;
            Socket socket = this.connection.getSocket();
            BufferedSink sink = Okio.buffer(Okio.sink(socket));
            this.writer = new WebSocketWriter(true, sink, this.random);
            BufferedSource source = Okio.buffer(Okio.source(socket));
            WebSocketReader reader = new WebSocketReader(true, source, listener, new WebSocketReader.FrameCallback() { // from class: com.squareup.okhttp.internal.ws.WebSocket.1
                @Override // com.squareup.okhttp.internal.ws.WebSocketReader.FrameCallback
                public void onPing(final Buffer buffer) {
                    WebSocket.this.pongExecutor.execute(new NamedRunnable("WebSocket PongWriter", new Object[0]) { // from class: com.squareup.okhttp.internal.ws.WebSocket.1.1
                        @Override // com.squareup.okhttp.internal.NamedRunnable
                        protected void execute() {
                            try {
                                WebSocket.this.writer.writePong(buffer);
                            } catch (IOException e) {
                            }
                        }
                    });
                }

                @Override // com.squareup.okhttp.internal.ws.WebSocketReader.FrameCallback
                public void onClose(Buffer buffer) throws IOException {
                    WebSocket.this.peerClose(buffer);
                }
            });
            ReaderRunnable readerRunnable = new ReaderRunnable(this.request.urlString(), reader, listener);
            new Thread(readerRunnable).start();
        }
        return response;
    }

    public BufferedSink newMessageSink(PayloadType type) {
        if (this.writerClosed) {
            throw new IllegalStateException("Closed");
        }
        if (this.connected) {
            return this.writer.newMessageSink(type);
        }
        throw new IllegalStateException("Not connected");
    }

    public void sendMessage(PayloadType type, Buffer payload) throws IOException {
        if (this.writerClosed) {
            throw new IllegalStateException("Closed");
        }
        if (!this.connected) {
            throw new IllegalStateException("Not connected");
        }
        this.writer.sendMessage(type, payload);
    }

    public void close(int code, String reason) throws IOException {
        synchronized (this.closeLock) {
            if (this.writerClosed) {
                return;
            }
            this.writerClosed = true;
            boolean closeConnection = this.readerClosed;
            this.writer.writeClose(code, reason);
            this.writer = null;
            if (closeConnection) {
                closeConnection();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void peerClose(Buffer buffer) throws IOException {
        boolean closeConnection;
        synchronized (this.closeLock) {
            this.readerClosed = true;
            closeConnection = this.writerClosed;
            this.writerClosed = true;
        }
        if (closeConnection) {
            closeConnection();
        } else {
            this.writer.writeClose(buffer);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void readerErrorClose(IOException e, WebSocketListener listener) {
        boolean closeConnection;
        synchronized (this.closeLock) {
            this.readerClosed = true;
            closeConnection = !this.writerClosed;
            this.writerClosed = true;
        }
        if (closeConnection) {
            if (e instanceof ProtocolException) {
                try {
                    this.writer.writeClose(CLOSE_PROTOCOL_EXCEPTION, null);
                } catch (IOException e2) {
                }
            }
            try {
                closeConnection();
            } catch (IOException e3) {
            }
        }
        listener.onFailure(e);
    }

    private void closeConnection() throws IOException {
        Internal.instance.connectionCloseIfOwnedBy(this.connection, this);
        this.connection = null;
    }

    public boolean isClosed() {
        return this.writerClosed;
    }

    /* loaded from: okhttp-2.2.0.jar:com/squareup/okhttp/internal/ws/WebSocket$ReaderRunnable.class */
    private class ReaderRunnable extends NamedRunnable {
        private final WebSocketReader reader;
        private final WebSocketListener listener;

        public ReaderRunnable(String url, WebSocketReader reader, WebSocketListener listener) {
            super("WebSocketReader " + url, new Object[0]);
            this.reader = reader;
            this.listener = listener;
        }

        @Override // com.squareup.okhttp.internal.NamedRunnable
        protected void execute() {
            while (!WebSocket.this.readerClosed) {
                try {
                    this.reader.readMessage();
                } catch (IOException e) {
                    WebSocket.this.readerErrorClose(e, this.listener);
                    return;
                }
            }
        }
    }
}
