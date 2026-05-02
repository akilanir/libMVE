package org.apache.commons.io;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.CharArrayWriter;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.Reader;
import java.io.StringWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.apache.commons.io.output.ByteArrayOutputStream;

/* loaded from: commons-io-1.3.2.jar:org/apache/commons/io/IOUtils.class */
public class IOUtils {
    public static final char DIR_SEPARATOR_UNIX = '/';
    public static final char DIR_SEPARATOR_WINDOWS = '\\';
    public static final char DIR_SEPARATOR = File.separatorChar;
    public static final String LINE_SEPARATOR_UNIX = "\n";
    public static final String LINE_SEPARATOR_WINDOWS = "\r\n";
    public static final String LINE_SEPARATOR;
    private static final int DEFAULT_BUFFER_SIZE = 4096;

    static {
        StringWriter buf = new StringWriter(4);
        PrintWriter out = new PrintWriter(buf);
        out.println();
        LINE_SEPARATOR = buf.toString();
    }

    public static void closeQuietly(Reader input) {
        if (input != null) {
            try {
                input.close();
            } catch (IOException e) {
            }
        }
    }

    public static void closeQuietly(Writer output) {
        if (output != null) {
            try {
                output.close();
            } catch (IOException e) {
            }
        }
    }

    public static void closeQuietly(InputStream input) {
        if (input != null) {
            try {
                input.close();
            } catch (IOException e) {
            }
        }
    }

    public static void closeQuietly(OutputStream output) {
        if (output != null) {
            try {
                output.close();
            } catch (IOException e) {
            }
        }
    }

    public static byte[] toByteArray(InputStream input) throws IOException {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        copy(input, output);
        return output.toByteArray();
    }

    public static byte[] toByteArray(Reader input) throws IOException {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        copy(input, output);
        return output.toByteArray();
    }

    public static byte[] toByteArray(Reader input, String encoding) throws IOException {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        copy(input, output, encoding);
        return output.toByteArray();
    }

    public static byte[] toByteArray(String input) throws IOException {
        return input.getBytes();
    }

    public static char[] toCharArray(InputStream is) throws IOException {
        CharArrayWriter output = new CharArrayWriter();
        copy(is, output);
        return output.toCharArray();
    }

    public static char[] toCharArray(InputStream is, String encoding) throws IOException {
        CharArrayWriter output = new CharArrayWriter();
        copy(is, output, encoding);
        return output.toCharArray();
    }

    public static char[] toCharArray(Reader input) throws IOException {
        CharArrayWriter sw = new CharArrayWriter();
        copy(input, sw);
        return sw.toCharArray();
    }

    public static String toString(InputStream input) throws IOException {
        StringWriter sw = new StringWriter();
        copy(input, sw);
        return sw.toString();
    }

    public static String toString(InputStream input, String encoding) throws IOException {
        StringWriter sw = new StringWriter();
        copy(input, sw, encoding);
        return sw.toString();
    }

    public static String toString(Reader input) throws IOException {
        StringWriter sw = new StringWriter();
        copy(input, sw);
        return sw.toString();
    }

    public static String toString(byte[] input) throws IOException {
        return new String(input);
    }

    public static String toString(byte[] input, String encoding) throws IOException {
        if (encoding == null) {
            return new String(input);
        }
        return new String(input, encoding);
    }

    public static List readLines(InputStream input) throws IOException {
        InputStreamReader reader = new InputStreamReader(input);
        return readLines(reader);
    }

    public static List readLines(InputStream input, String encoding) throws IOException {
        if (encoding == null) {
            return readLines(input);
        }
        InputStreamReader reader = new InputStreamReader(input, encoding);
        return readLines(reader);
    }

    public static List readLines(Reader input) throws IOException {
        BufferedReader reader = new BufferedReader(input);
        List list = new ArrayList();
        String readLine = reader.readLine();
        while (true) {
            String line = readLine;
            if (line != null) {
                list.add(line);
                readLine = reader.readLine();
            } else {
                return list;
            }
        }
    }

    public static LineIterator lineIterator(Reader reader) {
        return new LineIterator(reader);
    }

    public static LineIterator lineIterator(InputStream input, String encoding) throws IOException {
        Reader reader;
        if (encoding == null) {
            reader = new InputStreamReader(input);
        } else {
            reader = new InputStreamReader(input, encoding);
        }
        return new LineIterator(reader);
    }

    public static InputStream toInputStream(String input) {
        byte[] bytes = input.getBytes();
        return new ByteArrayInputStream(bytes);
    }

    public static InputStream toInputStream(String input, String encoding) throws IOException {
        byte[] bytes = encoding != null ? input.getBytes(encoding) : input.getBytes();
        return new ByteArrayInputStream(bytes);
    }

    public static void write(byte[] data, OutputStream output) throws IOException {
        if (data != null) {
            output.write(data);
        }
    }

    public static void write(byte[] data, Writer output) throws IOException {
        if (data != null) {
            output.write(new String(data));
        }
    }

    public static void write(byte[] data, Writer output, String encoding) throws IOException {
        if (data != null) {
            if (encoding == null) {
                write(data, output);
            } else {
                output.write(new String(data, encoding));
            }
        }
    }

    public static void write(char[] data, Writer output) throws IOException {
        if (data != null) {
            output.write(data);
        }
    }

    public static void write(char[] data, OutputStream output) throws IOException {
        if (data != null) {
            output.write(new String(data).getBytes());
        }
    }

    public static void write(char[] data, OutputStream output, String encoding) throws IOException {
        if (data != null) {
            if (encoding == null) {
                write(data, output);
            } else {
                output.write(new String(data).getBytes(encoding));
            }
        }
    }

    public static void write(String data, Writer output) throws IOException {
        if (data != null) {
            output.write(data);
        }
    }

    public static void write(String data, OutputStream output) throws IOException {
        if (data != null) {
            output.write(data.getBytes());
        }
    }

    public static void write(String data, OutputStream output, String encoding) throws IOException {
        if (data != null) {
            if (encoding == null) {
                write(data, output);
            } else {
                output.write(data.getBytes(encoding));
            }
        }
    }

    public static void write(StringBuffer data, Writer output) throws IOException {
        if (data != null) {
            output.write(data.toString());
        }
    }

    public static void write(StringBuffer data, OutputStream output) throws IOException {
        if (data != null) {
            output.write(data.toString().getBytes());
        }
    }

    public static void write(StringBuffer data, OutputStream output, String encoding) throws IOException {
        if (data != null) {
            if (encoding == null) {
                write(data, output);
            } else {
                output.write(data.toString().getBytes(encoding));
            }
        }
    }

    public static void writeLines(Collection lines, String lineEnding, OutputStream output) throws IOException {
        if (lines == null) {
            return;
        }
        if (lineEnding == null) {
            lineEnding = LINE_SEPARATOR;
        }
        for (Object line : lines) {
            if (line != null) {
                output.write(line.toString().getBytes());
            }
            output.write(lineEnding.getBytes());
        }
    }

    public static void writeLines(Collection lines, String lineEnding, OutputStream output, String encoding) throws IOException {
        if (encoding == null) {
            writeLines(lines, lineEnding, output);
            return;
        }
        if (lines == null) {
            return;
        }
        if (lineEnding == null) {
            lineEnding = LINE_SEPARATOR;
        }
        for (Object line : lines) {
            if (line != null) {
                output.write(line.toString().getBytes(encoding));
            }
            output.write(lineEnding.getBytes(encoding));
        }
    }

    public static void writeLines(Collection lines, String lineEnding, Writer writer) throws IOException {
        if (lines == null) {
            return;
        }
        if (lineEnding == null) {
            lineEnding = LINE_SEPARATOR;
        }
        for (Object line : lines) {
            if (line != null) {
                writer.write(line.toString());
            }
            writer.write(lineEnding);
        }
    }

    public static int copy(InputStream input, OutputStream output) throws IOException {
        long count = copyLarge(input, output);
        if (count > 2147483647L) {
            return -1;
        }
        return (int) count;
    }

    public static long copyLarge(InputStream input, OutputStream output) throws IOException {
        byte[] buffer = new byte[DEFAULT_BUFFER_SIZE];
        long count = 0;
        while (true) {
            int n = input.read(buffer);
            if (-1 != n) {
                output.write(buffer, 0, n);
                count += n;
            } else {
                return count;
            }
        }
    }

    public static void copy(InputStream input, Writer output) throws IOException {
        InputStreamReader in = new InputStreamReader(input);
        copy(in, output);
    }

    public static void copy(InputStream input, Writer output, String encoding) throws IOException {
        if (encoding == null) {
            copy(input, output);
        } else {
            InputStreamReader in = new InputStreamReader(input, encoding);
            copy(in, output);
        }
    }

    public static int copy(Reader input, Writer output) throws IOException {
        long count = copyLarge(input, output);
        if (count > 2147483647L) {
            return -1;
        }
        return (int) count;
    }

    public static long copyLarge(Reader input, Writer output) throws IOException {
        char[] buffer = new char[DEFAULT_BUFFER_SIZE];
        long count = 0;
        while (true) {
            int n = input.read(buffer);
            if (-1 != n) {
                output.write(buffer, 0, n);
                count += n;
            } else {
                return count;
            }
        }
    }

    public static void copy(Reader input, OutputStream output) throws IOException {
        OutputStreamWriter out = new OutputStreamWriter(output);
        copy(input, out);
        out.flush();
    }

    public static void copy(Reader input, OutputStream output, String encoding) throws IOException {
        if (encoding == null) {
            copy(input, output);
            return;
        }
        OutputStreamWriter out = new OutputStreamWriter(output, encoding);
        copy(input, out);
        out.flush();
    }

    public static boolean contentEquals(InputStream input1, InputStream input2) throws IOException {
        if (!(input1 instanceof BufferedInputStream)) {
            input1 = new BufferedInputStream(input1);
        }
        if (!(input2 instanceof BufferedInputStream)) {
            input2 = new BufferedInputStream(input2);
        }
        int read = input1.read();
        while (true) {
            int ch = read;
            if (-1 != ch) {
                int ch2 = input2.read();
                if (ch != ch2) {
                    return false;
                }
                read = input1.read();
            } else {
                int ch22 = input2.read();
                return ch22 == -1;
            }
        }
    }

    public static boolean contentEquals(Reader input1, Reader input2) throws IOException {
        if (!(input1 instanceof BufferedReader)) {
            input1 = new BufferedReader(input1);
        }
        if (!(input2 instanceof BufferedReader)) {
            input2 = new BufferedReader(input2);
        }
        int read = input1.read();
        while (true) {
            int ch = read;
            if (-1 != ch) {
                int ch2 = input2.read();
                if (ch != ch2) {
                    return false;
                }
                read = input1.read();
            } else {
                int ch22 = input2.read();
                return ch22 == -1;
            }
        }
    }
}
