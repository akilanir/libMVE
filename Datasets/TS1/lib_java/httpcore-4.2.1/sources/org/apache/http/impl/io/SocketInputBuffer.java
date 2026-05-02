package org.apache.http.impl.io;

import java.io.IOException;
import java.net.Socket;
import java.net.SocketTimeoutException;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.io.EofSensor;
import org.apache.http.params.HttpParams;

@NotThreadSafe
/* loaded from: httpcore-4.2.1.jar:org/apache/http/impl/io/SocketInputBuffer.class */
public class SocketInputBuffer extends AbstractSessionInputBuffer implements EofSensor {
    private final Socket socket;
    private boolean eof;

    public SocketInputBuffer(Socket socket, int buffersize, HttpParams params) throws IOException {
        if (socket == null) {
            throw new IllegalArgumentException("Socket may not be null");
        }
        this.socket = socket;
        this.eof = false;
        buffersize = buffersize < 0 ? socket.getReceiveBufferSize() : buffersize;
        init(socket.getInputStream(), buffersize < 1024 ? 1024 : buffersize, params);
    }

    @Override // org.apache.http.impl.io.AbstractSessionInputBuffer
    protected int fillBuffer() throws IOException {
        int i = super.fillBuffer();
        this.eof = i == -1;
        return i;
    }

    @Override // org.apache.http.io.SessionInputBuffer
    public boolean isDataAvailable(int timeout) throws IOException {
        boolean result = hasBufferedData();
        if (!result) {
            int oldtimeout = this.socket.getSoTimeout();
            try {
                try {
                    this.socket.setSoTimeout(timeout);
                    fillBuffer();
                    result = hasBufferedData();
                    this.socket.setSoTimeout(oldtimeout);
                } catch (SocketTimeoutException ex) {
                    throw ex;
                }
            } catch (Throwable th) {
                this.socket.setSoTimeout(oldtimeout);
                throw th;
            }
        }
        return result;
    }

    @Override // org.apache.http.io.EofSensor
    public boolean isEof() {
        return this.eof;
    }
}
