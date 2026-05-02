package com.google.android.exoplayer.upstream;

import java.io.EOFException;
import java.io.IOException;
import java.io.RandomAccessFile;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/upstream/FileDataSource.class */
public final class FileDataSource implements UriDataSource {
    private final TransferListener listener;
    private RandomAccessFile file;
    private String uriString;
    private long bytesRemaining;
    private boolean opened;

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/upstream/FileDataSource$FileDataSourceException.class */
    public static class FileDataSourceException extends IOException {
        public FileDataSourceException(IOException cause) {
            super(cause);
        }
    }

    public FileDataSource() {
        this(null);
    }

    public FileDataSource(TransferListener listener) {
        this.listener = listener;
    }

    @Override // com.google.android.exoplayer.upstream.DataSource
    public long open(DataSpec dataSpec) throws FileDataSourceException {
        try {
            this.uriString = dataSpec.uri.toString();
            this.file = new RandomAccessFile(dataSpec.uri.getPath(), "r");
            this.file.seek(dataSpec.position);
            this.bytesRemaining = dataSpec.length == -1 ? this.file.length() - dataSpec.position : dataSpec.length;
            if (this.bytesRemaining < 0) {
                throw new EOFException();
            }
            this.opened = true;
            if (this.listener != null) {
                this.listener.onTransferStart();
            }
            return this.bytesRemaining;
        } catch (IOException e) {
            throw new FileDataSourceException(e);
        }
    }

    @Override // com.google.android.exoplayer.upstream.DataSource
    public int read(byte[] buffer, int offset, int readLength) throws FileDataSourceException {
        if (this.bytesRemaining == 0) {
            return -1;
        }
        try {
            int bytesRead = this.file.read(buffer, offset, (int) Math.min(this.bytesRemaining, readLength));
            if (bytesRead > 0) {
                this.bytesRemaining -= bytesRead;
                if (this.listener != null) {
                    this.listener.onBytesTransferred(bytesRead);
                }
            }
            return bytesRead;
        } catch (IOException e) {
            throw new FileDataSourceException(e);
        }
    }

    @Override // com.google.android.exoplayer.upstream.UriDataSource
    public String getUri() {
        return this.uriString;
    }

    @Override // com.google.android.exoplayer.upstream.DataSource
    public void close() throws FileDataSourceException {
        this.uriString = null;
        try {
            if (this.file != null) {
                try {
                    this.file.close();
                    this.file = null;
                    if (this.opened) {
                        this.opened = false;
                        if (this.listener != null) {
                            this.listener.onTransferEnd();
                        }
                    }
                } catch (IOException e) {
                    throw new FileDataSourceException(e);
                }
            }
        } catch (Throwable th) {
            this.file = null;
            if (this.opened) {
                this.opened = false;
                if (this.listener != null) {
                    this.listener.onTransferEnd();
                }
            }
            throw th;
        }
    }
}
