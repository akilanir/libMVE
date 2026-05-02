package org.apache.commons.compress.archivers.sevenz;

import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.DataOutput;
import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.util.ArrayList;
import java.util.BitSet;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.zip.CRC32;
import org.apache.commons.compress.archivers.ArchiveEntry;
import org.apache.commons.compress.utils.CharsetNames;
import org.apache.commons.compress.utils.CountingOutputStream;

/*  JADX ERROR: NullPointerException in pass: ClassModifier
    java.lang.NullPointerException: Cannot invoke "java.util.List.forEach(java.util.function.Consumer)" because "blocks" is null
    	at jadx.core.utils.BlockUtils.collectAllInsns(BlockUtils.java:1029)
    	at jadx.core.dex.visitors.ClassModifier.removeBridgeMethod(ClassModifier.java:245)
    	at jadx.core.dex.visitors.ClassModifier.removeSyntheticMethods(ClassModifier.java:160)
    	at java.base/java.util.ArrayList.forEach(ArrayList.java:1511)
    	at jadx.core.dex.visitors.ClassModifier.visit(ClassModifier.java:65)
    */
/* loaded from: commons-compress-1.10.jar:org/apache/commons/compress/archivers/sevenz/SevenZOutputFile.class */
public class SevenZOutputFile implements Closeable {
    private final RandomAccessFile file;
    private CountingOutputStream currentOutputStream;
    private CountingOutputStream[] additionalCountingStreams;
    private final List<SevenZArchiveEntry> files = new ArrayList();
    private int numNonEmptyStreams = 0;
    private final CRC32 crc32 = new CRC32();
    private final CRC32 compressedCrc32 = new CRC32();
    private long fileBytesWritten = 0;
    private boolean finished = false;
    private Iterable<? extends SevenZMethodConfiguration> contentMethods = Collections.singletonList(new SevenZMethodConfiguration(SevenZMethod.LZMA2));
    private final Map<SevenZArchiveEntry, long[]> additionalSizes = new HashMap();

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
        	at jadx.core.ProcessClass.process(ProcessClass.java:69)
        	at jadx.core.ProcessClass.generateCode(ProcessClass.java:117)
        	at jadx.core.dex.nodes.ClassNode.generateClassCode(ClassNode.java:401)
        	at jadx.core.dex.nodes.ClassNode.decompile(ClassNode.java:389)
        	at jadx.core.dex.nodes.ClassNode.getCode(ClassNode.java:339)
        */
    static /* synthetic */ long access$408(org.apache.commons.compress.archivers.sevenz.SevenZOutputFile r8) {
        /*
            r0 = r8
            r1 = r0
            long r1 = r1.fileBytesWritten
            // decode failed: arraycopy: source index -1 out of bounds for object array[8]
            r2 = 1
            long r1 = r1 + r2
            r0.fileBytesWritten = r1
            return r-1
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.compress.archivers.sevenz.SevenZOutputFile.access$408(org.apache.commons.compress.archivers.sevenz.SevenZOutputFile):long");
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
        	at jadx.core.ProcessClass.process(ProcessClass.java:69)
        	at jadx.core.ProcessClass.generateCode(ProcessClass.java:117)
        	at jadx.core.dex.nodes.ClassNode.generateClassCode(ClassNode.java:401)
        	at jadx.core.dex.nodes.ClassNode.decompile(ClassNode.java:389)
        	at jadx.core.dex.nodes.ClassNode.getCode(ClassNode.java:339)
        */
    static /* synthetic */ long access$414(org.apache.commons.compress.archivers.sevenz.SevenZOutputFile r6, long r7) {
        /*
            r0 = r6
            r1 = r0
            long r1 = r1.fileBytesWritten
            r2 = r7
            long r1 = r1 + r2
            // decode failed: arraycopy: source index -1 out of bounds for object array[6]
            r0.fileBytesWritten = r1
            return r-1
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.compress.archivers.sevenz.SevenZOutputFile.access$414(org.apache.commons.compress.archivers.sevenz.SevenZOutputFile, long):long");
    }

    public SevenZOutputFile(File filename) throws IOException {
        this.file = new RandomAccessFile(filename, "rw");
        this.file.seek(32L);
    }

    public void setContentCompression(SevenZMethod method) {
        setContentMethods(Collections.singletonList(new SevenZMethodConfiguration(method)));
    }

    public void setContentMethods(Iterable<? extends SevenZMethodConfiguration> methods) {
        this.contentMethods = reverse(methods);
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (!this.finished) {
            finish();
        }
        this.file.close();
    }

    public SevenZArchiveEntry createArchiveEntry(File inputFile, String entryName) throws IOException {
        SevenZArchiveEntry entry = new SevenZArchiveEntry();
        entry.setDirectory(inputFile.isDirectory());
        entry.setName(entryName);
        entry.setLastModifiedDate(new Date(inputFile.lastModified()));
        return entry;
    }

    public void putArchiveEntry(ArchiveEntry archiveEntry) throws IOException {
        SevenZArchiveEntry entry = (SevenZArchiveEntry) archiveEntry;
        this.files.add(entry);
    }

    public void closeArchiveEntry() throws IOException {
        if (this.currentOutputStream != null) {
            this.currentOutputStream.flush();
            this.currentOutputStream.close();
        }
        SevenZArchiveEntry entry = this.files.get(this.files.size() - 1);
        if (this.fileBytesWritten > 0) {
            entry.setHasStream(true);
            this.numNonEmptyStreams++;
            entry.setSize(this.currentOutputStream.getBytesWritten());
            entry.setCompressedSize(this.fileBytesWritten);
            entry.setCrcValue(this.crc32.getValue());
            entry.setCompressedCrcValue(this.compressedCrc32.getValue());
            entry.setHasCrc(true);
            if (this.additionalCountingStreams != null) {
                long[] sizes = new long[this.additionalCountingStreams.length];
                for (int i = 0; i < this.additionalCountingStreams.length; i++) {
                    sizes[i] = this.additionalCountingStreams[i].getBytesWritten();
                }
                this.additionalSizes.put(entry, sizes);
            }
        } else {
            entry.setHasStream(false);
            entry.setSize(0L);
            entry.setCompressedSize(0L);
            entry.setHasCrc(false);
        }
        this.currentOutputStream = null;
        this.additionalCountingStreams = null;
        this.crc32.reset();
        this.compressedCrc32.reset();
        this.fileBytesWritten = 0L;
    }

    public void write(int b) throws IOException {
        getCurrentOutputStream().write(b);
    }

    public void write(byte[] b) throws IOException {
        write(b, 0, b.length);
    }

    public void write(byte[] b, int off, int len) throws IOException {
        if (len > 0) {
            getCurrentOutputStream().write(b, off, len);
        }
    }

    public void finish() throws IOException {
        if (this.finished) {
            throw new IOException("This archive has already been finished");
        }
        this.finished = true;
        long headerPosition = this.file.getFilePointer();
        ByteArrayOutputStream headerBaos = new ByteArrayOutputStream();
        DataOutputStream header = new DataOutputStream(headerBaos);
        writeHeader(header);
        header.flush();
        byte[] headerBytes = headerBaos.toByteArray();
        this.file.write(headerBytes);
        CRC32 crc32 = new CRC32();
        this.file.seek(0L);
        this.file.write(SevenZFile.sevenZSignature);
        this.file.write(0);
        this.file.write(2);
        ByteArrayOutputStream startHeaderBaos = new ByteArrayOutputStream();
        DataOutputStream startHeaderStream = new DataOutputStream(startHeaderBaos);
        startHeaderStream.writeLong(Long.reverseBytes(headerPosition - 32));
        startHeaderStream.writeLong(Long.reverseBytes(4294967295L & headerBytes.length));
        crc32.reset();
        crc32.update(headerBytes);
        startHeaderStream.writeInt(Integer.reverseBytes((int) crc32.getValue()));
        startHeaderStream.flush();
        byte[] startHeaderBytes = startHeaderBaos.toByteArray();
        crc32.reset();
        crc32.update(startHeaderBytes);
        this.file.writeInt(Integer.reverseBytes((int) crc32.getValue()));
        this.file.write(startHeaderBytes);
    }

    private OutputStream getCurrentOutputStream() throws IOException {
        if (this.currentOutputStream == null) {
            this.currentOutputStream = setupFileOutputStream();
        }
        return this.currentOutputStream;
    }

    private CountingOutputStream setupFileOutputStream() throws IOException {
        if (this.files.isEmpty()) {
            throw new IllegalStateException("No current 7z entry");
        }
        OutputStream out = new OutputStreamWrapper();
        ArrayList<CountingOutputStream> moreStreams = new ArrayList<>();
        boolean first = true;
        for (SevenZMethodConfiguration m : getContentMethods(this.files.get(this.files.size() - 1))) {
            if (!first) {
                CountingOutputStream cos = new CountingOutputStream(out);
                moreStreams.add(cos);
                out = cos;
            }
            out = Coders.addEncoder(out, m.getMethod(), m.getOptions());
            first = false;
        }
        if (!moreStreams.isEmpty()) {
            this.additionalCountingStreams = (CountingOutputStream[]) moreStreams.toArray(new CountingOutputStream[moreStreams.size()]);
        }
        return new CountingOutputStream(out) { // from class: org.apache.commons.compress.archivers.sevenz.SevenZOutputFile.1
            @Override // org.apache.commons.compress.utils.CountingOutputStream, java.io.FilterOutputStream, java.io.OutputStream
            public void write(int b) throws IOException {
                super.write(b);
                SevenZOutputFile.this.crc32.update(b);
            }

            @Override // org.apache.commons.compress.utils.CountingOutputStream, java.io.FilterOutputStream, java.io.OutputStream
            public void write(byte[] b) throws IOException {
                super.write(b);
                SevenZOutputFile.this.crc32.update(b);
            }

            @Override // org.apache.commons.compress.utils.CountingOutputStream, java.io.FilterOutputStream, java.io.OutputStream
            public void write(byte[] b, int off, int len) throws IOException {
                super.write(b, off, len);
                SevenZOutputFile.this.crc32.update(b, off, len);
            }
        };
    }

    private Iterable<? extends SevenZMethodConfiguration> getContentMethods(SevenZArchiveEntry entry) {
        Iterable<? extends SevenZMethodConfiguration> ms = entry.getContentMethods();
        return ms == null ? this.contentMethods : ms;
    }

    private void writeHeader(DataOutput header) throws IOException {
        header.write(1);
        header.write(4);
        writeStreamsInfo(header);
        writeFilesInfo(header);
        header.write(0);
    }

    private void writeStreamsInfo(DataOutput header) throws IOException {
        if (this.numNonEmptyStreams > 0) {
            writePackInfo(header);
            writeUnpackInfo(header);
        }
        writeSubStreamsInfo(header);
        header.write(0);
    }

    private void writePackInfo(DataOutput header) throws IOException {
        header.write(6);
        writeUint64(header, 0L);
        writeUint64(header, 4294967295L & this.numNonEmptyStreams);
        header.write(9);
        for (SevenZArchiveEntry entry : this.files) {
            if (entry.hasStream()) {
                writeUint64(header, entry.getCompressedSize());
            }
        }
        header.write(10);
        header.write(1);
        for (SevenZArchiveEntry entry2 : this.files) {
            if (entry2.hasStream()) {
                header.writeInt(Integer.reverseBytes((int) entry2.getCompressedCrcValue()));
            }
        }
        header.write(0);
    }

    private void writeUnpackInfo(DataOutput header) throws IOException {
        header.write(7);
        header.write(11);
        writeUint64(header, this.numNonEmptyStreams);
        header.write(0);
        for (SevenZArchiveEntry entry : this.files) {
            if (entry.hasStream()) {
                writeFolder(header, entry);
            }
        }
        header.write(12);
        for (SevenZArchiveEntry entry2 : this.files) {
            if (entry2.hasStream()) {
                long[] moreSizes = this.additionalSizes.get(entry2);
                if (moreSizes != null) {
                    for (long s : moreSizes) {
                        writeUint64(header, s);
                    }
                }
                writeUint64(header, entry2.getSize());
            }
        }
        header.write(10);
        header.write(1);
        for (SevenZArchiveEntry entry3 : this.files) {
            if (entry3.hasStream()) {
                header.writeInt(Integer.reverseBytes((int) entry3.getCrcValue()));
            }
        }
        header.write(0);
    }

    private void writeFolder(DataOutput header, SevenZArchiveEntry entry) throws IOException {
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        int numCoders = 0;
        for (SevenZMethodConfiguration m : getContentMethods(entry)) {
            numCoders++;
            writeSingleCodec(m, bos);
        }
        writeUint64(header, numCoders);
        header.write(bos.toByteArray());
        for (int i = 0; i < numCoders - 1; i++) {
            writeUint64(header, i + 1);
            writeUint64(header, i);
        }
    }

    private void writeSingleCodec(SevenZMethodConfiguration m, OutputStream bos) throws IOException {
        byte[] id = m.getMethod().getId();
        byte[] properties = Coders.findByMethod(m.getMethod()).getOptionsAsProperties(m.getOptions());
        int codecFlags = id.length;
        if (properties.length > 0) {
            codecFlags |= 32;
        }
        bos.write(codecFlags);
        bos.write(id);
        if (properties.length > 0) {
            bos.write(properties.length);
            bos.write(properties);
        }
    }

    private void writeSubStreamsInfo(DataOutput header) throws IOException {
        header.write(8);
        header.write(0);
    }

    private void writeFilesInfo(DataOutput header) throws IOException {
        header.write(5);
        writeUint64(header, this.files.size());
        writeFileEmptyStreams(header);
        writeFileEmptyFiles(header);
        writeFileAntiItems(header);
        writeFileNames(header);
        writeFileCTimes(header);
        writeFileATimes(header);
        writeFileMTimes(header);
        writeFileWindowsAttributes(header);
        header.write(0);
    }

    private void writeFileEmptyStreams(DataOutput header) throws IOException {
        boolean hasEmptyStreams = false;
        Iterator i$ = this.files.iterator();
        while (true) {
            if (!i$.hasNext()) {
                break;
            }
            SevenZArchiveEntry entry = i$.next();
            if (!entry.hasStream()) {
                hasEmptyStreams = true;
                break;
            }
        }
        if (hasEmptyStreams) {
            header.write(14);
            BitSet emptyStreams = new BitSet(this.files.size());
            for (int i = 0; i < this.files.size(); i++) {
                emptyStreams.set(i, !this.files.get(i).hasStream());
            }
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            DataOutputStream out = new DataOutputStream(baos);
            writeBits(out, emptyStreams, this.files.size());
            out.flush();
            byte[] contents = baos.toByteArray();
            writeUint64(header, contents.length);
            header.write(contents);
        }
    }

    private void writeFileEmptyFiles(DataOutput header) throws IOException {
        boolean hasEmptyFiles = false;
        int emptyStreamCounter = 0;
        BitSet emptyFiles = new BitSet(0);
        for (SevenZArchiveEntry file1 : this.files) {
            if (!file1.hasStream()) {
                boolean isDir = file1.isDirectory();
                int i = emptyStreamCounter;
                emptyStreamCounter++;
                emptyFiles.set(i, !isDir);
                hasEmptyFiles |= !isDir;
            }
        }
        if (hasEmptyFiles) {
            header.write(15);
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            DataOutputStream out = new DataOutputStream(baos);
            writeBits(out, emptyFiles, emptyStreamCounter);
            out.flush();
            byte[] contents = baos.toByteArray();
            writeUint64(header, contents.length);
            header.write(contents);
        }
    }

    private void writeFileAntiItems(DataOutput header) throws IOException {
        boolean hasAntiItems = false;
        BitSet antiItems = new BitSet(0);
        int antiItemCounter = 0;
        for (SevenZArchiveEntry file1 : this.files) {
            if (!file1.hasStream()) {
                boolean isAnti = file1.isAntiItem();
                int i = antiItemCounter;
                antiItemCounter++;
                antiItems.set(i, isAnti);
                hasAntiItems |= isAnti;
            }
        }
        if (hasAntiItems) {
            header.write(16);
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            DataOutputStream out = new DataOutputStream(baos);
            writeBits(out, antiItems, antiItemCounter);
            out.flush();
            byte[] contents = baos.toByteArray();
            writeUint64(header, contents.length);
            header.write(contents);
        }
    }

    private void writeFileNames(DataOutput header) throws IOException {
        header.write(17);
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        DataOutputStream out = new DataOutputStream(baos);
        out.write(0);
        for (SevenZArchiveEntry entry : this.files) {
            out.write(entry.getName().getBytes(CharsetNames.UTF_16LE));
            out.writeShort(0);
        }
        out.flush();
        byte[] contents = baos.toByteArray();
        writeUint64(header, contents.length);
        header.write(contents);
    }

    private void writeFileCTimes(DataOutput header) throws IOException {
        int numCreationDates = 0;
        Iterator i$ = this.files.iterator();
        while (i$.hasNext()) {
            if (i$.next().getHasCreationDate()) {
                numCreationDates++;
            }
        }
        if (numCreationDates > 0) {
            header.write(18);
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            DataOutputStream out = new DataOutputStream(baos);
            if (numCreationDates != this.files.size()) {
                out.write(0);
                BitSet cTimes = new BitSet(this.files.size());
                for (int i = 0; i < this.files.size(); i++) {
                    cTimes.set(i, this.files.get(i).getHasCreationDate());
                }
                writeBits(out, cTimes, this.files.size());
            } else {
                out.write(1);
            }
            out.write(0);
            for (SevenZArchiveEntry entry : this.files) {
                if (entry.getHasCreationDate()) {
                    out.writeLong(Long.reverseBytes(SevenZArchiveEntry.javaTimeToNtfsTime(entry.getCreationDate())));
                }
            }
            out.flush();
            byte[] contents = baos.toByteArray();
            writeUint64(header, contents.length);
            header.write(contents);
        }
    }

    private void writeFileATimes(DataOutput header) throws IOException {
        int numAccessDates = 0;
        Iterator i$ = this.files.iterator();
        while (i$.hasNext()) {
            if (i$.next().getHasAccessDate()) {
                numAccessDates++;
            }
        }
        if (numAccessDates > 0) {
            header.write(19);
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            DataOutputStream out = new DataOutputStream(baos);
            if (numAccessDates != this.files.size()) {
                out.write(0);
                BitSet aTimes = new BitSet(this.files.size());
                for (int i = 0; i < this.files.size(); i++) {
                    aTimes.set(i, this.files.get(i).getHasAccessDate());
                }
                writeBits(out, aTimes, this.files.size());
            } else {
                out.write(1);
            }
            out.write(0);
            for (SevenZArchiveEntry entry : this.files) {
                if (entry.getHasAccessDate()) {
                    out.writeLong(Long.reverseBytes(SevenZArchiveEntry.javaTimeToNtfsTime(entry.getAccessDate())));
                }
            }
            out.flush();
            byte[] contents = baos.toByteArray();
            writeUint64(header, contents.length);
            header.write(contents);
        }
    }

    private void writeFileMTimes(DataOutput header) throws IOException {
        int numLastModifiedDates = 0;
        Iterator i$ = this.files.iterator();
        while (i$.hasNext()) {
            if (i$.next().getHasLastModifiedDate()) {
                numLastModifiedDates++;
            }
        }
        if (numLastModifiedDates > 0) {
            header.write(20);
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            DataOutputStream out = new DataOutputStream(baos);
            if (numLastModifiedDates != this.files.size()) {
                out.write(0);
                BitSet mTimes = new BitSet(this.files.size());
                for (int i = 0; i < this.files.size(); i++) {
                    mTimes.set(i, this.files.get(i).getHasLastModifiedDate());
                }
                writeBits(out, mTimes, this.files.size());
            } else {
                out.write(1);
            }
            out.write(0);
            for (SevenZArchiveEntry entry : this.files) {
                if (entry.getHasLastModifiedDate()) {
                    out.writeLong(Long.reverseBytes(SevenZArchiveEntry.javaTimeToNtfsTime(entry.getLastModifiedDate())));
                }
            }
            out.flush();
            byte[] contents = baos.toByteArray();
            writeUint64(header, contents.length);
            header.write(contents);
        }
    }

    private void writeFileWindowsAttributes(DataOutput header) throws IOException {
        int numWindowsAttributes = 0;
        Iterator i$ = this.files.iterator();
        while (i$.hasNext()) {
            if (i$.next().getHasWindowsAttributes()) {
                numWindowsAttributes++;
            }
        }
        if (numWindowsAttributes > 0) {
            header.write(21);
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            DataOutputStream out = new DataOutputStream(baos);
            if (numWindowsAttributes != this.files.size()) {
                out.write(0);
                BitSet attributes = new BitSet(this.files.size());
                for (int i = 0; i < this.files.size(); i++) {
                    attributes.set(i, this.files.get(i).getHasWindowsAttributes());
                }
                writeBits(out, attributes, this.files.size());
            } else {
                out.write(1);
            }
            out.write(0);
            for (SevenZArchiveEntry entry : this.files) {
                if (entry.getHasWindowsAttributes()) {
                    out.writeInt(Integer.reverseBytes(entry.getWindowsAttributes()));
                }
            }
            out.flush();
            byte[] contents = baos.toByteArray();
            writeUint64(header, contents.length);
            header.write(contents);
        }
    }

    private void writeUint64(DataOutput header, long value) throws IOException {
        int firstByte = 0;
        int mask = 128;
        int i = 0;
        while (true) {
            if (i >= 8) {
                break;
            }
            if (value < (1 << (7 * (i + 1)))) {
                firstByte = (int) (firstByte | (value >>> (8 * i)));
                break;
            } else {
                firstByte |= mask;
                mask >>>= 1;
                i++;
            }
        }
        header.write(firstByte);
        while (i > 0) {
            header.write((int) (255 & value));
            value >>>= 8;
            i--;
        }
    }

    private void writeBits(DataOutput header, BitSet bits, int length) throws IOException {
        int cache = 0;
        int shift = 7;
        for (int i = 0; i < length; i++) {
            cache |= (bits.get(i) ? 1 : 0) << shift;
            shift--;
            if (shift < 0) {
                header.write(cache);
                shift = 7;
                cache = 0;
            }
        }
        if (shift != 7) {
            header.write(cache);
        }
    }

    private static <T> Iterable<T> reverse(Iterable<T> i) {
        LinkedList<T> l = new LinkedList<>();
        for (T t : i) {
            l.addFirst(t);
        }
        return l;
    }

    /* loaded from: commons-compress-1.10.jar:org/apache/commons/compress/archivers/sevenz/SevenZOutputFile$OutputStreamWrapper.class */
    private class OutputStreamWrapper extends OutputStream {
        private OutputStreamWrapper() {
        }

        /* JADX WARN: Failed to check method for inline after forced processorg.apache.commons.compress.archivers.sevenz.SevenZOutputFile.access$408(org.apache.commons.compress.archivers.sevenz.SevenZOutputFile):long */
        @Override // java.io.OutputStream
        public void write(int b) throws IOException {
            SevenZOutputFile.this.file.write(b);
            SevenZOutputFile.this.compressedCrc32.update(b);
            SevenZOutputFile.access$408(SevenZOutputFile.this);
        }

        @Override // java.io.OutputStream
        public void write(byte[] b) throws IOException {
            write(b, 0, b.length);
        }

        /* JADX WARN: Failed to check method for inline after forced processorg.apache.commons.compress.archivers.sevenz.SevenZOutputFile.access$414(org.apache.commons.compress.archivers.sevenz.SevenZOutputFile, long):long */
        @Override // java.io.OutputStream
        public void write(byte[] b, int off, int len) throws IOException {
            SevenZOutputFile.this.file.write(b, off, len);
            SevenZOutputFile.this.compressedCrc32.update(b, off, len);
            SevenZOutputFile.access$414(SevenZOutputFile.this, len);
        }

        @Override // java.io.OutputStream, java.io.Flushable
        public void flush() throws IOException {
        }

        @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
        public void close() throws IOException {
        }
    }
}
