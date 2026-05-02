package com.alibaba.fastjson.serializer;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.util.IOUtils;
import java.io.IOException;
import java.io.OutputStream;
import java.io.Writer;
import java.math.BigDecimal;
import java.nio.charset.Charset;
import java.util.List;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/serializer/SerializeWriter.class */
public final class SerializeWriter extends Writer {
    protected char[] buf;
    protected int count;
    protected int features;
    private final Writer writer;
    protected boolean useSingleQuotes;
    protected boolean quoteFieldNames;
    protected boolean sortField;
    protected boolean disableCircularReferenceDetect;
    protected boolean beanToArray;
    protected boolean writeNonStringValueAsString;
    protected boolean notWriteDefaultValue;
    protected boolean writeEnumUsingName;
    protected boolean writeEnumUsingToString;
    protected boolean writeDirect;
    protected char keySeperator;
    private static final ThreadLocal<char[]> bufLocal = new ThreadLocal<>();
    private static final ThreadLocal<byte[]> bytesBufLocal = new ThreadLocal<>();
    static final int nonDirectFeautres = (((((((((0 | SerializerFeature.UseSingleQuotes.mask) | SerializerFeature.BrowserSecure.mask) | SerializerFeature.BrowserCompatible.mask) | SerializerFeature.PrettyFormat.mask) | SerializerFeature.WriteEnumUsingToString.mask) | SerializerFeature.WriteNonStringValueAsString.mask) | SerializerFeature.WriteSlashAsSpecial.mask) | SerializerFeature.IgnoreErrorGetter.mask) | SerializerFeature.WriteClassName.mask) | SerializerFeature.NotWriteDefaultValue.mask;

    public SerializeWriter() {
        this((Writer) null);
    }

    public SerializeWriter(Writer writer) {
        this(writer, JSON.DEFAULT_GENERATE_FEATURE, SerializerFeature.EMPTY);
    }

    public SerializeWriter(SerializerFeature... features) {
        this((Writer) null, features);
    }

    public SerializeWriter(Writer writer, SerializerFeature... features) {
        this(writer, 0, features);
    }

    public SerializeWriter(Writer writer, int defaultFeatures, SerializerFeature... features) {
        this.writer = writer;
        this.buf = bufLocal.get();
        if (this.buf != null) {
            bufLocal.set(null);
        } else {
            this.buf = new char[2048];
        }
        int featuresValue = defaultFeatures;
        for (SerializerFeature feature : features) {
            featuresValue |= feature.getMask();
        }
        this.features = featuresValue;
        computeFeatures();
    }

    public int getBufferLength() {
        return this.buf.length;
    }

    public SerializeWriter(int initialSize) {
        this((Writer) null, initialSize);
    }

    public SerializeWriter(Writer writer, int initialSize) {
        this.writer = writer;
        if (initialSize <= 0) {
            throw new IllegalArgumentException("Negative initial size: " + initialSize);
        }
        this.buf = new char[initialSize];
    }

    public void config(SerializerFeature feature, boolean state) {
        if (state) {
            this.features |= feature.getMask();
            if (feature == SerializerFeature.WriteEnumUsingToString) {
                this.features &= SerializerFeature.WriteEnumUsingName.getMask() ^ (-1);
            } else if (feature == SerializerFeature.WriteEnumUsingName) {
                this.features &= SerializerFeature.WriteEnumUsingToString.getMask() ^ (-1);
            }
        } else {
            this.features &= feature.getMask() ^ (-1);
        }
        computeFeatures();
    }

    protected void computeFeatures() {
        this.quoteFieldNames = (this.features & SerializerFeature.QuoteFieldNames.mask) != 0;
        this.useSingleQuotes = (this.features & SerializerFeature.UseSingleQuotes.mask) != 0;
        this.sortField = (this.features & SerializerFeature.SortField.mask) != 0;
        this.disableCircularReferenceDetect = (this.features & SerializerFeature.DisableCircularReferenceDetect.mask) != 0;
        this.beanToArray = (this.features & SerializerFeature.BeanToArray.mask) != 0;
        this.writeNonStringValueAsString = (this.features & SerializerFeature.WriteNonStringValueAsString.mask) != 0;
        this.notWriteDefaultValue = (this.features & SerializerFeature.NotWriteDefaultValue.mask) != 0;
        this.writeEnumUsingName = (this.features & SerializerFeature.WriteEnumUsingName.mask) != 0;
        this.writeEnumUsingToString = (this.features & SerializerFeature.WriteEnumUsingToString.mask) != 0;
        this.writeDirect = this.quoteFieldNames && (this.features & nonDirectFeautres) == 0 && (this.beanToArray || this.writeEnumUsingName);
        this.keySeperator = this.useSingleQuotes ? '\'' : '\"';
    }

    public boolean isSortField() {
        return this.sortField;
    }

    public boolean isNotWriteDefaultValue() {
        return this.notWriteDefaultValue;
    }

    public boolean isEnabled(SerializerFeature feature) {
        return (this.features & feature.mask) != 0;
    }

    public boolean isEnabled(int feature) {
        return (this.features & feature) != 0;
    }

    @Override // java.io.Writer
    public void write(int c) {
        int newcount = this.count + 1;
        if (newcount > this.buf.length) {
            if (this.writer == null) {
                expandCapacity(newcount);
            } else {
                flush();
                newcount = 1;
            }
        }
        this.buf[this.count] = (char) c;
        this.count = newcount;
    }

    @Override // java.io.Writer
    public void write(char[] c, int off, int len) {
        if (off < 0 || off > c.length || len < 0 || off + len > c.length || off + len < 0) {
            throw new IndexOutOfBoundsException();
        }
        if (len == 0) {
            return;
        }
        int newcount = this.count + len;
        if (newcount > this.buf.length) {
            if (this.writer == null) {
                expandCapacity(newcount);
            } else {
                do {
                    int rest = this.buf.length - this.count;
                    System.arraycopy(c, off, this.buf, this.count, rest);
                    this.count = this.buf.length;
                    flush();
                    len -= rest;
                    off += rest;
                } while (len > this.buf.length);
                newcount = len;
            }
        }
        System.arraycopy(c, off, this.buf, this.count, len);
        this.count = newcount;
    }

    public void expandCapacity(int minimumCapacity) {
        int newCapacity = ((this.buf.length * 3) / 2) + 1;
        if (newCapacity < minimumCapacity) {
            newCapacity = minimumCapacity;
        }
        char[] newValue = new char[newCapacity];
        System.arraycopy(this.buf, 0, newValue, 0, this.count);
        this.buf = newValue;
    }

    @Override // java.io.Writer, java.lang.Appendable
    public SerializeWriter append(CharSequence csq) {
        String s = csq == null ? "null" : csq.toString();
        write(s, 0, s.length());
        return this;
    }

    @Override // java.io.Writer, java.lang.Appendable
    public SerializeWriter append(CharSequence csq, int start, int end) {
        String s = (csq == null ? "null" : csq).subSequence(start, end).toString();
        write(s, 0, s.length());
        return this;
    }

    @Override // java.io.Writer, java.lang.Appendable
    public SerializeWriter append(char c) {
        write(c);
        return this;
    }

    @Override // java.io.Writer
    public void write(String str, int off, int len) {
        int newcount = this.count + len;
        if (newcount > this.buf.length) {
            if (this.writer == null) {
                expandCapacity(newcount);
            } else {
                do {
                    int rest = this.buf.length - this.count;
                    str.getChars(off, off + rest, this.buf, this.count);
                    this.count = this.buf.length;
                    flush();
                    len -= rest;
                    off += rest;
                } while (len > this.buf.length);
                newcount = len;
            }
        }
        str.getChars(off, off + len, this.buf, this.count);
        this.count = newcount;
    }

    public void writeTo(Writer out) throws IOException {
        if (this.writer != null) {
            throw new UnsupportedOperationException("writer not null");
        }
        out.write(this.buf, 0, this.count);
    }

    public void writeTo(OutputStream out, String charsetName) throws IOException {
        writeTo(out, Charset.forName(charsetName));
    }

    public void writeTo(OutputStream out, Charset charset) throws IOException {
        writeToEx(out, charset);
    }

    public int writeToEx(OutputStream out, Charset charset) throws IOException {
        if (this.writer != null) {
            throw new UnsupportedOperationException("writer not null");
        }
        if (charset == IOUtils.UTF8) {
            return encodeToUTF8(out);
        }
        byte[] bytes = new String(this.buf, 0, this.count).getBytes(charset);
        out.write(bytes);
        return bytes.length;
    }

    public char[] toCharArray() {
        if (this.writer != null) {
            throw new UnsupportedOperationException("writer not null");
        }
        char[] newValue = new char[this.count];
        System.arraycopy(this.buf, 0, newValue, 0, this.count);
        return newValue;
    }

    public byte[] toBytes(String charsetName) {
        return toBytes((charsetName == null || "UTF-8".equals(charsetName)) ? IOUtils.UTF8 : Charset.forName(charsetName));
    }

    public byte[] toBytes(Charset charset) {
        if (this.writer != null) {
            throw new UnsupportedOperationException("writer not null");
        }
        if (charset == IOUtils.UTF8) {
            return encodeToUTF8Bytes();
        }
        return new String(this.buf, 0, this.count).getBytes(charset);
    }

    private int encodeToUTF8(OutputStream out) throws IOException {
        int bytesLength = (int) (this.count * 3.0d);
        byte[] bytes = bytesBufLocal.get();
        if (bytes == null) {
            bytes = new byte[8192];
            bytesBufLocal.set(bytes);
        }
        if (bytes.length < bytesLength) {
            bytes = new byte[bytesLength];
        }
        int position = IOUtils.encodeUTF8(this.buf, 0, this.count, bytes);
        out.write(bytes, 0, position);
        return position;
    }

    private byte[] encodeToUTF8Bytes() {
        int bytesLength = (int) (this.count * 3.0d);
        byte[] bytes = bytesBufLocal.get();
        if (bytes == null) {
            bytes = new byte[8192];
            bytesBufLocal.set(bytes);
        }
        if (bytes.length < bytesLength) {
            bytes = new byte[bytesLength];
        }
        int position = IOUtils.encodeUTF8(this.buf, 0, this.count, bytes);
        byte[] copy = new byte[position];
        System.arraycopy(bytes, 0, copy, 0, position);
        return copy;
    }

    public int size() {
        return this.count;
    }

    public String toString() {
        return new String(this.buf, 0, this.count);
    }

    @Override // java.io.Writer, java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        if (this.writer != null && this.count > 0) {
            flush();
        }
        if (this.buf.length <= 8192) {
            bufLocal.set(this.buf);
        }
        this.buf = null;
    }

    @Override // java.io.Writer
    public void write(String text) {
        if (text == null) {
            writeNull();
        } else {
            write(text, 0, text.length());
        }
    }

    public void writeInt(int i) {
        if (i == Integer.MIN_VALUE) {
            write("-2147483648");
            return;
        }
        int size = i < 0 ? IOUtils.stringSize(-i) + 1 : IOUtils.stringSize(i);
        int newcount = this.count + size;
        if (newcount > this.buf.length) {
            if (this.writer == null) {
                expandCapacity(newcount);
            } else {
                char[] chars = new char[size];
                IOUtils.getChars(i, size, chars);
                write(chars, 0, chars.length);
                return;
            }
        }
        IOUtils.getChars(i, newcount, this.buf);
        this.count = newcount;
    }

    public void writeByteArray(byte[] bytes) {
        int bytesLen = bytes.length;
        char quote = this.useSingleQuotes ? '\'' : '\"';
        if (bytesLen == 0) {
            String emptyString = this.useSingleQuotes ? "''" : "\"\"";
            write(emptyString);
            return;
        }
        char[] CA = IOUtils.CA;
        int eLen = (bytesLen / 3) * 3;
        int charsLen = (((bytesLen - 1) / 3) + 1) << 2;
        int offset = this.count;
        int newcount = this.count + charsLen + 2;
        if (newcount > this.buf.length) {
            if (this.writer != null) {
                write(quote);
                int s = 0;
                while (s < eLen) {
                    int i = s;
                    int s2 = s + 1;
                    int s3 = s2 + 1;
                    int i2 = ((bytes[i] & 255) << 16) | ((bytes[s2] & 255) << 8);
                    s = s3 + 1;
                    int i3 = i2 | (bytes[s3] & 255);
                    write(CA[(i3 >>> 18) & 63]);
                    write(CA[(i3 >>> 12) & 63]);
                    write(CA[(i3 >>> 6) & 63]);
                    write(CA[i3 & 63]);
                }
                int left = bytesLen - eLen;
                if (left > 0) {
                    int i4 = ((bytes[eLen] & 255) << 10) | (left == 2 ? (bytes[bytesLen - 1] & 255) << 2 : 0);
                    write(CA[i4 >> 12]);
                    write(CA[(i4 >>> 6) & 63]);
                    write(left == 2 ? CA[i4 & 63] : '=');
                    write(61);
                }
                write(quote);
                return;
            }
            expandCapacity(newcount);
        }
        this.count = newcount;
        this.buf[offset] = quote;
        int s4 = 0;
        int d = offset + 1;
        while (s4 < eLen) {
            int i5 = s4;
            int s5 = s4 + 1;
            int s6 = s5 + 1;
            int i6 = ((bytes[i5] & 255) << 16) | ((bytes[s5] & 255) << 8);
            s4 = s6 + 1;
            int i7 = i6 | (bytes[s6] & 255);
            int i8 = d;
            int d2 = d + 1;
            this.buf[i8] = CA[(i7 >>> 18) & 63];
            int d3 = d2 + 1;
            this.buf[d2] = CA[(i7 >>> 12) & 63];
            int d4 = d3 + 1;
            this.buf[d3] = CA[(i7 >>> 6) & 63];
            d = d4 + 1;
            this.buf[d4] = CA[i7 & 63];
        }
        int left2 = bytesLen - eLen;
        if (left2 > 0) {
            int i9 = ((bytes[eLen] & 255) << 10) | (left2 == 2 ? (bytes[bytesLen - 1] & 255) << 2 : 0);
            this.buf[newcount - 5] = CA[i9 >> 12];
            this.buf[newcount - 4] = CA[(i9 >>> 6) & 63];
            this.buf[newcount - 3] = left2 == 2 ? CA[i9 & 63] : '=';
            this.buf[newcount - 2] = '=';
        }
        this.buf[newcount - 1] = quote;
    }

    public void writeFloat(float value, boolean checkWriteClassName) {
        if (Float.isNaN(value) || Float.isInfinite(value)) {
            writeNull();
            return;
        }
        String floatText = Float.toString(value);
        if (floatText.endsWith(".0")) {
            floatText = floatText.substring(0, floatText.length() - 2);
        }
        write(floatText);
        if (checkWriteClassName && isEnabled(SerializerFeature.WriteClassName)) {
            write(70);
        }
    }

    public void writeDouble(double doubleValue, boolean checkWriteClassName) {
        if (Double.isNaN(doubleValue) || Double.isInfinite(doubleValue)) {
            writeNull();
            return;
        }
        String doubleText = Double.toString(doubleValue);
        if (doubleText.endsWith(".0")) {
            doubleText = doubleText.substring(0, doubleText.length() - 2);
        }
        write(doubleText);
        if (checkWriteClassName && isEnabled(SerializerFeature.WriteClassName)) {
            write(68);
        }
    }

    public void writeEnum(Enum<?> value) {
        if (value == null) {
            writeNull();
            return;
        }
        String strVal = null;
        if (this.writeEnumUsingName && !this.writeEnumUsingToString) {
            strVal = value.name();
        } else if (this.writeEnumUsingToString) {
            strVal = value.toString();
        }
        if (strVal != null) {
            char quote = isEnabled(SerializerFeature.UseSingleQuotes) ? '\'' : '\"';
            write(quote);
            write(strVal);
            write(quote);
            return;
        }
        writeInt(value.ordinal());
    }

    public void writeLong(long i) {
        boolean needQuotationMark = isEnabled(SerializerFeature.BrowserCompatible) && !isEnabled(SerializerFeature.WriteClassName) && (i > 9007199254740991L || i < -9007199254740991L);
        if (i == Long.MIN_VALUE) {
            if (!needQuotationMark) {
                write("-9223372036854775808");
                return;
            } else {
                write("\"-9223372036854775808\"");
                return;
            }
        }
        int size = i < 0 ? IOUtils.stringSize(-i) + 1 : IOUtils.stringSize(i);
        int newcount = this.count + size;
        if (needQuotationMark) {
            newcount += 2;
        }
        if (newcount > this.buf.length) {
            if (this.writer == null) {
                expandCapacity(newcount);
            } else {
                char[] chars = new char[size];
                IOUtils.getChars(i, size, chars);
                if (needQuotationMark) {
                    write(34);
                    write(chars, 0, chars.length);
                    write(34);
                    return;
                }
                write(chars, 0, chars.length);
                return;
            }
        }
        if (needQuotationMark) {
            this.buf[this.count] = '\"';
            IOUtils.getChars(i, newcount - 1, this.buf);
            this.buf[newcount - 1] = '\"';
        } else {
            IOUtils.getChars(i, newcount, this.buf);
        }
        this.count = newcount;
    }

    public void writeNull() {
        write("null");
    }

    public void writeNull(SerializerFeature feature) {
        writeNull(0, feature.mask);
    }

    public void writeNull(int beanFeatures, int feature) {
        if ((beanFeatures & feature) == 0 && (this.features & feature) == 0) {
            writeNull();
            return;
        }
        if (feature == SerializerFeature.WriteNullListAsEmpty.mask) {
            write("[]");
            return;
        }
        if (feature == SerializerFeature.WriteNullStringAsEmpty.mask) {
            writeString("");
            return;
        }
        if (feature == SerializerFeature.WriteNullBooleanAsFalse.mask) {
            write("false");
        } else if (feature == SerializerFeature.WriteNullNumberAsZero.mask) {
            write(48);
        } else {
            writeNull();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:76:0x024f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void writeStringWithDoubleQuote(java.lang.String r8, char r9) {
        /*
            Method dump skipped, instructions count: 2713
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.alibaba.fastjson.serializer.SerializeWriter.writeStringWithDoubleQuote(java.lang.String, char):void");
    }

    public void writeFieldNameDirect(String text) {
        int len = text.length();
        int newcount = this.count + len + 3;
        if (newcount > this.buf.length) {
            expandCapacity(newcount);
        }
        int start = this.count + 1;
        this.buf[this.count] = '\"';
        text.getChars(0, len, this.buf, start);
        this.count = newcount;
        this.buf[this.count - 2] = '\"';
        this.buf[this.count - 1] = ':';
    }

    public void write(List<String> list) {
        int offset;
        if (list.isEmpty()) {
            write("[]");
            return;
        }
        int offset2 = this.count;
        int list_size = list.size();
        for (int i = 0; i < list_size; i++) {
            String text = list.get(i);
            boolean hasSpecial = false;
            if (text == null) {
                hasSpecial = true;
            } else {
                int len = text.length();
                for (int j = 0; j < len; j++) {
                    char ch = text.charAt(j);
                    boolean z = ch < ' ' || ch > '~' || ch == '\"' || ch == '\\';
                    hasSpecial = z;
                    if (z) {
                        break;
                    }
                }
            }
            if (hasSpecial) {
                write(91);
                for (int j2 = 0; j2 < list.size(); j2++) {
                    String text2 = list.get(j2);
                    if (j2 != 0) {
                        write(44);
                    }
                    if (text2 == null) {
                        write("null");
                    } else {
                        writeStringWithDoubleQuote(text2, (char) 0);
                    }
                }
                write(93);
                return;
            }
            int newcount = offset2 + text.length() + 3;
            if (i == list.size() - 1) {
                newcount++;
            }
            if (newcount > this.buf.length) {
                this.count = offset2;
                expandCapacity(newcount);
            }
            if (i == 0) {
                int i2 = offset2;
                offset = offset2 + 1;
                this.buf[i2] = '[';
            } else {
                int i3 = offset2;
                offset = offset2 + 1;
                this.buf[i3] = ',';
            }
            int i4 = offset;
            int offset3 = offset + 1;
            this.buf[i4] = '\"';
            text.getChars(0, text.length(), this.buf, offset3);
            int offset4 = offset3 + text.length();
            offset2 = offset4 + 1;
            this.buf[offset4] = '\"';
        }
        this.buf[offset2] = ']';
        this.count = offset2 + 1;
    }

    public void writeFieldValue(char seperator, String name, char value) {
        write(seperator);
        writeFieldName(name);
        if (value == 0) {
            writeString("��");
        } else {
            writeString(Character.toString(value));
        }
    }

    public void writeFieldValue(char seperator, String name, boolean value) {
        int intSize = value ? 4 : 5;
        int nameLen = name.length();
        int newcount = this.count + nameLen + 4 + intSize;
        if (newcount > this.buf.length) {
            if (this.writer != null) {
                write(seperator);
                writeString(name);
                write(58);
                write(value);
                return;
            }
            expandCapacity(newcount);
        }
        int start = this.count;
        this.count = newcount;
        this.buf[start] = seperator;
        int nameEnd = start + nameLen + 1;
        this.buf[start + 1] = this.keySeperator;
        name.getChars(0, nameLen, this.buf, start + 2);
        this.buf[nameEnd + 1] = this.keySeperator;
        if (value) {
            System.arraycopy(":true".toCharArray(), 0, this.buf, nameEnd + 2, 5);
        } else {
            System.arraycopy(":false".toCharArray(), 0, this.buf, nameEnd + 2, 6);
        }
    }

    public void write(boolean value) {
        if (value) {
            write("true");
        } else {
            write("false");
        }
    }

    public void writeFieldValue(char seperator, String name, int value) {
        if (value == Integer.MIN_VALUE || !this.quoteFieldNames) {
            write(seperator);
            writeFieldName(name);
            writeInt(value);
            return;
        }
        int intSize = value < 0 ? IOUtils.stringSize(-value) + 1 : IOUtils.stringSize(value);
        int nameLen = name.length();
        int newcount = this.count + nameLen + 4 + intSize;
        if (newcount > this.buf.length) {
            if (this.writer != null) {
                write(seperator);
                writeFieldName(name);
                writeInt(value);
                return;
            }
            expandCapacity(newcount);
        }
        int start = this.count;
        this.count = newcount;
        this.buf[start] = seperator;
        int nameEnd = start + nameLen + 1;
        this.buf[start + 1] = this.keySeperator;
        name.getChars(0, nameLen, this.buf, start + 2);
        this.buf[nameEnd + 1] = this.keySeperator;
        this.buf[nameEnd + 2] = ':';
        IOUtils.getChars(value, this.count, this.buf);
    }

    public void writeFieldValue(char seperator, String name, long value) {
        if (value == Long.MIN_VALUE || !this.quoteFieldNames) {
            write(seperator);
            writeFieldName(name);
            writeLong(value);
            return;
        }
        int intSize = value < 0 ? IOUtils.stringSize(-value) + 1 : IOUtils.stringSize(value);
        int nameLen = name.length();
        int newcount = this.count + nameLen + 4 + intSize;
        if (newcount > this.buf.length) {
            if (this.writer != null) {
                write(seperator);
                writeFieldName(name);
                writeLong(value);
                return;
            }
            expandCapacity(newcount);
        }
        int start = this.count;
        this.count = newcount;
        this.buf[start] = seperator;
        int nameEnd = start + nameLen + 1;
        this.buf[start + 1] = this.keySeperator;
        name.getChars(0, nameLen, this.buf, start + 2);
        this.buf[nameEnd + 1] = this.keySeperator;
        this.buf[nameEnd + 2] = ':';
        IOUtils.getChars(value, this.count, this.buf);
    }

    public void writeFieldValue(char seperator, String name, float value) {
        write(seperator);
        writeFieldName(name);
        writeFloat(value, false);
    }

    public void writeFieldValue(char seperator, String name, double value) {
        write(seperator);
        writeFieldName(name);
        writeDouble(value, false);
    }

    public void writeFieldValue(char seperator, String name, String value) {
        if (this.quoteFieldNames) {
            if (this.useSingleQuotes) {
                write(seperator);
                writeFieldName(name);
                if (value == null) {
                    writeNull();
                    return;
                } else {
                    writeString(value);
                    return;
                }
            }
            if (isEnabled(SerializerFeature.BrowserSecure)) {
                write(seperator);
                writeStringWithDoubleQuote(name, ':');
                writeStringWithDoubleQuote(value, (char) 0);
                return;
            } else {
                if (isEnabled(SerializerFeature.BrowserCompatible)) {
                    write(seperator);
                    writeStringWithDoubleQuote(name, ':');
                    writeStringWithDoubleQuote(value, (char) 0);
                    return;
                }
                writeFieldValueStringWithDoubleQuoteCheck(seperator, name, value);
                return;
            }
        }
        write(seperator);
        writeFieldName(name);
        if (value == null) {
            writeNull();
        } else {
            writeString(value);
        }
    }

    public void writeFieldValueStringWithDoubleQuoteCheck(char seperator, String name, String value) {
        int valueLen;
        int newcount;
        int nameLen = name.length();
        int newcount2 = this.count;
        if (value == null) {
            valueLen = 4;
            newcount = newcount2 + nameLen + 8;
        } else {
            valueLen = value.length();
            newcount = newcount2 + nameLen + valueLen + 6;
        }
        if (newcount > this.buf.length) {
            if (this.writer != null) {
                write(seperator);
                writeStringWithDoubleQuote(name, ':');
                writeStringWithDoubleQuote(value, (char) 0);
                return;
            }
            expandCapacity(newcount);
        }
        this.buf[this.count] = seperator;
        int nameStart = this.count + 2;
        int nameEnd = nameStart + nameLen;
        this.buf[this.count + 1] = '\"';
        name.getChars(0, nameLen, this.buf, nameStart);
        this.count = newcount;
        this.buf[nameEnd] = '\"';
        int index = nameEnd + 1;
        int index2 = index + 1;
        this.buf[index] = ':';
        if (value == null) {
            int index3 = index2 + 1;
            this.buf[index2] = 'n';
            int index4 = index3 + 1;
            this.buf[index3] = 'u';
            int index5 = index4 + 1;
            this.buf[index4] = 'l';
            int i = index5 + 1;
            this.buf[index5] = 'l';
            return;
        }
        int index6 = index2 + 1;
        this.buf[index2] = '\"';
        int valueEnd = index6 + valueLen;
        value.getChars(0, valueLen, this.buf, index6);
        int specialCount = 0;
        int lastSpecialIndex = -1;
        int firstSpecialIndex = -1;
        char lastSpecial = 0;
        for (int i2 = index6; i2 < valueEnd; i2++) {
            char ch = this.buf[i2];
            if (ch >= ']') {
                if (ch >= 127 && (ch == 8232 || ch <= 160)) {
                    if (firstSpecialIndex == -1) {
                        firstSpecialIndex = i2;
                    }
                    specialCount++;
                    lastSpecialIndex = i2;
                    lastSpecial = ch;
                    newcount += 4;
                }
            } else if (isSpecial(ch, this.features)) {
                specialCount++;
                lastSpecialIndex = i2;
                lastSpecial = ch;
                if (ch < IOUtils.specicalFlags_doubleQuotes.length && IOUtils.specicalFlags_doubleQuotes[ch] == 4) {
                    newcount += 4;
                }
                if (firstSpecialIndex == -1) {
                    firstSpecialIndex = i2;
                }
            }
        }
        if (specialCount > 0) {
            int newcount3 = newcount + specialCount;
            if (newcount3 > this.buf.length) {
                expandCapacity(newcount3);
            }
            this.count = newcount3;
            if (specialCount == 1) {
                if (lastSpecial == 8232) {
                    int srcPos = lastSpecialIndex + 1;
                    int destPos = lastSpecialIndex + 6;
                    int LengthOfCopy = (valueEnd - lastSpecialIndex) - 1;
                    System.arraycopy(this.buf, srcPos, this.buf, destPos, LengthOfCopy);
                    this.buf[lastSpecialIndex] = '\\';
                    int lastSpecialIndex2 = lastSpecialIndex + 1;
                    this.buf[lastSpecialIndex2] = 'u';
                    int lastSpecialIndex3 = lastSpecialIndex2 + 1;
                    this.buf[lastSpecialIndex3] = '2';
                    int lastSpecialIndex4 = lastSpecialIndex3 + 1;
                    this.buf[lastSpecialIndex4] = '0';
                    int lastSpecialIndex5 = lastSpecialIndex4 + 1;
                    this.buf[lastSpecialIndex5] = '2';
                    this.buf[lastSpecialIndex5 + 1] = '8';
                } else {
                    char ch2 = lastSpecial;
                    if (ch2 < IOUtils.specicalFlags_doubleQuotes.length && IOUtils.specicalFlags_doubleQuotes[ch2] == 4) {
                        int srcPos2 = lastSpecialIndex + 1;
                        int destPos2 = lastSpecialIndex + 6;
                        int LengthOfCopy2 = (valueEnd - lastSpecialIndex) - 1;
                        System.arraycopy(this.buf, srcPos2, this.buf, destPos2, LengthOfCopy2);
                        int bufIndex = lastSpecialIndex;
                        int bufIndex2 = bufIndex + 1;
                        this.buf[bufIndex] = '\\';
                        int bufIndex3 = bufIndex2 + 1;
                        this.buf[bufIndex2] = 'u';
                        int bufIndex4 = bufIndex3 + 1;
                        this.buf[bufIndex3] = IOUtils.DIGITS[(ch2 >>> '\f') & 15];
                        int bufIndex5 = bufIndex4 + 1;
                        this.buf[bufIndex4] = IOUtils.DIGITS[(ch2 >>> '\b') & 15];
                        int bufIndex6 = bufIndex5 + 1;
                        this.buf[bufIndex5] = IOUtils.DIGITS[(ch2 >>> 4) & 15];
                        int i3 = bufIndex6 + 1;
                        this.buf[bufIndex6] = IOUtils.DIGITS[ch2 & 15];
                    } else {
                        int srcPos3 = lastSpecialIndex + 1;
                        int destPos3 = lastSpecialIndex + 2;
                        int LengthOfCopy3 = (valueEnd - lastSpecialIndex) - 1;
                        System.arraycopy(this.buf, srcPos3, this.buf, destPos3, LengthOfCopy3);
                        this.buf[lastSpecialIndex] = '\\';
                        this.buf[lastSpecialIndex + 1] = IOUtils.replaceChars[ch2];
                    }
                }
            } else if (specialCount > 1) {
                int textIndex = firstSpecialIndex - index6;
                int bufIndex7 = firstSpecialIndex;
                for (int i4 = textIndex; i4 < value.length(); i4++) {
                    char ch3 = value.charAt(i4);
                    if ((ch3 < IOUtils.specicalFlags_doubleQuotes.length && IOUtils.specicalFlags_doubleQuotes[ch3] != 0) || (ch3 == '/' && isEnabled(SerializerFeature.WriteSlashAsSpecial))) {
                        int i5 = bufIndex7;
                        int bufIndex8 = bufIndex7 + 1;
                        this.buf[i5] = '\\';
                        if (IOUtils.specicalFlags_doubleQuotes[ch3] == 4) {
                            int bufIndex9 = bufIndex8 + 1;
                            this.buf[bufIndex8] = 'u';
                            int bufIndex10 = bufIndex9 + 1;
                            this.buf[bufIndex9] = IOUtils.DIGITS[(ch3 >>> '\f') & 15];
                            int bufIndex11 = bufIndex10 + 1;
                            this.buf[bufIndex10] = IOUtils.DIGITS[(ch3 >>> '\b') & 15];
                            int bufIndex12 = bufIndex11 + 1;
                            this.buf[bufIndex11] = IOUtils.DIGITS[(ch3 >>> 4) & 15];
                            bufIndex7 = bufIndex12 + 1;
                            this.buf[bufIndex12] = IOUtils.DIGITS[ch3 & 15];
                            valueEnd += 5;
                        } else {
                            bufIndex7 = bufIndex8 + 1;
                            this.buf[bufIndex8] = IOUtils.replaceChars[ch3];
                            valueEnd++;
                        }
                    } else if (ch3 == 8232) {
                        int i6 = bufIndex7;
                        int bufIndex13 = bufIndex7 + 1;
                        this.buf[i6] = '\\';
                        int bufIndex14 = bufIndex13 + 1;
                        this.buf[bufIndex13] = 'u';
                        int bufIndex15 = bufIndex14 + 1;
                        this.buf[bufIndex14] = IOUtils.DIGITS[(ch3 >>> '\f') & 15];
                        int bufIndex16 = bufIndex15 + 1;
                        this.buf[bufIndex15] = IOUtils.DIGITS[(ch3 >>> '\b') & 15];
                        int bufIndex17 = bufIndex16 + 1;
                        this.buf[bufIndex16] = IOUtils.DIGITS[(ch3 >>> 4) & 15];
                        bufIndex7 = bufIndex17 + 1;
                        this.buf[bufIndex17] = IOUtils.DIGITS[ch3 & 15];
                        valueEnd += 5;
                    } else {
                        int i7 = bufIndex7;
                        bufIndex7++;
                        this.buf[i7] = ch3;
                    }
                }
            }
        }
        this.buf[this.count - 1] = '\"';
    }

    public void writeFieldValueStringWithDoubleQuote(char seperator, String name, String value) {
        int nameLen = name.length();
        int newcount = this.count;
        int valueLen = value.length();
        int newcount2 = newcount + nameLen + valueLen + 6;
        if (newcount2 > this.buf.length) {
            if (this.writer != null) {
                write(seperator);
                writeStringWithDoubleQuote(name, ':');
                writeStringWithDoubleQuote(value, (char) 0);
                return;
            }
            expandCapacity(newcount2);
        }
        this.buf[this.count] = seperator;
        int nameStart = this.count + 2;
        int nameEnd = nameStart + nameLen;
        this.buf[this.count + 1] = '\"';
        name.getChars(0, nameLen, this.buf, nameStart);
        this.count = newcount2;
        this.buf[nameEnd] = '\"';
        int index = nameEnd + 1;
        int index2 = index + 1;
        this.buf[index] = ':';
        this.buf[index2] = '\"';
        value.getChars(0, valueLen, this.buf, index2 + 1);
        this.buf[this.count - 1] = '\"';
    }

    static boolean isSpecial(char ch, int features) {
        if (ch == ' ') {
            return false;
        }
        if (ch == '/') {
            return (features & SerializerFeature.WriteSlashAsSpecial.mask) != 0;
        }
        if (ch > '#' && ch != '\\') {
            return false;
        }
        if (ch <= 31 || ch == '\\' || ch == '\"') {
            return true;
        }
        return false;
    }

    public void writeFieldValue(char seperator, String name, Enum<?> value) {
        if (value == null) {
            write(seperator);
            writeFieldName(name);
            writeNull();
        } else if (this.writeEnumUsingName && !this.writeEnumUsingToString) {
            writeEnumFieldValue(seperator, name, value.name());
        } else if (this.writeEnumUsingToString) {
            writeEnumFieldValue(seperator, name, value.toString());
        } else {
            writeFieldValue(seperator, name, value.ordinal());
        }
    }

    private void writeEnumFieldValue(char seperator, String name, String value) {
        if (this.useSingleQuotes) {
            writeFieldValue(seperator, name, value);
        } else {
            writeFieldValueStringWithDoubleQuote(seperator, name, value);
        }
    }

    public void writeFieldValue(char seperator, String name, BigDecimal value) {
        write(seperator);
        writeFieldName(name);
        if (value == null) {
            writeNull();
        } else {
            write(value.toString());
        }
    }

    public void writeString(String text, char seperator) {
        if (this.useSingleQuotes) {
            writeStringWithSingleQuote(text);
            write(seperator);
        } else {
            writeStringWithDoubleQuote(text, seperator);
        }
    }

    public void writeString(String text) {
        if (this.useSingleQuotes) {
            writeStringWithSingleQuote(text);
        } else {
            writeStringWithDoubleQuote(text, (char) 0);
        }
    }

    protected void writeStringWithSingleQuote(String text) {
        if (text == null) {
            int newcount = this.count + 4;
            if (newcount > this.buf.length) {
                expandCapacity(newcount);
            }
            "null".getChars(0, 4, this.buf, this.count);
            this.count = newcount;
            return;
        }
        int len = text.length();
        int newcount2 = this.count + len + 2;
        if (newcount2 > this.buf.length) {
            if (this.writer != null) {
                write(39);
                for (int i = 0; i < text.length(); i++) {
                    char ch = text.charAt(i);
                    if (ch <= '\r' || ch == '\\' || ch == '\'' || (ch == '/' && isEnabled(SerializerFeature.WriteSlashAsSpecial))) {
                        write(92);
                        write(IOUtils.replaceChars[ch]);
                    } else {
                        write(ch);
                    }
                }
                write(39);
                return;
            }
            expandCapacity(newcount2);
        }
        int start = this.count + 1;
        int end = start + len;
        this.buf[this.count] = '\'';
        text.getChars(0, len, this.buf, start);
        this.count = newcount2;
        int specialCount = 0;
        int lastSpecialIndex = -1;
        char lastSpecial = 0;
        for (int i2 = start; i2 < end; i2++) {
            char ch2 = this.buf[i2];
            if (ch2 <= '\r' || ch2 == '\\' || ch2 == '\'' || (ch2 == '/' && isEnabled(SerializerFeature.WriteSlashAsSpecial))) {
                specialCount++;
                lastSpecialIndex = i2;
                lastSpecial = ch2;
            }
        }
        int newcount3 = newcount2 + specialCount;
        if (newcount3 > this.buf.length) {
            expandCapacity(newcount3);
        }
        this.count = newcount3;
        if (specialCount == 1) {
            System.arraycopy(this.buf, lastSpecialIndex + 1, this.buf, lastSpecialIndex + 2, (end - lastSpecialIndex) - 1);
            this.buf[lastSpecialIndex] = '\\';
            this.buf[lastSpecialIndex + 1] = IOUtils.replaceChars[lastSpecial];
        } else if (specialCount > 1) {
            System.arraycopy(this.buf, lastSpecialIndex + 1, this.buf, lastSpecialIndex + 2, (end - lastSpecialIndex) - 1);
            this.buf[lastSpecialIndex] = '\\';
            int lastSpecialIndex2 = lastSpecialIndex + 1;
            this.buf[lastSpecialIndex2] = IOUtils.replaceChars[lastSpecial];
            int end2 = end + 1;
            for (int i3 = lastSpecialIndex2 - 2; i3 >= start; i3--) {
                char ch3 = this.buf[i3];
                if (ch3 <= '\r' || ch3 == '\\' || ch3 == '\'' || (ch3 == '/' && isEnabled(SerializerFeature.WriteSlashAsSpecial))) {
                    System.arraycopy(this.buf, i3 + 1, this.buf, i3 + 2, (end2 - i3) - 1);
                    this.buf[i3] = '\\';
                    this.buf[i3 + 1] = IOUtils.replaceChars[ch3];
                    end2++;
                }
            }
        }
        this.buf[this.count - 1] = '\'';
    }

    public void writeFieldName(String key) {
        writeFieldName(key, false);
    }

    public void writeFieldName(String key, boolean checkSpecial) {
        if (key == null) {
            write("null:");
            return;
        }
        if (this.useSingleQuotes) {
            if (this.quoteFieldNames) {
                writeStringWithSingleQuote(key);
                write(58);
                return;
            } else {
                writeKeyWithSingleQuoteIfHasSpecial(key);
                return;
            }
        }
        if (this.quoteFieldNames) {
            writeStringWithDoubleQuote(key, ':');
            return;
        }
        boolean hashSpecial = key.length() == 0;
        int i = 0;
        while (true) {
            if (i >= key.length()) {
                break;
            }
            char ch = key.charAt(i);
            if (!isSpecial(ch, 0)) {
                i++;
            } else {
                hashSpecial = true;
                break;
            }
        }
        if (hashSpecial) {
            writeStringWithDoubleQuote(key, ':');
        } else {
            write(key);
            write(58);
        }
    }

    private void writeKeyWithSingleQuoteIfHasSpecial(String text) {
        byte[] specicalFlags_singleQuotes = IOUtils.specicalFlags_singleQuotes;
        int len = text.length();
        int newcount = this.count + len + 1;
        if (newcount > this.buf.length) {
            if (this.writer != null) {
                if (len == 0) {
                    write(39);
                    write(39);
                    write(58);
                    return;
                }
                boolean hasSpecial = false;
                int i = 0;
                while (true) {
                    if (i >= len) {
                        break;
                    }
                    char ch = text.charAt(i);
                    if (ch >= specicalFlags_singleQuotes.length || specicalFlags_singleQuotes[ch] == 0) {
                        i++;
                    } else {
                        hasSpecial = true;
                        break;
                    }
                }
                if (hasSpecial) {
                    write(39);
                }
                for (int i2 = 0; i2 < len; i2++) {
                    char ch2 = text.charAt(i2);
                    if (ch2 < specicalFlags_singleQuotes.length && specicalFlags_singleQuotes[ch2] != 0) {
                        write(92);
                        write(IOUtils.replaceChars[ch2]);
                    } else {
                        write(ch2);
                    }
                }
                if (hasSpecial) {
                    write(39);
                }
                write(58);
                return;
            }
            expandCapacity(newcount);
        }
        if (len == 0) {
            int newCount = this.count + 3;
            if (newCount > this.buf.length) {
                expandCapacity(this.count + 3);
            }
            char[] cArr = this.buf;
            int i3 = this.count;
            this.count = i3 + 1;
            cArr[i3] = '\'';
            char[] cArr2 = this.buf;
            int i4 = this.count;
            this.count = i4 + 1;
            cArr2[i4] = '\'';
            char[] cArr3 = this.buf;
            int i5 = this.count;
            this.count = i5 + 1;
            cArr3[i5] = ':';
            return;
        }
        int start = this.count;
        int end = start + len;
        text.getChars(0, len, this.buf, start);
        this.count = newcount;
        boolean hasSpecial2 = false;
        int i6 = start;
        while (i6 < end) {
            char ch3 = this.buf[i6];
            if (ch3 < specicalFlags_singleQuotes.length && specicalFlags_singleQuotes[ch3] != 0) {
                if (!hasSpecial2) {
                    newcount += 3;
                    if (newcount > this.buf.length) {
                        expandCapacity(newcount);
                    }
                    this.count = newcount;
                    System.arraycopy(this.buf, i6 + 1, this.buf, i6 + 3, (end - i6) - 1);
                    System.arraycopy(this.buf, 0, this.buf, 1, i6);
                    this.buf[start] = '\'';
                    int i7 = i6 + 1;
                    this.buf[i7] = '\\';
                    i6 = i7 + 1;
                    this.buf[i6] = IOUtils.replaceChars[ch3];
                    end += 2;
                    this.buf[this.count - 2] = '\'';
                    hasSpecial2 = true;
                } else {
                    newcount++;
                    if (newcount > this.buf.length) {
                        expandCapacity(newcount);
                    }
                    this.count = newcount;
                    System.arraycopy(this.buf, i6 + 1, this.buf, i6 + 2, end - i6);
                    this.buf[i6] = '\\';
                    i6++;
                    this.buf[i6] = IOUtils.replaceChars[ch3];
                    end++;
                }
            }
            i6++;
        }
        this.buf[newcount - 1] = ':';
    }

    @Override // java.io.Writer, java.io.Flushable
    public void flush() {
        if (this.writer == null) {
            return;
        }
        try {
            this.writer.write(this.buf, 0, this.count);
            this.writer.flush();
            this.count = 0;
        } catch (IOException e) {
            throw new JSONException(e.getMessage(), e);
        }
    }
}
