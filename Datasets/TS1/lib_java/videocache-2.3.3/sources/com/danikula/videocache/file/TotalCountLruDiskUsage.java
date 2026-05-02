package com.danikula.videocache.file;

import java.io.File;
import java.io.IOException;

/* loaded from: videocache-2.3.3.jar:com/danikula/videocache/file/TotalCountLruDiskUsage.class */
public class TotalCountLruDiskUsage extends LruDiskUsage {
    private final int maxCount;

    @Override // com.danikula.videocache.file.LruDiskUsage, com.danikula.videocache.file.DiskUsage
    public /* bridge */ /* synthetic */ void touch(File x0) throws IOException {
        super.touch(x0);
    }

    public TotalCountLruDiskUsage(int maxCount) {
        if (maxCount <= 0) {
            throw new IllegalArgumentException("Max count must be positive number!");
        }
        this.maxCount = maxCount;
    }

    @Override // com.danikula.videocache.file.LruDiskUsage
    protected boolean accept(File file, long totalSize, int totalCount) {
        return totalCount <= this.maxCount;
    }
}
