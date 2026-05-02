package org.apache.commons.compress.archivers.zip;

import java.io.BufferedInputStream;
import java.io.Closeable;
import java.io.EOFException;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.RandomAccessFile;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.zip.Inflater;
import java.util.zip.InflaterInputStream;
import java.util.zip.ZipException;
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
/* loaded from: commons-compress-1.10.jar:org/apache/commons/compress/archivers/zip/ZipFile.class */
public class ZipFile implements Closeable {
    private static final int HASH_SIZE = 509;
    static final int NIBLET_MASK = 15;
    static final int BYTE_SHIFT = 8;
    private static final int POS_0 = 0;
    private static final int POS_1 = 1;
    private static final int POS_2 = 2;
    private static final int POS_3 = 3;
    private final List<ZipArchiveEntry> entries;
    private final Map<String, LinkedList<ZipArchiveEntry>> nameMap;
    private final String encoding;
    private final ZipEncoding zipEncoding;
    private final String archiveName;
    private final RandomAccessFile archive;
    private final boolean useUnicodeExtraFields;
    private volatile boolean closed;
    private final byte[] DWORD_BUF;
    private final byte[] WORD_BUF;
    private final byte[] CFH_BUF;
    private final byte[] SHORT_BUF;
    private static final int CFH_LEN = 42;
    private static final long CFH_SIG = ZipLong.getValue(ZipArchiveOutputStream.CFH_SIG);
    static final int MIN_EOCD_SIZE = 22;
    private static final int MAX_EOCD_SIZE = 65557;
    private static final int CFD_LOCATOR_OFFSET = 16;
    private static final int ZIP64_EOCDL_LENGTH = 20;
    private static final int ZIP64_EOCDL_LOCATOR_OFFSET = 8;
    private static final int ZIP64_EOCD_CFD_LOCATOR_OFFSET = 48;
    private static final long LFH_OFFSET_FOR_FILENAME_LENGTH = 26;
    private final Comparator<ZipArchiveEntry> OFFSET_COMPARATOR;

    static /* synthetic */ RandomAccessFile access$600(ZipFile x0) {
        return x0.archive;
    }

    /* loaded from: commons-compress-1.10.jar:org/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry.class */
    private static final class OffsetEntry {
        private long headerOffset;
        private long dataOffset;

        /*  JADX ERROR: Failed to decode insn: 0x0002: MOVE_MULTI
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
        static /* synthetic */ long access$202(org.apache.commons.compress.archivers.zip.ZipFile.OffsetEntry r6, long r7) {
            /*
                r0 = r6
                r1 = r7
                // decode failed: arraycopy: source index -1 out of bounds for object array[6]
                r0.headerOffset = r1
                return r-1
            */
            throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.compress.archivers.zip.ZipFile.OffsetEntry.access$202(org.apache.commons.compress.archivers.zip.ZipFile$OffsetEntry, long):long");
        }

        /*  JADX ERROR: Failed to decode insn: 0x0002: MOVE_MULTI
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
        static /* synthetic */ long access$002(org.apache.commons.compress.archivers.zip.ZipFile.OffsetEntry r6, long r7) {
            /*
                r0 = r6
                r1 = r7
                // decode failed: arraycopy: source index -1 out of bounds for object array[6]
                r0.dataOffset = r1
                return r-1
            */
            throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.compress.archivers.zip.ZipFile.OffsetEntry.access$002(org.apache.commons.compress.archivers.zip.ZipFile$OffsetEntry, long):long");
        }

        private OffsetEntry() {
            this.headerOffset = -1L;
            this.dataOffset = -1L;
        }
    }

    public ZipFile(File f) throws IOException {
        this(f, "UTF8");
    }

    public ZipFile(String name) throws IOException {
        this(new File(name), "UTF8");
    }

    public ZipFile(String name, String encoding) throws IOException {
        this(new File(name), encoding, true);
    }

    public ZipFile(File f, String encoding) throws IOException {
        this(f, encoding, true);
    }

    public ZipFile(File f, String encoding, boolean useUnicodeExtraFields) throws IOException {
        this.entries = new LinkedList();
        this.nameMap = new HashMap(HASH_SIZE);
        this.closed = true;
        this.DWORD_BUF = new byte[8];
        this.WORD_BUF = new byte[4];
        this.CFH_BUF = new byte[CFH_LEN];
        this.SHORT_BUF = new byte[2];
        this.OFFSET_COMPARATOR = new Comparator<ZipArchiveEntry>() { // from class: org.apache.commons.compress.archivers.zip.ZipFile.2
            @Override // java.util.Comparator
            public int compare(ZipArchiveEntry e1, ZipArchiveEntry e2) {
                if (e1 == e2) {
                    return 0;
                }
                Entry ent1 = e1 instanceof Entry ? (Entry) e1 : null;
                Entry ent2 = e2 instanceof Entry ? (Entry) e2 : null;
                if (ent1 == null) {
                    return 1;
                }
                if (ent2 != null) {
                    long val = ent1.getOffsetEntry().headerOffset - ent2.getOffsetEntry().headerOffset;
                    if (val == 0) {
                        return 0;
                    }
                    return val < 0 ? -1 : 1;
                }
                return -1;
            }
        };
        this.archiveName = f.getAbsolutePath();
        this.encoding = encoding;
        this.zipEncoding = ZipEncodingHelper.getZipEncoding(encoding);
        this.useUnicodeExtraFields = useUnicodeExtraFields;
        this.archive = new RandomAccessFile(f, "r");
        boolean success = false;
        try {
            Map<ZipArchiveEntry, NameAndComment> entriesWithoutUTF8Flag = populateFromCentralDirectory();
            resolveLocalFileHeaderData(entriesWithoutUTF8Flag);
            success = true;
            this.closed = 1 == 0;
            if (1 == 0) {
                IOUtils.closeQuietly(this.archive);
            }
        } catch (Throwable th) {
            this.closed = !success;
            if (!success) {
                IOUtils.closeQuietly(this.archive);
            }
            throw th;
        }
    }

    public String getEncoding() {
        return this.encoding;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.closed = true;
        this.archive.close();
    }

    public static void closeQuietly(ZipFile zipfile) {
        IOUtils.closeQuietly(zipfile);
    }

    public Enumeration<ZipArchiveEntry> getEntries() {
        return Collections.enumeration(this.entries);
    }

    public Enumeration<ZipArchiveEntry> getEntriesInPhysicalOrder() {
        ZipArchiveEntry[] allEntries = (ZipArchiveEntry[]) this.entries.toArray(new ZipArchiveEntry[this.entries.size()]);
        Arrays.sort(allEntries, this.OFFSET_COMPARATOR);
        return Collections.enumeration(Arrays.asList(allEntries));
    }

    public ZipArchiveEntry getEntry(String name) {
        LinkedList<ZipArchiveEntry> entriesOfThatName = this.nameMap.get(name);
        if (entriesOfThatName != null) {
            return entriesOfThatName.getFirst();
        }
        return null;
    }

    public Iterable<ZipArchiveEntry> getEntries(String name) {
        List<ZipArchiveEntry> entriesOfThatName = this.nameMap.get(name);
        return entriesOfThatName != null ? entriesOfThatName : Collections.emptyList();
    }

    public Iterable<ZipArchiveEntry> getEntriesInPhysicalOrder(String name) {
        ZipArchiveEntry[] entriesOfThatName = new ZipArchiveEntry[0];
        if (this.nameMap.containsKey(name)) {
            entriesOfThatName = (ZipArchiveEntry[]) this.nameMap.get(name).toArray(entriesOfThatName);
            Arrays.sort(entriesOfThatName, this.OFFSET_COMPARATOR);
        }
        return Arrays.asList(entriesOfThatName);
    }

    public boolean canReadEntryData(ZipArchiveEntry ze) {
        return ZipUtil.canHandleEntryData(ze);
    }

    private InputStream getRawInputStream(ZipArchiveEntry ze) {
        if (!(ze instanceof Entry)) {
            return null;
        }
        OffsetEntry offsetEntry = ((Entry) ze).getOffsetEntry();
        long start = offsetEntry.dataOffset;
        return new BoundedInputStream(start, ze.getCompressedSize());
    }

    public void copyRawEntries(ZipArchiveOutputStream target, ZipArchiveEntryPredicate predicate) throws IOException {
        Enumeration<ZipArchiveEntry> src = getEntriesInPhysicalOrder();
        while (src.hasMoreElements()) {
            ZipArchiveEntry entry = src.nextElement();
            if (predicate.test(entry)) {
                target.addRawArchiveEntry(entry, getRawInputStream(entry));
            }
        }
    }

    public InputStream getInputStream(ZipArchiveEntry ze) throws IOException, ZipException {
        if (!(ze instanceof Entry)) {
            return null;
        }
        OffsetEntry offsetEntry = ((Entry) ze).getOffsetEntry();
        ZipUtil.checkRequestedFeatures(ze);
        long start = offsetEntry.dataOffset;
        BoundedInputStream bis = new BoundedInputStream(start, ze.getCompressedSize());
        switch (ZipMethod.getMethodByCode(ze.getMethod())) {
            case STORED:
                return bis;
            case UNSHRINKING:
                return new UnshrinkingInputStream(bis);
            case IMPLODING:
                return new ExplodingInputStream(ze.getGeneralPurposeBit().getSlidingDictionarySize(), ze.getGeneralPurposeBit().getNumberOfShannonFanoTrees(), new BufferedInputStream(bis));
            case DEFLATED:
                bis.addDummy();
                final Inflater inflater = new Inflater(true);
                return new InflaterInputStream(bis, inflater) { // from class: org.apache.commons.compress.archivers.zip.ZipFile.1
                    @Override // java.util.zip.InflaterInputStream, java.io.FilterInputStream, java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
                    public void close() throws IOException {
                        super.close();
                        inflater.end();
                    }
                };
            default:
                throw new ZipException("Found unsupported compression method " + ze.getMethod());
        }
    }

    public String getUnixSymlink(ZipArchiveEntry entry) throws IOException {
        if (entry != null && entry.isUnixSymlink()) {
            InputStream in = null;
            try {
                in = getInputStream(entry);
                byte[] symlinkBytes = IOUtils.toByteArray(in);
                String decode = this.zipEncoding.decode(symlinkBytes);
                if (in != null) {
                    in.close();
                }
                return decode;
            } catch (Throwable th) {
                if (in != null) {
                    in.close();
                }
                throw th;
            }
        }
        return null;
    }

    protected void finalize() throws Throwable {
        try {
            if (!this.closed) {
                System.err.println("Cleaning up unclosed ZipFile for archive " + this.archiveName);
                close();
            }
        } finally {
            super.finalize();
        }
    }

    static {
    }

    private Map<ZipArchiveEntry, NameAndComment> populateFromCentralDirectory() throws IOException {
        HashMap<ZipArchiveEntry, NameAndComment> noUTF8Flag = new HashMap<>();
        positionAtCentralDirectory();
        this.archive.readFully(this.WORD_BUF);
        long sig = ZipLong.getValue(this.WORD_BUF);
        if (sig != CFH_SIG && startsWithLocalFileHeader()) {
            throw new IOException("central directory is empty, can't expand corrupt archive.");
        }
        while (sig == CFH_SIG) {
            readCentralDirectoryEntry(noUTF8Flag);
            this.archive.readFully(this.WORD_BUF);
            sig = ZipLong.getValue(this.WORD_BUF);
        }
        return noUTF8Flag;
    }

    /* JADX WARN: Failed to check method for inline after forced processorg.apache.commons.compress.archivers.zip.ZipFile.OffsetEntry.access$202(org.apache.commons.compress.archivers.zip.ZipFile$OffsetEntry, long):long */
    private void readCentralDirectoryEntry(Map<ZipArchiveEntry, NameAndComment> noUTF8Flag) throws IOException {
        this.archive.readFully(this.CFH_BUF);
        OffsetEntry offset = new OffsetEntry();
        Entry ze = new Entry(offset);
        int versionMadeBy = ZipShort.getValue(this.CFH_BUF, 0);
        ze.setPlatform((versionMadeBy >> 8) & 15);
        int off = 0 + 2 + 2;
        GeneralPurposeBit gpFlag = GeneralPurposeBit.parse(this.CFH_BUF, off);
        boolean hasUTF8Flag = gpFlag.usesUTF8ForNames();
        ZipEncoding entryEncoding = hasUTF8Flag ? ZipEncodingHelper.UTF8_ZIP_ENCODING : this.zipEncoding;
        ze.setGeneralPurposeBit(gpFlag);
        int off2 = off + 2;
        ze.setMethod(ZipShort.getValue(this.CFH_BUF, off2));
        int off3 = off2 + 2;
        long time = ZipUtil.dosToJavaTime(ZipLong.getValue(this.CFH_BUF, off3));
        ze.setTime(time);
        int off4 = off3 + 4;
        ze.setCrc(ZipLong.getValue(this.CFH_BUF, off4));
        int off5 = off4 + 4;
        ze.setCompressedSize(ZipLong.getValue(this.CFH_BUF, off5));
        int off6 = off5 + 4;
        ze.setSize(ZipLong.getValue(this.CFH_BUF, off6));
        int off7 = off6 + 4;
        int fileNameLen = ZipShort.getValue(this.CFH_BUF, off7);
        int off8 = off7 + 2;
        int extraLen = ZipShort.getValue(this.CFH_BUF, off8);
        int off9 = off8 + 2;
        int commentLen = ZipShort.getValue(this.CFH_BUF, off9);
        int off10 = off9 + 2;
        int diskStart = ZipShort.getValue(this.CFH_BUF, off10);
        int off11 = off10 + 2;
        ze.setInternalAttributes(ZipShort.getValue(this.CFH_BUF, off11));
        int off12 = off11 + 2;
        ze.setExternalAttributes(ZipLong.getValue(this.CFH_BUF, off12));
        byte[] fileName = new byte[fileNameLen];
        this.archive.readFully(fileName);
        ze.setName(entryEncoding.decode(fileName), fileName);
        OffsetEntry.access$202(offset, ZipLong.getValue(this.CFH_BUF, off12 + 4));
        this.entries.add(ze);
        byte[] cdExtraData = new byte[extraLen];
        this.archive.readFully(cdExtraData);
        ze.setCentralDirectoryExtra(cdExtraData);
        setSizesAndOffsetFromZip64Extra(ze, offset, diskStart);
        byte[] comment = new byte[commentLen];
        this.archive.readFully(comment);
        ze.setComment(entryEncoding.decode(comment));
        if (!hasUTF8Flag && this.useUnicodeExtraFields) {
            noUTF8Flag.put(ze, new NameAndComment(fileName, comment));
        }
    }

    /* JADX WARN: Failed to check method for inline after forced processorg.apache.commons.compress.archivers.zip.ZipFile.OffsetEntry.access$202(org.apache.commons.compress.archivers.zip.ZipFile$OffsetEntry, long):long */
    private void setSizesAndOffsetFromZip64Extra(ZipArchiveEntry ze, OffsetEntry offset, int diskStart) throws IOException {
        Zip64ExtendedInformationExtraField z64 = (Zip64ExtendedInformationExtraField) ze.getExtraField(Zip64ExtendedInformationExtraField.HEADER_ID);
        if (z64 != null) {
            boolean hasUncompressedSize = ze.getSize() == 4294967295L;
            boolean hasCompressedSize = ze.getCompressedSize() == 4294967295L;
            boolean hasRelativeHeaderOffset = offset.headerOffset == 4294967295L;
            z64.reparseCentralDirectoryData(hasUncompressedSize, hasCompressedSize, hasRelativeHeaderOffset, diskStart == 65535);
            if (hasUncompressedSize) {
                ze.setSize(z64.getSize().getLongValue());
            } else if (hasCompressedSize) {
                z64.setSize(new ZipEightByteInteger(ze.getSize()));
            }
            if (hasCompressedSize) {
                ze.setCompressedSize(z64.getCompressedSize().getLongValue());
            } else if (hasUncompressedSize) {
                z64.setCompressedSize(new ZipEightByteInteger(ze.getCompressedSize()));
            }
            if (hasRelativeHeaderOffset) {
                OffsetEntry.access$202(offset, z64.getRelativeHeaderOffset().getLongValue());
            }
        }
    }

    private void positionAtCentralDirectory() throws IOException {
        positionAtEndOfCentralDirectoryRecord();
        boolean found = false;
        boolean searchedForZip64EOCD = this.archive.getFilePointer() > 20;
        if (searchedForZip64EOCD) {
            this.archive.seek(this.archive.getFilePointer() - 20);
            this.archive.readFully(this.WORD_BUF);
            found = Arrays.equals(ZipArchiveOutputStream.ZIP64_EOCD_LOC_SIG, this.WORD_BUF);
        }
        if (!found) {
            if (searchedForZip64EOCD) {
                skipBytes(16);
            }
            positionAtCentralDirectory32();
            return;
        }
        positionAtCentralDirectory64();
    }

    private void positionAtCentralDirectory64() throws IOException {
        skipBytes(4);
        this.archive.readFully(this.DWORD_BUF);
        this.archive.seek(ZipEightByteInteger.getLongValue(this.DWORD_BUF));
        this.archive.readFully(this.WORD_BUF);
        if (!Arrays.equals(this.WORD_BUF, ZipArchiveOutputStream.ZIP64_EOCD_SIG)) {
            throw new ZipException("archive's ZIP64 end of central directory locator is corrupt.");
        }
        skipBytes(44);
        this.archive.readFully(this.DWORD_BUF);
        this.archive.seek(ZipEightByteInteger.getLongValue(this.DWORD_BUF));
    }

    private void positionAtCentralDirectory32() throws IOException {
        skipBytes(16);
        this.archive.readFully(this.WORD_BUF);
        this.archive.seek(ZipLong.getValue(this.WORD_BUF));
    }

    private void positionAtEndOfCentralDirectoryRecord() throws IOException {
        boolean found = tryToLocateSignature(22L, 65557L, ZipArchiveOutputStream.EOCD_SIG);
        if (!found) {
            throw new ZipException("archive is not a ZIP archive");
        }
    }

    private boolean tryToLocateSignature(long minDistanceFromEnd, long maxDistanceFromEnd, byte[] sig) throws IOException {
        boolean found = false;
        long off = this.archive.length() - minDistanceFromEnd;
        long stopSearching = Math.max(0L, this.archive.length() - maxDistanceFromEnd);
        if (off >= 0) {
            while (true) {
                if (off < stopSearching) {
                    break;
                }
                this.archive.seek(off);
                int curr = this.archive.read();
                if (curr == -1) {
                    break;
                }
                if (curr != sig[0] || this.archive.read() != sig[1] || this.archive.read() != sig[2] || this.archive.read() != sig[3]) {
                    off--;
                } else {
                    found = true;
                    break;
                }
            }
        }
        if (found) {
            this.archive.seek(off);
        }
        return found;
    }

    private void skipBytes(int count) throws IOException {
        int i = 0;
        while (true) {
            int totalSkipped = i;
            if (totalSkipped < count) {
                int skippedNow = this.archive.skipBytes(count - totalSkipped);
                if (skippedNow <= 0) {
                    throw new EOFException();
                }
                i = totalSkipped + skippedNow;
            } else {
                return;
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:13:0x0093, code lost:
    
        r0 = new byte[r0];
        r6.archive.readFully(r0);
        r0.setExtra(r0);
        org.apache.commons.compress.archivers.zip.ZipFile.OffsetEntry.access$002(r0, ((((r0 + org.apache.commons.compress.archivers.zip.ZipFile.LFH_OFFSET_FOR_FILENAME_LENGTH) + 2) + 2) + r0) + r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:14:0x00cd, code lost:
    
        if (r7.containsKey(r0) == false) goto L16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x00d0, code lost:
    
        r0 = r7.get(r0);
        org.apache.commons.compress.archivers.zip.ZipUtil.setNameAndCommentFromExtraFields(r0, r0.name, r0.comment);
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x00ec, code lost:
    
        r0 = r0.getName();
        r19 = r6.nameMap.get(r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x0105, code lost:
    
        if (r19 != null) goto L24;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x0108, code lost:
    
        r19 = new java.util.LinkedList<>();
        r6.nameMap.put(r0, r19);
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x011f, code lost:
    
        r19.addLast(r0);
     */
    /* JADX WARN: Failed to check method for inline after forced processorg.apache.commons.compress.archivers.zip.ZipFile.OffsetEntry.access$002(org.apache.commons.compress.archivers.zip.ZipFile$OffsetEntry, long):long */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void resolveLocalFileHeaderData(java.util.Map<org.apache.commons.compress.archivers.zip.ZipArchiveEntry, org.apache.commons.compress.archivers.zip.ZipFile.NameAndComment> r7) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 298
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.compress.archivers.zip.ZipFile.resolveLocalFileHeaderData(java.util.Map):void");
    }

    private boolean startsWithLocalFileHeader() throws IOException {
        this.archive.seek(0L);
        this.archive.readFully(this.WORD_BUF);
        return Arrays.equals(this.WORD_BUF, ZipArchiveOutputStream.LFH_SIG);
    }

    /* loaded from: commons-compress-1.10.jar:org/apache/commons/compress/archivers/zip/ZipFile$BoundedInputStream.class */
    private class BoundedInputStream extends InputStream {
        private long remaining;
        private long loc;
        private boolean addDummyByte = false;

        /*  JADX ERROR: Failed to decode insn: 0x0005: MOVE_MULTI
            java.lang.ArrayIndexOutOfBoundsException: arraycopy: source index -1 out of bounds for object array[9]
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
        /*  JADX ERROR: Failed to decode insn: 0x0036: MOVE_MULTI
            java.lang.ArrayIndexOutOfBoundsException: arraycopy: source index -1 out of bounds for object array[9]
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
        @Override // java.io.InputStream
        public int read() throws java.io.IOException {
            /*
                r9 = this;
                r0 = r9
                r1 = r0
                long r1 = r1.remaining
                // decode failed: arraycopy: source index -1 out of bounds for object array[9]
                r2 = 1
                long r1 = r1 - r2
                r0.remaining = r1
                r0 = 0
                int r-1 = (r-1 > r0 ? 1 : (r-1 == r0 ? 0 : -1))
                if (r-1 > 0) goto L20
                r-1 = r9
                boolean r-1 = r-1.addDummyByte
                if (r-1 == 0) goto L1e
                r-1 = r9
                r0 = 0
                r-1.addDummyByte = r0
                r-1 = 0
                return r-1
                r-1 = -1
                return r-1
                r-1 = r9
                org.apache.commons.compress.archivers.zip.ZipFile r-1 = org.apache.commons.compress.archivers.zip.ZipFile.this
                org.apache.commons.compress.archivers.zip.ZipFile.access$600(r-1)
                r0 = r-1
                r10 = r0
                monitor-enter(r-1)
                r-1 = r9
                org.apache.commons.compress.archivers.zip.ZipFile r-1 = org.apache.commons.compress.archivers.zip.ZipFile.this
                org.apache.commons.compress.archivers.zip.ZipFile.access$600(r-1)
                r0 = r9
                r1 = r0
                long r1 = r1.loc
                // decode failed: arraycopy: source index -1 out of bounds for object array[9]
                r2 = 1
                long r1 = r1 + r2
                r0.loc = r1
                r-2.seek(r-1)
                r-2 = r9
                org.apache.commons.compress.archivers.zip.ZipFile r-2 = org.apache.commons.compress.archivers.zip.ZipFile.this
                java.io.RandomAccessFile r-2 = org.apache.commons.compress.archivers.zip.ZipFile.access$600(r-2)
                int r-2 = r-2.read()
                r-1 = r10
                monitor-exit(r-1)
                return r-2
                r11 = move-exception
                r0 = r10
                monitor-exit(r0)
                r0 = r11
                throw r0
            */
            throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.compress.archivers.zip.ZipFile.BoundedInputStream.read():int");
        }

        BoundedInputStream(long start, long remaining) {
            this.remaining = remaining;
            this.loc = start;
        }

        @Override // java.io.InputStream
        public int read(byte[] b, int off, int len) throws IOException {
            int ret;
            if (this.remaining <= 0) {
                if (this.addDummyByte) {
                    this.addDummyByte = false;
                    b[off] = 0;
                    return 1;
                }
                return -1;
            }
            if (len > 0) {
                if (len > this.remaining) {
                    len = (int) this.remaining;
                }
                synchronized (ZipFile.this.archive) {
                    ZipFile.this.archive.seek(this.loc);
                    ret = ZipFile.this.archive.read(b, off, len);
                }
                if (ret > 0) {
                    this.loc += ret;
                    this.remaining -= ret;
                }
                return ret;
            }
            return 0;
        }

        void addDummy() {
            this.addDummyByte = true;
        }
    }

    /* loaded from: commons-compress-1.10.jar:org/apache/commons/compress/archivers/zip/ZipFile$NameAndComment.class */
    private static final class NameAndComment {
        private final byte[] name;
        private final byte[] comment;

        private NameAndComment(byte[] name, byte[] comment) {
            this.name = name;
            this.comment = comment;
        }
    }

    /* loaded from: commons-compress-1.10.jar:org/apache/commons/compress/archivers/zip/ZipFile$Entry.class */
    private static class Entry extends ZipArchiveEntry {
        private final OffsetEntry offsetEntry;

        Entry(OffsetEntry offset) {
            this.offsetEntry = offset;
        }

        OffsetEntry getOffsetEntry() {
            return this.offsetEntry;
        }

        @Override // org.apache.commons.compress.archivers.zip.ZipArchiveEntry, java.util.zip.ZipEntry
        public int hashCode() {
            return (3 * super.hashCode()) + ((int) (this.offsetEntry.headerOffset % 2147483647L));
        }

        @Override // org.apache.commons.compress.archivers.zip.ZipArchiveEntry
        public boolean equals(Object other) {
            if (super.equals(other)) {
                Entry otherEntry = (Entry) other;
                return this.offsetEntry.headerOffset == otherEntry.offsetEntry.headerOffset && this.offsetEntry.dataOffset == otherEntry.offsetEntry.dataOffset;
            }
            return false;
        }
    }
}
