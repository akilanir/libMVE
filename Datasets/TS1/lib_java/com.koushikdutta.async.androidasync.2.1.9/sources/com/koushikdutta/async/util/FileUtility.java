package com.koushikdutta.async.util;

import java.io.File;

/* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/util/FileUtility.class */
public class FileUtility {
    public static boolean deleteDirectory(File path) {
        File[] files;
        if (path.exists() && (files = path.listFiles()) != null) {
            for (int i = 0; i < files.length; i++) {
                if (files[i].isDirectory()) {
                    deleteDirectory(files[i]);
                } else {
                    files[i].delete();
                }
            }
        }
        return path.delete();
    }
}
