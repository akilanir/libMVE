package org.tukaani.xz;

import java.io.ByteArrayInputStream;
import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import org.tukaani.xz.check.Check;
import org.tukaani.xz.common.DecoderUtil;
import org.tukaani.xz.common.Util;

/* loaded from: xz-1.5.jar:org/tukaani/xz/BlockInputStream.class */
class BlockInputStream extends InputStream {
    private final DataInputStream inData;
    private final CountingInputStream inCounted;
    private InputStream filterChain;
    private final Check check;
    private long uncompressedSizeInHeader;
    private long compressedSizeInHeader;
    private long compressedSizeLimit;
    private final int headerSize;
    private long uncompressedSize = 0;
    private boolean endReached = false;
    private final byte[] tempBuf = new byte[1];

    /* JADX WARN: Multi-variable type inference failed */
    public BlockInputStream(InputStream inputStream, Check check, int i, long j, long j2) throws IOException, IndexIndicatorException {
        this.uncompressedSizeInHeader = -1L;
        this.compressedSizeInHeader = -1L;
        this.check = check;
        this.inData = new DataInputStream(inputStream);
        byte[] bArr = new byte[Util.BLOCK_HEADER_SIZE_MAX];
        this.inData.readFully(bArr, 0, 1);
        if (bArr[0] == 0) {
            throw new IndexIndicatorException();
        }
        this.headerSize = 4 * ((bArr[0] & 255) + 1);
        this.inData.readFully(bArr, 1, this.headerSize - 1);
        if (!DecoderUtil.isCRC32Valid(bArr, 0, this.headerSize - 4, this.headerSize - 4)) {
            throw new CorruptedInputException("XZ Block Header is corrupt");
        }
        if ((bArr[1] & 60) != 0) {
            throw new UnsupportedOptionsException("Unsupported options in XZ Block Header");
        }
        int i2 = (bArr[1] & 3) + 1;
        long[] jArr = new long[i2];
        byte[] bArr2 = new byte[i2];
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bArr, 2, this.headerSize - 6);
        try {
            this.compressedSizeLimit = (9223372036854775804L - this.headerSize) - check.getSize();
            if ((bArr[1] & 64) != 0) {
                this.compressedSizeInHeader = DecoderUtil.decodeVLI(byteArrayInputStream);
                if (this.compressedSizeInHeader == 0 || this.compressedSizeInHeader > this.compressedSizeLimit) {
                    throw new CorruptedInputException();
                }
                this.compressedSizeLimit = this.compressedSizeInHeader;
            }
            if ((bArr[1] & 128) != 0) {
                this.uncompressedSizeInHeader = DecoderUtil.decodeVLI(byteArrayInputStream);
            }
            for (int i3 = 0; i3 < i2; i3++) {
                jArr[i3] = DecoderUtil.decodeVLI(byteArrayInputStream);
                long decodeVLI = DecoderUtil.decodeVLI(byteArrayInputStream);
                if (decodeVLI > byteArrayInputStream.available()) {
                    throw new CorruptedInputException();
                }
                bArr2[i3] = new byte[(int) decodeVLI];
                byteArrayInputStream.read(bArr2[i3]);
            }
            for (int available = byteArrayInputStream.available(); available > 0; available--) {
                if (byteArrayInputStream.read() != 0) {
                    throw new UnsupportedOptionsException("Unsupported options in XZ Block Header");
                }
            }
            if (j != -1) {
                int size = this.headerSize + check.getSize();
                if (size >= j) {
                    throw new CorruptedInputException("XZ Index does not match a Block Header");
                }
                long j3 = j - size;
                if (j3 > this.compressedSizeLimit || !(this.compressedSizeInHeader == -1 || this.compressedSizeInHeader == j3)) {
                    throw new CorruptedInputException("XZ Index does not match a Block Header");
                }
                if (this.uncompressedSizeInHeader != -1 && this.uncompressedSizeInHeader != j2) {
                    throw new CorruptedInputException("XZ Index does not match a Block Header");
                }
                this.compressedSizeLimit = j3;
                this.compressedSizeInHeader = j3;
                this.uncompressedSizeInHeader = j2;
            }
            FilterDecoder[] filterDecoderArr = new FilterDecoder[jArr.length];
            for (int i4 = 0; i4 < filterDecoderArr.length; i4++) {
                if (jArr[i4] == 33) {
                    filterDecoderArr[i4] = new LZMA2Decoder(bArr2[i4]);
                } else if (jArr[i4] == 3) {
                    filterDecoderArr[i4] = new DeltaDecoder(bArr2[i4]);
                } else {
                    if (!BCJDecoder.isBCJFilterID(jArr[i4])) {
                        throw new UnsupportedOptionsException(new StringBuffer().append("Unknown Filter ID ").append(jArr[i4]).toString());
                    }
                    filterDecoderArr[i4] = new BCJDecoder(jArr[i4], bArr2[i4]);
                }
            }
            RawCoder.validate(filterDecoderArr);
            if (i >= 0) {
                int i5 = 0;
                for (FilterDecoder filterDecoder : filterDecoderArr) {
                    i5 += filterDecoder.getMemoryUsage();
                }
                if (i5 > i) {
                    throw new MemoryLimitException(i5, i);
                }
            }
            this.inCounted = new CountingInputStream(inputStream);
            this.filterChain = this.inCounted;
            for (int length = filterDecoderArr.length - 1; length >= 0; length--) {
                this.filterChain = filterDecoderArr[length].getInputStream(this.filterChain);
            }
        } catch (IOException e) {
            throw new CorruptedInputException("XZ Block Header is corrupt");
        }
    }

    @Override // java.io.InputStream
    public int read() throws IOException {
        if (read(this.tempBuf, 0, 1) == -1) {
            return -1;
        }
        return this.tempBuf[0] & 255;
    }

    @Override // java.io.InputStream
    public int read(byte[] bArr, int i, int i2) throws IOException {
        if (this.endReached) {
            return -1;
        }
        int read = this.filterChain.read(bArr, i, i2);
        if (read > 0) {
            this.check.update(bArr, i, read);
            this.uncompressedSize += read;
            long size = this.inCounted.getSize();
            if (size < 0 || size > this.compressedSizeLimit || this.uncompressedSize < 0 || (this.uncompressedSizeInHeader != -1 && this.uncompressedSize > this.uncompressedSizeInHeader)) {
                throw new CorruptedInputException();
            }
            if (read < i2 || this.uncompressedSize == this.uncompressedSizeInHeader) {
                if (this.filterChain.read() != -1) {
                    throw new CorruptedInputException();
                }
                validate();
                this.endReached = true;
            }
        } else if (read == -1) {
            validate();
            this.endReached = true;
        }
        return read;
    }

    private void validate() throws IOException {
        long size = this.inCounted.getSize();
        if ((this.compressedSizeInHeader != -1 && this.compressedSizeInHeader != size) || (this.uncompressedSizeInHeader != -1 && this.uncompressedSizeInHeader != this.uncompressedSize)) {
            throw new CorruptedInputException();
        }
        do {
            long j = size;
            size = j + 1;
            if ((j & 3) == 0) {
                byte[] bArr = new byte[this.check.getSize()];
                this.inData.readFully(bArr);
                if (!Arrays.equals(this.check.finish(), bArr)) {
                    throw new CorruptedInputException(new StringBuffer().append("Integrity check (").append(this.check.getName()).append(") does not match").toString());
                }
                return;
            }
        } while (this.inData.readUnsignedByte() == 0);
        throw new CorruptedInputException();
    }

    @Override // java.io.InputStream
    public int available() throws IOException {
        return this.filterChain.available();
    }

    public long getUnpaddedSize() {
        return this.headerSize + this.inCounted.getSize() + this.check.getSize();
    }

    public long getUncompressedSize() {
        return this.uncompressedSize;
    }
}
