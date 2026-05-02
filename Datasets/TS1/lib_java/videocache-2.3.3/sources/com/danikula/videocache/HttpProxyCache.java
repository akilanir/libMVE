package com.danikula.videocache;

import android.text.TextUtils;
import com.danikula.videocache.file.FileCache;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.Socket;

/* loaded from: videocache-2.3.3.jar:com/danikula/videocache/HttpProxyCache.class */
class HttpProxyCache extends ProxyCache {
    private static final float NO_CACHE_BARRIER = 0.2f;
    private final HttpUrlSource source;
    private final FileCache cache;
    private CacheListener listener;

    public HttpProxyCache(HttpUrlSource source, FileCache cache) {
        super(source, cache);
        this.cache = cache;
        this.source = source;
    }

    public void registerCacheListener(CacheListener cacheListener) {
        this.listener = cacheListener;
    }

    public void processRequest(GetRequest request, Socket socket) throws IOException, ProxyCacheException {
        OutputStream out = new BufferedOutputStream(socket.getOutputStream());
        String responseHeaders = newResponseHeaders(request);
        out.write(responseHeaders.getBytes("UTF-8"));
        long offset = request.rangeOffset;
        if (isUseCache(request)) {
            responseWithCache(out, offset);
        } else {
            responseWithoutCache(out, offset);
        }
    }

    private boolean isUseCache(GetRequest request) throws ProxyCacheException {
        int sourceLength = this.source.length();
        boolean sourceLengthKnown = sourceLength > 0;
        int cacheAvailable = this.cache.available();
        return (sourceLengthKnown && request.partial && ((float) request.rangeOffset) > ((float) cacheAvailable) + (((float) sourceLength) * NO_CACHE_BARRIER)) ? false : true;
    }

    private String newResponseHeaders(GetRequest request) throws IOException, ProxyCacheException {
        String mime = this.source.getMime();
        boolean mimeKnown = !TextUtils.isEmpty(mime);
        int length = this.cache.isCompleted() ? this.cache.available() : this.source.length();
        boolean lengthKnown = length >= 0;
        long contentLength = request.partial ? length - request.rangeOffset : length;
        boolean addRange = lengthKnown && request.partial;
        return (request.partial ? "HTTP/1.1 206 PARTIAL CONTENT\n" : "HTTP/1.1 200 OK\n") + "Accept-Ranges: bytes\n" + (lengthKnown ? String.format("Content-Length: %d\n", Long.valueOf(contentLength)) : "") + (addRange ? String.format("Content-Range: bytes %d-%d/%d\n", Long.valueOf(request.rangeOffset), Integer.valueOf(length - 1), Integer.valueOf(length)) : "") + (mimeKnown ? String.format("Content-Type: %s\n", mime) : "") + "\n";
    }

    private void responseWithCache(OutputStream out, long offset) throws ProxyCacheException, IOException {
        byte[] buffer = new byte[8192];
        while (true) {
            int readBytes = read(buffer, offset, buffer.length);
            if (readBytes != -1) {
                out.write(buffer, 0, readBytes);
                offset += readBytes;
            } else {
                out.flush();
                return;
            }
        }
    }

    private void responseWithoutCache(OutputStream out, long offset) throws ProxyCacheException, IOException {
        try {
            HttpUrlSource source = new HttpUrlSource(this.source);
            source.open((int) offset);
            byte[] buffer = new byte[8192];
            while (true) {
                int readBytes = source.read(buffer);
                if (readBytes != -1) {
                    out.write(buffer, 0, readBytes);
                    offset += readBytes;
                } else {
                    out.flush();
                    this.source.close();
                    return;
                }
            }
        } catch (Throwable th) {
            this.source.close();
            throw th;
        }
    }

    @Override // com.danikula.videocache.ProxyCache
    protected void onCachePercentsAvailableChanged(int percents) {
        if (this.listener != null) {
            this.listener.onCacheAvailable(this.cache.file, this.source.url, percents);
        }
    }
}
