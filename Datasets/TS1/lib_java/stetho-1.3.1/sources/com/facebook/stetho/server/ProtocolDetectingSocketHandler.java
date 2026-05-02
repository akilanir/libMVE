package com.facebook.stetho.server;

import android.content.Context;
import android.net.LocalSocket;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/server/ProtocolDetectingSocketHandler.class */
public class ProtocolDetectingSocketHandler extends SecureSocketHandler {
    private static final int SENSING_BUFFER_SIZE = 256;
    private final ArrayList<HandlerInfo> mHandlers;

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/server/ProtocolDetectingSocketHandler$MagicMatcher.class */
    public interface MagicMatcher {
        boolean matches(InputStream inputStream) throws IOException;
    }

    public ProtocolDetectingSocketHandler(Context context) {
        super(context);
        this.mHandlers = new ArrayList<>(2);
    }

    public void addHandler(MagicMatcher magicMatcher, SocketLikeHandler handler) {
        this.mHandlers.add(new HandlerInfo(magicMatcher, handler));
    }

    @Override // com.facebook.stetho.server.SecureSocketHandler
    protected void onSecured(LocalSocket socket) throws IOException {
        LeakyBufferedInputStream leakyIn = new LeakyBufferedInputStream(socket.getInputStream(), SENSING_BUFFER_SIZE);
        if (this.mHandlers.isEmpty()) {
            throw new IllegalStateException("No handlers added");
        }
        int N = this.mHandlers.size();
        for (int i = 0; i < N; i++) {
            HandlerInfo handlerInfo = this.mHandlers.get(i);
            leakyIn.mark(SENSING_BUFFER_SIZE);
            boolean matches = handlerInfo.magicMatcher.matches(leakyIn);
            leakyIn.reset();
            if (matches) {
                SocketLike socketLike = new SocketLike(socket, leakyIn);
                handlerInfo.handler.onAccepted(socketLike);
                return;
            }
        }
        throw new IOException("No matching handler, firstByte=" + leakyIn.read());
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/server/ProtocolDetectingSocketHandler$ExactMagicMatcher.class */
    public static class ExactMagicMatcher implements MagicMatcher {
        private final byte[] mMagic;

        public ExactMagicMatcher(byte[] magic) {
            this.mMagic = magic;
        }

        @Override // com.facebook.stetho.server.ProtocolDetectingSocketHandler.MagicMatcher
        public boolean matches(InputStream in) throws IOException {
            byte[] buf = new byte[this.mMagic.length];
            int n = in.read(buf);
            return n == buf.length && Arrays.equals(buf, this.mMagic);
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/server/ProtocolDetectingSocketHandler$AlwaysMatchMatcher.class */
    public static class AlwaysMatchMatcher implements MagicMatcher {
        @Override // com.facebook.stetho.server.ProtocolDetectingSocketHandler.MagicMatcher
        public boolean matches(InputStream in) throws IOException {
            return true;
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/server/ProtocolDetectingSocketHandler$HandlerInfo.class */
    private static class HandlerInfo {
        public final MagicMatcher magicMatcher;
        public final SocketLikeHandler handler;

        private HandlerInfo(MagicMatcher magicMatcher, SocketLikeHandler handler) {
            this.magicMatcher = magicMatcher;
            this.handler = handler;
        }
    }
}
