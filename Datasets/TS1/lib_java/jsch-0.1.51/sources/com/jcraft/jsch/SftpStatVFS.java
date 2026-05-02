package com.jcraft.jsch;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/SftpStatVFS.class */
public class SftpStatVFS {
    private long bsize;
    private long frsize;
    private long blocks;
    private long bfree;
    private long bavail;
    private long files;
    private long ffree;
    private long favail;
    private long fsid;
    private long flag;
    private long namemax;
    long size;
    int uid;
    int gid;
    int permissions;
    int atime;
    int mtime;
    int flags = 0;
    String[] extended = null;

    private SftpStatVFS() {
    }

    static SftpStatVFS getStatVFS(Buffer buf) {
        SftpStatVFS statvfs = new SftpStatVFS();
        statvfs.bsize = buf.getLong();
        statvfs.frsize = buf.getLong();
        statvfs.blocks = buf.getLong();
        statvfs.bfree = buf.getLong();
        statvfs.bavail = buf.getLong();
        statvfs.files = buf.getLong();
        statvfs.ffree = buf.getLong();
        statvfs.favail = buf.getLong();
        statvfs.fsid = buf.getLong();
        int flag = (int) buf.getLong();
        statvfs.namemax = buf.getLong();
        statvfs.flag = (flag & 1) != 0 ? 1L : 0L;
        statvfs.flag |= (flag & 2) != 0 ? 2L : 0L;
        return statvfs;
    }

    public long getBlockSize() {
        return this.bsize;
    }

    public long getFragmentSize() {
        return this.frsize;
    }

    public long getBlocks() {
        return this.blocks;
    }

    public long getFreeBlocks() {
        return this.bfree;
    }

    public long getAvailBlocks() {
        return this.bavail;
    }

    public long getINodes() {
        return this.files;
    }

    public long getFreeINodes() {
        return this.ffree;
    }

    public long getAvailINodes() {
        return this.favail;
    }

    public long getFileSystemID() {
        return this.fsid;
    }

    public long getMountFlag() {
        return this.flag;
    }

    public long getMaximumFilenameLength() {
        return this.namemax;
    }

    public long getSize() {
        return (getFragmentSize() * getBlocks()) / 1024;
    }

    public long getUsed() {
        return (getFragmentSize() * (getBlocks() - getFreeBlocks())) / 1024;
    }

    public long getAvailForNonRoot() {
        return (getFragmentSize() * getAvailBlocks()) / 1024;
    }

    public long getAvail() {
        return (getFragmentSize() * getFreeBlocks()) / 1024;
    }

    public int getCapacity() {
        return (int) ((100 * (getBlocks() - getFreeBlocks())) / getBlocks());
    }
}
