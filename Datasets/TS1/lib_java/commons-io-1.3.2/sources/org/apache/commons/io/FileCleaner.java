package org.apache.commons.io;

import java.io.File;

/* loaded from: commons-io-1.3.2.jar:org/apache/commons/io/FileCleaner.class */
public class FileCleaner {
    static final FileCleaningTracker theInstance = new FileCleaningTracker();

    public static void track(File file, Object marker) {
        theInstance.track(file, marker);
    }

    public static void track(File file, Object marker, FileDeleteStrategy deleteStrategy) {
        theInstance.track(file, marker, deleteStrategy);
    }

    public static void track(String path, Object marker) {
        theInstance.track(path, marker);
    }

    public static void track(String path, Object marker, FileDeleteStrategy deleteStrategy) {
        theInstance.track(path, marker, deleteStrategy);
    }

    public static int getTrackCount() {
        return theInstance.getTrackCount();
    }

    public static synchronized void exitWhenFinished() {
        theInstance.exitWhenFinished();
    }

    public static FileCleaningTracker getInstance() {
        return theInstance;
    }
}
