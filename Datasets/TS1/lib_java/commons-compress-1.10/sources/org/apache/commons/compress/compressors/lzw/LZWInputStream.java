package org.apache.commons.compress.compressors.lzw;

import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteOrder;
import org.apache.commons.compress.compressors.CompressorInputStream;
import org.apache.commons.compress.utils.BitInputStream;

/* loaded from: commons-compress-1.10.jar:org/apache/commons/compress/compressors/lzw/LZWInputStream.class */
public abstract class LZWInputStream extends CompressorInputStream {
    protected static final int DEFAULT_CODE_SIZE = 9;
    protected static final int UNUSED_PREFIX = -1;
    protected final BitInputStream in;
    private byte previousCodeFirstChar;
    private int tableSize;
    private int[] prefixes;
    private byte[] characters;
    private byte[] outputStack;
    private int outputStackLocation;
    private final byte[] oneByte = new byte[1];
    private int clearCode = -1;
    private int codeSize = 9;
    private int previousCode = -1;

    protected abstract int decompressNextSymbol() throws IOException;

    protected abstract int addEntry(int i, byte b) throws IOException;

    protected LZWInputStream(InputStream inputStream, ByteOrder byteOrder) {
        this.in = new BitInputStream(inputStream, byteOrder);
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.in.close();
    }

    @Override // java.io.InputStream
    public int read() throws IOException {
        int ret = read(this.oneByte);
        if (ret < 0) {
            return ret;
        }
        return 255 & this.oneByte[0];
    }

    @Override // java.io.InputStream
    public int read(byte[] b, int off, int len) throws IOException {
        int readFromStack = readFromStack(b, off, len);
        while (true) {
            int bytesRead = readFromStack;
            if (len - bytesRead > 0) {
                int result = decompressNextSymbol();
                if (result < 0) {
                    if (bytesRead > 0) {
                        count(bytesRead);
                        return bytesRead;
                    }
                    return result;
                }
                readFromStack = bytesRead + readFromStack(b, off + bytesRead, len - bytesRead);
            } else {
                count(bytesRead);
                return bytesRead;
            }
        }
    }

    protected void setClearCode(int codeSize) {
        this.clearCode = 1 << (codeSize - 1);
    }

    protected void initializeTables(int maxCodeSize) {
        int maxTableSize = 1 << maxCodeSize;
        this.prefixes = new int[maxTableSize];
        this.characters = new byte[maxTableSize];
        this.outputStack = new byte[maxTableSize];
        this.outputStackLocation = maxTableSize;
        for (int i = 0; i < 256; i++) {
            this.prefixes[i] = -1;
            this.characters[i] = (byte) i;
        }
    }

    protected int readNextCode() throws IOException {
        if (this.codeSize > 31) {
            throw new IllegalArgumentException("code size must not be bigger than 31");
        }
        return (int) this.in.readBits(this.codeSize);
    }

    protected int addEntry(int previousCode, byte character, int maxTableSize) {
        if (this.tableSize < maxTableSize) {
            this.prefixes[this.tableSize] = previousCode;
            this.characters[this.tableSize] = character;
            int i = this.tableSize;
            this.tableSize = i + 1;
            return i;
        }
        return -1;
    }

    protected int addRepeatOfPreviousCode() throws IOException {
        if (this.previousCode == -1) {
            throw new IOException("The first code can't be a reference to its preceding code");
        }
        return addEntry(this.previousCode, this.previousCodeFirstChar);
    }

    protected int expandCodeToOutputStack(int code, boolean addedUnfinishedEntry) throws IOException {
        int i = code;
        while (true) {
            int entry = i;
            if (entry < 0) {
                break;
            }
            byte[] bArr = this.outputStack;
            int i2 = this.outputStackLocation - 1;
            this.outputStackLocation = i2;
            bArr[i2] = this.characters[entry];
            i = this.prefixes[entry];
        }
        if (this.previousCode != -1 && !addedUnfinishedEntry) {
            addEntry(this.previousCode, this.outputStack[this.outputStackLocation]);
        }
        this.previousCode = code;
        this.previousCodeFirstChar = this.outputStack[this.outputStackLocation];
        return this.outputStackLocation;
    }

    private int readFromStack(byte[] b, int off, int len) {
        int remainingInStack = this.outputStack.length - this.outputStackLocation;
        if (remainingInStack > 0) {
            int maxLength = Math.min(remainingInStack, len);
            System.arraycopy(this.outputStack, this.outputStackLocation, b, off, maxLength);
            this.outputStackLocation += maxLength;
            return maxLength;
        }
        return 0;
    }

    protected int getCodeSize() {
        return this.codeSize;
    }

    protected void resetCodeSize() {
        setCodeSize(9);
    }

    protected void setCodeSize(int cs) {
        this.codeSize = cs;
    }

    protected void incrementCodeSize() {
        this.codeSize++;
    }

    protected void resetPreviousCode() {
        this.previousCode = -1;
    }

    protected int getPrefix(int offset) {
        return this.prefixes[offset];
    }

    protected void setPrefix(int offset, int value) {
        this.prefixes[offset] = value;
    }

    protected int getPrefixesLength() {
        return this.prefixes.length;
    }

    protected int getClearCode() {
        return this.clearCode;
    }

    protected int getTableSize() {
        return this.tableSize;
    }

    protected void setTableSize(int newSize) {
        this.tableSize = newSize;
    }
}
