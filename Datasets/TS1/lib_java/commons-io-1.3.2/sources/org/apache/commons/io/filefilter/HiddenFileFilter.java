package org.apache.commons.io.filefilter;

import java.io.File;

/* loaded from: commons-io-1.3.2.jar:org/apache/commons/io/filefilter/HiddenFileFilter.class */
public class HiddenFileFilter extends AbstractFileFilter {
    public static final IOFileFilter HIDDEN = new HiddenFileFilter();
    public static final IOFileFilter VISIBLE = new NotFileFilter(HIDDEN);

    protected HiddenFileFilter() {
    }

    @Override // org.apache.commons.io.filefilter.AbstractFileFilter, org.apache.commons.io.filefilter.IOFileFilter, java.io.FileFilter
    public boolean accept(File file) {
        return file.isHidden();
    }
}
