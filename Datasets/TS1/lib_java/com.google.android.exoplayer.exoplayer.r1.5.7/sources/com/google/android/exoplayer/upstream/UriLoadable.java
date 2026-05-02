package com.google.android.exoplayer.upstream;

import android.net.Uri;
import com.google.android.exoplayer.ParserException;
import com.google.android.exoplayer.upstream.Loader;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/upstream/UriLoadable.class */
public final class UriLoadable<T> implements Loader.Loadable {
    private final DataSpec dataSpec;
    private final UriDataSource uriDataSource;
    private final Parser<T> parser;
    private volatile T result;
    private volatile boolean isCanceled;

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/upstream/UriLoadable$Parser.class */
    public interface Parser<T> {
        T parse(String str, InputStream inputStream) throws ParserException, IOException;
    }

    public UriLoadable(String url, UriDataSource uriDataSource, Parser<T> parser) {
        this.uriDataSource = uriDataSource;
        this.parser = parser;
        this.dataSpec = new DataSpec(Uri.parse(url), 1);
    }

    public final T getResult() {
        return this.result;
    }

    @Override // com.google.android.exoplayer.upstream.Loader.Loadable
    public final void cancelLoad() {
        this.isCanceled = true;
    }

    @Override // com.google.android.exoplayer.upstream.Loader.Loadable
    public final boolean isLoadCanceled() {
        return this.isCanceled;
    }

    @Override // com.google.android.exoplayer.upstream.Loader.Loadable
    public final void load() throws IOException, InterruptedException {
        DataSourceInputStream inputStream = new DataSourceInputStream(this.uriDataSource, this.dataSpec);
        try {
            inputStream.open();
            this.result = this.parser.parse(this.uriDataSource.getUri(), inputStream);
            inputStream.close();
        } catch (Throwable th) {
            inputStream.close();
            throw th;
        }
    }
}
