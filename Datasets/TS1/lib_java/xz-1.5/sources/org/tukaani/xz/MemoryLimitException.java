package org.tukaani.xz;

/* loaded from: xz-1.5.jar:org/tukaani/xz/MemoryLimitException.class */
public class MemoryLimitException extends XZIOException {
    private static final long serialVersionUID = 3;
    private final int memoryNeeded;
    private final int memoryLimit;

    public MemoryLimitException(int i, int i2) {
        super(new StringBuffer().append("").append(i).append(" KiB of memory would be needed; limit was ").append(i2).append(" KiB").toString());
        this.memoryNeeded = i;
        this.memoryLimit = i2;
    }

    public int getMemoryNeeded() {
        return this.memoryNeeded;
    }

    public int getMemoryLimit() {
        return this.memoryLimit;
    }
}
