package com.squareup.okhttp;

import com.squareup.okhttp.Headers;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Response;
import com.squareup.okhttp.internal.DiskLruCache;
import com.squareup.okhttp.internal.InternalCache;
import com.squareup.okhttp.internal.Util;
import com.squareup.okhttp.internal.http.CacheRequest;
import com.squareup.okhttp.internal.http.CacheStrategy;
import com.squareup.okhttp.internal.http.HttpMethod;
import com.squareup.okhttp.internal.http.OkHeaders;
import com.squareup.okhttp.internal.http.StatusLine;
import com.squareup.okhttp.internal.io.FileSystem;
import java.io.Closeable;
import java.io.File;
import java.io.IOException;
import java.security.cert.Certificate;
import java.security.cert.CertificateEncodingException;
import java.security.cert.CertificateException;
import java.security.cert.CertificateFactory;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.NoSuchElementException;
import okio.Buffer;
import okio.BufferedSink;
import okio.BufferedSource;
import okio.ByteString;
import okio.ForwardingSink;
import okio.ForwardingSource;
import okio.Okio;
import okio.Sink;
import okio.Source;

/* loaded from: okhttp-2.5.0.jar:com/squareup/okhttp/Cache.class */
public final class Cache {
    private static final int VERSION = 201105;
    private static final int ENTRY_METADATA = 0;
    private static final int ENTRY_BODY = 1;
    private static final int ENTRY_COUNT = 2;
    final InternalCache internalCache;
    private final DiskLruCache cache;
    private int writeSuccessCount;
    private int writeAbortCount;
    private int networkCount;
    private int hitCount;
    private int requestCount;

    static /* synthetic */ int access$808(Cache x0) {
        int i = x0.writeSuccessCount;
        x0.writeSuccessCount = i + ENTRY_BODY;
        return i;
    }

    static /* synthetic */ int access$908(Cache x0) {
        int i = x0.writeAbortCount;
        x0.writeAbortCount = i + ENTRY_BODY;
        return i;
    }

    public Cache(File directory, long maxSize) {
        this(directory, maxSize, FileSystem.SYSTEM);
    }

    Cache(File directory, long maxSize, FileSystem fileSystem) {
        this.internalCache = new InternalCache() { // from class: com.squareup.okhttp.Cache.1
            @Override // com.squareup.okhttp.internal.InternalCache
            public Response get(Request request) throws IOException {
                return Cache.this.get(request);
            }

            @Override // com.squareup.okhttp.internal.InternalCache
            public CacheRequest put(Response response) throws IOException {
                return Cache.this.put(response);
            }

            @Override // com.squareup.okhttp.internal.InternalCache
            public void remove(Request request) throws IOException {
                Cache.this.remove(request);
            }

            @Override // com.squareup.okhttp.internal.InternalCache
            public void update(Response cached, Response network) throws IOException {
                Cache.this.update(cached, network);
            }

            @Override // com.squareup.okhttp.internal.InternalCache
            public void trackConditionalCacheHit() {
                Cache.this.trackConditionalCacheHit();
            }

            @Override // com.squareup.okhttp.internal.InternalCache
            public void trackResponse(CacheStrategy cacheStrategy) {
                Cache.this.trackResponse(cacheStrategy);
            }
        };
        this.cache = DiskLruCache.create(fileSystem, directory, VERSION, ENTRY_COUNT, maxSize);
    }

    private static String urlToKey(Request request) {
        return Util.md5Hex(request.urlString());
    }

    Response get(Request request) {
        String key = urlToKey(request);
        try {
            DiskLruCache.Snapshot snapshot = this.cache.get(key);
            if (snapshot == null) {
                return null;
            }
            try {
                Entry entry = new Entry(snapshot.getSource(ENTRY_METADATA));
                Response response = entry.response(request, snapshot);
                if (!entry.matches(request, response)) {
                    Util.closeQuietly(response.body());
                    return null;
                }
                return response;
            } catch (IOException e) {
                Util.closeQuietly(snapshot);
                return null;
            }
        } catch (IOException e2) {
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public CacheRequest put(Response response) throws IOException {
        String requestMethod = response.request().method();
        if (HttpMethod.invalidatesCache(response.request().method())) {
            try {
                remove(response.request());
                return null;
            } catch (IOException e) {
                return null;
            }
        }
        if (!requestMethod.equals("GET") || OkHeaders.hasVaryAll(response)) {
            return null;
        }
        Entry entry = new Entry(response);
        DiskLruCache.Editor editor = ENTRY_METADATA;
        try {
            editor = this.cache.edit(urlToKey(response.request()));
            if (editor == null) {
                return null;
            }
            entry.writeTo(editor);
            return new CacheRequestImpl(editor);
        } catch (IOException e2) {
            abortQuietly(editor);
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void remove(Request request) throws IOException {
        this.cache.remove(urlToKey(request));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void update(Response cached, Response network) {
        Entry entry = new Entry(network);
        DiskLruCache.Snapshot snapshot = ((CacheResponseBody) cached.body()).snapshot;
        DiskLruCache.Editor editor = ENTRY_METADATA;
        try {
            editor = snapshot.edit();
            if (editor != null) {
                entry.writeTo(editor);
                editor.commit();
            }
        } catch (IOException e) {
            abortQuietly(editor);
        }
    }

    private void abortQuietly(DiskLruCache.Editor editor) {
        if (editor != null) {
            try {
                editor.abort();
            } catch (IOException e) {
            }
        }
    }

    public void initialize() throws IOException {
        this.cache.initialize();
    }

    public void delete() throws IOException {
        this.cache.delete();
    }

    public void evictAll() throws IOException {
        this.cache.evictAll();
    }

    public Iterator<String> urls() throws IOException {
        return new Iterator<String>() { // from class: com.squareup.okhttp.Cache.2
            final Iterator<DiskLruCache.Snapshot> delegate;
            String nextUrl;
            boolean canRemove;

            {
                this.delegate = Cache.this.cache.snapshots();
            }

            @Override // java.util.Iterator
            public boolean hasNext() {
                if (this.nextUrl != null) {
                    return true;
                }
                this.canRemove = false;
                while (this.delegate.hasNext()) {
                    DiskLruCache.Snapshot snapshot = this.delegate.next();
                    try {
                        BufferedSource metadata = Okio.buffer(snapshot.getSource(Cache.ENTRY_METADATA));
                        this.nextUrl = metadata.readUtf8LineStrict();
                        snapshot.close();
                        return true;
                    } catch (IOException e) {
                        snapshot.close();
                    } catch (Throwable th) {
                        snapshot.close();
                        throw th;
                    }
                }
                return false;
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // java.util.Iterator
            public String next() {
                if (!hasNext()) {
                    throw new NoSuchElementException();
                }
                String result = this.nextUrl;
                this.nextUrl = null;
                this.canRemove = true;
                return result;
            }

            @Override // java.util.Iterator
            public void remove() {
                if (!this.canRemove) {
                    throw new IllegalStateException("remove() before next()");
                }
                this.delegate.remove();
            }
        };
    }

    public synchronized int getWriteAbortCount() {
        return this.writeAbortCount;
    }

    public synchronized int getWriteSuccessCount() {
        return this.writeSuccessCount;
    }

    public long getSize() throws IOException {
        return this.cache.size();
    }

    public long getMaxSize() {
        return this.cache.getMaxSize();
    }

    public void flush() throws IOException {
        this.cache.flush();
    }

    public void close() throws IOException {
        this.cache.close();
    }

    public File getDirectory() {
        return this.cache.getDirectory();
    }

    public boolean isClosed() {
        return this.cache.isClosed();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized void trackResponse(CacheStrategy cacheStrategy) {
        this.requestCount += ENTRY_BODY;
        if (cacheStrategy.networkRequest != null) {
            this.networkCount += ENTRY_BODY;
        } else if (cacheStrategy.cacheResponse != null) {
            this.hitCount += ENTRY_BODY;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized void trackConditionalCacheHit() {
        this.hitCount += ENTRY_BODY;
    }

    public synchronized int getNetworkCount() {
        return this.networkCount;
    }

    public synchronized int getHitCount() {
        return this.hitCount;
    }

    public synchronized int getRequestCount() {
        return this.requestCount;
    }

    /* loaded from: okhttp-2.5.0.jar:com/squareup/okhttp/Cache$CacheRequestImpl.class */
    private final class CacheRequestImpl implements CacheRequest {
        private final DiskLruCache.Editor editor;
        private Sink cacheOut;
        private boolean done;
        private Sink body;

        public CacheRequestImpl(final DiskLruCache.Editor editor) throws IOException {
            this.editor = editor;
            this.cacheOut = editor.newSink(Cache.ENTRY_BODY);
            this.body = new ForwardingSink(this.cacheOut) { // from class: com.squareup.okhttp.Cache.CacheRequestImpl.1
                public void close() throws IOException {
                    synchronized (Cache.this) {
                        if (CacheRequestImpl.this.done) {
                            return;
                        }
                        CacheRequestImpl.this.done = true;
                        Cache.access$808(Cache.this);
                        super.close();
                        editor.commit();
                    }
                }
            };
        }

        @Override // com.squareup.okhttp.internal.http.CacheRequest
        public void abort() {
            synchronized (Cache.this) {
                if (this.done) {
                    return;
                }
                this.done = true;
                Cache.access$908(Cache.this);
                Util.closeQuietly((Closeable) this.cacheOut);
                try {
                    this.editor.abort();
                } catch (IOException e) {
                }
            }
        }

        @Override // com.squareup.okhttp.internal.http.CacheRequest
        public Sink body() {
            return this.body;
        }
    }

    /* loaded from: okhttp-2.5.0.jar:com/squareup/okhttp/Cache$Entry.class */
    private static final class Entry {
        private final String url;
        private final Headers varyHeaders;
        private final String requestMethod;
        private final Protocol protocol;
        private final int code;
        private final String message;
        private final Headers responseHeaders;
        private final Handshake handshake;

        public Entry(Source in) throws IOException {
            try {
                BufferedSource source = Okio.buffer(in);
                this.url = source.readUtf8LineStrict();
                this.requestMethod = source.readUtf8LineStrict();
                Headers.Builder varyHeadersBuilder = new Headers.Builder();
                int varyRequestHeaderLineCount = Cache.readInt(source);
                for (int i = Cache.ENTRY_METADATA; i < varyRequestHeaderLineCount; i += Cache.ENTRY_BODY) {
                    varyHeadersBuilder.addLenient(source.readUtf8LineStrict());
                }
                this.varyHeaders = varyHeadersBuilder.build();
                StatusLine statusLine = StatusLine.parse(source.readUtf8LineStrict());
                this.protocol = statusLine.protocol;
                this.code = statusLine.code;
                this.message = statusLine.message;
                Headers.Builder responseHeadersBuilder = new Headers.Builder();
                int responseHeaderLineCount = Cache.readInt(source);
                for (int i2 = Cache.ENTRY_METADATA; i2 < responseHeaderLineCount; i2 += Cache.ENTRY_BODY) {
                    responseHeadersBuilder.addLenient(source.readUtf8LineStrict());
                }
                this.responseHeaders = responseHeadersBuilder.build();
                if (isHttps()) {
                    String blank = source.readUtf8LineStrict();
                    if (blank.length() > 0) {
                        throw new IOException("expected \"\" but was \"" + blank + "\"");
                    }
                    String cipherSuite = source.readUtf8LineStrict();
                    List<Certificate> peerCertificates = readCertificateList(source);
                    List<Certificate> localCertificates = readCertificateList(source);
                    this.handshake = Handshake.get(cipherSuite, peerCertificates, localCertificates);
                } else {
                    this.handshake = null;
                }
            } finally {
                in.close();
            }
        }

        public Entry(Response response) {
            this.url = response.request().urlString();
            this.varyHeaders = OkHeaders.varyHeaders(response);
            this.requestMethod = response.request().method();
            this.protocol = response.protocol();
            this.code = response.code();
            this.message = response.message();
            this.responseHeaders = response.headers();
            this.handshake = response.handshake();
        }

        public void writeTo(DiskLruCache.Editor editor) throws IOException {
            BufferedSink sink = Okio.buffer(editor.newSink(Cache.ENTRY_METADATA));
            sink.writeUtf8(this.url);
            sink.writeByte(10);
            sink.writeUtf8(this.requestMethod);
            sink.writeByte(10);
            sink.writeDecimalLong(this.varyHeaders.size());
            sink.writeByte(10);
            int size = this.varyHeaders.size();
            for (int i = Cache.ENTRY_METADATA; i < size; i += Cache.ENTRY_BODY) {
                sink.writeUtf8(this.varyHeaders.name(i));
                sink.writeUtf8(": ");
                sink.writeUtf8(this.varyHeaders.value(i));
                sink.writeByte(10);
            }
            sink.writeUtf8(new StatusLine(this.protocol, this.code, this.message).toString());
            sink.writeByte(10);
            sink.writeDecimalLong(this.responseHeaders.size());
            sink.writeByte(10);
            int size2 = this.responseHeaders.size();
            for (int i2 = Cache.ENTRY_METADATA; i2 < size2; i2 += Cache.ENTRY_BODY) {
                sink.writeUtf8(this.responseHeaders.name(i2));
                sink.writeUtf8(": ");
                sink.writeUtf8(this.responseHeaders.value(i2));
                sink.writeByte(10);
            }
            if (isHttps()) {
                sink.writeByte(10);
                sink.writeUtf8(this.handshake.cipherSuite());
                sink.writeByte(10);
                writeCertList(sink, this.handshake.peerCertificates());
                writeCertList(sink, this.handshake.localCertificates());
            }
            sink.close();
        }

        private boolean isHttps() {
            return this.url.startsWith("https://");
        }

        private List<Certificate> readCertificateList(BufferedSource source) throws IOException {
            int length = Cache.readInt(source);
            if (length == -1) {
                return Collections.emptyList();
            }
            try {
                CertificateFactory certificateFactory = CertificateFactory.getInstance("X.509");
                List<Certificate> result = new ArrayList<>(length);
                for (int i = Cache.ENTRY_METADATA; i < length; i += Cache.ENTRY_BODY) {
                    String line = source.readUtf8LineStrict();
                    Buffer bytes = new Buffer();
                    bytes.write(ByteString.decodeBase64(line));
                    result.add(certificateFactory.generateCertificate(bytes.inputStream()));
                }
                return result;
            } catch (CertificateException e) {
                throw new IOException(e.getMessage());
            }
        }

        private void writeCertList(BufferedSink sink, List<Certificate> certificates) throws IOException {
            try {
                sink.writeDecimalLong(certificates.size());
                sink.writeByte(10);
                int size = certificates.size();
                for (int i = Cache.ENTRY_METADATA; i < size; i += Cache.ENTRY_BODY) {
                    byte[] bytes = certificates.get(i).getEncoded();
                    String line = ByteString.of(bytes).base64();
                    sink.writeUtf8(line);
                    sink.writeByte(10);
                }
            } catch (CertificateEncodingException e) {
                throw new IOException(e.getMessage());
            }
        }

        public boolean matches(Request request, Response response) {
            return this.url.equals(request.urlString()) && this.requestMethod.equals(request.method()) && OkHeaders.varyMatches(response, this.varyHeaders, request);
        }

        public Response response(Request request, DiskLruCache.Snapshot snapshot) {
            String contentType = this.responseHeaders.get("Content-Type");
            String contentLength = this.responseHeaders.get("Content-Length");
            Request cacheRequest = new Request.Builder().url(this.url).method(this.requestMethod, null).headers(this.varyHeaders).build();
            return new Response.Builder().request(cacheRequest).protocol(this.protocol).code(this.code).message(this.message).headers(this.responseHeaders).body(new CacheResponseBody(snapshot, contentType, contentLength)).handshake(this.handshake).build();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static int readInt(BufferedSource source) throws IOException {
        try {
            long result = source.readDecimalLong();
            String line = source.readUtf8LineStrict();
            if (result < 0 || result > 2147483647L || !line.isEmpty()) {
                throw new IOException("expected an int but was \"" + result + line + "\"");
            }
            return (int) result;
        } catch (NumberFormatException e) {
            throw new IOException(e.getMessage());
        }
    }

    /* loaded from: okhttp-2.5.0.jar:com/squareup/okhttp/Cache$CacheResponseBody.class */
    private static class CacheResponseBody extends ResponseBody {
        private final DiskLruCache.Snapshot snapshot;
        private final BufferedSource bodySource;
        private final String contentType;
        private final String contentLength;

        public CacheResponseBody(final DiskLruCache.Snapshot snapshot, String contentType, String contentLength) {
            this.snapshot = snapshot;
            this.contentType = contentType;
            this.contentLength = contentLength;
            Source source = snapshot.getSource(Cache.ENTRY_BODY);
            this.bodySource = Okio.buffer(new ForwardingSource(source) { // from class: com.squareup.okhttp.Cache.CacheResponseBody.1
                public void close() throws IOException {
                    snapshot.close();
                    super.close();
                }
            });
        }

        @Override // com.squareup.okhttp.ResponseBody
        public MediaType contentType() {
            if (this.contentType != null) {
                return MediaType.parse(this.contentType);
            }
            return null;
        }

        @Override // com.squareup.okhttp.ResponseBody
        public long contentLength() {
            try {
                if (this.contentLength != null) {
                    return Long.parseLong(this.contentLength);
                }
                return -1L;
            } catch (NumberFormatException e) {
                return -1L;
            }
        }

        @Override // com.squareup.okhttp.ResponseBody
        public BufferedSource source() {
            return this.bodySource;
        }
    }
}
