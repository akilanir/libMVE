package org.apache.commons.io;

import java.io.File;
import java.io.IOException;

/* loaded from: commons-io-1.3.2.jar:org/apache/commons/io/FileDeleteStrategy.class */
public class FileDeleteStrategy {
    public static final FileDeleteStrategy NORMAL = new FileDeleteStrategy("Normal");
    public static final FileDeleteStrategy FORCE = new ForceFileDeleteStrategy();
    private final String name;

    protected FileDeleteStrategy(String name) {
        this.name = name;
    }

    public boolean deleteQuietly(File fileToDelete) {
        if (fileToDelete == null || !fileToDelete.exists()) {
            return true;
        }
        try {
            return doDelete(fileToDelete);
        } catch (IOException e) {
            return false;
        }
    }

    public void delete(File fileToDelete) throws IOException {
        if (fileToDelete.exists() && !doDelete(fileToDelete)) {
            throw new IOException(new StringBuffer().append("Deletion failed: ").append(fileToDelete).toString());
        }
    }

    protected boolean doDelete(File fileToDelete) throws IOException {
        return fileToDelete.delete();
    }

    public String toString() {
        return new StringBuffer().append("FileDeleteStrategy[").append(this.name).append("]").toString();
    }

    /* loaded from: commons-io-1.3.2.jar:org/apache/commons/io/FileDeleteStrategy$ForceFileDeleteStrategy.class */
    static class ForceFileDeleteStrategy extends FileDeleteStrategy {
        ForceFileDeleteStrategy() {
            super("Force");
        }

        @Override // org.apache.commons.io.FileDeleteStrategy
        protected boolean doDelete(File fileToDelete) throws IOException {
            FileUtils.forceDelete(fileToDelete);
            return true;
        }
    }
}
