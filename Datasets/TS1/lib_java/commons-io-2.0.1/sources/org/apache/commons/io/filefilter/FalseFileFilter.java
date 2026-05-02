package org.apache.commons.io.filefilter;

import java.io.File;
import java.io.Serializable;

/* loaded from: commons-io-2.0.1.jar:org/apache/commons/io/filefilter/FalseFileFilter.class */
public class FalseFileFilter implements IOFileFilter, Serializable {
    public static final IOFileFilter FALSE = new FalseFileFilter();
    public static final IOFileFilter INSTANCE = FALSE;

    protected FalseFileFilter() {
    }

    @Override // org.apache.commons.io.filefilter.IOFileFilter, java.io.FileFilter
    public boolean accept(File file) {
        return false;
    }

    @Override // org.apache.commons.io.filefilter.IOFileFilter, java.io.FilenameFilter
    public boolean accept(File dir, String name) {
        return false;
    }
}
