package com.squareup.picasso;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.NetworkInfo;
import com.squareup.picasso.Downloader;
import com.squareup.picasso.Picasso;
import com.squareup.picasso.RequestHandler;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: picasso-2.4.0.jar:com/squareup/picasso/NetworkRequestHandler.class */
class NetworkRequestHandler extends RequestHandler {
    static final int RETRY_COUNT = 2;
    private static final int MARKER = 65536;
    private static final String SCHEME_HTTP = "http";
    private static final String SCHEME_HTTPS = "https";
    private final Downloader downloader;
    private final Stats stats;

    public NetworkRequestHandler(Downloader downloader, Stats stats) {
        this.downloader = downloader;
        this.stats = stats;
    }

    @Override // com.squareup.picasso.RequestHandler
    public boolean canHandleRequest(Request data) {
        String scheme = data.uri.getScheme();
        return SCHEME_HTTP.equals(scheme) || SCHEME_HTTPS.equals(scheme);
    }

    @Override // com.squareup.picasso.RequestHandler
    public RequestHandler.Result load(Request data) throws IOException {
        Downloader.Response response = this.downloader.load(data.uri, data.loadFromLocalCacheOnly);
        if (response == null) {
            return null;
        }
        Picasso.LoadedFrom loadedFrom = response.cached ? Picasso.LoadedFrom.DISK : Picasso.LoadedFrom.NETWORK;
        Bitmap bitmap = response.getBitmap();
        if (bitmap != null) {
            return new RequestHandler.Result(bitmap, loadedFrom);
        }
        InputStream is = response.getInputStream();
        if (is == null) {
            return null;
        }
        if (response.getContentLength() == 0) {
            Utils.closeQuietly(is);
            throw new IOException("Received response with 0 content-length header.");
        }
        if (loadedFrom == Picasso.LoadedFrom.NETWORK && response.getContentLength() > 0) {
            this.stats.dispatchDownloadFinished(response.getContentLength());
        }
        try {
            RequestHandler.Result result = new RequestHandler.Result(decodeStream(is, data), loadedFrom);
            Utils.closeQuietly(is);
            return result;
        } catch (Throwable th) {
            Utils.closeQuietly(is);
            throw th;
        }
    }

    @Override // com.squareup.picasso.RequestHandler
    int getRetryCount() {
        return RETRY_COUNT;
    }

    @Override // com.squareup.picasso.RequestHandler
    boolean shouldRetry(boolean airplaneMode, NetworkInfo info) {
        return info == null || info.isConnected();
    }

    @Override // com.squareup.picasso.RequestHandler
    boolean supportsReplay() {
        return true;
    }

    private Bitmap decodeStream(InputStream stream, Request data) throws IOException {
        MarkableInputStream markStream = new MarkableInputStream(stream);
        long mark = markStream.savePosition(MARKER);
        BitmapFactory.Options options = createBitmapOptions(data);
        boolean calculateSize = requiresInSampleSize(options);
        boolean isWebPFile = Utils.isWebPFile(markStream);
        markStream.reset(mark);
        if (isWebPFile) {
            byte[] bytes = Utils.toByteArray(markStream);
            if (calculateSize) {
                BitmapFactory.decodeByteArray(bytes, 0, bytes.length, options);
                calculateInSampleSize(data.targetWidth, data.targetHeight, options, data);
            }
            return BitmapFactory.decodeByteArray(bytes, 0, bytes.length, options);
        }
        if (calculateSize) {
            BitmapFactory.decodeStream(markStream, null, options);
            calculateInSampleSize(data.targetWidth, data.targetHeight, options, data);
            markStream.reset(mark);
        }
        Bitmap bitmap = BitmapFactory.decodeStream(markStream, null, options);
        if (bitmap == null) {
            throw new IOException("Failed to decode stream.");
        }
        return bitmap;
    }
}
