package com.koushikdutta.async.stream;

import com.koushikdutta.async.AsyncServer;
import com.koushikdutta.async.ByteBufferList;
import com.koushikdutta.async.DataSink;
import com.koushikdutta.async.callback.CompletedCallback;
import com.koushikdutta.async.callback.WritableCallback;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.ByteBuffer;

/* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/stream/OutputStreamDataSink.class */
public class OutputStreamDataSink implements DataSink {
    AsyncServer server;
    OutputStream mStream;
    WritableCallback mWritable;
    boolean closeReported;
    Exception closeException;
    CompletedCallback mClosedCallback;
    WritableCallback outputStreamCallback;

    public OutputStreamDataSink(AsyncServer server) {
        this(server, null);
    }

    @Override // com.koushikdutta.async.DataSink
    public void end() {
        try {
            if (this.mStream != null) {
                this.mStream.close();
            }
            reportClose(null);
        } catch (IOException e) {
            reportClose(e);
        }
    }

    public OutputStreamDataSink(AsyncServer server, OutputStream stream) {
        this.server = server;
        setOutputStream(stream);
    }

    public void setOutputStream(OutputStream stream) {
        this.mStream = stream;
    }

    public OutputStream getOutputStream() throws IOException {
        return this.mStream;
    }

    @Override // com.koushikdutta.async.DataSink
    public void write(ByteBufferList bb) {
        while (bb.size() > 0) {
            try {
                ByteBuffer b = bb.remove();
                getOutputStream().write(b.array(), b.arrayOffset() + b.position(), b.remaining());
                ByteBufferList.reclaim(b);
            } catch (IOException e) {
                reportClose(e);
                return;
            } finally {
                bb.recycle();
            }
        }
    }

    @Override // com.koushikdutta.async.DataSink
    public void setWriteableCallback(WritableCallback handler) {
        this.mWritable = handler;
    }

    @Override // com.koushikdutta.async.DataSink
    public WritableCallback getWriteableCallback() {
        return this.mWritable;
    }

    @Override // com.koushikdutta.async.DataSink
    public boolean isOpen() {
        return this.closeReported;
    }

    public void reportClose(Exception ex) {
        if (this.closeReported) {
            return;
        }
        this.closeReported = true;
        this.closeException = ex;
        if (this.mClosedCallback != null) {
            this.mClosedCallback.onCompleted(this.closeException);
        }
    }

    @Override // com.koushikdutta.async.DataSink
    public void setClosedCallback(CompletedCallback handler) {
        this.mClosedCallback = handler;
    }

    @Override // com.koushikdutta.async.DataSink
    public CompletedCallback getClosedCallback() {
        return this.mClosedCallback;
    }

    @Override // com.koushikdutta.async.DataSink
    public AsyncServer getServer() {
        return this.server;
    }

    public void setOutputStreamWritableCallback(WritableCallback outputStreamCallback) {
        this.outputStreamCallback = outputStreamCallback;
    }
}
