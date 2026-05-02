package android.support.multidex;

import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.zip.CRC32;
import java.util.zip.ZipException;

/* loaded from: com.android.support.multidex.1.0.1.jar:android/support/multidex/ZipUtil.class */
final class ZipUtil {
    private static final int ENDHDR = 22;
    private static final int ENDSIG = 101010256;
    private static final int BUFFER_SIZE = 16384;

    /* loaded from: com.android.support.multidex.1.0.1.jar:android/support/multidex/ZipUtil$CentralDirectory.class */
    static class CentralDirectory {
        long offset;
        long size;

        CentralDirectory() {
        }
    }

    ZipUtil() {
    }

    static long getZipCrc(File apk) throws IOException {
        RandomAccessFile raf = new RandomAccessFile(apk, "r");
        try {
            CentralDirectory dir = findCentralDirectory(raf);
            long computeCrcOfCentralDir = computeCrcOfCentralDir(raf, dir);
            raf.close();
            return computeCrcOfCentralDir;
        } catch (Throwable th) {
            raf.close();
            throw th;
        }
    }

    static CentralDirectory findCentralDirectory(RandomAccessFile raf) throws IOException, ZipException {
        long scanOffset = raf.length() - 22;
        if (scanOffset < 0) {
            throw new ZipException("File too short to be a zip file: " + raf.length());
        }
        long stopOffset = scanOffset - 65536;
        if (stopOffset < 0) {
            stopOffset = 0;
        }
        int endSig = Integer.reverseBytes(ENDSIG);
        do {
            raf.seek(scanOffset);
            if (raf.readInt() != endSig) {
                scanOffset--;
            } else {
                raf.skipBytes(2);
                raf.skipBytes(2);
                raf.skipBytes(2);
                raf.skipBytes(2);
                CentralDirectory dir = new CentralDirectory();
                dir.size = Integer.reverseBytes(raf.readInt()) & 4294967295L;
                dir.offset = Integer.reverseBytes(raf.readInt()) & 4294967295L;
                return dir;
            }
        } while (scanOffset >= stopOffset);
        throw new ZipException("End Of Central Directory signature not found");
    }

    static long computeCrcOfCentralDir(RandomAccessFile raf, CentralDirectory dir) throws IOException {
        CRC32 crc = new CRC32();
        long stillToRead = dir.size;
        raf.seek(dir.offset);
        int length = (int) Math.min(16384L, stillToRead);
        byte[] buffer = new byte[BUFFER_SIZE];
        int read = raf.read(buffer, 0, length);
        while (true) {
            int length2 = read;
            if (length2 == -1) {
                break;
            }
            crc.update(buffer, 0, length2);
            stillToRead -= length2;
            if (stillToRead == 0) {
                break;
            }
            int length3 = (int) Math.min(16384L, stillToRead);
            read = raf.read(buffer, 0, length3);
        }
        return crc.getValue();
    }
}
