package com.google.android.exoplayer.upstream.cache;

import com.google.android.exoplayer.upstream.DataSink;
import com.google.android.exoplayer.upstream.DataSpec;
import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.Util;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/upstream/cache/CacheDataSink.class */
public final class CacheDataSink implements DataSink {
    private final Cache cache;
    private final long maxCacheFileSize;
    private DataSpec dataSpec;
    private File file;
    private FileOutputStream outputStream;
    private long outputStreamBytesWritten;
    private long dataSpecBytesWritten;

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/upstream/cache/CacheDataSink$CacheDataSinkException.class */
    public static class CacheDataSinkException extends IOException {
        public CacheDataSinkException(IOException cause) {
            super(cause);
        }
    }

    public CacheDataSink(Cache cache, long maxCacheFileSize) {
        this.cache = (Cache) Assertions.checkNotNull(cache);
        this.maxCacheFileSize = maxCacheFileSize;
    }

    @Override // com.google.android.exoplayer.upstream.DataSink
    public DataSink open(DataSpec dataSpec) throws CacheDataSinkException {
        Assertions.checkState(dataSpec.length != -1);
        try {
            this.dataSpec = dataSpec;
            this.dataSpecBytesWritten = 0L;
            openNextOutputStream();
            return this;
        } catch (FileNotFoundException e) {
            throw new CacheDataSinkException(e);
        }
    }

    @Override // com.google.android.exoplayer.upstream.DataSink
    public void write(byte[] buffer, int offset, int length) throws CacheDataSinkException {
        int bytesWritten = 0;
        while (bytesWritten < length) {
            try {
                if (this.outputStreamBytesWritten == this.maxCacheFileSize) {
                    closeCurrentOutputStream();
                    openNextOutputStream();
                }
                int bytesToWrite = (int) Math.min(length - bytesWritten, this.maxCacheFileSize - this.outputStreamBytesWritten);
                this.outputStream.write(buffer, offset + bytesWritten, bytesToWrite);
                bytesWritten += bytesToWrite;
                this.outputStreamBytesWritten += bytesToWrite;
                this.dataSpecBytesWritten += bytesToWrite;
            } catch (IOException e) {
                throw new CacheDataSinkException(e);
            }
        }
    }

    @Override // com.google.android.exoplayer.upstream.DataSink
    public void close() throws CacheDataSinkException {
        try {
            closeCurrentOutputStream();
        } catch (IOException e) {
            throw new CacheDataSinkException(e);
        }
    }

    private void openNextOutputStream() throws FileNotFoundException {
        this.file = this.cache.startFile(this.dataSpec.key, this.dataSpec.absoluteStreamPosition + this.dataSpecBytesWritten, Math.min(this.dataSpec.length - this.dataSpecBytesWritten, this.maxCacheFileSize));
        this.outputStream = new FileOutputStream(this.file);
        this.outputStreamBytesWritten = 0L;
    }

    private void closeCurrentOutputStream() throws IOException {
        if (this.outputStream == null) {
            return;
        }
        boolean success = false;
        try {
            this.outputStream.flush();
            this.outputStream.getFD().sync();
            success = true;
            Util.closeQuietly(this.outputStream);
            if (1 != 0) {
                this.cache.commitFile(this.file);
            } else {
                this.file.delete();
            }
            this.outputStream = null;
            this.file = null;
        } catch (Throwable th) {
            Util.closeQuietly(this.outputStream);
            if (success) {
                this.cache.commitFile(this.file);
            } else {
                this.file.delete();
            }
            this.outputStream = null;
            this.file = null;
            throw th;
        }
    }
}
