package com.google.android.exoplayer.dash.mpd;

import android.os.SystemClock;
import com.google.android.exoplayer.ParserException;
import com.google.android.exoplayer.upstream.Loader;
import com.google.android.exoplayer.upstream.UriDataSource;
import com.google.android.exoplayer.upstream.UriLoadable;
import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.Util;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Locale;
import java.util.TimeZone;
import java.util.concurrent.CancellationException;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/dash/mpd/UtcTimingElementResolver.class */
public final class UtcTimingElementResolver implements Loader.Callback {
    private final UriDataSource uriDataSource;
    private final UtcTimingElement timingElement;
    private final long timingElementElapsedRealtime;
    private final UtcTimingCallback callback;
    private Loader singleUseLoader;
    private UriLoadable<Long> singleUseLoadable;

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/dash/mpd/UtcTimingElementResolver$UtcTimingCallback.class */
    public interface UtcTimingCallback {
        void onTimestampResolved(UtcTimingElement utcTimingElement, long j);

        void onTimestampError(UtcTimingElement utcTimingElement, IOException iOException);
    }

    public static void resolveTimingElement(UriDataSource uriDataSource, UtcTimingElement timingElement, long timingElementElapsedRealtime, UtcTimingCallback callback) {
        UtcTimingElementResolver resolver = new UtcTimingElementResolver(uriDataSource, timingElement, timingElementElapsedRealtime, callback);
        resolver.resolve();
    }

    private UtcTimingElementResolver(UriDataSource uriDataSource, UtcTimingElement timingElement, long timingElementElapsedRealtime, UtcTimingCallback callback) {
        this.uriDataSource = uriDataSource;
        this.timingElement = (UtcTimingElement) Assertions.checkNotNull(timingElement);
        this.timingElementElapsedRealtime = timingElementElapsedRealtime;
        this.callback = (UtcTimingCallback) Assertions.checkNotNull(callback);
    }

    private void resolve() {
        String scheme = this.timingElement.schemeIdUri;
        if (Util.areEqual(scheme, "urn:mpeg:dash:utc:direct:2012")) {
            resolveDirect();
            return;
        }
        if (Util.areEqual(scheme, "urn:mpeg:dash:utc:http-iso:2014")) {
            resolveHttp(new Iso8601Parser());
        } else if (Util.areEqual(scheme, "urn:mpeg:dash:utc:http-xsdate:2012") || Util.areEqual(scheme, "urn:mpeg:dash:utc:http-xsdate:2014")) {
            resolveHttp(new XsDateTimeParser());
        } else {
            this.callback.onTimestampError(this.timingElement, new IOException("Unsupported utc timing scheme"));
        }
    }

    private void resolveDirect() {
        try {
            long utcTimestamp = Util.parseXsDateTime(this.timingElement.value);
            long elapsedRealtimeOffset = utcTimestamp - this.timingElementElapsedRealtime;
            this.callback.onTimestampResolved(this.timingElement, elapsedRealtimeOffset);
        } catch (ParseException e) {
            this.callback.onTimestampError(this.timingElement, new ParserException(e));
        }
    }

    private void resolveHttp(UriLoadable.Parser<Long> parser) {
        this.singleUseLoader = new Loader("utctiming");
        this.singleUseLoadable = new UriLoadable<>(this.timingElement.value, this.uriDataSource, parser);
        this.singleUseLoader.startLoading(this.singleUseLoadable, this);
    }

    @Override // com.google.android.exoplayer.upstream.Loader.Callback
    public void onLoadCanceled(Loader.Loadable loadable) {
        onLoadError(loadable, new IOException("Load cancelled", new CancellationException()));
    }

    @Override // com.google.android.exoplayer.upstream.Loader.Callback
    public void onLoadCompleted(Loader.Loadable loadable) {
        releaseLoader();
        long elapsedRealtimeOffset = this.singleUseLoadable.getResult().longValue() - SystemClock.elapsedRealtime();
        this.callback.onTimestampResolved(this.timingElement, elapsedRealtimeOffset);
    }

    @Override // com.google.android.exoplayer.upstream.Loader.Callback
    public void onLoadError(Loader.Loadable loadable, IOException exception) {
        releaseLoader();
        this.callback.onTimestampError(this.timingElement, exception);
    }

    private void releaseLoader() {
        this.singleUseLoader.release();
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/dash/mpd/UtcTimingElementResolver$XsDateTimeParser.class */
    private static class XsDateTimeParser implements UriLoadable.Parser<Long> {
        private XsDateTimeParser() {
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.google.android.exoplayer.upstream.UriLoadable.Parser
        public Long parse(String connectionUrl, InputStream inputStream) throws ParserException, IOException {
            String firstLine = new BufferedReader(new InputStreamReader(inputStream)).readLine();
            try {
                return Long.valueOf(Util.parseXsDateTime(firstLine));
            } catch (ParseException e) {
                throw new ParserException(e);
            }
        }
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/dash/mpd/UtcTimingElementResolver$Iso8601Parser.class */
    private static class Iso8601Parser implements UriLoadable.Parser<Long> {
        private Iso8601Parser() {
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.google.android.exoplayer.upstream.UriLoadable.Parser
        public Long parse(String connectionUrl, InputStream inputStream) throws ParserException, IOException {
            String firstLine = new BufferedReader(new InputStreamReader(inputStream)).readLine();
            try {
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'", Locale.US);
                format.setTimeZone(TimeZone.getTimeZone("UTC"));
                return Long.valueOf(format.parse(firstLine).getTime());
            } catch (ParseException e) {
                throw new ParserException(e);
            }
        }
    }
}
