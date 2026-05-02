package com.google.android.exoplayer.upstream;

import android.content.Context;
import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.Util;
import java.io.IOException;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/upstream/DefaultUriDataSource.class */
public final class DefaultUriDataSource implements UriDataSource {
    private static final String SCHEME_ASSET = "asset";
    private static final String SCHEME_CONTENT = "content";
    private final UriDataSource httpDataSource;
    private final UriDataSource fileDataSource;
    private final UriDataSource assetDataSource;
    private final UriDataSource contentDataSource;
    private UriDataSource dataSource;

    public DefaultUriDataSource(Context context, String userAgent) {
        this(context, null, userAgent, false);
    }

    public DefaultUriDataSource(Context context, TransferListener listener, String userAgent) {
        this(context, listener, userAgent, false);
    }

    public DefaultUriDataSource(Context context, TransferListener listener, String userAgent, boolean allowCrossProtocolRedirects) {
        this(context, listener, new DefaultHttpDataSource(userAgent, null, listener, 8000, 8000, allowCrossProtocolRedirects));
    }

    public DefaultUriDataSource(Context context, TransferListener listener, UriDataSource httpDataSource) {
        this.httpDataSource = (UriDataSource) Assertions.checkNotNull(httpDataSource);
        this.fileDataSource = new FileDataSource(listener);
        this.assetDataSource = new AssetDataSource(context, listener);
        this.contentDataSource = new ContentDataSource(context, listener);
    }

    @Override // com.google.android.exoplayer.upstream.DataSource
    public long open(DataSpec dataSpec) throws IOException {
        Assertions.checkState(this.dataSource == null);
        String scheme = dataSpec.uri.getScheme();
        if (Util.isLocalFileUri(dataSpec.uri)) {
            if (dataSpec.uri.getPath().startsWith("/android_asset/")) {
                this.dataSource = this.assetDataSource;
            } else {
                this.dataSource = this.fileDataSource;
            }
        } else if (SCHEME_ASSET.equals(scheme)) {
            this.dataSource = this.assetDataSource;
        } else if (SCHEME_CONTENT.equals(scheme)) {
            this.dataSource = this.contentDataSource;
        } else {
            this.dataSource = this.httpDataSource;
        }
        return this.dataSource.open(dataSpec);
    }

    @Override // com.google.android.exoplayer.upstream.DataSource
    public int read(byte[] buffer, int offset, int readLength) throws IOException {
        return this.dataSource.read(buffer, offset, readLength);
    }

    @Override // com.google.android.exoplayer.upstream.UriDataSource
    public String getUri() {
        if (this.dataSource == null) {
            return null;
        }
        return this.dataSource.getUri();
    }

    @Override // com.google.android.exoplayer.upstream.DataSource
    public void close() throws IOException {
        if (this.dataSource != null) {
            try {
                this.dataSource.close();
                this.dataSource = null;
            } catch (Throwable th) {
                this.dataSource = null;
                throw th;
            }
        }
    }
}
