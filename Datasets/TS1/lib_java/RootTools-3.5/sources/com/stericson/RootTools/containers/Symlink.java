package com.stericson.RootTools.containers;

import java.io.File;

/* loaded from: RootTools-3.5.jar:com/stericson/RootTools/containers/Symlink.class */
public class Symlink {
    protected final File file;
    protected final File symlinkPath;

    public Symlink(File file, File path) {
        this.file = file;
        this.symlinkPath = path;
    }

    public File getFile() {
        return this.file;
    }

    public File getSymlinkPath() {
        return this.symlinkPath;
    }
}
