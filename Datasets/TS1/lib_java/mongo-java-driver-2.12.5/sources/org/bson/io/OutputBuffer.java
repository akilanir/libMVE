package org.bson.io;

import com.mongodb.Bytes;
import com.mongodb.util.Util;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import org.bson.BSONException;

/* loaded from: mongo-java-driver-2.12.5.jar:org/bson/io/OutputBuffer.class */
public abstract class OutputBuffer extends OutputStream {
    @Override // java.io.OutputStream
    public abstract void write(byte[] bArr);

    @Override // java.io.OutputStream
    public abstract void write(byte[] bArr, int i, int i2);

    @Override // java.io.OutputStream
    public abstract void write(int i);

    public abstract int getPosition();

    @Deprecated
    public abstract void setPosition(int i);

    @Deprecated
    public abstract void seekEnd();

    @Deprecated
    public abstract void seekStart();

    public abstract int size();

    public abstract int pipe(OutputStream outputStream) throws IOException;

    public byte[] toByteArray() {
        try {
            ByteArrayOutputStream bout = new ByteArrayOutputStream(size());
            pipe(bout);
            return bout.toByteArray();
        } catch (IOException ioe) {
            throw new RuntimeException("should be impossible", ioe);
        }
    }

    @Deprecated
    public String asString() {
        return new String(toByteArray());
    }

    @Deprecated
    public String asString(String encoding) throws UnsupportedEncodingException {
        return new String(toByteArray(), encoding);
    }

    @Deprecated
    public String hex() {
        final StringBuilder buf = new StringBuilder();
        try {
            pipe(new OutputStream() { // from class: org.bson.io.OutputBuffer.1
                @Override // java.io.OutputStream
                public void write(int b) {
                    String s = Integer.toHexString(255 & b);
                    if (s.length() < 2) {
                        buf.append("0");
                    }
                    buf.append(s);
                }
            });
            return buf.toString();
        } catch (IOException e) {
            throw new RuntimeException("impossible");
        }
    }

    @Deprecated
    public String md5() {
        try {
            final MessageDigest md5 = MessageDigest.getInstance("MD5");
            md5.reset();
            try {
                pipe(new OutputStream() { // from class: org.bson.io.OutputBuffer.2
                    @Override // java.io.OutputStream
                    public void write(byte[] b, int off, int len) {
                        md5.update(b, off, len);
                    }

                    @Override // java.io.OutputStream
                    public void write(int b) {
                        md5.update((byte) (b & 255));
                    }
                });
                return Util.toHex(md5.digest());
            } catch (IOException e) {
                throw new RuntimeException("impossible");
            }
        } catch (NoSuchAlgorithmException e2) {
            throw new RuntimeException("Error - this implementation of Java doesn't support MD5.");
        }
    }

    public void writeInt(int x) {
        write(x >> 0);
        write(x >> 8);
        write(x >> 16);
        write(x >> 24);
    }

    @Deprecated
    public void writeIntBE(int x) {
        write(x >> 24);
        write(x >> 16);
        write(x >> 8);
        write(x);
    }

    @Deprecated
    public void writeInt(int pos, int x) {
        int save = getPosition();
        setPosition(pos);
        writeInt(x);
        setPosition(save);
    }

    public void writeLong(long x) {
        write((byte) (255 & (x >> 0)));
        write((byte) (255 & (x >> 8)));
        write((byte) (255 & (x >> 16)));
        write((byte) (255 & (x >> 24)));
        write((byte) (255 & (x >> 32)));
        write((byte) (255 & (x >> 40)));
        write((byte) (255 & (x >> 48)));
        write((byte) (255 & (x >> 56)));
    }

    public void writeDouble(double x) {
        writeLong(Double.doubleToRawLongBits(x));
    }

    public void writeString(String str) {
        writeInt(0);
        int strLen = writeCString(str, false);
        backpatchSize(strLen, 4);
    }

    public int writeCString(String str) {
        return writeCString(str, true);
    }

    private int writeCString(String str, boolean checkForNullCharacters) {
        int len = str.length();
        int total = 0;
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 < len) {
                int c = Character.codePointAt(str, i2);
                if (checkForNullCharacters && c == 0) {
                    throw new BSONException(String.format("BSON cstring '%s' is not valid because it contains a null character at index %d", str, Integer.valueOf(i2)));
                }
                if (c < 128) {
                    write((byte) c);
                    total++;
                } else if (c < 2048) {
                    write((byte) (192 + (c >> 6)));
                    write((byte) (Bytes.QUERYOPTION_PARTIAL + (c & 63)));
                    total += 2;
                } else if (c < 65536) {
                    write((byte) (224 + (c >> 12)));
                    write((byte) (Bytes.QUERYOPTION_PARTIAL + ((c >> 6) & 63)));
                    write((byte) (Bytes.QUERYOPTION_PARTIAL + (c & 63)));
                    total += 3;
                } else {
                    write((byte) (240 + (c >> 18)));
                    write((byte) (Bytes.QUERYOPTION_PARTIAL + ((c >> 12) & 63)));
                    write((byte) (Bytes.QUERYOPTION_PARTIAL + ((c >> 6) & 63)));
                    write((byte) (Bytes.QUERYOPTION_PARTIAL + (c & 63)));
                    total += 4;
                }
                i = i2 + Character.charCount(c);
            } else {
                write(0);
                return total + 1;
            }
        }
    }

    public String toString() {
        return getClass().getName() + " size: " + size() + " pos: " + getPosition();
    }

    public void backpatchSize(int size) {
        writeInt(getPosition() - size, size);
    }

    protected void backpatchSize(int size, int additionalOffset) {
        writeInt((getPosition() - size) - additionalOffset, size);
    }

    public void truncateToPosition(int newPosition) {
        setPosition(newPosition);
    }
}
