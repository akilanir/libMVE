package org.apache.commons.compress.archivers.sevenz;

import java.io.ByteArrayInputStream;
import java.io.Closeable;
import java.io.DataInput;
import java.io.DataInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.RandomAccessFile;
import java.util.Arrays;
import java.util.BitSet;
import java.util.LinkedList;
import java.util.zip.CRC32;
import org.apache.commons.compress.archivers.cpio.CpioConstants;
import org.apache.commons.compress.utils.BoundedInputStream;
import org.apache.commons.compress.utils.CRC32VerifyingInputStream;
import org.apache.commons.compress.utils.IOUtils;

/* loaded from: commons-compress-1.10.jar:org/apache/commons/compress/archivers/sevenz/SevenZFile.class */
public class SevenZFile implements Closeable {
    static final int SIGNATURE_HEADER_SIZE = 32;
    private final String fileName;
    private RandomAccessFile file;
    private final Archive archive;
    private int currentEntryIndex;
    private int currentFolderIndex;
    private InputStream currentFolderInputStream;
    private InputStream currentEntryInputStream;
    private byte[] password;
    static final byte[] sevenZSignature = {55, 122, -68, -81, 39, 28};

    public SevenZFile(File filename, byte[] password) throws IOException {
        this.currentEntryIndex = -1;
        this.currentFolderIndex = -1;
        this.currentFolderInputStream = null;
        this.currentEntryInputStream = null;
        boolean succeeded = false;
        this.file = new RandomAccessFile(filename, "r");
        this.fileName = filename.getAbsolutePath();
        try {
            this.archive = readHeaders(password);
            if (password != null) {
                this.password = new byte[password.length];
                System.arraycopy(password, 0, this.password, 0, password.length);
            } else {
                this.password = null;
            }
            succeeded = true;
        } finally {
            if (!succeeded) {
                this.file.close();
            }
        }
    }

    public SevenZFile(File filename) throws IOException {
        this(filename, null);
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (this.file != null) {
            try {
                this.file.close();
                this.file = null;
                if (this.password != null) {
                    Arrays.fill(this.password, (byte) 0);
                }
                this.password = null;
            } catch (Throwable th) {
                this.file = null;
                if (this.password != null) {
                    Arrays.fill(this.password, (byte) 0);
                }
                this.password = null;
                throw th;
            }
        }
    }

    public SevenZArchiveEntry getNextEntry() throws IOException {
        if (this.currentEntryIndex >= this.archive.files.length - 1) {
            return null;
        }
        this.currentEntryIndex++;
        SevenZArchiveEntry entry = this.archive.files[this.currentEntryIndex];
        buildDecodingStream();
        return entry;
    }

    private Archive readHeaders(byte[] password) throws IOException {
        byte[] signature = new byte[6];
        this.file.readFully(signature);
        if (!Arrays.equals(signature, sevenZSignature)) {
            throw new IOException("Bad 7z signature");
        }
        byte archiveVersionMajor = this.file.readByte();
        byte archiveVersionMinor = this.file.readByte();
        if (archiveVersionMajor != 0) {
            throw new IOException(String.format("Unsupported 7z version (%d,%d)", Byte.valueOf(archiveVersionMajor), Byte.valueOf(archiveVersionMinor)));
        }
        long startHeaderCrc = 4294967295L & Integer.reverseBytes(this.file.readInt());
        StartHeader startHeader = readStartHeader(startHeaderCrc);
        int nextHeaderSizeInt = (int) startHeader.nextHeaderSize;
        if (nextHeaderSizeInt != startHeader.nextHeaderSize) {
            throw new IOException("cannot handle nextHeaderSize " + startHeader.nextHeaderSize);
        }
        this.file.seek(32 + startHeader.nextHeaderOffset);
        byte[] nextHeader = new byte[nextHeaderSizeInt];
        this.file.readFully(nextHeader);
        CRC32 crc = new CRC32();
        crc.update(nextHeader);
        if (startHeader.nextHeaderCrc != crc.getValue()) {
            throw new IOException("NextHeader CRC mismatch");
        }
        ByteArrayInputStream byteStream = new ByteArrayInputStream(nextHeader);
        DataInputStream nextHeaderInputStream = new DataInputStream(byteStream);
        Archive archive = new Archive();
        int nid = nextHeaderInputStream.readUnsignedByte();
        if (nid == 23) {
            nextHeaderInputStream = readEncodedHeader(nextHeaderInputStream, archive, password);
            archive = new Archive();
            nid = nextHeaderInputStream.readUnsignedByte();
        }
        if (nid == 1) {
            readHeader(nextHeaderInputStream, archive);
            nextHeaderInputStream.close();
            return archive;
        }
        throw new IOException("Broken or unsupported archive: no Header");
    }

    private StartHeader readStartHeader(long startHeaderCrc) throws IOException {
        StartHeader startHeader = new StartHeader();
        DataInputStream dataInputStream = null;
        try {
            dataInputStream = new DataInputStream(new CRC32VerifyingInputStream(new BoundedRandomAccessFileInputStream(this.file, 20L), 20L, startHeaderCrc));
            startHeader.nextHeaderOffset = Long.reverseBytes(dataInputStream.readLong());
            startHeader.nextHeaderSize = Long.reverseBytes(dataInputStream.readLong());
            startHeader.nextHeaderCrc = 4294967295L & Integer.reverseBytes(dataInputStream.readInt());
            if (dataInputStream != null) {
                dataInputStream.close();
            }
            return startHeader;
        } catch (Throwable th) {
            if (dataInputStream != null) {
                dataInputStream.close();
            }
            throw th;
        }
    }

    private void readHeader(DataInput header, Archive archive) throws IOException {
        int nid = header.readUnsignedByte();
        if (nid == 2) {
            readArchiveProperties(header);
            nid = header.readUnsignedByte();
        }
        if (nid == 3) {
            throw new IOException("Additional streams unsupported");
        }
        if (nid == 4) {
            readStreamsInfo(header, archive);
            nid = header.readUnsignedByte();
        }
        if (nid == 5) {
            readFilesInfo(header, archive);
            nid = header.readUnsignedByte();
        }
        if (nid != 0) {
            throw new IOException("Badly terminated header, found " + nid);
        }
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x0008 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void readArchiveProperties(java.io.DataInput r4) throws java.io.IOException {
        /*
            r3 = this;
            r0 = r4
            int r0 = r0.readUnsignedByte()
            r5 = r0
        L7:
            r0 = r5
            if (r0 == 0) goto L28
            r0 = r4
            long r0 = readUint64(r0)
            r6 = r0
            r0 = r6
            int r0 = (int) r0
            byte[] r0 = new byte[r0]
            r8 = r0
            r0 = r4
            r1 = r8
            r0.readFully(r1)
            r0 = r4
            int r0 = r0.readUnsignedByte()
            r5 = r0
            goto L7
        L28:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.compress.archivers.sevenz.SevenZFile.readArchiveProperties(java.io.DataInput):void");
    }

    private DataInputStream readEncodedHeader(DataInputStream header, Archive archive, byte[] password) throws IOException {
        readStreamsInfo(header, archive);
        Folder folder = archive.folders[0];
        long folderOffset = 32 + archive.packPos + 0;
        this.file.seek(folderOffset);
        InputStream inputStreamStack = new BoundedRandomAccessFileInputStream(this.file, archive.packSizes[0]);
        for (Coder coder : folder.getOrderedCoders()) {
            if (coder.numInStreams != 1 || coder.numOutStreams != 1) {
                throw new IOException("Multi input/output stream coders are not yet supported");
            }
            inputStreamStack = Coders.addDecoder(this.fileName, inputStreamStack, folder.getUnpackSizeForCoder(coder), coder, password);
        }
        if (folder.hasCrc) {
            inputStreamStack = new CRC32VerifyingInputStream(inputStreamStack, folder.getUnpackSize(), folder.crc);
        }
        byte[] nextHeader = new byte[(int) folder.getUnpackSize()];
        DataInputStream nextHeaderInputStream = new DataInputStream(inputStreamStack);
        try {
            nextHeaderInputStream.readFully(nextHeader);
            nextHeaderInputStream.close();
            return new DataInputStream(new ByteArrayInputStream(nextHeader));
        } catch (Throwable th) {
            nextHeaderInputStream.close();
            throw th;
        }
    }

    private void readStreamsInfo(DataInput header, Archive archive) throws IOException {
        int nid = header.readUnsignedByte();
        if (nid == 6) {
            readPackInfo(header, archive);
            nid = header.readUnsignedByte();
        }
        if (nid == 7) {
            readUnpackInfo(header, archive);
            nid = header.readUnsignedByte();
        } else {
            archive.folders = new Folder[0];
        }
        if (nid == 8) {
            readSubStreamsInfo(header, archive);
            nid = header.readUnsignedByte();
        }
        if (nid != 0) {
            throw new IOException("Badly terminated StreamsInfo");
        }
    }

    private void readPackInfo(DataInput header, Archive archive) throws IOException {
        archive.packPos = readUint64(header);
        long numPackStreams = readUint64(header);
        int nid = header.readUnsignedByte();
        if (nid == 9) {
            archive.packSizes = new long[(int) numPackStreams];
            for (int i = 0; i < archive.packSizes.length; i++) {
                archive.packSizes[i] = readUint64(header);
            }
            nid = header.readUnsignedByte();
        }
        if (nid == 10) {
            archive.packCrcsDefined = readAllOrBits(header, (int) numPackStreams);
            archive.packCrcs = new long[(int) numPackStreams];
            for (int i2 = 0; i2 < ((int) numPackStreams); i2++) {
                if (archive.packCrcsDefined.get(i2)) {
                    archive.packCrcs[i2] = 4294967295L & Integer.reverseBytes(header.readInt());
                }
            }
            nid = header.readUnsignedByte();
        }
        if (nid != 0) {
            throw new IOException("Badly terminated PackInfo (" + nid + ")");
        }
    }

    private void readUnpackInfo(DataInput header, Archive archive) throws IOException {
        int nid = header.readUnsignedByte();
        if (nid != 11) {
            throw new IOException("Expected kFolder, got " + nid);
        }
        long numFolders = readUint64(header);
        Folder[] folders = new Folder[(int) numFolders];
        archive.folders = folders;
        int external = header.readUnsignedByte();
        if (external != 0) {
            throw new IOException("External unsupported");
        }
        for (int i = 0; i < ((int) numFolders); i++) {
            folders[i] = readFolder(header);
        }
        int nid2 = header.readUnsignedByte();
        if (nid2 != 12) {
            throw new IOException("Expected kCodersUnpackSize, got " + nid2);
        }
        for (Folder folder : folders) {
            folder.unpackSizes = new long[(int) folder.totalOutputStreams];
            for (int i2 = 0; i2 < folder.totalOutputStreams; i2++) {
                folder.unpackSizes[i2] = readUint64(header);
            }
        }
        int nid3 = header.readUnsignedByte();
        if (nid3 == 10) {
            BitSet crcsDefined = readAllOrBits(header, (int) numFolders);
            for (int i3 = 0; i3 < ((int) numFolders); i3++) {
                if (crcsDefined.get(i3)) {
                    folders[i3].hasCrc = true;
                    folders[i3].crc = 4294967295L & Integer.reverseBytes(header.readInt());
                } else {
                    folders[i3].hasCrc = false;
                }
            }
            nid3 = header.readUnsignedByte();
        }
        if (nid3 != 0) {
            throw new IOException("Badly terminated UnpackInfo");
        }
    }

    private void readSubStreamsInfo(DataInput header, Archive archive) throws IOException {
        for (Folder folder : archive.folders) {
            folder.numUnpackSubStreams = 1;
        }
        int totalUnpackStreams = archive.folders.length;
        int nid = header.readUnsignedByte();
        if (nid == 13) {
            totalUnpackStreams = 0;
            Folder[] arr$ = archive.folders;
            for (Folder folder2 : arr$) {
                long numStreams = readUint64(header);
                folder2.numUnpackSubStreams = (int) numStreams;
                totalUnpackStreams = (int) (totalUnpackStreams + numStreams);
            }
            nid = header.readUnsignedByte();
        }
        SubStreamsInfo subStreamsInfo = new SubStreamsInfo();
        subStreamsInfo.unpackSizes = new long[totalUnpackStreams];
        subStreamsInfo.hasCrc = new BitSet(totalUnpackStreams);
        subStreamsInfo.crcs = new long[totalUnpackStreams];
        int nextUnpackStream = 0;
        Folder[] arr$2 = archive.folders;
        for (Folder folder3 : arr$2) {
            if (folder3.numUnpackSubStreams != 0) {
                long sum = 0;
                if (nid == 9) {
                    for (int i = 0; i < folder3.numUnpackSubStreams - 1; i++) {
                        long size = readUint64(header);
                        int i2 = nextUnpackStream;
                        nextUnpackStream++;
                        subStreamsInfo.unpackSizes[i2] = size;
                        sum += size;
                    }
                }
                int i3 = nextUnpackStream;
                nextUnpackStream++;
                subStreamsInfo.unpackSizes[i3] = folder3.getUnpackSize() - sum;
            }
        }
        if (nid == 9) {
            nid = header.readUnsignedByte();
        }
        int numDigests = 0;
        Folder[] arr$3 = archive.folders;
        for (Folder folder4 : arr$3) {
            if (folder4.numUnpackSubStreams != 1 || !folder4.hasCrc) {
                numDigests += folder4.numUnpackSubStreams;
            }
        }
        if (nid == 10) {
            BitSet hasMissingCrc = readAllOrBits(header, numDigests);
            long[] missingCrcs = new long[numDigests];
            for (int i4 = 0; i4 < numDigests; i4++) {
                if (hasMissingCrc.get(i4)) {
                    missingCrcs[i4] = 4294967295L & Integer.reverseBytes(header.readInt());
                }
            }
            int nextCrc = 0;
            int nextMissingCrc = 0;
            Folder[] arr$4 = archive.folders;
            for (Folder folder5 : arr$4) {
                if (folder5.numUnpackSubStreams == 1 && folder5.hasCrc) {
                    subStreamsInfo.hasCrc.set(nextCrc, true);
                    subStreamsInfo.crcs[nextCrc] = folder5.crc;
                    nextCrc++;
                } else {
                    for (int i5 = 0; i5 < folder5.numUnpackSubStreams; i5++) {
                        subStreamsInfo.hasCrc.set(nextCrc, hasMissingCrc.get(nextMissingCrc));
                        subStreamsInfo.crcs[nextCrc] = missingCrcs[nextMissingCrc];
                        nextCrc++;
                        nextMissingCrc++;
                    }
                }
            }
            nid = header.readUnsignedByte();
        }
        if (nid != 0) {
            throw new IOException("Badly terminated SubStreamsInfo");
        }
        archive.subStreamsInfo = subStreamsInfo;
    }

    private Folder readFolder(DataInput header) throws IOException {
        Folder folder = new Folder();
        long numCoders = readUint64(header);
        Coder[] coders = new Coder[(int) numCoders];
        long totalInStreams = 0;
        long totalOutStreams = 0;
        for (int i = 0; i < coders.length; i++) {
            coders[i] = new Coder();
            int bits = header.readUnsignedByte();
            int idSize = bits & 15;
            boolean isSimple = (bits & 16) == 0;
            boolean hasAttributes = (bits & 32) != 0;
            boolean moreAlternativeMethods = (bits & CpioConstants.C_IWUSR) != 0;
            coders[i].decompressionMethodId = new byte[idSize];
            header.readFully(coders[i].decompressionMethodId);
            if (isSimple) {
                coders[i].numInStreams = 1L;
                coders[i].numOutStreams = 1L;
            } else {
                coders[i].numInStreams = readUint64(header);
                coders[i].numOutStreams = readUint64(header);
            }
            totalInStreams += coders[i].numInStreams;
            totalOutStreams += coders[i].numOutStreams;
            if (hasAttributes) {
                long propertiesSize = readUint64(header);
                coders[i].properties = new byte[(int) propertiesSize];
                header.readFully(coders[i].properties);
            }
            if (moreAlternativeMethods) {
                throw new IOException("Alternative methods are unsupported, please report. The reference implementation doesn't support them either.");
            }
        }
        folder.coders = coders;
        folder.totalInputStreams = totalInStreams;
        folder.totalOutputStreams = totalOutStreams;
        if (totalOutStreams == 0) {
            throw new IOException("Total output streams can't be 0");
        }
        long numBindPairs = totalOutStreams - 1;
        BindPair[] bindPairs = new BindPair[(int) numBindPairs];
        for (int i2 = 0; i2 < bindPairs.length; i2++) {
            bindPairs[i2] = new BindPair();
            bindPairs[i2].inIndex = readUint64(header);
            bindPairs[i2].outIndex = readUint64(header);
        }
        folder.bindPairs = bindPairs;
        if (totalInStreams < numBindPairs) {
            throw new IOException("Total input streams can't be less than the number of bind pairs");
        }
        long numPackedStreams = totalInStreams - numBindPairs;
        long[] packedStreams = new long[(int) numPackedStreams];
        if (numPackedStreams == 1) {
            int i3 = 0;
            while (i3 < ((int) totalInStreams) && folder.findBindPairForInStream(i3) >= 0) {
                i3++;
            }
            if (i3 == ((int) totalInStreams)) {
                throw new IOException("Couldn't find stream's bind pair index");
            }
            packedStreams[0] = i3;
        } else {
            for (int i4 = 0; i4 < ((int) numPackedStreams); i4++) {
                packedStreams[i4] = readUint64(header);
            }
        }
        folder.packedStreams = packedStreams;
        return folder;
    }

    private BitSet readAllOrBits(DataInput header, int size) throws IOException {
        BitSet bits;
        int areAllDefined = header.readUnsignedByte();
        if (areAllDefined != 0) {
            bits = new BitSet(size);
            for (int i = 0; i < size; i++) {
                bits.set(i, true);
            }
        } else {
            bits = readBits(header, size);
        }
        return bits;
    }

    private BitSet readBits(DataInput header, int size) throws IOException {
        BitSet bits = new BitSet(size);
        int mask = 0;
        int cache = 0;
        for (int i = 0; i < size; i++) {
            if (mask == 0) {
                mask = 128;
                cache = header.readUnsignedByte();
            }
            bits.set(i, (cache & mask) != 0);
            mask >>>= 1;
        }
        return bits;
    }

    /* JADX WARN: Code restructure failed: missing block: B:45:0x0173, code lost:
    
        throw new java.io.IOException("Error parsing file names");
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void readFilesInfo(java.io.DataInput r9, org.apache.commons.compress.archivers.sevenz.Archive r10) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 1069
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.compress.archivers.sevenz.SevenZFile.readFilesInfo(java.io.DataInput, org.apache.commons.compress.archivers.sevenz.Archive):void");
    }

    private void calculateStreamMap(Archive archive) throws IOException {
        StreamMap streamMap = new StreamMap();
        int nextFolderPackStreamIndex = 0;
        int numFolders = archive.folders != null ? archive.folders.length : 0;
        streamMap.folderFirstPackStreamIndex = new int[numFolders];
        for (int i = 0; i < numFolders; i++) {
            streamMap.folderFirstPackStreamIndex[i] = nextFolderPackStreamIndex;
            nextFolderPackStreamIndex += archive.folders[i].packedStreams.length;
        }
        long nextPackStreamOffset = 0;
        int numPackSizes = archive.packSizes != null ? archive.packSizes.length : 0;
        streamMap.packStreamOffsets = new long[numPackSizes];
        for (int i2 = 0; i2 < numPackSizes; i2++) {
            streamMap.packStreamOffsets[i2] = nextPackStreamOffset;
            nextPackStreamOffset += archive.packSizes[i2];
        }
        streamMap.folderFirstFileIndex = new int[numFolders];
        streamMap.fileFolderIndex = new int[archive.files.length];
        int nextFolderIndex = 0;
        int nextFolderUnpackStreamIndex = 0;
        for (int i3 = 0; i3 < archive.files.length; i3++) {
            if (!archive.files[i3].hasStream() && nextFolderUnpackStreamIndex == 0) {
                streamMap.fileFolderIndex[i3] = -1;
            } else {
                if (nextFolderUnpackStreamIndex == 0) {
                    while (nextFolderIndex < archive.folders.length) {
                        streamMap.folderFirstFileIndex[nextFolderIndex] = i3;
                        if (archive.folders[nextFolderIndex].numUnpackSubStreams > 0) {
                            break;
                        } else {
                            nextFolderIndex++;
                        }
                    }
                    if (nextFolderIndex >= archive.folders.length) {
                        throw new IOException("Too few folders in archive");
                    }
                }
                streamMap.fileFolderIndex[i3] = nextFolderIndex;
                if (archive.files[i3].hasStream()) {
                    nextFolderUnpackStreamIndex++;
                    if (nextFolderUnpackStreamIndex >= archive.folders[nextFolderIndex].numUnpackSubStreams) {
                        nextFolderIndex++;
                        nextFolderUnpackStreamIndex = 0;
                    }
                }
            }
        }
        archive.streamMap = streamMap;
    }

    private void buildDecodingStream() throws IOException {
        int folderIndex = this.archive.streamMap.fileFolderIndex[this.currentEntryIndex];
        if (folderIndex < 0) {
            this.currentEntryInputStream = new BoundedInputStream(new ByteArrayInputStream(new byte[0]), 0L);
            return;
        }
        SevenZArchiveEntry file = this.archive.files[this.currentEntryIndex];
        if (this.currentFolderIndex == folderIndex) {
            drainPreviousEntry();
            file.setContentMethods(this.archive.files[this.currentEntryIndex - 1].getContentMethods());
        } else {
            this.currentFolderIndex = folderIndex;
            if (this.currentFolderInputStream != null) {
                this.currentFolderInputStream.close();
                this.currentFolderInputStream = null;
            }
            Folder folder = this.archive.folders[folderIndex];
            int firstPackStreamIndex = this.archive.streamMap.folderFirstPackStreamIndex[folderIndex];
            long folderOffset = 32 + this.archive.packPos + this.archive.streamMap.packStreamOffsets[firstPackStreamIndex];
            this.currentFolderInputStream = buildDecoderStack(folder, folderOffset, firstPackStreamIndex, file);
        }
        InputStream fileStream = new BoundedInputStream(this.currentFolderInputStream, file.getSize());
        if (file.getHasCrc()) {
            this.currentEntryInputStream = new CRC32VerifyingInputStream(fileStream, file.getSize(), file.getCrcValue());
        } else {
            this.currentEntryInputStream = fileStream;
        }
    }

    private void drainPreviousEntry() throws IOException {
        if (this.currentEntryInputStream != null) {
            IOUtils.skip(this.currentEntryInputStream, Long.MAX_VALUE);
            this.currentEntryInputStream.close();
            this.currentEntryInputStream = null;
        }
    }

    private InputStream buildDecoderStack(Folder folder, long folderOffset, int firstPackStreamIndex, SevenZArchiveEntry entry) throws IOException {
        this.file.seek(folderOffset);
        InputStream inputStreamStack = new BoundedRandomAccessFileInputStream(this.file, this.archive.packSizes[firstPackStreamIndex]);
        LinkedList<SevenZMethodConfiguration> methods = new LinkedList<>();
        for (Coder coder : folder.getOrderedCoders()) {
            if (coder.numInStreams != 1 || coder.numOutStreams != 1) {
                throw new IOException("Multi input/output stream coders are not yet supported");
            }
            SevenZMethod method = SevenZMethod.byId(coder.decompressionMethodId);
            inputStreamStack = Coders.addDecoder(this.fileName, inputStreamStack, folder.getUnpackSizeForCoder(coder), coder, this.password);
            methods.addFirst(new SevenZMethodConfiguration(method, Coders.findByMethod(method).getOptionsFromCoder(coder, inputStreamStack)));
        }
        entry.setContentMethods(methods);
        if (folder.hasCrc) {
            return new CRC32VerifyingInputStream(inputStreamStack, folder.getUnpackSize(), folder.crc);
        }
        return inputStreamStack;
    }

    public int read() throws IOException {
        if (this.currentEntryInputStream == null) {
            throw new IllegalStateException("No current 7z entry");
        }
        return this.currentEntryInputStream.read();
    }

    public int read(byte[] b) throws IOException {
        return read(b, 0, b.length);
    }

    public int read(byte[] b, int off, int len) throws IOException {
        if (this.currentEntryInputStream == null) {
            throw new IllegalStateException("No current 7z entry");
        }
        return this.currentEntryInputStream.read(b, off, len);
    }

    private static long readUint64(DataInput in) throws IOException {
        long firstByte = in.readUnsignedByte();
        int mask = 128;
        long value = 0;
        for (int i = 0; i < 8; i++) {
            if ((firstByte & mask) == 0) {
                return value | ((firstByte & (mask - 1)) << (8 * i));
            }
            long nextByte = in.readUnsignedByte();
            value |= nextByte << (8 * i);
            mask >>>= 1;
        }
        return value;
    }

    public static boolean matches(byte[] signature, int length) {
        if (length < sevenZSignature.length) {
            return false;
        }
        for (int i = 0; i < sevenZSignature.length; i++) {
            if (signature[i] != sevenZSignature[i]) {
                return false;
            }
        }
        return true;
    }

    private static long skipBytesFully(DataInput input, long bytesToSkip) throws IOException {
        if (bytesToSkip < 1) {
            return 0L;
        }
        long skipped = 0;
        while (bytesToSkip > 2147483647L) {
            long skippedNow = skipBytesFully(input, 2147483647L);
            if (skippedNow == 0) {
                return skipped;
            }
            skipped += skippedNow;
            bytesToSkip -= skippedNow;
        }
        while (bytesToSkip > 0) {
            int skippedNow2 = input.skipBytes((int) bytesToSkip);
            if (skippedNow2 == 0) {
                return skipped;
            }
            skipped += skippedNow2;
            bytesToSkip -= skippedNow2;
        }
        return skipped;
    }
}
