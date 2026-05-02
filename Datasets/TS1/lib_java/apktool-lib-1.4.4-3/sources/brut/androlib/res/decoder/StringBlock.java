package brut.androlib.res.decoder;

import brut.androlib.res.xml.ResXmlEncoders;
import brut.util.ExtDataInput;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.util.logging.Level;
import java.util.logging.Logger;

/* loaded from: apktool-lib-1.4.4-3.jar:brut/androlib/res/decoder/StringBlock.class */
public class StringBlock {
    private int[] m_stringOffsets;
    private byte[] m_strings;
    private int[] m_styleOffsets;
    private int[] m_styles;
    private boolean m_isUTF8;
    private static final CharsetDecoder UTF16LE_DECODER = Charset.forName("UTF-16LE").newDecoder();
    private static final CharsetDecoder UTF8_DECODER = Charset.forName("UTF-8").newDecoder();
    private static final Logger LOGGER = Logger.getLogger(StringBlock.class.getName());
    private static final int CHUNK_TYPE = 1835009;
    private static final int UTF8_FLAG = 256;

    public static StringBlock read(ExtDataInput extDataInput) throws IOException {
        extDataInput.skipCheckInt(CHUNK_TYPE);
        int readInt = extDataInput.readInt();
        int readInt2 = extDataInput.readInt();
        int readInt3 = extDataInput.readInt();
        int readInt4 = extDataInput.readInt();
        int readInt5 = extDataInput.readInt();
        int readInt6 = extDataInput.readInt();
        StringBlock stringBlock = new StringBlock();
        stringBlock.m_isUTF8 = (readInt4 & UTF8_FLAG) != 0;
        stringBlock.m_stringOffsets = extDataInput.readIntArray(readInt2);
        if (readInt3 != 0) {
            stringBlock.m_styleOffsets = extDataInput.readIntArray(readInt3);
        }
        int i = (readInt6 == 0 ? readInt : readInt6) - readInt5;
        if (i % 4 != 0) {
            throw new IOException("String data size is not multiple of 4 (" + i + ").");
        }
        stringBlock.m_strings = new byte[i];
        extDataInput.readFully(stringBlock.m_strings);
        if (readInt6 != 0) {
            int i2 = readInt - readInt6;
            if (i2 % 4 != 0) {
                throw new IOException("Style data size is not multiple of 4 (" + i2 + ").");
            }
            stringBlock.m_styles = extDataInput.readIntArray(i2 / 4);
        }
        return stringBlock;
    }

    public int getCount() {
        if (this.m_stringOffsets != null) {
            return this.m_stringOffsets.length;
        }
        return 0;
    }

    public String getString(int i) {
        int i2;
        int i3;
        if (i < 0 || this.m_stringOffsets == null || i >= this.m_stringOffsets.length) {
            return null;
        }
        int i4 = this.m_stringOffsets[i];
        if (this.m_isUTF8) {
            int i5 = i4 + getVarint(this.m_strings, i4)[1];
            int[] varint = getVarint(this.m_strings, i5);
            i2 = i5 + varint[1];
            i3 = varint[0];
        } else {
            i3 = getShort(this.m_strings, i4) * 2;
            i2 = i4 + 2;
        }
        return decodeString(i2, i3);
    }

    public CharSequence get(int i) {
        return getString(i);
    }

    public String getHTML(int i) {
        String string = getString(i);
        if (string == null) {
            return string;
        }
        int[] style = getStyle(i);
        if (style == null) {
            return ResXmlEncoders.escapeXmlChars(string);
        }
        StringBuilder sb = new StringBuilder(string.length() + 32);
        int[] iArr = new int[style.length / 3];
        int i2 = 0;
        int i3 = 0;
        while (true) {
            int i4 = -1;
            for (int i5 = 0; i5 != style.length; i5 += 3) {
                if (style[i5 + 1] != -1 && (i4 == -1 || style[i4 + 1] > style[i5 + 1])) {
                    i4 = i5;
                }
            }
            int length = i4 != -1 ? style[i4 + 1] : string.length();
            int i6 = i3 - 1;
            while (i6 >= 0) {
                int i7 = iArr[i6];
                int i8 = style[i7 + 2];
                if (i8 >= length) {
                    break;
                }
                if (i2 <= i8) {
                    sb.append(ResXmlEncoders.escapeXmlChars(string.substring(i2, i8 + 1)));
                    i2 = i8 + 1;
                }
                outputStyleTag(getString(style[i7]), sb, true);
                i6--;
            }
            int i9 = i6 + 1;
            if (i2 < length) {
                sb.append(ResXmlEncoders.escapeXmlChars(string.substring(i2, length)));
                i2 = length;
            }
            if (i4 == -1) {
                return sb.toString();
            }
            outputStyleTag(getString(style[i4]), sb, false);
            style[i4 + 1] = -1;
            i3 = i9 + 1;
            iArr[i9] = i4;
        }
    }

    private void outputStyleTag(String str, StringBuilder sb, boolean z) {
        String substring;
        sb.append('<');
        if (z) {
            sb.append('/');
        }
        int indexOf = str.indexOf(59);
        if (indexOf == -1) {
            sb.append(str);
        } else {
            sb.append(str.substring(0, indexOf));
            if (!z) {
                boolean z2 = true;
                while (z2) {
                    int indexOf2 = str.indexOf(61, indexOf + 1);
                    sb.append(' ').append(str.substring(indexOf + 1, indexOf2)).append("=\"");
                    indexOf = str.indexOf(59, indexOf2 + 1);
                    if (indexOf != -1) {
                        substring = str.substring(indexOf2 + 1, indexOf);
                    } else {
                        z2 = false;
                        substring = str.substring(indexOf2 + 1);
                    }
                    sb.append(ResXmlEncoders.escapeXmlChars(substring)).append('\"');
                }
            }
        }
        sb.append('>');
    }

    public int find(String str) {
        if (str == null) {
            return -1;
        }
        for (int i = 0; i != this.m_stringOffsets.length; i++) {
            int i2 = this.m_stringOffsets[i];
            int i3 = getShort(this.m_strings, i2);
            if (i3 == str.length()) {
                int i4 = 0;
                while (i4 != i3) {
                    i2 += 2;
                    if (str.charAt(i4) != getShort(this.m_strings, i2)) {
                        break;
                    }
                    i4++;
                }
                if (i4 == i3) {
                    return i;
                }
            }
        }
        return -1;
    }

    private StringBlock() {
    }

    private int[] getStyle(int i) {
        if (this.m_styleOffsets == null || this.m_styles == null || i >= this.m_styleOffsets.length) {
            return null;
        }
        int i2 = this.m_styleOffsets[i] / 4;
        int i3 = 0;
        for (int i4 = i2; i4 < this.m_styles.length && this.m_styles[i4] != -1; i4++) {
            i3++;
        }
        if (i3 == 0 || i3 % 3 != 0) {
            return null;
        }
        int[] iArr = new int[i3];
        int i5 = i2;
        int i6 = 0;
        while (i5 < this.m_styles.length && this.m_styles[i5] != -1) {
            int i7 = i6;
            i6++;
            int i8 = i5;
            i5++;
            iArr[i7] = this.m_styles[i8];
        }
        return iArr;
    }

    private String decodeString(int i, int i2) {
        try {
            return (this.m_isUTF8 ? UTF8_DECODER : UTF16LE_DECODER).decode(ByteBuffer.wrap(this.m_strings, i, i2)).toString();
        } catch (CharacterCodingException e) {
            LOGGER.log(Level.WARNING, (String) null, (Throwable) e);
            return null;
        }
    }

    private static final int getShort(byte[] bArr, int i) {
        return ((bArr[i + 1] & 255) << 8) | (bArr[i] & 255);
    }

    private static final int getShort(int[] iArr, int i) {
        int i2 = iArr[i / 4];
        return (i % 4) / 2 == 0 ? i2 & 65535 : i2 >>> 16;
    }

    private static final int[] getVarint(byte[] bArr, int i) {
        byte b = bArr[i];
        boolean z = (b & 128) != 0;
        int i2 = b & Byte.MAX_VALUE;
        return !z ? new int[]{i2, 1} : new int[]{(i2 << 8) | (bArr[i + 1] & 255), 2};
    }
}
