package org.apache.commons.io.filefilter;

import java.io.File;
import java.io.Serializable;

/* loaded from: commons-io-2.0.1.jar:org/apache/commons/io/filefilter/TrueFileFilter.class */
public class TrueFileFilter implements IOFileFilter, Serializable {
    public static final IOFileFilter TRUE = new TrueFileFilter();
    public static final IOFileFilter INSTANCE = TRUE;

    protected TrueFileFilter() {
    }

    @Override // org.apache.commons.io.filefilter.IOFileFilter, java.io.FileFilter
    public boolean accept(File file) {
        return true;
    }

    @Override // org.apache.commons.io.filefilter.IOFileFilter, java.io.FilenameFilter
    public boolean accept(File dir, String name) {
        return true;
    }
}
