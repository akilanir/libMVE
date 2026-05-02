package org.tukaani.xz.lz;

import java.io.IOException;
import java.io.OutputStream;
import org.tukaani.xz.common.Util;

/* loaded from: xz-1.5.jar:org/tukaani/xz/lz/LZEncoder.class */
public abstract class LZEncoder {
    public static final int MF_HC4 = 4;
    public static final int MF_BT4 = 20;
    private final int keepSizeBefore;
    private final int keepSizeAfter;
    final int matchLenMax;
    final int niceLen;
    final byte[] buf;
    int readPos = -1;
    private int readLimit = -1;
    private boolean finishing = false;
    private int writePos = 0;
    private int pendingSize = 0;
    static final boolean $assertionsDisabled;
    static Class class$org$tukaani$xz$lz$LZEncoder;

    static void normalize(int[] iArr, int i) {
        for (int i2 = 0; i2 < iArr.length; i2++) {
            if (iArr[i2] <= i) {
                iArr[i2] = 0;
            } else {
                int i3 = i2;
                iArr[i3] = iArr[i3] - i;
            }
        }
    }

    private static int getBufSize(int i, int i2, int i3, int i4) {
        return i2 + i + i3 + i4 + Math.min((i / 2) + 262144, 536870912);
    }

    public static int getMemoryUsage(int i, int i2, int i3, int i4, int i5) {
        int memoryUsage;
        int bufSize = (getBufSize(i, i2, i3, i4) / Util.BLOCK_HEADER_SIZE_MAX) + 10;
        switch (i5) {
            case 4:
                memoryUsage = bufSize + HC4.getMemoryUsage(i);
                break;
            case 20:
                memoryUsage = bufSize + BT4.getMemoryUsage(i);
                break;
            default:
                throw new IllegalArgumentException();
        }
        return memoryUsage;
    }

    public static LZEncoder getInstance(int i, int i2, int i3, int i4, int i5, int i6, int i7) {
        switch (i6) {
            case 4:
                return new HC4(i, i2, i3, i4, i5, i7);
            case 20:
                return new BT4(i, i2, i3, i4, i5, i7);
            default:
                throw new IllegalArgumentException();
        }
    }

    LZEncoder(int i, int i2, int i3, int i4, int i5) {
        this.buf = new byte[getBufSize(i, i2, i3, i5)];
        this.keepSizeBefore = i2 + i;
        this.keepSizeAfter = i3 + i5;
        this.matchLenMax = i5;
        this.niceLen = i4;
    }

    public void setPresetDict(int i, byte[] bArr) {
        if (!$assertionsDisabled && isStarted()) {
            throw new AssertionError();
        }
        if (!$assertionsDisabled && this.writePos != 0) {
            throw new AssertionError();
        }
        if (bArr != null) {
            int min = Math.min(bArr.length, i);
            System.arraycopy(bArr, bArr.length - min, this.buf, 0, min);
            this.writePos += min;
            skip(min);
        }
    }

    private void moveWindow() {
        int i = ((this.readPos + 1) - this.keepSizeBefore) & (-16);
        System.arraycopy(this.buf, i, this.buf, 0, this.writePos - i);
        this.readPos -= i;
        this.readLimit -= i;
        this.writePos -= i;
    }

    public int fillWindow(byte[] bArr, int i, int i2) {
        if (!$assertionsDisabled && this.finishing) {
            throw new AssertionError();
        }
        if (this.readPos >= this.buf.length - this.keepSizeAfter) {
            moveWindow();
        }
        if (i2 > this.buf.length - this.writePos) {
            i2 = this.buf.length - this.writePos;
        }
        System.arraycopy(bArr, i, this.buf, this.writePos, i2);
        this.writePos += i2;
        if (this.writePos >= this.keepSizeAfter) {
            this.readLimit = this.writePos - this.keepSizeAfter;
        }
        processPendingBytes();
        return i2;
    }

    private void processPendingBytes() {
        if (this.pendingSize <= 0 || this.readPos >= this.readLimit) {
            return;
        }
        this.readPos -= this.pendingSize;
        int i = this.pendingSize;
        this.pendingSize = 0;
        skip(i);
        if (!$assertionsDisabled && this.pendingSize >= i) {
            throw new AssertionError();
        }
    }

    public boolean isStarted() {
        return this.readPos != -1;
    }

    public void setFlushing() {
        this.readLimit = this.writePos - 1;
        processPendingBytes();
    }

    public void setFinishing() {
        this.readLimit = this.writePos - 1;
        this.finishing = true;
        processPendingBytes();
    }

    public boolean hasEnoughData(int i) {
        return this.readPos - i < this.readLimit;
    }

    public void copyUncompressed(OutputStream outputStream, int i, int i2) throws IOException {
        outputStream.write(this.buf, (this.readPos + 1) - i, i2);
    }

    public int getAvail() {
        if ($assertionsDisabled || isStarted()) {
            return this.writePos - this.readPos;
        }
        throw new AssertionError();
    }

    public int getPos() {
        return this.readPos;
    }

    public int getByte(int i) {
        return this.buf[this.readPos - i] & 255;
    }

    public int getByte(int i, int i2) {
        return this.buf[(this.readPos + i) - i2] & 255;
    }

    public int getMatchLen(int i, int i2) {
        int i3 = (this.readPos - i) - 1;
        int i4 = 0;
        while (i4 < i2 && this.buf[this.readPos + i4] == this.buf[i3 + i4]) {
            i4++;
        }
        return i4;
    }

    public int getMatchLen(int i, int i2, int i3) {
        int i4 = this.readPos + i;
        int i5 = (i4 - i2) - 1;
        int i6 = 0;
        while (i6 < i3 && this.buf[i4 + i6] == this.buf[i5 + i6]) {
            i6++;
        }
        return i6;
    }

    public boolean verifyMatches(Matches matches) {
        int min = Math.min(getAvail(), this.matchLenMax);
        for (int i = 0; i < matches.count; i++) {
            if (getMatchLen(matches.dist[i], min) != matches.len[i]) {
                return false;
            }
        }
        return true;
    }

    int movePos(int i, int i2) {
        if (!$assertionsDisabled && i < i2) {
            throw new AssertionError();
        }
        this.readPos++;
        int i3 = this.writePos - this.readPos;
        if (i3 < i && (i3 < i2 || !this.finishing)) {
            this.pendingSize++;
            i3 = 0;
        }
        return i3;
    }

    public abstract Matches getMatches();

    public abstract void skip(int i);

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    static {
        Class cls;
        if (class$org$tukaani$xz$lz$LZEncoder == null) {
            cls = class$("org.tukaani.xz.lz.LZEncoder");
            class$org$tukaani$xz$lz$LZEncoder = cls;
        } else {
            cls = class$org$tukaani$xz$lz$LZEncoder;
        }
        $assertionsDisabled = !cls.desiredAssertionStatus();
    }
}
