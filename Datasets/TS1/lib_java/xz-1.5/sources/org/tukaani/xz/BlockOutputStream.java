package org.tukaani.xz;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import org.tukaani.xz.check.Check;
import org.tukaani.xz.common.EncoderUtil;

/* loaded from: xz-1.5.jar:org/tukaani/xz/BlockOutputStream.class */
class BlockOutputStream extends FinishableOutputStream {
    private final OutputStream out;
    private final CountingOutputStream outCounted;
    private FinishableOutputStream filterChain;
    private final Check check;
    private final int headerSize;
    private final long compressedSizeLimit;
    private long uncompressedSize = 0;
    private final byte[] tempBuf = new byte[1];

    public BlockOutputStream(OutputStream outputStream, FilterEncoder[] filterEncoderArr, Check check) throws IOException {
        this.out = outputStream;
        this.check = check;
        this.outCounted = new CountingOutputStream(outputStream);
        this.filterChain = this.outCounted;
        for (int length = filterEncoderArr.length - 1; length >= 0; length--) {
            this.filterChain = filterEncoderArr[length].getOutputStream(this.filterChain);
        }
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        byteArrayOutputStream.write(0);
        byteArrayOutputStream.write(filterEncoderArr.length - 1);
        for (int i = 0; i < filterEncoderArr.length; i++) {
            EncoderUtil.encodeVLI(byteArrayOutputStream, filterEncoderArr[i].getFilterID());
            byte[] filterProps = filterEncoderArr[i].getFilterProps();
            EncoderUtil.encodeVLI(byteArrayOutputStream, filterProps.length);
            byteArrayOutputStream.write(filterProps);
        }
        while ((byteArrayOutputStream.size() & 3) != 0) {
            byteArrayOutputStream.write(0);
        }
        byte[] byteArray = byteArrayOutputStream.toByteArray();
        this.headerSize = byteArray.length + 4;
        if (this.headerSize > 1024) {
            throw new UnsupportedOptionsException();
        }
        byteArray[0] = (byte) (byteArray.length / 4);
        outputStream.write(byteArray);
        EncoderUtil.writeCRC32(outputStream, byteArray);
        this.compressedSizeLimit = (9223372036854775804L - this.headerSize) - check.getSize();
    }

    @Override // java.io.OutputStream
    public void write(int i) throws IOException {
        this.tempBuf[0] = (byte) i;
        write(this.tempBuf, 0, 1);
    }

    @Override // java.io.OutputStream
    public void write(byte[] bArr, int i, int i2) throws IOException {
        this.filterChain.write(bArr, i, i2);
        this.check.update(bArr, i, i2);
        this.uncompressedSize += i2;
        validate();
    }

    @Override // java.io.OutputStream, java.io.Flushable
    public void flush() throws IOException {
        this.filterChain.flush();
        validate();
    }

    @Override // org.tukaani.xz.FinishableOutputStream
    public void finish() throws IOException {
        this.filterChain.finish();
        validate();
        long size = this.outCounted.getSize();
        while (true) {
            long j = size;
            if ((j & 3) == 0) {
                this.out.write(this.check.finish());
                return;
            } else {
                this.out.write(0);
                size = j + 1;
            }
        }
    }

    private void validate() throws IOException {
        long size = this.outCounted.getSize();
        if (size < 0 || size > this.compressedSizeLimit || this.uncompressedSize < 0) {
            throw new XZIOException("XZ Stream has grown too big");
        }
    }

    public long getUnpaddedSize() {
        return this.headerSize + this.outCounted.getSize() + this.check.getSize();
    }

    public long getUncompressedSize() {
        return this.uncompressedSize;
    }
}
