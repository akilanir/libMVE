package ezvcard.util;

import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.io.Writer;
import java.nio.charset.Charset;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/util/IOUtils.class */
public class IOUtils {
    private static final Charset UTF8 = Charset.forName("UTF-8");

    public static String getFileExtension(File file) {
        String fileName = file.getName();
        int dot = fileName.lastIndexOf(46);
        if (dot >= 0 && dot < fileName.length() - 1) {
            return fileName.substring(dot + 1);
        }
        return null;
    }

    public static byte[] toByteArray(InputStream in) throws IOException {
        return toByteArray(in, false);
    }

    public static byte[] toByteArray(InputStream in, boolean close) throws IOException {
        try {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            while (true) {
                int read = in.read(buffer);
                if (read == -1) {
                    break;
                }
                out.write(buffer, 0, read);
            }
            byte[] byteArray = out.toByteArray();
            if (close) {
                closeQuietly(in);
            }
            return byteArray;
        } catch (Throwable th) {
            if (close) {
                closeQuietly(in);
            }
            throw th;
        }
    }

    public static String toString(Reader reader) throws IOException {
        StringBuilder sb = new StringBuilder();
        char[] buffer = new char[4096];
        while (true) {
            int read = reader.read(buffer);
            if (read != -1) {
                sb.append(buffer, 0, read);
            } else {
                return sb.toString();
            }
        }
    }

    public static String getFileContents(File file) throws IOException {
        return getFileContents(file, Charset.defaultCharset().name());
    }

    public static String getFileContents(File file, String charset) throws IOException {
        byte[] bytes = toByteArray(new FileInputStream(file), true);
        return new String(bytes, charset);
    }

    public static void closeQuietly(Closeable closeable) {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (IOException e) {
            }
        }
    }

    public static Writer utf8Writer(OutputStream out) {
        return new OutputStreamWriter(out, UTF8);
    }

    public static Writer utf8Writer(File file) throws FileNotFoundException {
        return utf8Writer(file, false);
    }

    public static Writer utf8Writer(File file, boolean append) throws FileNotFoundException {
        return utf8Writer(new FileOutputStream(file, append));
    }

    public static Reader utf8Reader(InputStream in) {
        return new InputStreamReader(in, UTF8);
    }

    public static Reader utf8Reader(File file) throws FileNotFoundException {
        return utf8Reader(new FileInputStream(file));
    }

    private IOUtils() {
    }
}
