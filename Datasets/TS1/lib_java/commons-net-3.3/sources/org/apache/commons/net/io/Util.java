package org.apache.commons.net.io;

import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Reader;
import java.io.Writer;
import java.net.Socket;

/* loaded from: commons-net-3.3.jar:org/apache/commons/net/io/Util.class */
public final class Util {
    public static final int DEFAULT_COPY_BUFFER_SIZE = 1024;

    private Util() {
    }

    public static final long copyStream(InputStream source, OutputStream dest, int bufferSize, long streamSize, CopyStreamListener listener, boolean flush) throws CopyStreamException {
        long total = 0;
        byte[] buffer = new byte[bufferSize >= 0 ? bufferSize : DEFAULT_COPY_BUFFER_SIZE];
        while (true) {
            try {
                int bytes = source.read(buffer);
                if (bytes == -1) {
                    break;
                }
                if (bytes == 0) {
                    int bytes2 = source.read();
                    if (bytes2 < 0) {
                        break;
                    }
                    dest.write(bytes2);
                    if (flush) {
                        dest.flush();
                    }
                    total++;
                    if (listener != null) {
                        listener.bytesTransferred(total, 1, streamSize);
                    }
                } else {
                    dest.write(buffer, 0, bytes);
                    if (flush) {
                        dest.flush();
                    }
                    total += bytes;
                    if (listener != null) {
                        listener.bytesTransferred(total, bytes, streamSize);
                    }
                }
            } catch (IOException e) {
                throw new CopyStreamException("IOException caught while copying.", total, e);
            }
        }
        return total;
    }

    public static final long copyStream(InputStream source, OutputStream dest, int bufferSize, long streamSize, CopyStreamListener listener) throws CopyStreamException {
        return copyStream(source, dest, bufferSize, streamSize, listener, true);
    }

    public static final long copyStream(InputStream source, OutputStream dest, int bufferSize) throws CopyStreamException {
        return copyStream(source, dest, bufferSize, -1L, null);
    }

    public static final long copyStream(InputStream source, OutputStream dest) throws CopyStreamException {
        return copyStream(source, dest, DEFAULT_COPY_BUFFER_SIZE);
    }

    public static final long copyReader(Reader source, Writer dest, int bufferSize, long streamSize, CopyStreamListener listener) throws CopyStreamException {
        long total = 0;
        char[] buffer = new char[bufferSize >= 0 ? bufferSize : DEFAULT_COPY_BUFFER_SIZE];
        while (true) {
            try {
                int chars = source.read(buffer);
                if (chars == -1) {
                    break;
                }
                if (chars == 0) {
                    int chars2 = source.read();
                    if (chars2 < 0) {
                        break;
                    }
                    dest.write(chars2);
                    dest.flush();
                    total++;
                    if (listener != null) {
                        listener.bytesTransferred(total, chars2, streamSize);
                    }
                } else {
                    dest.write(buffer, 0, chars);
                    dest.flush();
                    total += chars;
                    if (listener != null) {
                        listener.bytesTransferred(total, chars, streamSize);
                    }
                }
            } catch (IOException e) {
                throw new CopyStreamException("IOException caught while copying.", total, e);
            }
        }
        return total;
    }

    public static final long copyReader(Reader source, Writer dest, int bufferSize) throws CopyStreamException {
        return copyReader(source, dest, bufferSize, -1L, null);
    }

    public static final long copyReader(Reader source, Writer dest) throws CopyStreamException {
        return copyReader(source, dest, DEFAULT_COPY_BUFFER_SIZE);
    }

    public static void closeQuietly(Closeable closeable) {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (IOException e) {
            }
        }
    }

    public static void closeQuietly(Socket socket) {
        if (socket != null) {
            try {
                socket.close();
            } catch (IOException e) {
            }
        }
    }
}
