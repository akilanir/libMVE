package com.danikula.videocache.file;

import java.io.File;
import java.io.IOException;

/* loaded from: videocache-2.3.3.jar:com/danikula/videocache/file/DiskUsage.class */
public interface DiskUsage {
    void touch(File file) throws IOException;
}
