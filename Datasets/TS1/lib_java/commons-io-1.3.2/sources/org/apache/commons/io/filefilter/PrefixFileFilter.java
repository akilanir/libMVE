package org.apache.commons.io.filefilter;

import java.io.File;
import java.util.List;

/* loaded from: commons-io-1.3.2.jar:org/apache/commons/io/filefilter/PrefixFileFilter.class */
public class PrefixFileFilter extends AbstractFileFilter {
    private String[] prefixes;

    public PrefixFileFilter(String prefix) {
        if (prefix == null) {
            throw new IllegalArgumentException("The prefix must not be null");
        }
        this.prefixes = new String[]{prefix};
    }

    public PrefixFileFilter(String[] prefixes) {
        if (prefixes == null) {
            throw new IllegalArgumentException("The array of prefixes must not be null");
        }
        this.prefixes = prefixes;
    }

    public PrefixFileFilter(List prefixes) {
        if (prefixes == null) {
            throw new IllegalArgumentException("The list of prefixes must not be null");
        }
        this.prefixes = (String[]) prefixes.toArray(new String[prefixes.size()]);
    }

    @Override // org.apache.commons.io.filefilter.AbstractFileFilter, org.apache.commons.io.filefilter.IOFileFilter, java.io.FileFilter
    public boolean accept(File file) {
        String name = file.getName();
        for (int i = 0; i < this.prefixes.length; i++) {
            if (name.startsWith(this.prefixes[i])) {
                return true;
            }
        }
        return false;
    }

    @Override // org.apache.commons.io.filefilter.AbstractFileFilter, org.apache.commons.io.filefilter.IOFileFilter, java.io.FilenameFilter
    public boolean accept(File file, String name) {
        for (int i = 0; i < this.prefixes.length; i++) {
            if (name.startsWith(this.prefixes[i])) {
                return true;
            }
        }
        return false;
    }
}
