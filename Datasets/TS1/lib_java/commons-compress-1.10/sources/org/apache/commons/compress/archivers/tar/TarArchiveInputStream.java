package org.apache.commons.compress.archivers.tar;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import org.apache.commons.compress.archivers.ArchiveEntry;
import org.apache.commons.compress.archivers.ArchiveInputStream;
import org.apache.commons.compress.archivers.zip.ZipEncoding;
import org.apache.commons.compress.archivers.zip.ZipEncodingHelper;
import org.apache.commons.compress.utils.ArchiveUtils;
import org.apache.commons.compress.utils.CharsetNames;
import org.apache.commons.compress.utils.IOUtils;

/* loaded from: commons-compress-1.10.jar:org/apache/commons/compress/archivers/tar/TarArchiveInputStream.class */
public class TarArchiveInputStream extends ArchiveInputStream {
    private static final int SMALL_BUFFER_SIZE = 256;
    private final byte[] SMALL_BUF;
    private final int recordSize;
    private final int blockSize;
    private boolean hasHitEOF;
    private long entrySize;
    private long entryOffset;
    private final InputStream is;
    private TarArchiveEntry currEntry;
    private final ZipEncoding zipEncoding;
    final String encoding;

    public TarArchiveInputStream(InputStream is) {
        this(is, TarConstants.DEFAULT_BLKSIZE, 512);
    }

    public TarArchiveInputStream(InputStream is, String encoding) {
        this(is, TarConstants.DEFAULT_BLKSIZE, 512, encoding);
    }

    public TarArchiveInputStream(InputStream is, int blockSize) {
        this(is, blockSize, 512);
    }

    public TarArchiveInputStream(InputStream is, int blockSize, String encoding) {
        this(is, blockSize, 512, encoding);
    }

    public TarArchiveInputStream(InputStream is, int blockSize, int recordSize) {
        this(is, blockSize, recordSize, null);
    }

    public TarArchiveInputStream(InputStream is, int blockSize, int recordSize, String encoding) {
        this.SMALL_BUF = new byte[256];
        this.is = is;
        this.hasHitEOF = false;
        this.encoding = encoding;
        this.zipEncoding = ZipEncodingHelper.getZipEncoding(encoding);
        this.recordSize = recordSize;
        this.blockSize = blockSize;
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.is.close();
    }

    public int getRecordSize() {
        return this.recordSize;
    }

    @Override // java.io.InputStream
    public int available() throws IOException {
        if (this.entrySize - this.entryOffset > 2147483647L) {
            return Integer.MAX_VALUE;
        }
        return (int) (this.entrySize - this.entryOffset);
    }

    @Override // java.io.InputStream
    public long skip(long n) throws IOException {
        if (n <= 0) {
            return 0L;
        }
        long available = this.entrySize - this.entryOffset;
        long skipped = this.is.skip(Math.min(n, available));
        count(skipped);
        this.entryOffset += skipped;
        return skipped;
    }

    @Override // java.io.InputStream
    public boolean markSupported() {
        return false;
    }

    @Override // java.io.InputStream
    public void mark(int markLimit) {
    }

    @Override // java.io.InputStream
    public synchronized void reset() {
    }

    public TarArchiveEntry getNextTarEntry() throws IOException {
        if (this.hasHitEOF) {
            return null;
        }
        if (this.currEntry != null) {
            IOUtils.skip(this, Long.MAX_VALUE);
            skipRecordPadding();
        }
        byte[] headerBuf = getRecord();
        if (headerBuf == null) {
            this.currEntry = null;
            return null;
        }
        try {
            this.currEntry = new TarArchiveEntry(headerBuf, this.zipEncoding);
            this.entryOffset = 0L;
            this.entrySize = this.currEntry.getSize();
            if (this.currEntry.isGNULongLinkEntry()) {
                byte[] longLinkData = getLongNameData();
                if (longLinkData == null) {
                    return null;
                }
                this.currEntry.setLinkName(this.zipEncoding.decode(longLinkData));
            }
            if (this.currEntry.isGNULongNameEntry()) {
                byte[] longNameData = getLongNameData();
                if (longNameData == null) {
                    return null;
                }
                this.currEntry.setName(this.zipEncoding.decode(longNameData));
            }
            if (this.currEntry.isPaxHeader()) {
                paxHeaders();
            }
            if (this.currEntry.isGNUSparse()) {
                readGNUSparse();
            }
            this.entrySize = this.currEntry.getSize();
            return this.currEntry;
        } catch (IllegalArgumentException e) {
            IOException ioe = new IOException("Error detected parsing the header");
            ioe.initCause(e);
            throw ioe;
        }
    }

    private void skipRecordPadding() throws IOException {
        if (this.entrySize > 0 && this.entrySize % this.recordSize != 0) {
            long numRecords = (this.entrySize / this.recordSize) + 1;
            long padding = (numRecords * this.recordSize) - this.entrySize;
            long skipped = IOUtils.skip(this.is, padding);
            count(skipped);
        }
    }

    protected byte[] getLongNameData() throws IOException {
        ByteArrayOutputStream longName = new ByteArrayOutputStream();
        while (true) {
            int length = read(this.SMALL_BUF);
            if (length < 0) {
                break;
            }
            longName.write(this.SMALL_BUF, 0, length);
        }
        getNextEntry();
        if (this.currEntry == null) {
            return null;
        }
        byte[] longNameData = longName.toByteArray();
        int length2 = longNameData.length;
        while (length2 > 0 && longNameData[length2 - 1] == 0) {
            length2--;
        }
        if (length2 != longNameData.length) {
            byte[] l = new byte[length2];
            System.arraycopy(longNameData, 0, l, 0, length2);
            longNameData = l;
        }
        return longNameData;
    }

    private byte[] getRecord() throws IOException {
        byte[] headerBuf = readRecord();
        this.hasHitEOF = isEOFRecord(headerBuf);
        if (this.hasHitEOF && headerBuf != null) {
            tryToConsumeSecondEOFRecord();
            consumeRemainderOfLastBlock();
            headerBuf = null;
        }
        return headerBuf;
    }

    protected boolean isEOFRecord(byte[] record) {
        return record == null || ArchiveUtils.isArrayZero(record, this.recordSize);
    }

    protected byte[] readRecord() throws IOException {
        byte[] record = new byte[this.recordSize];
        int readNow = IOUtils.readFully(this.is, record);
        count(readNow);
        if (readNow != this.recordSize) {
            return null;
        }
        return record;
    }

    private void paxHeaders() throws IOException {
        Map<String, String> headers = parsePaxHeaders(this);
        getNextEntry();
        applyPaxHeadersToCurrentEntry(headers);
    }

    Map<String, String> parsePaxHeaders(InputStream i) throws IOException {
        int ch;
        Map<String, String> headers = new HashMap<>();
        do {
            int len = 0;
            int read = 0;
            while (true) {
                int read2 = i.read();
                ch = read2;
                if (read2 == -1) {
                    break;
                }
                read++;
                if (ch == 32) {
                    ByteArrayOutputStream coll = new ByteArrayOutputStream();
                    while (true) {
                        int read3 = i.read();
                        ch = read3;
                        if (read3 == -1) {
                            break;
                        }
                        read++;
                        if (ch == 61) {
                            String keyword = coll.toString(CharsetNames.UTF_8);
                            int restLen = len - read;
                            byte[] rest = new byte[restLen];
                            int got = IOUtils.readFully(i, rest);
                            if (got != restLen) {
                                throw new IOException("Failed to read Paxheader. Expected " + restLen + " bytes, read " + got);
                            }
                            String value = new String(rest, 0, restLen - 1, CharsetNames.UTF_8);
                            headers.put(keyword, value);
                        } else {
                            coll.write((byte) ch);
                        }
                    }
                } else {
                    len = (len * 10) + (ch - 48);
                }
            }
        } while (ch != -1);
        return headers;
    }

    private void applyPaxHeadersToCurrentEntry(Map<String, String> headers) {
        for (Map.Entry<String, String> ent : headers.entrySet()) {
            String key = ent.getKey();
            String val = ent.getValue();
            if ("path".equals(key)) {
                this.currEntry.setName(val);
            } else if ("linkpath".equals(key)) {
                this.currEntry.setLinkName(val);
            } else if ("gid".equals(key)) {
                this.currEntry.setGroupId(Long.parseLong(val));
            } else if ("gname".equals(key)) {
                this.currEntry.setGroupName(val);
            } else if ("uid".equals(key)) {
                this.currEntry.setUserId(Long.parseLong(val));
            } else if ("uname".equals(key)) {
                this.currEntry.setUserName(val);
            } else if ("size".equals(key)) {
                this.currEntry.setSize(Long.parseLong(val));
            } else if ("mtime".equals(key)) {
                this.currEntry.setModTime((long) (Double.parseDouble(val) * 1000.0d));
            } else if ("SCHILY.devminor".equals(key)) {
                this.currEntry.setDevMinor(Integer.parseInt(val));
            } else if ("SCHILY.devmajor".equals(key)) {
                this.currEntry.setDevMajor(Integer.parseInt(val));
            }
        }
    }

    private void readGNUSparse() throws IOException {
        TarArchiveSparseEntry entry;
        if (this.currEntry.isExtended()) {
            do {
                byte[] headerBuf = getRecord();
                if (headerBuf == null) {
                    this.currEntry = null;
                    return;
                }
                entry = new TarArchiveSparseEntry(headerBuf);
            } while (entry.isExtended());
        }
    }

    @Override // org.apache.commons.compress.archivers.ArchiveInputStream
    public ArchiveEntry getNextEntry() throws IOException {
        return getNextTarEntry();
    }

    private void tryToConsumeSecondEOFRecord() throws IOException {
        boolean shouldReset = true;
        boolean marked = this.is.markSupported();
        if (marked) {
            this.is.mark(this.recordSize);
        }
        try {
            shouldReset = !isEOFRecord(readRecord());
        } finally {
            if (shouldReset && marked) {
                pushedBackBytes(this.recordSize);
                this.is.reset();
            }
        }
    }

    @Override // java.io.InputStream
    public int read(byte[] buf, int offset, int numToRead) throws IOException {
        if (this.hasHitEOF || this.entryOffset >= this.entrySize) {
            return -1;
        }
        if (this.currEntry == null) {
            throw new IllegalStateException("No current tar entry");
        }
        int numToRead2 = Math.min(numToRead, available());
        int totalRead = this.is.read(buf, offset, numToRead2);
        if (totalRead == -1) {
            if (numToRead2 > 0) {
                throw new IOException("Truncated TAR archive");
            }
            this.hasHitEOF = true;
        } else {
            count(totalRead);
            this.entryOffset += totalRead;
        }
        return totalRead;
    }

    @Override // org.apache.commons.compress.archivers.ArchiveInputStream
    public boolean canReadEntryData(ArchiveEntry ae) {
        if (ae instanceof TarArchiveEntry) {
            TarArchiveEntry te = (TarArchiveEntry) ae;
            return !te.isGNUSparse();
        }
        return false;
    }

    public TarArchiveEntry getCurrentEntry() {
        return this.currEntry;
    }

    protected final void setCurrentEntry(TarArchiveEntry e) {
        this.currEntry = e;
    }

    protected final boolean isAtEOF() {
        return this.hasHitEOF;
    }

    protected final void setAtEOF(boolean b) {
        this.hasHitEOF = b;
    }

    private void consumeRemainderOfLastBlock() throws IOException {
        long bytesReadOfLastBlock = getBytesRead() % this.blockSize;
        if (bytesReadOfLastBlock > 0) {
            long skipped = IOUtils.skip(this.is, this.blockSize - bytesReadOfLastBlock);
            count(skipped);
        }
    }

    public static boolean matches(byte[] signature, int length) {
        if (length < 265) {
            return false;
        }
        if (ArchiveUtils.matchAsciiBuffer("ustar��", signature, TarConstants.MAGIC_OFFSET, 6) && ArchiveUtils.matchAsciiBuffer(TarConstants.VERSION_POSIX, signature, TarConstants.VERSION_OFFSET, 2)) {
            return true;
        }
        if (ArchiveUtils.matchAsciiBuffer(TarConstants.MAGIC_GNU, signature, TarConstants.MAGIC_OFFSET, 6) && (ArchiveUtils.matchAsciiBuffer(TarConstants.VERSION_GNU_SPACE, signature, TarConstants.VERSION_OFFSET, 2) || ArchiveUtils.matchAsciiBuffer(TarConstants.VERSION_GNU_ZERO, signature, TarConstants.VERSION_OFFSET, 2))) {
            return true;
        }
        if (ArchiveUtils.matchAsciiBuffer("ustar��", signature, TarConstants.MAGIC_OFFSET, 6) && ArchiveUtils.matchAsciiBuffer(TarConstants.VERSION_ANT, signature, TarConstants.VERSION_OFFSET, 2)) {
            return true;
        }
        return false;
    }
}
