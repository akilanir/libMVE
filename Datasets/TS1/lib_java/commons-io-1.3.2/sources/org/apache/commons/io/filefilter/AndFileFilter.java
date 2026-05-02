package org.apache.commons.io.filefilter;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* loaded from: commons-io-1.3.2.jar:org/apache/commons/io/filefilter/AndFileFilter.class */
public class AndFileFilter extends AbstractFileFilter implements ConditionalFileFilter {
    private List fileFilters;

    public AndFileFilter() {
        this.fileFilters = new ArrayList();
    }

    public AndFileFilter(List fileFilters) {
        if (fileFilters == null) {
            this.fileFilters = new ArrayList();
        } else {
            this.fileFilters = new ArrayList(fileFilters);
        }
    }

    public AndFileFilter(IOFileFilter filter1, IOFileFilter filter2) {
        if (filter1 == null || filter2 == null) {
            throw new IllegalArgumentException("The filters must not be null");
        }
        this.fileFilters = new ArrayList();
        addFileFilter(filter1);
        addFileFilter(filter2);
    }

    @Override // org.apache.commons.io.filefilter.ConditionalFileFilter
    public void addFileFilter(IOFileFilter ioFileFilter) {
        this.fileFilters.add(ioFileFilter);
    }

    @Override // org.apache.commons.io.filefilter.ConditionalFileFilter
    public List getFileFilters() {
        return Collections.unmodifiableList(this.fileFilters);
    }

    @Override // org.apache.commons.io.filefilter.ConditionalFileFilter
    public boolean removeFileFilter(IOFileFilter ioFileFilter) {
        return this.fileFilters.remove(ioFileFilter);
    }

    @Override // org.apache.commons.io.filefilter.ConditionalFileFilter
    public void setFileFilters(List fileFilters) {
        this.fileFilters = new ArrayList(fileFilters);
    }

    @Override // org.apache.commons.io.filefilter.AbstractFileFilter, org.apache.commons.io.filefilter.IOFileFilter, java.io.FileFilter
    public boolean accept(File file) {
        if (this.fileFilters.size() == 0) {
            return false;
        }
        for (IOFileFilter fileFilter : this.fileFilters) {
            if (!fileFilter.accept(file)) {
                return false;
            }
        }
        return true;
    }

    @Override // org.apache.commons.io.filefilter.AbstractFileFilter, org.apache.commons.io.filefilter.IOFileFilter, java.io.FilenameFilter
    public boolean accept(File file, String name) {
        if (this.fileFilters.size() == 0) {
            return false;
        }
        for (IOFileFilter fileFilter : this.fileFilters) {
            if (!fileFilter.accept(file, name)) {
                return false;
            }
        }
        return true;
    }
}
