package com.danikula.videocache;

import com.danikula.videocache.file.DiskUsage;
import com.danikula.videocache.file.FileNameGenerator;
import java.io.File;

/* loaded from: videocache-2.3.3.jar:com/danikula/videocache/Config.class */
class Config {
    public final File cacheRoot;
    public final FileNameGenerator fileNameGenerator;
    public final DiskUsage diskUsage;

    Config(File cacheRoot, FileNameGenerator fileNameGenerator, DiskUsage diskUsage) {
        this.cacheRoot = cacheRoot;
        this.fileNameGenerator = fileNameGenerator;
        this.diskUsage = diskUsage;
    }

    File generateCacheFile(String url) {
        String name = this.fileNameGenerator.generate(url);
        return new File(this.cacheRoot, name);
    }
}
