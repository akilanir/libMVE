package nl.siegmann.epublib.util;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Reader;
import java.io.StringWriter;
import java.io.Writer;

/* loaded from: epublib-core-3.1.jar:nl/siegmann/epublib/util/IOUtil.class */
public class IOUtil {
    public static final int IO_COPY_BUFFER_SIZE = 4096;

    public static byte[] toByteArray(Reader in, String encoding) throws IOException {
        StringWriter out = new StringWriter();
        copy(in, out);
        out.flush();
        return out.toString().getBytes(encoding);
    }

    public static byte[] toByteArray(InputStream in) throws IOException {
        ByteArrayOutputStream result = new ByteArrayOutputStream();
        copy(in, result);
        result.flush();
        return result.toByteArray();
    }

    protected static int calcNewNrReadSize(int nrRead, int totalNrNread) {
        if (totalNrNread < 0) {
            return totalNrNread;
        }
        if (totalNrNread > Integer.MAX_VALUE - nrRead) {
            return -1;
        }
        return totalNrNread + nrRead;
    }

    public static int copy(InputStream in, OutputStream out) throws IOException {
        byte[] buffer = new byte[IO_COPY_BUFFER_SIZE];
        int i = 0;
        while (true) {
            int result = i;
            int readSize = in.read(buffer);
            if (readSize >= 0) {
                out.write(buffer, 0, readSize);
                i = calcNewNrReadSize(readSize, result);
            } else {
                out.flush();
                return result;
            }
        }
    }

    public static int copy(Reader in, Writer out) throws IOException {
        char[] buffer = new char[IO_COPY_BUFFER_SIZE];
        int i = 0;
        while (true) {
            int result = i;
            int readSize = in.read(buffer);
            if (readSize >= 0) {
                out.write(buffer, 0, readSize);
                i = calcNewNrReadSize(readSize, result);
            } else {
                out.flush();
                return result;
            }
        }
    }
}
