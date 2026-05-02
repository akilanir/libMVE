package com.google.android.exoplayer.upstream;

import android.content.ContentResolver;
import android.content.Context;
import android.content.res.AssetFileDescriptor;
import java.io.EOFException;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/upstream/ContentDataSource.class */
public final class ContentDataSource implements UriDataSource {
    private final ContentResolver resolver;
    private final TransferListener listener;
    private InputStream inputStream;
    private String uriString;
    private long bytesRemaining;
    private boolean opened;

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/upstream/ContentDataSource$ContentDataSourceException.class */
    public static class ContentDataSourceException extends IOException {
        public ContentDataSourceException(IOException cause) {
            super(cause);
        }
    }

    public ContentDataSource(Context context) {
        this(context, null);
    }

    public ContentDataSource(Context context, TransferListener listener) {
        this.resolver = context.getContentResolver();
        this.listener = listener;
    }

    @Override // com.google.android.exoplayer.upstream.DataSource
    public long open(DataSpec dataSpec) throws ContentDataSourceException {
        try {
            this.uriString = dataSpec.uri.toString();
            AssetFileDescriptor assetFd = this.resolver.openAssetFileDescriptor(dataSpec.uri, "r");
            this.inputStream = new FileInputStream(assetFd.getFileDescriptor());
            long skipped = this.inputStream.skip(dataSpec.position);
            if (skipped < dataSpec.position) {
                throw new EOFException();
            }
            if (dataSpec.length != -1) {
                this.bytesRemaining = dataSpec.length;
            } else {
                this.bytesRemaining = this.inputStream.available();
                if (this.bytesRemaining == 0) {
                    this.bytesRemaining = -1L;
                }
            }
            this.opened = true;
            if (this.listener != null) {
                this.listener.onTransferStart();
            }
            return this.bytesRemaining;
        } catch (IOException e) {
            throw new ContentDataSourceException(e);
        }
    }

    @Override // com.google.android.exoplayer.upstream.DataSource
    public int read(byte[] buffer, int offset, int readLength) throws ContentDataSourceException {
        if (this.bytesRemaining == 0) {
            return -1;
        }
        try {
            int bytesToRead = this.bytesRemaining == -1 ? readLength : (int) Math.min(this.bytesRemaining, readLength);
            int bytesRead = this.inputStream.read(buffer, offset, bytesToRead);
            if (bytesRead > 0) {
                if (this.bytesRemaining != -1) {
                    this.bytesRemaining -= bytesRead;
                }
                if (this.listener != null) {
                    this.listener.onBytesTransferred(bytesRead);
                }
            }
            return bytesRead;
        } catch (IOException e) {
            throw new ContentDataSourceException(e);
        }
    }

    @Override // com.google.android.exoplayer.upstream.UriDataSource
    public String getUri() {
        return this.uriString;
    }

    @Override // com.google.android.exoplayer.upstream.DataSource
    public void close() throws ContentDataSourceException {
        this.uriString = null;
        try {
            if (this.inputStream != null) {
                try {
                    this.inputStream.close();
                    this.inputStream = null;
                    if (this.opened) {
                        this.opened = false;
                        if (this.listener != null) {
                            this.listener.onTransferEnd();
                        }
                    }
                } catch (IOException e) {
                    throw new ContentDataSourceException(e);
                }
            }
        } catch (Throwable th) {
            this.inputStream = null;
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
