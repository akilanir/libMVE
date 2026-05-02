package org.apache.commons.compress.archivers.dump;

import java.io.IOException;
import org.apache.commons.compress.archivers.zip.ZipEncoding;

/* loaded from: commons-compress-1.10.jar:org/apache/commons/compress/archivers/dump/DumpArchiveUtil.class */
class DumpArchiveUtil {
    private DumpArchiveUtil() {
    }

    public static int calculateChecksum(byte[] buffer) {
        int calc = 0;
        for (int i = 0; i < 256; i++) {
            calc += convert32(buffer, 4 * i);
        }
        return DumpArchiveConstants.CHECKSUM - (calc - convert32(buffer, 28));
    }

    public static final boolean verify(byte[] buffer) {
        int magic = convert32(buffer, 24);
        if (magic != 60012) {
            return false;
        }
        int checksum = convert32(buffer, 28);
        if (checksum != calculateChecksum(buffer)) {
            return false;
        }
        return true;
    }

    public static final int getIno(byte[] buffer) {
        return convert32(buffer, 20);
    }

    public static final long convert64(byte[] buffer, int offset) {
        long i = 0 + (buffer[offset + 7] << 56);
        return i + ((buffer[offset + 6] << 48) & 71776119061217280L) + ((buffer[offset + 5] << 40) & 280375465082880L) + ((buffer[offset + 4] << 32) & 1095216660480L) + ((buffer[offset + 3] << 24) & 4278190080L) + ((buffer[offset + 2] << 16) & 16711680) + ((buffer[offset + 1] << 8) & 65280) + (buffer[offset] & 255);
    }

    public static final int convert32(byte[] buffer, int offset) {
        int i = buffer[offset + 3] << 24;
        return i + ((buffer[offset + 2] << 16) & 16711680) + ((buffer[offset + 1] << 8) & 65280) + (buffer[offset] & 255);
    }

    public static final int convert16(byte[] buffer, int offset) {
        int i = 0 + ((buffer[offset + 1] << 8) & 65280);
        return i + (buffer[offset] & 255);
    }

    static String decode(ZipEncoding encoding, byte[] b, int offset, int len) throws IOException {
        byte[] copy = new byte[len];
        System.arraycopy(b, offset, copy, 0, len);
        return encoding.decode(copy);
    }
}
