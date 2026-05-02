package org.apache.commons.io.filefilter;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* loaded from: commons-io-1.3.2.jar:org/apache/commons/io/filefilter/OrFileFilter.class */
public class OrFileFilter extends AbstractFileFilter implements ConditionalFileFilter {
    private List fileFilters;

    public OrFileFilter() {
        this.fileFilters = new ArrayList();
    }

    public OrFileFilter(List fileFilters) {
        if (fileFilters == null) {
            this.fileFilters = new ArrayList();
        } else {
            this.fileFilters = new ArrayList(fileFilters);
        }
    }

    public OrFileFilter(IOFileFilter filter1, IOFileFilter filter2) {
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
        this.fileFilters = fileFilters;
    }

    @Override // org.apache.commons.io.filefilter.AbstractFileFilter, org.apache.commons.io.filefilter.IOFileFilter, java.io.FileFilter
    public boolean accept(File file) {
        for (IOFileFilter fileFilter : this.fileFilters) {
            if (fileFilter.accept(file)) {
                return true;
            }
        }
        return false;
    }

    @Override // org.apache.commons.io.filefilter.AbstractFileFilter, org.apache.commons.io.filefilter.IOFileFilter, java.io.FilenameFilter
    public boolean accept(File file, String name) {
        for (IOFileFilter fileFilter : this.fileFilters) {
            if (fileFilter.accept(file, name)) {
                return true;
            }
        }
        return false;
    }
}
