package cz.msebera.android.httpclient.impl.io;

import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.io.EofSensor;
import cz.msebera.android.httpclient.params.HttpParams;
import cz.msebera.android.httpclient.util.Args;
import java.io.IOException;
import java.net.Socket;

@NotThreadSafe
@Deprecated
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/io/SocketInputBuffer.class */
public class SocketInputBuffer extends AbstractSessionInputBuffer implements EofSensor {
    private final Socket socket;
    private boolean eof;

    public SocketInputBuffer(Socket socket, int buffersize, HttpParams params) throws IOException {
        Args.notNull(socket, "Socket");
        this.socket = socket;
        this.eof = false;
        int n = buffersize;
        n = n < 0 ? socket.getReceiveBufferSize() : n;
        init(socket.getInputStream(), n < 1024 ? 1024 : n, params);
    }

    @Override // cz.msebera.android.httpclient.impl.io.AbstractSessionInputBuffer
    protected int fillBuffer() throws IOException {
        int i = super.fillBuffer();
        this.eof = i == -1;
        return i;
    }

    @Override // cz.msebera.android.httpclient.io.SessionInputBuffer
    public boolean isDataAvailable(int timeout) throws IOException {
        boolean result = hasBufferedData();
        if (!result) {
            int oldtimeout = this.socket.getSoTimeout();
            try {
                this.socket.setSoTimeout(timeout);
                fillBuffer();
                result = hasBufferedData();
                this.socket.setSoTimeout(oldtimeout);
            } catch (Throwable th) {
                this.socket.setSoTimeout(oldtimeout);
                throw th;
            }
        }
        return result;
    }

    @Override // cz.msebera.android.httpclient.io.EofSensor
    public boolean isEof() {
        return this.eof;
    }
}
