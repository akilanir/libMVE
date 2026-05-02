package org.apache.commons.io.filefilter;

import java.io.File;
import java.io.FileFilter;
import java.io.FilenameFilter;

/* loaded from: commons-io-1.3.2.jar:org/apache/commons/io/filefilter/IOFileFilter.class */
public interface IOFileFilter extends FileFilter, FilenameFilter {
    @Override // java.io.FileFilter
    boolean accept(File file);

    boolean accept(File file, String str);
}
