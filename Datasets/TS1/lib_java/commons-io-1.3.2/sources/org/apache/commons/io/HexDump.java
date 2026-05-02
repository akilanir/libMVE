package org.apache.commons.io;

import java.io.IOException;
import java.io.OutputStream;

/* loaded from: commons-io-1.3.2.jar:org/apache/commons/io/HexDump.class */
public class HexDump {
    public static final String EOL = System.getProperty("line.separator");
    private static final StringBuffer _lbuffer = new StringBuffer(8);
    private static final StringBuffer _cbuffer = new StringBuffer(2);
    private static final char[] _hexcodes = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};
    private static final int[] _shifts = {28, 24, 20, 16, 12, 8, 4, 0};

    public static void dump(byte[] data, long offset, OutputStream stream, int index) throws IOException, ArrayIndexOutOfBoundsException, IllegalArgumentException {
        if (index < 0 || index >= data.length) {
            throw new ArrayIndexOutOfBoundsException(new StringBuffer().append("illegal index: ").append(index).append(" into array of length ").append(data.length).toString());
        }
        if (stream == null) {
            throw new IllegalArgumentException("cannot write to nullstream");
        }
        long display_offset = offset + index;
        StringBuffer buffer = new StringBuffer(74);
        for (int j = index; j < data.length; j += 16) {
            int chars_read = data.length - j;
            if (chars_read > 16) {
                chars_read = 16;
            }
            buffer.append(dump(display_offset)).append(' ');
            for (int k = 0; k < 16; k++) {
                if (k < chars_read) {
                    buffer.append(dump(data[k + j]));
                } else {
                    buffer.append("  ");
                }
                buffer.append(' ');
            }
            for (int k2 = 0; k2 < chars_read; k2++) {
                if (data[k2 + j] >= 32 && data[k2 + j] < Byte.MAX_VALUE) {
                    buffer.append((char) data[k2 + j]);
                } else {
                    buffer.append('.');
                }
            }
            buffer.append(EOL);
            stream.write(buffer.toString().getBytes());
            stream.flush();
            buffer.setLength(0);
            display_offset += chars_read;
        }
    }

    private static StringBuffer dump(long value) {
        _lbuffer.setLength(0);
        for (int j = 0; j < 8; j++) {
            _lbuffer.append(_hexcodes[((int) (value >> _shifts[j])) & 15]);
        }
        return _lbuffer;
    }

    private static StringBuffer dump(byte value) {
        _cbuffer.setLength(0);
        for (int j = 0; j < 2; j++) {
            _cbuffer.append(_hexcodes[(value >> _shifts[j + 6]) & 15]);
        }
        return _cbuffer;
    }
}
