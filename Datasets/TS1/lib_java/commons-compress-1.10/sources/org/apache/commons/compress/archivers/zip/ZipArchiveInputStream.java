package org.apache.commons.compress.archivers.zip;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PushbackInputStream;
import java.nio.ByteBuffer;
import java.util.zip.CRC32;
import java.util.zip.DataFormatException;
import java.util.zip.Inflater;
import java.util.zip.ZipException;
import org.apache.commons.compress.archivers.ArchiveEntry;
import org.apache.commons.compress.archivers.ArchiveInputStream;
import org.apache.commons.compress.archivers.zip.UnsupportedZipFeatureException;
import org.apache.commons.compress.utils.IOUtils;

/*  JADX ERROR: NullPointerException in pass: ClassModifier
    java.lang.NullPointerException: Cannot invoke "java.util.List.forEach(java.util.function.Consumer)" because "blocks" is null
    	at jadx.core.utils.BlockUtils.collectAllInsns(BlockUtils.java:1029)
    	at jadx.core.dex.visitors.ClassModifier.removeBridgeMethod(ClassModifier.java:245)
    	at jadx.core.dex.visitors.ClassModifier.removeSyntheticMethods(ClassModifier.java:160)
    	at java.base/java.util.ArrayList.forEach(ArrayList.java:1511)
    	at jadx.core.dex.visitors.ClassModifier.visit(ClassModifier.java:65)
    	at jadx.core.dex.visitors.ClassModifier.visit(ClassModifier.java:58)
    */
/* loaded from: commons-compress-1.10.jar:org/apache/commons/compress/archivers/zip/ZipArchiveInputStream.class */
public class ZipArchiveInputStream extends ArchiveInputStream {
    private final ZipEncoding zipEncoding;
    final String encoding;
    private final boolean useUnicodeExtraFields;
    private final InputStream in;
    private final Inflater inf;
    private final ByteBuffer buf;
    private CurrentEntry current;
    private boolean closed;
    private boolean hitCentralDirectory;
    private ByteArrayInputStream lastStoredEntry;
    private boolean allowStoredEntriesWithDataDescriptor;
    private static final int LFH_LEN = 30;
    private static final int CFH_LEN = 46;
    private static final long TWO_EXP_32 = 4294967296L;
    private final byte[] LFH_BUF;
    private final byte[] SKIP_BUF;
    private final byte[] SHORT_BUF;
    private final byte[] WORD_BUF;
    private final byte[] TWO_DWORD_BUF;
    private int entriesRead;
    private static final byte[] LFH = ZipLong.LFH_SIG.getBytes();
    private static final byte[] CFH = ZipLong.CFH_SIG.getBytes();
    private static final byte[] DD = ZipLong.DD_SIG.getBytes();

    public ZipArchiveInputStream(InputStream inputStream) {
        this(inputStream, "UTF8");
    }

    public ZipArchiveInputStream(InputStream inputStream, String encoding) {
        this(inputStream, encoding, true);
    }

    public ZipArchiveInputStream(InputStream inputStream, String encoding, boolean useUnicodeExtraFields) {
        this(inputStream, encoding, useUnicodeExtraFields, false);
    }

    public ZipArchiveInputStream(InputStream inputStream, String encoding, boolean useUnicodeExtraFields, boolean allowStoredEntriesWithDataDescriptor) {
        this.inf = new Inflater(true);
        this.buf = ByteBuffer.allocate(512);
        this.current = null;
        this.closed = false;
        this.hitCentralDirectory = false;
        this.lastStoredEntry = null;
        this.allowStoredEntriesWithDataDescriptor = false;
        this.LFH_BUF = new byte[LFH_LEN];
        this.SKIP_BUF = new byte[1024];
        this.SHORT_BUF = new byte[2];
        this.WORD_BUF = new byte[4];
        this.TWO_DWORD_BUF = new byte[16];
        this.entriesRead = 0;
        this.encoding = encoding;
        this.zipEncoding = ZipEncodingHelper.getZipEncoding(encoding);
        this.useUnicodeExtraFields = useUnicodeExtraFields;
        this.in = new PushbackInputStream(inputStream, this.buf.capacity());
        this.allowStoredEntriesWithDataDescriptor = allowStoredEntriesWithDataDescriptor;
        this.buf.limit(0);
    }

    public ZipArchiveEntry getNextZipEntry() throws IOException {
        int off;
        boolean firstEntry = true;
        if (this.closed || this.hitCentralDirectory) {
            return null;
        }
        if (this.current != null) {
            closeEntry();
            firstEntry = false;
        }
        try {
            if (firstEntry) {
                readFirstLocalFileHeader(this.LFH_BUF);
            } else {
                readFully(this.LFH_BUF);
            }
            ZipLong sig = new ZipLong(this.LFH_BUF);
            if (sig.equals(ZipLong.CFH_SIG) || sig.equals(ZipLong.AED_SIG)) {
                this.hitCentralDirectory = true;
                skipRemainderOfArchive();
            }
            if (!sig.equals(ZipLong.LFH_SIG)) {
                return null;
            }
            this.current = new CurrentEntry();
            int versionMadeBy = ZipShort.getValue(this.LFH_BUF, 4);
            int off2 = 4 + 2;
            this.current.entry.setPlatform((versionMadeBy >> 8) & 15);
            GeneralPurposeBit gpFlag = GeneralPurposeBit.parse(this.LFH_BUF, off2);
            boolean hasUTF8Flag = gpFlag.usesUTF8ForNames();
            ZipEncoding entryEncoding = hasUTF8Flag ? ZipEncodingHelper.UTF8_ZIP_ENCODING : this.zipEncoding;
            this.current.hasDataDescriptor = gpFlag.usesDataDescriptor();
            this.current.entry.setGeneralPurposeBit(gpFlag);
            int off3 = off2 + 2;
            this.current.entry.setMethod(ZipShort.getValue(this.LFH_BUF, off3));
            int off4 = off3 + 2;
            long time = ZipUtil.dosToJavaTime(ZipLong.getValue(this.LFH_BUF, off4));
            this.current.entry.setTime(time);
            int off5 = off4 + 4;
            ZipLong size = null;
            ZipLong cSize = null;
            if (this.current.hasDataDescriptor) {
                off = off5 + 12;
            } else {
                this.current.entry.setCrc(ZipLong.getValue(this.LFH_BUF, off5));
                int off6 = off5 + 4;
                cSize = new ZipLong(this.LFH_BUF, off6);
                int off7 = off6 + 4;
                size = new ZipLong(this.LFH_BUF, off7);
                off = off7 + 4;
            }
            int fileNameLen = ZipShort.getValue(this.LFH_BUF, off);
            int off8 = off + 2;
            int extraLen = ZipShort.getValue(this.LFH_BUF, off8);
            int i = off8 + 2;
            byte[] fileName = new byte[fileNameLen];
            readFully(fileName);
            this.current.entry.setName(entryEncoding.decode(fileName), fileName);
            byte[] extraData = new byte[extraLen];
            readFully(extraData);
            this.current.entry.setExtra(extraData);
            if (!hasUTF8Flag && this.useUnicodeExtraFields) {
                ZipUtil.setNameAndCommentFromExtraFields(this.current.entry, fileName, null);
            }
            processZip64Extra(size, cSize);
            if (this.current.entry.getCompressedSize() != -1) {
                if (this.current.entry.getMethod() == ZipMethod.UNSHRINKING.getCode()) {
                    this.current.in = new UnshrinkingInputStream(new BoundedInputStream(this.in, this.current.entry.getCompressedSize()));
                } else if (this.current.entry.getMethod() == ZipMethod.IMPLODING.getCode()) {
                    this.current.in = new ExplodingInputStream(this.current.entry.getGeneralPurposeBit().getSlidingDictionarySize(), this.current.entry.getGeneralPurposeBit().getNumberOfShannonFanoTrees(), new BoundedInputStream(this.in, this.current.entry.getCompressedSize()));
                }
            }
            this.entriesRead++;
            return this.current.entry;
        } catch (EOFException e) {
            return null;
        }
    }

    private void readFirstLocalFileHeader(byte[] lfh) throws IOException {
        readFully(lfh);
        ZipLong sig = new ZipLong(lfh);
        if (sig.equals(ZipLong.DD_SIG)) {
            throw new UnsupportedZipFeatureException(UnsupportedZipFeatureException.Feature.SPLITTING);
        }
        if (sig.equals(ZipLong.SINGLE_SEGMENT_SPLIT_MARKER)) {
            byte[] missedLfhBytes = new byte[4];
            readFully(missedLfhBytes);
            System.arraycopy(lfh, 4, lfh, 0, 26);
            System.arraycopy(missedLfhBytes, 0, lfh, 26, 4);
        }
    }

    private void processZip64Extra(ZipLong size, ZipLong cSize) {
        Zip64ExtendedInformationExtraField z64 = (Zip64ExtendedInformationExtraField) this.current.entry.getExtraField(Zip64ExtendedInformationExtraField.HEADER_ID);
        this.current.usesZip64 = z64 != null;
        if (!this.current.hasDataDescriptor) {
            if (z64 == null || (!cSize.equals(ZipLong.ZIP64_MAGIC) && !size.equals(ZipLong.ZIP64_MAGIC))) {
                this.current.entry.setCompressedSize(cSize.getValue());
                this.current.entry.setSize(size.getValue());
            } else {
                this.current.entry.setCompressedSize(z64.getCompressedSize().getLongValue());
                this.current.entry.setSize(z64.getSize().getLongValue());
            }
        }
    }

    @Override // org.apache.commons.compress.archivers.ArchiveInputStream
    public ArchiveEntry getNextEntry() throws IOException {
        return getNextZipEntry();
    }

    @Override // org.apache.commons.compress.archivers.ArchiveInputStream
    public boolean canReadEntryData(ArchiveEntry ae) {
        if (ae instanceof ZipArchiveEntry) {
            ZipArchiveEntry ze = (ZipArchiveEntry) ae;
            return ZipUtil.canHandleEntryData(ze) && supportsDataDescriptorFor(ze);
        }
        return false;
    }

    @Override // java.io.InputStream
    public int read(byte[] buffer, int offset, int length) throws IOException {
        int read;
        if (this.closed) {
            throw new IOException("The stream is closed");
        }
        if (this.current == null) {
            return -1;
        }
        if (offset > buffer.length || length < 0 || offset < 0 || buffer.length - offset < length) {
            throw new ArrayIndexOutOfBoundsException();
        }
        ZipUtil.checkRequestedFeatures(this.current.entry);
        if (!supportsDataDescriptorFor(this.current.entry)) {
            throw new UnsupportedZipFeatureException(UnsupportedZipFeatureException.Feature.DATA_DESCRIPTOR, this.current.entry);
        }
        if (this.current.entry.getMethod() == 0) {
            read = readStored(buffer, offset, length);
        } else if (this.current.entry.getMethod() == 8) {
            read = readDeflated(buffer, offset, length);
        } else {
            if (this.current.entry.getMethod() != ZipMethod.UNSHRINKING.getCode() && this.current.entry.getMethod() != ZipMethod.IMPLODING.getCode()) {
                throw new UnsupportedZipFeatureException(ZipMethod.getMethodByCode(this.current.entry.getMethod()), this.current.entry);
            }
            read = this.current.in.read(buffer, offset, length);
        }
        if (read >= 0) {
            this.current.crc.update(buffer, offset, read);
        }
        return read;
    }

    /* JADX WARN: Failed to check method for inline after forced processorg.apache.commons.compress.archivers.zip.ZipArchiveInputStream.CurrentEntry.access$614(org.apache.commons.compress.archivers.zip.ZipArchiveInputStream$CurrentEntry, long):long */
    /* JADX WARN: Failed to check method for inline after forced processorg.apache.commons.compress.archivers.zip.ZipArchiveInputStream.CurrentEntry.access$714(org.apache.commons.compress.archivers.zip.ZipArchiveInputStream$CurrentEntry, long):long */
    private int readStored(byte[] buffer, int offset, int length) throws IOException {
        if (this.current.hasDataDescriptor) {
            if (this.lastStoredEntry == null) {
                readStoredEntry();
            }
            return this.lastStoredEntry.read(buffer, offset, length);
        }
        long csize = this.current.entry.getSize();
        if (this.current.bytesRead >= csize) {
            return -1;
        }
        if (this.buf.position() >= this.buf.limit()) {
            this.buf.position(0);
            int l = this.in.read(this.buf.array());
            if (l == -1) {
                return -1;
            }
            this.buf.limit(l);
            count(l);
            CurrentEntry.access$714(this.current, l);
        }
        int toRead = Math.min(this.buf.remaining(), length);
        if (csize - this.current.bytesRead < toRead) {
            toRead = (int) (csize - this.current.bytesRead);
        }
        this.buf.get(buffer, offset, toRead);
        CurrentEntry.access$614(this.current, toRead);
        return toRead;
    }

    private int readDeflated(byte[] buffer, int offset, int length) throws IOException {
        int read = readFromInflater(buffer, offset, length);
        if (read <= 0) {
            if (this.inf.finished()) {
                return -1;
            }
            if (this.inf.needsDictionary()) {
                throw new ZipException("This archive needs a preset dictionary which is not supported by Commons Compress.");
            }
            if (read == -1) {
                throw new IOException("Truncated ZIP file");
            }
        }
        return read;
    }

    /* JADX WARN: Failed to check method for inline after forced processorg.apache.commons.compress.archivers.zip.ZipArchiveInputStream.CurrentEntry.access$714(org.apache.commons.compress.archivers.zip.ZipArchiveInputStream$CurrentEntry, long):long */
    private int readFromInflater(byte[] buffer, int offset, int length) throws IOException {
        int read = 0;
        while (true) {
            if (this.inf.needsInput()) {
                int l = fill();
                if (l > 0) {
                    CurrentEntry.access$714(this.current, this.buf.limit());
                    read = this.inf.inflate(buffer, offset, length);
                    if (read != 0) {
                        break;
                    }
                    break;
                    break;
                }
                if (l == -1) {
                    return -1;
                }
            } else {
                try {
                    read = this.inf.inflate(buffer, offset, length);
                    if (read != 0 || !this.inf.needsInput()) {
                        break;
                    }
                } catch (DataFormatException e) {
                    throw ((IOException) new ZipException(e.getMessage()).initCause(e));
                }
            }
        }
        return read;
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (!this.closed) {
            this.closed = true;
            this.in.close();
            this.inf.end();
        }
    }

    @Override // java.io.InputStream
    public long skip(long value) throws IOException {
        if (value >= 0) {
            long j = 0;
            while (true) {
                long skipped = j;
                if (skipped < value) {
                    long rem = value - skipped;
                    int x = read(this.SKIP_BUF, 0, (int) (((long) this.SKIP_BUF.length) > rem ? rem : this.SKIP_BUF.length));
                    if (x == -1) {
                        return skipped;
                    }
                    j = skipped + x;
                } else {
                    return skipped;
                }
            }
        } else {
            throw new IllegalArgumentException();
        }
    }

    public static boolean matches(byte[] signature, int length) {
        if (length < ZipArchiveOutputStream.LFH_SIG.length) {
            return false;
        }
        return checksig(signature, ZipArchiveOutputStream.LFH_SIG) || checksig(signature, ZipArchiveOutputStream.EOCD_SIG) || checksig(signature, ZipArchiveOutputStream.DD_SIG) || checksig(signature, ZipLong.SINGLE_SEGMENT_SPLIT_MARKER.getBytes());
    }

    private static boolean checksig(byte[] signature, byte[] expected) {
        for (int i = 0; i < expected.length; i++) {
            if (signature[i] != expected[i]) {
                return false;
            }
        }
        return true;
    }

    private void closeEntry() throws IOException {
        if (this.closed) {
            throw new IOException("The stream is closed");
        }
        if (this.current == null) {
            return;
        }
        if (this.current.bytesReadFromStream <= this.current.entry.getCompressedSize() && !this.current.hasDataDescriptor) {
            drainCurrentEntryData();
        } else {
            skip(Long.MAX_VALUE);
            long inB = this.current.entry.getMethod() == 8 ? getBytesInflated() : this.current.bytesRead;
            int diff = (int) (this.current.bytesReadFromStream - inB);
            if (diff > 0) {
                pushback(this.buf.array(), this.buf.limit() - diff, diff);
            }
        }
        if (this.lastStoredEntry == null && this.current.hasDataDescriptor) {
            readDataDescriptor();
        }
        this.inf.reset();
        this.buf.clear().flip();
        this.current = null;
        this.lastStoredEntry = null;
    }

    private void drainCurrentEntryData() throws IOException {
        long compressedSize = this.current.entry.getCompressedSize();
        long j = this.current.bytesReadFromStream;
        while (true) {
            long remaining = compressedSize - j;
            if (remaining > 0) {
                long n = this.in.read(this.buf.array(), 0, (int) Math.min(this.buf.capacity(), remaining));
                if (n < 0) {
                    throw new EOFException("Truncated ZIP entry: " + this.current.entry.getName());
                }
                count(n);
                compressedSize = remaining;
                j = n;
            } else {
                return;
            }
        }
    }

    private long getBytesInflated() {
        long inB = this.inf.getBytesRead();
        if (this.current.bytesReadFromStream >= TWO_EXP_32) {
            while (inB + TWO_EXP_32 <= this.current.bytesReadFromStream) {
                inB += TWO_EXP_32;
            }
        }
        return inB;
    }

    private int fill() throws IOException {
        if (this.closed) {
            throw new IOException("The stream is closed");
        }
        int length = this.in.read(this.buf.array());
        if (length > 0) {
            this.buf.limit(length);
            count(this.buf.limit());
            this.inf.setInput(this.buf.array(), 0, this.buf.limit());
        }
        return length;
    }

    private void readFully(byte[] b) throws IOException {
        int count = IOUtils.readFully(this.in, b);
        count(count);
        if (count < b.length) {
            throw new EOFException();
        }
    }

    private void readDataDescriptor() throws IOException {
        readFully(this.WORD_BUF);
        ZipLong val = new ZipLong(this.WORD_BUF);
        if (ZipLong.DD_SIG.equals(val)) {
            readFully(this.WORD_BUF);
            val = new ZipLong(this.WORD_BUF);
        }
        this.current.entry.setCrc(val.getValue());
        readFully(this.TWO_DWORD_BUF);
        ZipLong potentialSig = new ZipLong(this.TWO_DWORD_BUF, 8);
        if (potentialSig.equals(ZipLong.CFH_SIG) || potentialSig.equals(ZipLong.LFH_SIG)) {
            pushback(this.TWO_DWORD_BUF, 8, 8);
            this.current.entry.setCompressedSize(ZipLong.getValue(this.TWO_DWORD_BUF));
            this.current.entry.setSize(ZipLong.getValue(this.TWO_DWORD_BUF, 4));
        } else {
            this.current.entry.setCompressedSize(ZipEightByteInteger.getLongValue(this.TWO_DWORD_BUF));
            this.current.entry.setSize(ZipEightByteInteger.getLongValue(this.TWO_DWORD_BUF, 8));
        }
    }

    private boolean supportsDataDescriptorFor(ZipArchiveEntry entry) {
        return !entry.getGeneralPurposeBit().usesDataDescriptor() || (this.allowStoredEntriesWithDataDescriptor && entry.getMethod() == 0) || entry.getMethod() == 8;
    }

    private void readStoredEntry() throws IOException {
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        int off = 0;
        boolean done = false;
        int ddLen = this.current.usesZip64 ? 20 : 12;
        while (!done) {
            int r = this.in.read(this.buf.array(), off, 512 - off);
            if (r <= 0) {
                throw new IOException("Truncated ZIP file");
            }
            if (r + off < 4) {
                off += r;
            } else {
                done = bufferContainsSignature(bos, off, r, ddLen);
                if (!done) {
                    off = cacheBytesRead(bos, off, r, ddLen);
                }
            }
        }
        byte[] b = bos.toByteArray();
        this.lastStoredEntry = new ByteArrayInputStream(b);
    }

    static {
    }

    private boolean bufferContainsSignature(ByteArrayOutputStream bos, int offset, int lastRead, int expectedDDLen) throws IOException {
        boolean done = false;
        int readTooMuch = 0;
        for (int i = 0; !done && i < lastRead - 4; i++) {
            if (this.buf.array()[i] == LFH[0] && this.buf.array()[i + 1] == LFH[1]) {
                if ((this.buf.array()[i + 2] == LFH[2] && this.buf.array()[i + 3] == LFH[3]) || (this.buf.array()[i] == CFH[2] && this.buf.array()[i + 3] == CFH[3])) {
                    readTooMuch = ((offset + lastRead) - i) - expectedDDLen;
                    done = true;
                } else if (this.buf.array()[i + 2] == DD[2] && this.buf.array()[i + 3] == DD[3]) {
                    readTooMuch = (offset + lastRead) - i;
                    done = true;
                }
                if (done) {
                    pushback(this.buf.array(), (offset + lastRead) - readTooMuch, readTooMuch);
                    bos.write(this.buf.array(), 0, i);
                    readDataDescriptor();
                }
            }
        }
        return done;
    }

    private int cacheBytesRead(ByteArrayOutputStream bos, int offset, int lastRead, int expecteDDLen) {
        int offset2;
        int cacheable = ((offset + lastRead) - expecteDDLen) - 3;
        if (cacheable > 0) {
            bos.write(this.buf.array(), 0, cacheable);
            System.arraycopy(this.buf.array(), cacheable, this.buf.array(), 0, expecteDDLen + 3);
            offset2 = expecteDDLen + 3;
        } else {
            offset2 = offset + lastRead;
        }
        return offset2;
    }

    private void pushback(byte[] buf, int offset, int length) throws IOException {
        ((PushbackInputStream) this.in).unread(buf, offset, length);
        pushedBackBytes(length);
    }

    private void skipRemainderOfArchive() throws IOException {
        realSkip((this.entriesRead * CFH_LEN) - LFH_LEN);
        findEocdRecord();
        realSkip(16L);
        readFully(this.SHORT_BUF);
        realSkip(ZipShort.getValue(this.SHORT_BUF));
    }

    private void findEocdRecord() throws IOException {
        int currentByte = -1;
        boolean skipReadCall = false;
        while (true) {
            if (!skipReadCall) {
                int readOneByte = readOneByte();
                currentByte = readOneByte;
                if (readOneByte <= -1) {
                    return;
                }
            }
            skipReadCall = false;
            if (isFirstByteOfEocdSig(currentByte)) {
                currentByte = readOneByte();
                if (currentByte != ZipArchiveOutputStream.EOCD_SIG[1]) {
                    if (currentByte != -1) {
                        skipReadCall = isFirstByteOfEocdSig(currentByte);
                    } else {
                        return;
                    }
                } else {
                    currentByte = readOneByte();
                    if (currentByte != ZipArchiveOutputStream.EOCD_SIG[2]) {
                        if (currentByte != -1) {
                            skipReadCall = isFirstByteOfEocdSig(currentByte);
                        } else {
                            return;
                        }
                    } else {
                        currentByte = readOneByte();
                        if (currentByte != -1 && currentByte != ZipArchiveOutputStream.EOCD_SIG[3]) {
                            skipReadCall = isFirstByteOfEocdSig(currentByte);
                        } else {
                            return;
                        }
                    }
                }
            }
        }
    }

    private void realSkip(long value) throws IOException {
        if (value >= 0) {
            long j = 0;
            while (true) {
                long skipped = j;
                if (skipped < value) {
                    long rem = value - skipped;
                    int x = this.in.read(this.SKIP_BUF, 0, (int) (((long) this.SKIP_BUF.length) > rem ? rem : this.SKIP_BUF.length));
                    if (x == -1) {
                        return;
                    }
                    count(x);
                    j = skipped + x;
                } else {
                    return;
                }
            }
        } else {
            throw new IllegalArgumentException();
        }
    }

    private int readOneByte() throws IOException {
        int b = this.in.read();
        if (b != -1) {
            count(1);
        }
        return b;
    }

    private boolean isFirstByteOfEocdSig(int b) {
        return b == ZipArchiveOutputStream.EOCD_SIG[0];
    }

    /* loaded from: commons-compress-1.10.jar:org/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry.class */
    private static final class CurrentEntry {
        private final ZipArchiveEntry entry;
        private boolean hasDataDescriptor;
        private boolean usesZip64;
        private long bytesRead;
        private long bytesReadFromStream;
        private final CRC32 crc;
        private InputStream in;

        /*  JADX ERROR: Failed to decode insn: 0x0007: MOVE_MULTI
            java.lang.ArrayIndexOutOfBoundsException: arraycopy: source index -1 out of bounds for object array[6]
            	at java.base/java.lang.System.arraycopy(Native Method)
            	at jadx.plugins.input.java.data.code.StackState.insert(StackState.java:52)
            	at jadx.plugins.input.java.data.code.CodeDecodeState.insert(CodeDecodeState.java:137)
            	at jadx.plugins.input.java.data.code.JavaInsnsRegister.dup2x1(JavaInsnsRegister.java:313)
            	at jadx.plugins.input.java.data.code.JavaInsnData.decode(JavaInsnData.java:46)
            	at jadx.core.dex.instructions.InsnDecoder.lambda$process$0(InsnDecoder.java:50)
            	at jadx.plugins.input.java.data.code.JavaCodeReader.visitInstructions(JavaCodeReader.java:85)
            	at jadx.core.dex.instructions.InsnDecoder.process(InsnDecoder.java:46)
            	at jadx.core.dex.nodes.MethodNode.load(MethodNode.java:157)
            	at jadx.core.dex.nodes.ClassNode.load(ClassNode.java:458)
            	at jadx.core.dex.nodes.ClassNode.load(ClassNode.java:464)
            	at jadx.core.ProcessClass.process(ProcessClass.java:69)
            	at jadx.core.ProcessClass.generateCode(ProcessClass.java:117)
            	at jadx.core.dex.nodes.ClassNode.generateClassCode(ClassNode.java:401)
            	at jadx.core.dex.nodes.ClassNode.decompile(ClassNode.java:389)
            	at jadx.core.dex.nodes.ClassNode.getCode(ClassNode.java:339)
            */
        static /* synthetic */ long access$714(org.apache.commons.compress.archivers.zip.ZipArchiveInputStream.CurrentEntry r6, long r7) {
            /*
                r0 = r6
                r1 = r0
                long r1 = r1.bytesReadFromStream
                r2 = r7
                long r1 = r1 + r2
                // decode failed: arraycopy: source index -1 out of bounds for object array[6]
                r0.bytesReadFromStream = r1
                return r-1
            */
            throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.compress.archivers.zip.ZipArchiveInputStream.CurrentEntry.access$714(org.apache.commons.compress.archivers.zip.ZipArchiveInputStream$CurrentEntry, long):long");
        }

        /*  JADX ERROR: Failed to decode insn: 0x0007: MOVE_MULTI
            java.lang.ArrayIndexOutOfBoundsException: arraycopy: source index -1 out of bounds for object array[6]
            	at java.base/java.lang.System.arraycopy(Native Method)
            	at jadx.plugins.input.java.data.code.StackState.insert(StackState.java:52)
            	at jadx.plugins.input.java.data.code.CodeDecodeState.insert(CodeDecodeState.java:137)
            	at jadx.plugins.input.java.data.code.JavaInsnsRegister.dup2x1(JavaInsnsRegister.java:313)
            	at jadx.plugins.input.java.data.code.JavaInsnData.decode(JavaInsnData.java:46)
            	at jadx.core.dex.instructions.InsnDecoder.lambda$process$0(InsnDecoder.java:50)
            	at jadx.plugins.input.java.data.code.JavaCodeReader.visitInstructions(JavaCodeReader.java:85)
            	at jadx.core.dex.instructions.InsnDecoder.process(InsnDecoder.java:46)
            	at jadx.core.dex.nodes.MethodNode.load(MethodNode.java:157)
            	at jadx.core.dex.nodes.ClassNode.load(ClassNode.java:458)
            	at jadx.core.dex.nodes.ClassNode.load(ClassNode.java:464)
            	at jadx.core.ProcessClass.process(ProcessClass.java:69)
            	at jadx.core.ProcessClass.generateCode(ProcessClass.java:117)
            	at jadx.core.dex.nodes.ClassNode.generateClassCode(ClassNode.java:401)
            	at jadx.core.dex.nodes.ClassNode.decompile(ClassNode.java:389)
            	at jadx.core.dex.nodes.ClassNode.getCode(ClassNode.java:339)
            */
        static /* synthetic */ long access$614(org.apache.commons.compress.archivers.zip.ZipArchiveInputStream.CurrentEntry r6, long r7) {
            /*
                r0 = r6
                r1 = r0
                long r1 = r1.bytesRead
                r2 = r7
                long r1 = r1 + r2
                // decode failed: arraycopy: source index -1 out of bounds for object array[6]
                r0.bytesRead = r1
                return r-1
            */
            throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.compress.archivers.zip.ZipArchiveInputStream.CurrentEntry.access$614(org.apache.commons.compress.archivers.zip.ZipArchiveInputStream$CurrentEntry, long):long");
        }

        /*  JADX ERROR: Failed to decode insn: 0x0005: MOVE_MULTI
            java.lang.ArrayIndexOutOfBoundsException: arraycopy: source index -1 out of bounds for object array[8]
            	at java.base/java.lang.System.arraycopy(Native Method)
            	at jadx.plugins.input.java.data.code.StackState.insert(StackState.java:52)
            	at jadx.plugins.input.java.data.code.CodeDecodeState.insert(CodeDecodeState.java:137)
            	at jadx.plugins.input.java.data.code.JavaInsnsRegister.dup2x1(JavaInsnsRegister.java:313)
            	at jadx.plugins.input.java.data.code.JavaInsnData.decode(JavaInsnData.java:46)
            	at jadx.core.dex.instructions.InsnDecoder.lambda$process$0(InsnDecoder.java:50)
            	at jadx.plugins.input.java.data.code.JavaCodeReader.visitInstructions(JavaCodeReader.java:85)
            	at jadx.core.dex.instructions.InsnDecoder.process(InsnDecoder.java:46)
            	at jadx.core.dex.nodes.MethodNode.load(MethodNode.java:157)
            	at jadx.core.dex.nodes.ClassNode.load(ClassNode.java:458)
            	at jadx.core.dex.nodes.ClassNode.load(ClassNode.java:464)
            	at jadx.core.ProcessClass.process(ProcessClass.java:69)
            	at jadx.core.ProcessClass.generateCode(ProcessClass.java:117)
            	at jadx.core.dex.nodes.ClassNode.generateClassCode(ClassNode.java:401)
            	at jadx.core.dex.nodes.ClassNode.decompile(ClassNode.java:389)
            	at jadx.core.dex.nodes.ClassNode.getCode(ClassNode.java:339)
            */
        static /* synthetic */ long access$708(org.apache.commons.compress.archivers.zip.ZipArchiveInputStream.CurrentEntry r8) {
            /*
                r0 = r8
                r1 = r0
                long r1 = r1.bytesReadFromStream
                // decode failed: arraycopy: source index -1 out of bounds for object array[8]
                r2 = 1
                long r1 = r1 + r2
                r0.bytesReadFromStream = r1
                return r-1
            */
            throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.compress.archivers.zip.ZipArchiveInputStream.CurrentEntry.access$708(org.apache.commons.compress.archivers.zip.ZipArchiveInputStream$CurrentEntry):long");
        }

        private CurrentEntry() {
            this.entry = new ZipArchiveEntry();
            this.crc = new CRC32();
        }
    }

    /* loaded from: commons-compress-1.10.jar:org/apache/commons/compress/archivers/zip/ZipArchiveInputStream$BoundedInputStream.class */
    private class BoundedInputStream extends InputStream {
        private final InputStream in;
        private final long max;
        private long pos = 0;

        public BoundedInputStream(InputStream in, long size) {
            this.max = size;
            this.in = in;
        }

        /* JADX WARN: Failed to check method for inline after forced processorg.apache.commons.compress.archivers.zip.ZipArchiveInputStream.CurrentEntry.access$708(org.apache.commons.compress.archivers.zip.ZipArchiveInputStream$CurrentEntry):long */
        @Override // java.io.InputStream
        public int read() throws IOException {
            if (this.max >= 0 && this.pos >= this.max) {
                return -1;
            }
            int result = this.in.read();
            this.pos++;
            ZipArchiveInputStream.this.count(1);
            CurrentEntry.access$708(ZipArchiveInputStream.this.current);
            return result;
        }

        @Override // java.io.InputStream
        public int read(byte[] b) throws IOException {
            return read(b, 0, b.length);
        }

        /* JADX WARN: Failed to check method for inline after forced processorg.apache.commons.compress.archivers.zip.ZipArchiveInputStream.CurrentEntry.access$714(org.apache.commons.compress.archivers.zip.ZipArchiveInputStream$CurrentEntry, long):long */
        @Override // java.io.InputStream
        public int read(byte[] b, int off, int len) throws IOException {
            if (this.max >= 0 && this.pos >= this.max) {
                return -1;
            }
            long maxRead = this.max >= 0 ? Math.min(len, this.max - this.pos) : len;
            int bytesRead = this.in.read(b, off, (int) maxRead);
            if (bytesRead == -1) {
                return -1;
            }
            this.pos += bytesRead;
            ZipArchiveInputStream.this.count(bytesRead);
            CurrentEntry.access$714(ZipArchiveInputStream.this.current, bytesRead);
            return bytesRead;
        }

        @Override // java.io.InputStream
        public long skip(long n) throws IOException {
            long toSkip = this.max >= 0 ? Math.min(n, this.max - this.pos) : n;
            long skippedBytes = this.in.skip(toSkip);
            this.pos += skippedBytes;
            return skippedBytes;
        }

        @Override // java.io.InputStream
        public int available() throws IOException {
            if (this.max >= 0 && this.pos >= this.max) {
                return 0;
            }
            return this.in.available();
        }
    }
}
