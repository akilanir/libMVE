package com.koushikdutta.async;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.ClosedChannelException;
import java.nio.channels.SelectionKey;
import java.nio.channels.Selector;
import java.nio.channels.ServerSocketChannel;

/* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/ServerSocketChannelWrapper.class */
class ServerSocketChannelWrapper extends ChannelWrapper {
    ServerSocketChannel mChannel;
    static final /* synthetic */ boolean $assertionsDisabled;

    static {
        $assertionsDisabled = !ServerSocketChannelWrapper.class.desiredAssertionStatus();
    }

    @Override // com.koushikdutta.async.ChannelWrapper
    public void shutdownOutput() {
    }

    @Override // com.koushikdutta.async.ChannelWrapper
    public void shutdownInput() {
    }

    @Override // com.koushikdutta.async.ChannelWrapper
    public int getLocalPort() {
        return this.mChannel.socket().getLocalPort();
    }

    ServerSocketChannelWrapper(ServerSocketChannel channel) throws IOException {
        super(channel);
        this.mChannel = channel;
    }

    @Override // java.nio.channels.ReadableByteChannel
    public int read(ByteBuffer buffer) throws IOException {
        if ($assertionsDisabled) {
            throw new IOException("Can't read ServerSocketChannel");
        }
        throw new AssertionError();
    }

    @Override // com.koushikdutta.async.ChannelWrapper
    public boolean isConnected() {
        if ($assertionsDisabled) {
            return false;
        }
        throw new AssertionError();
    }

    @Override // com.koushikdutta.async.ChannelWrapper
    public int write(ByteBuffer src) throws IOException {
        if ($assertionsDisabled) {
            throw new IOException("Can't write ServerSocketChannel");
        }
        throw new AssertionError();
    }

    @Override // com.koushikdutta.async.ChannelWrapper
    public SelectionKey register(Selector sel) throws ClosedChannelException {
        return this.mChannel.register(sel, 16);
    }

    @Override // com.koushikdutta.async.ChannelWrapper
    public int write(ByteBuffer[] src) throws IOException {
        if ($assertionsDisabled) {
            throw new IOException("Can't write ServerSocketChannel");
        }
        throw new AssertionError();
    }

    @Override // java.nio.channels.ScatteringByteChannel
    public long read(ByteBuffer[] byteBuffers) throws IOException {
        if ($assertionsDisabled) {
            throw new IOException("Can't read ServerSocketChannel");
        }
        throw new AssertionError();
    }

    @Override // java.nio.channels.ScatteringByteChannel
    public long read(ByteBuffer[] byteBuffers, int i, int i2) throws IOException {
        if ($assertionsDisabled) {
            throw new IOException("Can't read ServerSocketChannel");
        }
        throw new AssertionError();
    }

    @Override // com.koushikdutta.async.ChannelWrapper
    public Object getSocket() {
        return this.mChannel.socket();
    }
}
