package org.tukaani.xz;

import java.io.DataOutputStream;
import java.io.IOException;
import org.tukaani.xz.lz.LZEncoder;
import org.tukaani.xz.lzma.LZMAEncoder;
import org.tukaani.xz.rangecoder.RangeEncoder;

/* loaded from: xz-1.5.jar:org/tukaani/xz/LZMA2OutputStream.class */
class LZMA2OutputStream extends FinishableOutputStream {
    static final int COMPRESSED_SIZE_MAX = 65536;
    private FinishableOutputStream out;
    private final DataOutputStream outData;
    private final LZEncoder lz;
    private final RangeEncoder rc;
    private final LZMAEncoder lzma;
    private final int props;
    private boolean dictResetNeeded;
    private boolean stateResetNeeded = true;
    private boolean propsNeeded = true;
    private int pendingSize = 0;
    private boolean finished = false;
    private IOException exception = null;
    private final byte[] tempBuf = new byte[1];
    static final boolean $assertionsDisabled;
    static Class class$org$tukaani$xz$LZMA2OutputStream;

    private static int getExtraSizeBefore(int i) {
        if (COMPRESSED_SIZE_MAX > i) {
            return COMPRESSED_SIZE_MAX - i;
        }
        return 0;
    }

    static int getMemoryUsage(LZMA2Options lZMA2Options) {
        int dictSize = lZMA2Options.getDictSize();
        return 70 + LZMAEncoder.getMemoryUsage(lZMA2Options.getMode(), dictSize, getExtraSizeBefore(dictSize), lZMA2Options.getMatchFinder());
    }

    LZMA2OutputStream(FinishableOutputStream finishableOutputStream, LZMA2Options lZMA2Options) {
        this.dictResetNeeded = true;
        if (finishableOutputStream == null) {
            throw new NullPointerException();
        }
        this.out = finishableOutputStream;
        this.outData = new DataOutputStream(finishableOutputStream);
        this.rc = new RangeEncoder(COMPRESSED_SIZE_MAX);
        int dictSize = lZMA2Options.getDictSize();
        this.lzma = LZMAEncoder.getInstance(this.rc, lZMA2Options.getLc(), lZMA2Options.getLp(), lZMA2Options.getPb(), lZMA2Options.getMode(), dictSize, getExtraSizeBefore(dictSize), lZMA2Options.getNiceLen(), lZMA2Options.getMatchFinder(), lZMA2Options.getDepthLimit());
        this.lz = this.lzma.getLZEncoder();
        byte[] presetDict = lZMA2Options.getPresetDict();
        if (presetDict != null && presetDict.length > 0) {
            this.lz.setPresetDict(dictSize, presetDict);
            this.dictResetNeeded = false;
        }
        this.props = (((lZMA2Options.getPb() * 5) + lZMA2Options.getLp()) * 9) + lZMA2Options.getLc();
    }

    @Override // java.io.OutputStream
    public void write(int i) throws IOException {
        this.tempBuf[0] = (byte) i;
        write(this.tempBuf, 0, 1);
    }

    @Override // java.io.OutputStream
    public void write(byte[] bArr, int i, int i2) throws IOException {
        if (i < 0 || i2 < 0 || i + i2 < 0 || i + i2 > bArr.length) {
            throw new IndexOutOfBoundsException();
        }
        if (this.exception != null) {
            throw this.exception;
        }
        if (this.finished) {
            throw new XZIOException("Stream finished or closed");
        }
        while (i2 > 0) {
            try {
                int fillWindow = this.lz.fillWindow(bArr, i, i2);
                i += fillWindow;
                i2 -= fillWindow;
                this.pendingSize += fillWindow;
                if (this.lzma.encodeForLZMA2()) {
                    writeChunk();
                }
            } catch (IOException e) {
                this.exception = e;
                throw e;
            }
        }
    }

    private void writeChunk() throws IOException {
        int finish = this.rc.finish();
        int uncompressedSize = this.lzma.getUncompressedSize();
        if (!$assertionsDisabled && finish <= 0) {
            throw new AssertionError(finish);
        }
        if (!$assertionsDisabled && uncompressedSize <= 0) {
            throw new AssertionError(uncompressedSize);
        }
        if (finish + 2 < uncompressedSize) {
            writeLZMA(uncompressedSize, finish);
        } else {
            this.lzma.reset();
            uncompressedSize = this.lzma.getUncompressedSize();
            if (!$assertionsDisabled && uncompressedSize <= 0) {
                throw new AssertionError(uncompressedSize);
            }
            writeUncompressed(uncompressedSize);
        }
        this.pendingSize -= uncompressedSize;
        this.lzma.resetUncompressedSize();
        this.rc.reset();
    }

    private void writeLZMA(int i, int i2) throws IOException {
        this.outData.writeByte((this.propsNeeded ? this.dictResetNeeded ? 224 : 192 : this.stateResetNeeded ? 160 : 128) | ((i - 1) >>> 16));
        this.outData.writeShort(i - 1);
        this.outData.writeShort(i2 - 1);
        if (this.propsNeeded) {
            this.outData.writeByte(this.props);
        }
        this.rc.write(this.out);
        this.propsNeeded = false;
        this.stateResetNeeded = false;
        this.dictResetNeeded = false;
    }

    private void writeUncompressed(int i) throws IOException {
        while (i > 0) {
            int min = Math.min(i, COMPRESSED_SIZE_MAX);
            this.outData.writeByte(this.dictResetNeeded ? 1 : 2);
            this.outData.writeShort(min - 1);
            this.lz.copyUncompressed(this.out, i, min);
            i -= min;
            this.dictResetNeeded = false;
        }
        this.stateResetNeeded = true;
    }

    private void writeEndMarker() throws IOException {
        if (!$assertionsDisabled && this.finished) {
            throw new AssertionError();
        }
        if (this.exception != null) {
            throw this.exception;
        }
        this.lz.setFinishing();
        while (this.pendingSize > 0) {
            try {
                this.lzma.encodeForLZMA2();
                writeChunk();
            } catch (IOException e) {
                this.exception = e;
                throw e;
            }
        }
        this.out.write(0);
        this.finished = true;
    }

    @Override // java.io.OutputStream, java.io.Flushable
    public void flush() throws IOException {
        if (this.exception != null) {
            throw this.exception;
        }
        if (this.finished) {
            throw new XZIOException("Stream finished or closed");
        }
        try {
            this.lz.setFlushing();
            while (this.pendingSize > 0) {
                this.lzma.encodeForLZMA2();
                writeChunk();
            }
            this.out.flush();
        } catch (IOException e) {
            this.exception = e;
            throw e;
        }
    }

    @Override // org.tukaani.xz.FinishableOutputStream
    public void finish() throws IOException {
        if (this.finished) {
            return;
        }
        writeEndMarker();
        try {
            this.out.finish();
            this.finished = true;
        } catch (IOException e) {
            this.exception = e;
            throw e;
        }
    }

    @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (this.out != null) {
            if (!this.finished) {
                try {
                    writeEndMarker();
                } catch (IOException e) {
                }
            }
            try {
                this.out.close();
            } catch (IOException e2) {
                if (this.exception == null) {
                    this.exception = e2;
                }
            }
            this.out = null;
        }
        if (this.exception != null) {
            throw this.exception;
        }
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    static {
        Class cls;
        if (class$org$tukaani$xz$LZMA2OutputStream == null) {
            cls = class$("org.tukaani.xz.LZMA2OutputStream");
            class$org$tukaani$xz$LZMA2OutputStream = cls;
        } else {
            cls = class$org$tukaani$xz$LZMA2OutputStream;
        }
        $assertionsDisabled = !cls.desiredAssertionStatus();
    }
}
