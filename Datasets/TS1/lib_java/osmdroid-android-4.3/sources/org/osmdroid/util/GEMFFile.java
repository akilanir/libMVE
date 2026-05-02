package org.osmdroid.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.RandomAccessFile;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

/* loaded from: osmdroid-android-4.3.jar:org/osmdroid/util/GEMFFile.class */
public class GEMFFile {
    private static final long FILE_SIZE_LIMIT = 1073741824;
    private static final int FILE_COPY_BUFFER_SIZE = 1024;
    private static final int VERSION = 4;
    private static final int TILE_SIZE = 256;
    private static final int U32_SIZE = 4;
    private static final int U64_SIZE = 8;
    private final String mLocation;
    private final List<RandomAccessFile> mFiles;
    private final List<String> mFileNames;
    private final List<GEMFRange> mRangeData;
    private final List<Long> mFileSizes;
    private final LinkedHashMap<Integer, String> mSources;
    private boolean mSourceLimited;
    private int mCurrentSource;

    public GEMFFile(File pLocation) throws FileNotFoundException, IOException {
        this(pLocation.getAbsolutePath());
    }

    public GEMFFile(String pLocation) throws FileNotFoundException, IOException {
        this.mFiles = new ArrayList();
        this.mFileNames = new ArrayList();
        this.mRangeData = new ArrayList();
        this.mFileSizes = new ArrayList();
        this.mSources = new LinkedHashMap<>();
        this.mSourceLimited = false;
        this.mCurrentSource = 0;
        this.mLocation = pLocation;
        openFiles();
        readHeader();
    }

    public GEMFFile(String pLocation, List<File> pSourceFolders) throws FileNotFoundException, IOException {
        this.mFiles = new ArrayList();
        this.mFileNames = new ArrayList();
        this.mRangeData = new ArrayList();
        this.mFileSizes = new ArrayList();
        this.mSources = new LinkedHashMap<>();
        this.mSourceLimited = false;
        this.mCurrentSource = 0;
        this.mLocation = pLocation;
        LinkedHashMap<String, LinkedHashMap<Integer, LinkedHashMap<Integer, LinkedHashMap<Integer, File>>>> dirIndex = new LinkedHashMap<>();
        for (File sourceDir : pSourceFolders) {
            LinkedHashMap<Integer, LinkedHashMap<Integer, LinkedHashMap<Integer, File>>> zList = new LinkedHashMap<>();
            File[] arr$ = sourceDir.listFiles();
            for (File zDir : arr$) {
                try {
                    Integer.parseInt(zDir.getName());
                    LinkedHashMap<Integer, LinkedHashMap<Integer, File>> xList = new LinkedHashMap<>();
                    File[] arr$2 = zDir.listFiles();
                    for (File xDir : arr$2) {
                        try {
                            Integer.parseInt(xDir.getName());
                            LinkedHashMap<Integer, File> yList = new LinkedHashMap<>();
                            File[] arr$3 = xDir.listFiles();
                            for (File yFile : arr$3) {
                                try {
                                    Integer.parseInt(yFile.getName().substring(0, yFile.getName().indexOf(46)));
                                    yList.put(Integer.valueOf(Integer.parseInt(yFile.getName().substring(0, yFile.getName().indexOf(46)))), yFile);
                                } catch (NumberFormatException e) {
                                }
                            }
                            xList.put(new Integer(xDir.getName()), yList);
                        } catch (NumberFormatException e2) {
                        }
                    }
                    zList.put(Integer.valueOf(Integer.parseInt(zDir.getName())), xList);
                } catch (NumberFormatException e3) {
                }
            }
            dirIndex.put(sourceDir.getName(), zList);
        }
        LinkedHashMap<String, Integer> sourceIndex = new LinkedHashMap<>();
        LinkedHashMap<Integer, String> indexSource = new LinkedHashMap<>();
        int si = 0;
        for (String source : dirIndex.keySet()) {
            sourceIndex.put(source, new Integer(si));
            indexSource.put(new Integer(si), source);
            si++;
        }
        List<GEMFRange> ranges = new ArrayList<>();
        for (String source2 : dirIndex.keySet()) {
            for (Integer zoom : dirIndex.get(source2).keySet()) {
                LinkedHashMap<List<Integer>, List<Integer>> ySets = new LinkedHashMap<>();
                Iterator i$ = new TreeSet(dirIndex.get(source2).get(zoom).keySet()).iterator();
                while (i$.hasNext()) {
                    Integer x = (Integer) i$.next();
                    List<Integer> ySet = new ArrayList<>();
                    for (Integer y : dirIndex.get(source2).get(zoom).get(x).keySet()) {
                        ySet.add(y);
                    }
                    if (ySet.size() != 0) {
                        Collections.sort(ySet);
                        if (!ySets.containsKey(ySet)) {
                            ySets.put(ySet, new ArrayList<>());
                        }
                        ySets.get(ySet).add(x);
                    }
                }
                LinkedHashMap<List<Integer>, List<Integer>> xSets = new LinkedHashMap<>();
                for (List<Integer> ySet2 : ySets.keySet()) {
                    TreeSet<Integer> xList2 = new TreeSet<>(ySets.get(ySet2));
                    List<Integer> xSet = new ArrayList<>();
                    for (int i = xList2.first().intValue(); i < xList2.last().intValue() + 1; i++) {
                        if (xList2.contains(new Integer(i))) {
                            xSet.add(new Integer(i));
                        } else if (xSet.size() > 0) {
                            xSets.put(ySet2, xSet);
                            xSet = new ArrayList<>();
                        }
                    }
                    if (xSet.size() > 0) {
                        xSets.put(ySet2, xSet);
                    }
                }
                for (List<Integer> xSet2 : xSets.keySet()) {
                    TreeSet<Integer> yList2 = new TreeSet<>(xSet2);
                    TreeSet<Integer> xList3 = new TreeSet<>(ySets.get(xSet2));
                    GEMFRange range = new GEMFRange();
                    range.zoom = zoom;
                    range.sourceIndex = sourceIndex.get(source2);
                    range.xMin = xList3.first();
                    range.xMax = xList3.last();
                    for (int i2 = yList2.first().intValue(); i2 < yList2.last().intValue() + 1; i2++) {
                        if (yList2.contains(new Integer(i2))) {
                            if (range.yMin == null) {
                                range.yMin = Integer.valueOf(i2);
                            }
                            range.yMax = Integer.valueOf(i2);
                        } else if (range.yMin != null) {
                            ranges.add(range);
                            range = new GEMFRange();
                            range.zoom = zoom;
                            range.sourceIndex = sourceIndex.get(source2);
                            range.xMin = xList3.first();
                            range.xMax = xList3.last();
                        }
                    }
                    if (range.yMin != null) {
                        ranges.add(range);
                    }
                }
            }
        }
        int source_list_size = 0;
        Iterator i$2 = sourceIndex.keySet().iterator();
        while (i$2.hasNext()) {
            source_list_size += 8 + i$2.next().length();
        }
        long offset = 12 + source_list_size + (ranges.size() * 32) + 4;
        for (GEMFRange range2 : ranges) {
            range2.offset = Long.valueOf(offset);
            for (int x2 = range2.xMin.intValue(); x2 < range2.xMax.intValue() + 1; x2++) {
                for (int y2 = range2.yMin.intValue(); y2 < range2.yMax.intValue() + 1; y2++) {
                    offset += 12;
                }
            }
        }
        long headerSize = offset;
        RandomAccessFile gemfFile = new RandomAccessFile(pLocation, "rw");
        gemfFile.writeInt(4);
        gemfFile.writeInt(TILE_SIZE);
        gemfFile.writeInt(sourceIndex.size());
        for (String source3 : sourceIndex.keySet()) {
            gemfFile.writeInt(sourceIndex.get(source3).intValue());
            gemfFile.writeInt(source3.length());
            gemfFile.write(source3.getBytes());
        }
        gemfFile.writeInt(ranges.size());
        for (GEMFRange range3 : ranges) {
            gemfFile.writeInt(range3.zoom.intValue());
            gemfFile.writeInt(range3.xMin.intValue());
            gemfFile.writeInt(range3.xMax.intValue());
            gemfFile.writeInt(range3.yMin.intValue());
            gemfFile.writeInt(range3.yMax.intValue());
            gemfFile.writeInt(range3.sourceIndex.intValue());
            gemfFile.writeLong(range3.offset.longValue());
        }
        for (GEMFRange range4 : ranges) {
            for (int x3 = range4.xMin.intValue(); x3 < range4.xMax.intValue() + 1; x3++) {
                for (int y3 = range4.yMin.intValue(); y3 < range4.yMax.intValue() + 1; y3++) {
                    gemfFile.writeLong(offset);
                    long fileSize = dirIndex.get(indexSource.get(range4.sourceIndex)).get(range4.zoom).get(Integer.valueOf(x3)).get(Integer.valueOf(y3)).length();
                    gemfFile.writeInt((int) fileSize);
                    offset += fileSize;
                }
            }
        }
        byte[] buf = new byte[FILE_COPY_BUFFER_SIZE];
        long currentOffset = headerSize;
        int fileIndex = 0;
        for (GEMFRange range5 : ranges) {
            for (int x4 = range5.xMin.intValue(); x4 < range5.xMax.intValue() + 1; x4++) {
                for (int y4 = range5.yMin.intValue(); y4 < range5.yMax.intValue() + 1; y4++) {
                    long fileSize2 = dirIndex.get(indexSource.get(range5.sourceIndex)).get(range5.zoom).get(Integer.valueOf(x4)).get(Integer.valueOf(y4)).length();
                    if (currentOffset + fileSize2 > FILE_SIZE_LIMIT) {
                        gemfFile.close();
                        fileIndex++;
                        gemfFile = new RandomAccessFile(pLocation + "-" + fileIndex, "rw");
                        currentOffset = 0;
                    } else {
                        currentOffset += fileSize2;
                    }
                    FileInputStream tile = new FileInputStream(dirIndex.get(indexSource.get(range5.sourceIndex)).get(range5.zoom).get(Integer.valueOf(x4)).get(Integer.valueOf(y4)));
                    int read = tile.read(buf, 0, FILE_COPY_BUFFER_SIZE);
                    while (true) {
                        int read2 = read;
                        if (read2 != -1) {
                            gemfFile.write(buf, 0, read2);
                            read = tile.read(buf, 0, FILE_COPY_BUFFER_SIZE);
                        }
                    }
                    tile.close();
                }
            }
        }
        gemfFile.close();
        openFiles();
        readHeader();
    }

    public void close() throws IOException {
        for (RandomAccessFile file : this.mFiles) {
            file.close();
        }
    }

    private void openFiles() throws FileNotFoundException {
        File base = new File(this.mLocation);
        this.mFiles.add(new RandomAccessFile(base, "r"));
        this.mFileNames.add(base.getPath());
        int i = 0;
        while (true) {
            i++;
            File nextFile = new File(this.mLocation + "-" + i);
            if (nextFile.exists()) {
                this.mFiles.add(new RandomAccessFile(nextFile, "r"));
                this.mFileNames.add(nextFile.getPath());
            } else {
                return;
            }
        }
    }

    private void readHeader() throws IOException {
        RandomAccessFile baseFile = this.mFiles.get(0);
        for (RandomAccessFile file : this.mFiles) {
            this.mFileSizes.add(Long.valueOf(file.length()));
        }
        int version = baseFile.readInt();
        if (version != 4) {
            throw new IOException("Bad file version: " + version);
        }
        int tile_size = baseFile.readInt();
        if (tile_size != TILE_SIZE) {
            throw new IOException("Bad tile size: " + tile_size);
        }
        int sourceCount = baseFile.readInt();
        for (int i = 0; i < sourceCount; i++) {
            int sourceIndex = baseFile.readInt();
            int sourceNameLength = baseFile.readInt();
            byte[] nameData = new byte[sourceNameLength];
            baseFile.read(nameData, 0, sourceNameLength);
            String sourceName = new String(nameData);
            this.mSources.put(new Integer(sourceIndex), sourceName);
        }
        int num_ranges = baseFile.readInt();
        for (int i2 = 0; i2 < num_ranges; i2++) {
            GEMFRange rs = new GEMFRange();
            rs.zoom = Integer.valueOf(baseFile.readInt());
            rs.xMin = Integer.valueOf(baseFile.readInt());
            rs.xMax = Integer.valueOf(baseFile.readInt());
            rs.yMin = Integer.valueOf(baseFile.readInt());
            rs.yMax = Integer.valueOf(baseFile.readInt());
            rs.sourceIndex = Integer.valueOf(baseFile.readInt());
            rs.offset = Long.valueOf(baseFile.readLong());
            this.mRangeData.add(rs);
        }
    }

    public String getName() {
        return this.mLocation;
    }

    public LinkedHashMap<Integer, String> getSources() {
        return this.mSources;
    }

    public void selectSource(int pSource) {
        if (this.mSources.containsKey(new Integer(pSource))) {
            this.mSourceLimited = true;
            this.mCurrentSource = pSource;
        }
    }

    public void acceptAnySource() {
        this.mSourceLimited = false;
    }

    public Set<Integer> getZoomLevels() {
        Set<Integer> zoomLevels = new TreeSet<>();
        for (GEMFRange rs : this.mRangeData) {
            zoomLevels.add(rs.zoom);
        }
        return zoomLevels;
    }

    public InputStream getInputStream(int pX, int pY, int pZ) {
        GEMFRange range = null;
        for (GEMFRange rs : this.mRangeData) {
            if (pZ == rs.zoom.intValue() && pX >= rs.xMin.intValue() && pX <= rs.xMax.intValue() && pY >= rs.yMin.intValue() && pY <= rs.yMax.intValue() && (!this.mSourceLimited || rs.sourceIndex.intValue() == this.mCurrentSource)) {
                range = rs;
                break;
            }
        }
        if (range == null) {
            return null;
        }
        try {
            int numY = (range.yMax.intValue() + 1) - range.yMin.intValue();
            int xIndex = pX - range.xMin.intValue();
            int yIndex = pY - range.yMin.intValue();
            long offset = (xIndex * numY) + yIndex;
            long offset2 = (offset * 12) + range.offset.longValue();
            RandomAccessFile baseFile = this.mFiles.get(0);
            baseFile.seek(offset2);
            long dataOffset = baseFile.readLong();
            int dataLength = baseFile.readInt();
            RandomAccessFile pDataFile = this.mFiles.get(0);
            int index = 0;
            if (dataOffset > this.mFileSizes.get(0).longValue()) {
                int fileListCount = this.mFileSizes.size();
                while (index < fileListCount - 1 && dataOffset > this.mFileSizes.get(index).longValue()) {
                    dataOffset -= this.mFileSizes.get(index).longValue();
                    index++;
                }
                pDataFile = this.mFiles.get(index);
            }
            pDataFile.seek(dataOffset);
            return new GEMFInputStream(this.mFileNames.get(index), dataOffset, dataLength);
        } catch (IOException e) {
            return null;
        }
    }

    /* loaded from: osmdroid-android-4.3.jar:org/osmdroid/util/GEMFFile$GEMFRange.class */
    private class GEMFRange {
        Integer zoom;
        Integer xMin;
        Integer xMax;
        Integer yMin;
        Integer yMax;
        Integer sourceIndex;
        Long offset;

        private GEMFRange() {
        }

        public String toString() {
            return String.format("GEMF Range: source=%d, zoom=%d, x=%d-%d, y=%d-%d, offset=0x%08X", this.sourceIndex, this.zoom, this.xMin, this.xMax, this.yMin, this.yMax, this.offset);
        }
    }

    /* loaded from: osmdroid-android-4.3.jar:org/osmdroid/util/GEMFFile$GEMFInputStream.class */
    class GEMFInputStream extends InputStream {
        RandomAccessFile raf;
        int remainingBytes;

        GEMFInputStream(String filePath, long offset, int length) throws IOException {
            this.raf = new RandomAccessFile(filePath, "r");
            this.raf.seek(offset);
            this.remainingBytes = length;
        }

        @Override // java.io.InputStream
        public int available() {
            return this.remainingBytes;
        }

        @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
        public void close() throws IOException {
            this.raf.close();
        }

        @Override // java.io.InputStream
        public boolean markSupported() {
            return false;
        }

        @Override // java.io.InputStream
        public int read(byte[] buffer, int offset, int length) throws IOException {
            int read = this.raf.read(buffer, offset, length > this.remainingBytes ? this.remainingBytes : length);
            this.remainingBytes -= read;
            return read;
        }

        @Override // java.io.InputStream
        public int read() throws IOException {
            if (this.remainingBytes > 0) {
                this.remainingBytes--;
                return this.raf.read();
            }
            throw new IOException("End of stream");
        }

        @Override // java.io.InputStream
        public long skip(long byteCount) {
            return 0L;
        }
    }
}
