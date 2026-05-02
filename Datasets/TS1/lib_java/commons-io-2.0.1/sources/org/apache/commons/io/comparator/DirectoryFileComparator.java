package org.apache.commons.io.comparator;

import java.io.File;
import java.io.Serializable;
import java.util.Comparator;

/* loaded from: commons-io-2.0.1.jar:org/apache/commons/io/comparator/DirectoryFileComparator.class */
public class DirectoryFileComparator extends AbstractFileComparator implements Serializable {
    public static final Comparator<File> DIRECTORY_COMPARATOR = new DirectoryFileComparator();
    public static final Comparator<File> DIRECTORY_REVERSE = new ReverseComparator(DIRECTORY_COMPARATOR);

    @Override // java.util.Comparator
    public int compare(File file1, File file2) {
        return getType(file1) - getType(file2);
    }

    private int getType(File file) {
        if (file.isDirectory()) {
            return 1;
        }
        return 2;
    }
}
