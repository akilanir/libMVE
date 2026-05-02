package com.danikula.videocache.file;

import android.util.Log;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/* loaded from: videocache-2.3.3.jar:com/danikula/videocache/file/LruDiskUsage.class */
abstract class LruDiskUsage implements DiskUsage {
    private static final String LOG_TAG = "ProxyCache";
    private final ExecutorService workerThread = Executors.newSingleThreadExecutor();

    protected abstract boolean accept(File file, long j, int i);

    LruDiskUsage() {
    }

    @Override // com.danikula.videocache.file.DiskUsage
    public void touch(File file) throws IOException {
        this.workerThread.submit(new TouchCallable(file));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void touchInBackground(File file) throws IOException {
        Files.setLastModifiedNow(file);
        List<File> files = Files.getLruListFiles(file.getParentFile());
        trim(files);
    }

    private void trim(List<File> files) {
        long totalSize = countTotalSize(files);
        int totalCount = files.size();
        for (File file : files) {
            boolean accepted = accept(file, totalSize, totalCount);
            if (!accepted) {
                long fileSize = file.length();
                boolean deleted = file.delete();
                if (deleted) {
                    totalCount--;
                    totalSize -= fileSize;
                    Log.i(LOG_TAG, "Cache file " + file + " is deleted because it exceeds cache limit");
                } else {
                    Log.e(LOG_TAG, "Error deleting file " + file + " for trimming cache");
                }
            }
        }
    }

    private long countTotalSize(List<File> files) {
        long totalSize = 0;
        for (File file : files) {
            totalSize += file.length();
        }
        return totalSize;
    }

    /* loaded from: videocache-2.3.3.jar:com/danikula/videocache/file/LruDiskUsage$TouchCallable.class */
    private class TouchCallable implements Callable<Void> {
        private final File file;

        public TouchCallable(File file) {
            this.file = file;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // java.util.concurrent.Callable
        public Void call() throws Exception {
            LruDiskUsage.this.touchInBackground(this.file);
            return null;
        }
    }
}
