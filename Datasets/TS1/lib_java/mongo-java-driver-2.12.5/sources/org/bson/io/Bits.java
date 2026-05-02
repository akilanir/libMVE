package org.bson.io;

import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: mongo-java-driver-2.12.5.jar:org/bson/io/Bits.class */
public class Bits {
    public static void readFully(InputStream in, byte[] b) throws IOException {
        readFully(in, b, b.length);
    }

    public static void readFully(InputStream in, byte[] b, int length) throws IOException {
        readFully(in, b, 0, length);
    }

    public static void readFully(InputStream in, byte[] b, int startOffset, int length) throws IOException {
        if (b.length < length + startOffset) {
            throw new IllegalArgumentException("Buffer is too small");
        }
        int offset = startOffset;
        int toRead = length;
        while (toRead > 0) {
            int bytesRead = in.read(b, offset, toRead);
            if (bytesRead < 0) {
                throw new EOFException();
            }
            toRead -= bytesRead;
            offset += bytesRead;
        }
    }

    public static int readInt(InputStream in) throws IOException {
        return readInt(in, new byte[4]);
    }

    public static int readInt(InputStream in, byte[] data) throws IOException {
        readFully(in, data, 4);
        return readInt(data);
    }

    public static int readInt(byte[] data) {
        return readInt(data, 0);
    }

    public static int readInt(byte[] data, int offset) {
        int x = 0 | ((255 & data[offset + 0]) << 0);
        return x | ((255 & data[offset + 1]) << 8) | ((255 & data[offset + 2]) << 16) | ((255 & data[offset + 3]) << 24);
    }

    public static int readIntBE(byte[] data, int offset) {
        int x = 0 | ((255 & data[offset + 0]) << 24);
        return x | ((255 & data[offset + 1]) << 16) | ((255 & data[offset + 2]) << 8) | ((255 & data[offset + 3]) << 0);
    }

    public static long readLong(InputStream in) throws IOException {
        return readLong(in, new byte[8]);
    }

    public static long readLong(InputStream in, byte[] data) throws IOException {
        readFully(in, data, 8);
        return readLong(data);
    }

    public static long readLong(byte[] data) {
        return readLong(data, 0);
    }

    public static long readLong(byte[] data, int offset) {
        long x = 0 | ((255 & data[offset + 0]) << 0);
        return x | ((255 & data[offset + 1]) << 8) | ((255 & data[offset + 2]) << 16) | ((255 & data[offset + 3]) << 24) | ((255 & data[offset + 4]) << 32) | ((255 & data[offset + 5]) << 40) | ((255 & data[offset + 6]) << 48) | ((255 & data[offset + 7]) << 56);
    }
}
