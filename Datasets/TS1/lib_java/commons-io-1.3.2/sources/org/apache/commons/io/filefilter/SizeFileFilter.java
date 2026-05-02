package org.apache.commons.io.filefilter;

import java.io.File;

/* loaded from: commons-io-1.3.2.jar:org/apache/commons/io/filefilter/SizeFileFilter.class */
public class SizeFileFilter extends AbstractFileFilter {
    private long size;
    private boolean acceptLarger;

    public SizeFileFilter(long size) {
        this(size, true);
    }

    public SizeFileFilter(long size, boolean acceptLarger) {
        if (size < 0) {
            throw new IllegalArgumentException("The size must be non-negative");
        }
        this.size = size;
        this.acceptLarger = acceptLarger;
    }

    @Override // org.apache.commons.io.filefilter.AbstractFileFilter, org.apache.commons.io.filefilter.IOFileFilter, java.io.FileFilter
    public boolean accept(File file) {
        boolean smaller = file.length() < this.size;
        return this.acceptLarger ? !smaller : smaller;
    }
}
