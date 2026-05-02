package org.apache.commons.compress.archivers.tar;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Locale;
import org.apache.commons.compress.archivers.ArchiveEntry;
import org.apache.commons.compress.archivers.zip.ZipEncoding;
import org.apache.commons.compress.utils.ArchiveUtils;

/* loaded from: commons-compress-1.10.jar:org/apache/commons/compress/archivers/tar/TarArchiveEntry.class */
public class TarArchiveEntry implements TarConstants, ArchiveEntry {
    private String name;
    private int mode;
    private long userId;
    private long groupId;
    private long size;
    private long modTime;
    private boolean checkSumOK;
    private byte linkFlag;
    private String linkName;
    private String magic;
    private String version;
    private String userName;
    private String groupName;
    private int devMajor;
    private int devMinor;
    private boolean isExtended;
    private long realSize;
    private final File file;
    public static final int MAX_NAMELEN = 31;
    public static final int DEFAULT_DIR_MODE = 16877;
    public static final int DEFAULT_FILE_MODE = 33188;
    public static final int MILLIS_PER_SECOND = 1000;

    private TarArchiveEntry() {
        this.name = "";
        this.userId = 0L;
        this.groupId = 0L;
        this.size = 0L;
        this.linkName = "";
        this.magic = "ustar��";
        this.version = TarConstants.VERSION_POSIX;
        this.groupName = "";
        this.devMajor = 0;
        this.devMinor = 0;
        String user = System.getProperty("user.name", "");
        this.userName = user.length() > 31 ? user.substring(0, 31) : user;
        this.file = null;
    }

    public TarArchiveEntry(String name) {
        this(name, false);
    }

    public TarArchiveEntry(String name, boolean preserveLeadingSlashes) {
        this();
        String name2 = normalizeFileName(name, preserveLeadingSlashes);
        boolean isDir = name2.endsWith("/");
        this.name = name2;
        this.mode = isDir ? DEFAULT_DIR_MODE : DEFAULT_FILE_MODE;
        this.linkFlag = isDir ? (byte) 53 : (byte) 48;
        this.modTime = new Date().getTime() / 1000;
        this.userName = "";
    }

    public TarArchiveEntry(String name, byte linkFlag) {
        this(name, linkFlag, false);
    }

    public TarArchiveEntry(String name, byte linkFlag, boolean preserveLeadingSlashes) {
        this(name, preserveLeadingSlashes);
        this.linkFlag = linkFlag;
        if (linkFlag == 76) {
            this.magic = TarConstants.MAGIC_GNU;
            this.version = TarConstants.VERSION_GNU_SPACE;
        }
    }

    public TarArchiveEntry(File file) {
        this(file, file.getPath());
    }

    public TarArchiveEntry(File file, String fileName) {
        this.name = "";
        this.userId = 0L;
        this.groupId = 0L;
        this.size = 0L;
        this.linkName = "";
        this.magic = "ustar��";
        this.version = TarConstants.VERSION_POSIX;
        this.groupName = "";
        this.devMajor = 0;
        this.devMinor = 0;
        String normalizedName = normalizeFileName(fileName, false);
        this.file = file;
        if (file.isDirectory()) {
            this.mode = DEFAULT_DIR_MODE;
            this.linkFlag = (byte) 53;
            int nameLength = normalizedName.length();
            if (nameLength == 0 || normalizedName.charAt(nameLength - 1) != '/') {
                this.name = normalizedName + "/";
            } else {
                this.name = normalizedName;
            }
        } else {
            this.mode = DEFAULT_FILE_MODE;
            this.linkFlag = (byte) 48;
            this.size = file.length();
            this.name = normalizedName;
        }
        this.modTime = file.lastModified() / 1000;
        this.userName = "";
    }

    public TarArchiveEntry(byte[] headerBuf) {
        this();
        parseTarHeader(headerBuf);
    }

    public TarArchiveEntry(byte[] headerBuf, ZipEncoding encoding) throws IOException {
        this();
        parseTarHeader(headerBuf, encoding);
    }

    public boolean equals(TarArchiveEntry it) {
        return getName().equals(it.getName());
    }

    public boolean equals(Object it) {
        if (it == null || getClass() != it.getClass()) {
            return false;
        }
        return equals((TarArchiveEntry) it);
    }

    public int hashCode() {
        return getName().hashCode();
    }

    public boolean isDescendent(TarArchiveEntry desc) {
        return desc.getName().startsWith(getName());
    }

    @Override // org.apache.commons.compress.archivers.ArchiveEntry
    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = normalizeFileName(name, false);
    }

    public void setMode(int mode) {
        this.mode = mode;
    }

    public String getLinkName() {
        return this.linkName;
    }

    public void setLinkName(String link) {
        this.linkName = link;
    }

    @Deprecated
    public int getUserId() {
        return (int) (this.userId & (-1));
    }

    public void setUserId(int userId) {
        setUserId(userId);
    }

    public long getLongUserId() {
        return this.userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    @Deprecated
    public int getGroupId() {
        return (int) (this.groupId & (-1));
    }

    public void setGroupId(int groupId) {
        setGroupId(groupId);
    }

    public long getLongGroupId() {
        return this.groupId;
    }

    public void setGroupId(long groupId) {
        this.groupId = groupId;
    }

    public String getUserName() {
        return this.userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getGroupName() {
        return this.groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public void setIds(int userId, int groupId) {
        setUserId(userId);
        setGroupId(groupId);
    }

    public void setNames(String userName, String groupName) {
        setUserName(userName);
        setGroupName(groupName);
    }

    public void setModTime(long time) {
        this.modTime = time / 1000;
    }

    public void setModTime(Date time) {
        this.modTime = time.getTime() / 1000;
    }

    public Date getModTime() {
        return new Date(this.modTime * 1000);
    }

    @Override // org.apache.commons.compress.archivers.ArchiveEntry
    public Date getLastModifiedDate() {
        return getModTime();
    }

    public boolean isCheckSumOK() {
        return this.checkSumOK;
    }

    public File getFile() {
        return this.file;
    }

    public int getMode() {
        return this.mode;
    }

    @Override // org.apache.commons.compress.archivers.ArchiveEntry
    public long getSize() {
        return this.size;
    }

    public void setSize(long size) {
        if (size < 0) {
            throw new IllegalArgumentException("Size is out of range: " + size);
        }
        this.size = size;
    }

    public int getDevMajor() {
        return this.devMajor;
    }

    public void setDevMajor(int devNo) {
        if (devNo < 0) {
            throw new IllegalArgumentException("Major device number is out of range: " + devNo);
        }
        this.devMajor = devNo;
    }

    public int getDevMinor() {
        return this.devMinor;
    }

    public void setDevMinor(int devNo) {
        if (devNo < 0) {
            throw new IllegalArgumentException("Minor device number is out of range: " + devNo);
        }
        this.devMinor = devNo;
    }

    public boolean isExtended() {
        return this.isExtended;
    }

    public long getRealSize() {
        return this.realSize;
    }

    public boolean isGNUSparse() {
        return this.linkFlag == 83;
    }

    public boolean isGNULongLinkEntry() {
        return this.linkFlag == 75 && this.name.equals(TarConstants.GNU_LONGLINK);
    }

    public boolean isGNULongNameEntry() {
        return this.linkFlag == 76 && this.name.equals(TarConstants.GNU_LONGLINK);
    }

    public boolean isPaxHeader() {
        return this.linkFlag == 120 || this.linkFlag == 88;
    }

    public boolean isGlobalPaxHeader() {
        return this.linkFlag == 103;
    }

    @Override // org.apache.commons.compress.archivers.ArchiveEntry
    public boolean isDirectory() {
        if (this.file != null) {
            return this.file.isDirectory();
        }
        if (this.linkFlag == 53 || getName().endsWith("/")) {
            return true;
        }
        return false;
    }

    public boolean isFile() {
        if (this.file != null) {
            return this.file.isFile();
        }
        return this.linkFlag == 0 || this.linkFlag == 48 || !getName().endsWith("/");
    }

    public boolean isSymbolicLink() {
        return this.linkFlag == 50;
    }

    public boolean isLink() {
        return this.linkFlag == 49;
    }

    public boolean isCharacterDevice() {
        return this.linkFlag == 51;
    }

    public boolean isBlockDevice() {
        return this.linkFlag == 52;
    }

    public boolean isFIFO() {
        return this.linkFlag == 54;
    }

    public TarArchiveEntry[] getDirectoryEntries() {
        if (this.file == null || !this.file.isDirectory()) {
            return new TarArchiveEntry[0];
        }
        String[] list = this.file.list();
        TarArchiveEntry[] result = new TarArchiveEntry[list.length];
        for (int i = 0; i < list.length; i++) {
            result[i] = new TarArchiveEntry(new File(this.file, list[i]));
        }
        return result;
    }

    public void writeEntryHeader(byte[] outbuf) {
        try {
            writeEntryHeader(outbuf, TarUtils.DEFAULT_ENCODING, false);
        } catch (IOException e) {
            try {
                writeEntryHeader(outbuf, TarUtils.FALLBACK_ENCODING, false);
            } catch (IOException ex2) {
                throw new RuntimeException(ex2);
            }
        }
    }

    public void writeEntryHeader(byte[] outbuf, ZipEncoding encoding, boolean starMode) throws IOException {
        int offset = writeEntryHeaderField(this.modTime, outbuf, writeEntryHeaderField(this.size, outbuf, writeEntryHeaderField(this.groupId, outbuf, writeEntryHeaderField(this.userId, outbuf, writeEntryHeaderField(this.mode, outbuf, TarUtils.formatNameBytes(this.name, outbuf, 0, 100, encoding), 8, starMode), 8, starMode), 8, starMode), 12, starMode), 12, starMode);
        for (int c = 0; c < 8; c++) {
            int i = offset;
            offset++;
            outbuf[i] = 32;
        }
        outbuf[offset] = this.linkFlag;
        int offset2 = writeEntryHeaderField(this.devMinor, outbuf, writeEntryHeaderField(this.devMajor, outbuf, TarUtils.formatNameBytes(this.groupName, outbuf, TarUtils.formatNameBytes(this.userName, outbuf, TarUtils.formatNameBytes(this.version, outbuf, TarUtils.formatNameBytes(this.magic, outbuf, TarUtils.formatNameBytes(this.linkName, outbuf, offset + 1, 100, encoding), 6), 2), 32, encoding), 32, encoding), 8, starMode), 8, starMode);
        while (offset2 < outbuf.length) {
            int i2 = offset2;
            offset2++;
            outbuf[i2] = 0;
        }
        long chk = TarUtils.computeCheckSum(outbuf);
        TarUtils.formatCheckSumOctalBytes(chk, outbuf, offset, 8);
    }

    private int writeEntryHeaderField(long value, byte[] outbuf, int offset, int length, boolean starMode) {
        if (!starMode && (value < 0 || value >= (1 << (3 * (length - 1))))) {
            return TarUtils.formatLongOctalBytes(0L, outbuf, offset, length);
        }
        return TarUtils.formatLongOctalOrBinaryBytes(value, outbuf, offset, length);
    }

    public void parseTarHeader(byte[] header) {
        try {
            parseTarHeader(header, TarUtils.DEFAULT_ENCODING);
        } catch (IOException e) {
            try {
                parseTarHeader(header, TarUtils.DEFAULT_ENCODING, true);
            } catch (IOException ex2) {
                throw new RuntimeException(ex2);
            }
        }
    }

    public void parseTarHeader(byte[] header, ZipEncoding encoding) throws IOException {
        parseTarHeader(header, encoding, false);
    }

    private void parseTarHeader(byte[] header, ZipEncoding encoding, boolean oldStyle) throws IOException {
        this.name = oldStyle ? TarUtils.parseName(header, 0, 100) : TarUtils.parseName(header, 0, 100, encoding);
        int offset = 0 + 100;
        this.mode = (int) TarUtils.parseOctalOrBinary(header, offset, 8);
        this.userId = (int) TarUtils.parseOctalOrBinary(header, r10, 8);
        this.groupId = (int) TarUtils.parseOctalOrBinary(header, r10, 8);
        int offset2 = offset + 8 + 8 + 8;
        this.size = TarUtils.parseOctalOrBinary(header, offset2, 12);
        int offset3 = offset2 + 12;
        this.modTime = TarUtils.parseOctalOrBinary(header, offset3, 12);
        this.checkSumOK = TarUtils.verifyCheckSum(header);
        int offset4 = offset3 + 12 + 8;
        int offset5 = offset4 + 1;
        this.linkFlag = header[offset4];
        this.linkName = oldStyle ? TarUtils.parseName(header, offset5, 100) : TarUtils.parseName(header, offset5, 100, encoding);
        int offset6 = offset5 + 100;
        this.magic = TarUtils.parseName(header, offset6, 6);
        int offset7 = offset6 + 6;
        this.version = TarUtils.parseName(header, offset7, 2);
        int offset8 = offset7 + 2;
        this.userName = oldStyle ? TarUtils.parseName(header, offset8, 32) : TarUtils.parseName(header, offset8, 32, encoding);
        int offset9 = offset8 + 32;
        this.groupName = oldStyle ? TarUtils.parseName(header, offset9, 32) : TarUtils.parseName(header, offset9, 32, encoding);
        int offset10 = offset9 + 32;
        this.devMajor = (int) TarUtils.parseOctalOrBinary(header, offset10, 8);
        int offset11 = offset10 + 8;
        this.devMinor = (int) TarUtils.parseOctalOrBinary(header, offset11, 8);
        int offset12 = offset11 + 8;
        int type = evaluateType(header);
        switch (type) {
            case 2:
                int offset13 = offset12 + 12 + 12 + 12 + 4 + 1 + 96;
                this.isExtended = TarUtils.parseBoolean(header, offset13);
                int offset14 = offset13 + 1;
                this.realSize = TarUtils.parseOctal(header, offset14, 12);
                int i = offset14 + 12;
                break;
            case 3:
            default:
                String prefix = oldStyle ? TarUtils.parseName(header, offset12, TarConstants.PREFIXLEN) : TarUtils.parseName(header, offset12, TarConstants.PREFIXLEN, encoding);
                if (isDirectory() && !this.name.endsWith("/")) {
                    this.name += "/";
                }
                if (prefix.length() > 0) {
                    this.name = prefix + "/" + this.name;
                    break;
                }
                break;
        }
    }

    private static String normalizeFileName(String fileName, boolean preserveLeadingSlashes) {
        String fileName2;
        int colon;
        String osname = System.getProperty("os.name").toLowerCase(Locale.ENGLISH);
        if (osname != null) {
            if (osname.startsWith("windows")) {
                if (fileName.length() > 2) {
                    char ch1 = fileName.charAt(0);
                    char ch2 = fileName.charAt(1);
                    if (ch2 == ':' && ((ch1 >= 'a' && ch1 <= 'z') || (ch1 >= 'A' && ch1 <= 'Z'))) {
                        fileName = fileName.substring(2);
                    }
                }
            } else if (osname.contains("netware") && (colon = fileName.indexOf(58)) != -1) {
                fileName = fileName.substring(colon + 1);
            }
        }
        String replace = fileName.replace(File.separatorChar, '/');
        while (true) {
            fileName2 = replace;
            if (preserveLeadingSlashes || !fileName2.startsWith("/")) {
                break;
            }
            replace = fileName2.substring(1);
        }
        return fileName2;
    }

    private int evaluateType(byte[] header) {
        if (ArchiveUtils.matchAsciiBuffer(TarConstants.MAGIC_GNU, header, TarConstants.MAGIC_OFFSET, 6)) {
            return 2;
        }
        if (ArchiveUtils.matchAsciiBuffer("ustar��", header, TarConstants.MAGIC_OFFSET, 6)) {
            return 3;
        }
        return 0;
    }
}
