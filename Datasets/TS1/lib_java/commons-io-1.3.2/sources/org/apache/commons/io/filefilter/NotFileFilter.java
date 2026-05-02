package org.apache.commons.io.filefilter;

import java.io.File;

/* loaded from: commons-io-1.3.2.jar:org/apache/commons/io/filefilter/NotFileFilter.class */
public class NotFileFilter extends AbstractFileFilter {
    private IOFileFilter filter;

    public NotFileFilter(IOFileFilter filter) {
        if (filter == null) {
            throw new IllegalArgumentException("The filter must not be null");
        }
        this.filter = filter;
    }

    @Override // org.apache.commons.io.filefilter.AbstractFileFilter, org.apache.commons.io.filefilter.IOFileFilter, java.io.FileFilter
    public boolean accept(File file) {
        return !this.filter.accept(file);
    }

    @Override // org.apache.commons.io.filefilter.AbstractFileFilter, org.apache.commons.io.filefilter.IOFileFilter, java.io.FilenameFilter
    public boolean accept(File file, String name) {
        return !this.filter.accept(file, name);
    }
}
