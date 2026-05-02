package org.tukaani.xz.check;

/* loaded from: xz-1.5.jar:org/tukaani/xz/check/CRC64.class */
public class CRC64 extends Check {
    private static final long poly = -3932672073523589310L;
    private static final long[] crcTable = new long[256];
    private long crc = -1;

    public CRC64() {
        this.size = 8;
        this.name = "CRC64";
    }

    @Override // org.tukaani.xz.check.Check
    public void update(byte[] bArr, int i, int i2) {
        int i3 = i + i2;
        while (i < i3) {
            int i4 = i;
            i++;
            this.crc = crcTable[(bArr[i4] ^ ((int) this.crc)) & 255] ^ (this.crc >>> 8);
        }
    }

    @Override // org.tukaani.xz.check.Check
    public byte[] finish() {
        long j = this.crc ^ (-1);
        this.crc = -1L;
        byte[] bArr = new byte[8];
        for (int i = 0; i < bArr.length; i++) {
            bArr[i] = (byte) (j >> (i * 8));
        }
        return bArr;
    }

    static {
        for (int i = 0; i < crcTable.length; i++) {
            long j = i;
            for (int i2 = 0; i2 < 8; i2++) {
                j = (j & 1) == 1 ? (j >>> 1) ^ poly : j >>> 1;
            }
            crcTable[i] = j;
        }
    }
}
