package com.google.android.exoplayer.upstream;

import android.text.TextUtils;
import android.util.Log;
import com.google.android.exoplayer.upstream.HttpDataSource;
import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.MpegAudioHeader;
import com.google.android.exoplayer.util.Predicate;
import com.google.android.exoplayer.util.Util;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InterruptedIOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.NoRouteToHostException;
import java.net.ProtocolException;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/upstream/DefaultHttpDataSource.class */
public class DefaultHttpDataSource implements HttpDataSource {
    public static final int DEFAULT_CONNECT_TIMEOUT_MILLIS = 8000;
    public static final int DEFAULT_READ_TIMEOUT_MILLIS = 8000;
    private static final int MAX_REDIRECTS = 20;
    private static final String TAG = "DefaultHttpDataSource";
    private static final Pattern CONTENT_RANGE_HEADER = Pattern.compile("^bytes (\\d+)-(\\d+)/(\\d+)$");
    private static final AtomicReference<byte[]> skipBufferReference = new AtomicReference<>();
    private final boolean allowCrossProtocolRedirects;
    private final int connectTimeoutMillis;
    private final int readTimeoutMillis;
    private final String userAgent;
    private final Predicate<String> contentTypePredicate;
    private final HashMap<String, String> requestProperties;
    private final TransferListener listener;
    private DataSpec dataSpec;
    private HttpURLConnection connection;
    private InputStream inputStream;
    private boolean opened;
    private long bytesToSkip;
    private long bytesToRead;
    private long bytesSkipped;
    private long bytesRead;

    public DefaultHttpDataSource(String userAgent, Predicate<String> contentTypePredicate) {
        this(userAgent, contentTypePredicate, null);
    }

    public DefaultHttpDataSource(String userAgent, Predicate<String> contentTypePredicate, TransferListener listener) {
        this(userAgent, contentTypePredicate, listener, 8000, 8000);
    }

    public DefaultHttpDataSource(String userAgent, Predicate<String> contentTypePredicate, TransferListener listener, int connectTimeoutMillis, int readTimeoutMillis) {
        this(userAgent, contentTypePredicate, listener, connectTimeoutMillis, readTimeoutMillis, false);
    }

    public DefaultHttpDataSource(String userAgent, Predicate<String> contentTypePredicate, TransferListener listener, int connectTimeoutMillis, int readTimeoutMillis, boolean allowCrossProtocolRedirects) {
        this.userAgent = Assertions.checkNotEmpty(userAgent);
        this.contentTypePredicate = contentTypePredicate;
        this.listener = listener;
        this.requestProperties = new HashMap<>();
        this.connectTimeoutMillis = connectTimeoutMillis;
        this.readTimeoutMillis = readTimeoutMillis;
        this.allowCrossProtocolRedirects = allowCrossProtocolRedirects;
    }

    @Override // com.google.android.exoplayer.upstream.UriDataSource
    public String getUri() {
        if (this.connection == null) {
            return null;
        }
        return this.connection.getURL().toString();
    }

    @Override // com.google.android.exoplayer.upstream.HttpDataSource
    public Map<String, List<String>> getResponseHeaders() {
        if (this.connection == null) {
            return null;
        }
        return this.connection.getHeaderFields();
    }

    @Override // com.google.android.exoplayer.upstream.HttpDataSource
    public void setRequestProperty(String name, String value) {
        Assertions.checkNotNull(name);
        Assertions.checkNotNull(value);
        synchronized (this.requestProperties) {
            this.requestProperties.put(name, value);
        }
    }

    @Override // com.google.android.exoplayer.upstream.HttpDataSource
    public void clearRequestProperty(String name) {
        Assertions.checkNotNull(name);
        synchronized (this.requestProperties) {
            this.requestProperties.remove(name);
        }
    }

    @Override // com.google.android.exoplayer.upstream.HttpDataSource
    public void clearAllRequestProperties() {
        synchronized (this.requestProperties) {
            this.requestProperties.clear();
        }
    }

    @Override // com.google.android.exoplayer.upstream.HttpDataSource, com.google.android.exoplayer.upstream.DataSource
    public long open(DataSpec dataSpec) throws HttpDataSource.HttpDataSourceException {
        this.dataSpec = dataSpec;
        this.bytesRead = 0L;
        this.bytesSkipped = 0L;
        try {
            this.connection = makeConnection(dataSpec);
            try {
                int responseCode = this.connection.getResponseCode();
                if (responseCode < 200 || responseCode > 299) {
                    Map<String, List<String>> headers = this.connection.getHeaderFields();
                    closeConnectionQuietly();
                    throw new HttpDataSource.InvalidResponseCodeException(responseCode, headers, dataSpec);
                }
                String contentType = this.connection.getContentType();
                if (this.contentTypePredicate != null && !this.contentTypePredicate.evaluate(contentType)) {
                    closeConnectionQuietly();
                    throw new HttpDataSource.InvalidContentTypeException(contentType, dataSpec);
                }
                this.bytesToSkip = (responseCode != 200 || dataSpec.position == 0) ? 0L : dataSpec.position;
                if ((dataSpec.flags & 1) == 0) {
                    long contentLength = getContentLength(this.connection);
                    this.bytesToRead = dataSpec.length != -1 ? dataSpec.length : contentLength != -1 ? contentLength - this.bytesToSkip : -1L;
                } else {
                    this.bytesToRead = dataSpec.length;
                }
                try {
                    this.inputStream = this.connection.getInputStream();
                    this.opened = true;
                    if (this.listener != null) {
                        this.listener.onTransferStart();
                    }
                    return this.bytesToRead;
                } catch (IOException e) {
                    closeConnectionQuietly();
                    throw new HttpDataSource.HttpDataSourceException(e, dataSpec);
                }
            } catch (IOException e2) {
                closeConnectionQuietly();
                throw new HttpDataSource.HttpDataSourceException("Unable to connect to " + dataSpec.uri.toString(), e2, dataSpec);
            }
        } catch (IOException e3) {
            throw new HttpDataSource.HttpDataSourceException("Unable to connect to " + dataSpec.uri.toString(), e3, dataSpec);
        }
    }

    @Override // com.google.android.exoplayer.upstream.HttpDataSource, com.google.android.exoplayer.upstream.DataSource
    public int read(byte[] buffer, int offset, int readLength) throws HttpDataSource.HttpDataSourceException {
        try {
            skipInternal();
            return readInternal(buffer, offset, readLength);
        } catch (IOException e) {
            throw new HttpDataSource.HttpDataSourceException(e, this.dataSpec);
        }
    }

    @Override // com.google.android.exoplayer.upstream.HttpDataSource, com.google.android.exoplayer.upstream.DataSource
    public void close() throws HttpDataSource.HttpDataSourceException {
        try {
            if (this.inputStream != null) {
                Util.maybeTerminateInputStream(this.connection, bytesRemaining());
                try {
                    this.inputStream.close();
                } catch (IOException e) {
                    throw new HttpDataSource.HttpDataSourceException(e, this.dataSpec);
                }
            }
        } finally {
            this.inputStream = null;
            closeConnectionQuietly();
            if (this.opened) {
                this.opened = false;
                if (this.listener != null) {
                    this.listener.onTransferEnd();
                }
            }
        }
    }

    protected final HttpURLConnection getConnection() {
        return this.connection;
    }

    protected final long bytesSkipped() {
        return this.bytesSkipped;
    }

    protected final long bytesRead() {
        return this.bytesRead;
    }

    protected final long bytesRemaining() {
        return this.bytesToRead == -1 ? this.bytesToRead : this.bytesToRead - this.bytesRead;
    }

    private HttpURLConnection makeConnection(DataSpec dataSpec) throws IOException {
        HttpURLConnection connection;
        URL url = new URL(dataSpec.uri.toString());
        byte[] postBody = dataSpec.postBody;
        long position = dataSpec.position;
        long length = dataSpec.length;
        boolean allowGzip = (dataSpec.flags & 1) != 0;
        if (!this.allowCrossProtocolRedirects) {
            return makeConnection(url, postBody, position, length, allowGzip, true);
        }
        int redirectCount = 0;
        while (true) {
            int i = redirectCount;
            redirectCount++;
            if (i <= 20) {
                connection = makeConnection(url, postBody, position, length, allowGzip, false);
                int responseCode = connection.getResponseCode();
                if (responseCode != 300 && responseCode != 301 && responseCode != 302 && responseCode != 303 && (postBody != null || (responseCode != 307 && responseCode != 308))) {
                    break;
                }
                postBody = null;
                String location = connection.getHeaderField("Location");
                connection.disconnect();
                url = handleRedirect(url, location);
            } else {
                throw new NoRouteToHostException("Too many redirects: " + redirectCount);
            }
        }
        return connection;
    }

    private HttpURLConnection makeConnection(URL url, byte[] postBody, long position, long length, boolean allowGzip, boolean followRedirects) throws IOException {
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setConnectTimeout(this.connectTimeoutMillis);
        connection.setReadTimeout(this.readTimeoutMillis);
        synchronized (this.requestProperties) {
            for (Map.Entry<String, String> property : this.requestProperties.entrySet()) {
                connection.setRequestProperty(property.getKey(), property.getValue());
            }
        }
        if (position != 0 || length != -1) {
            String rangeRequest = "bytes=" + position + "-";
            if (length != -1) {
                rangeRequest = rangeRequest + ((position + length) - 1);
            }
            connection.setRequestProperty("Range", rangeRequest);
        }
        connection.setRequestProperty("User-Agent", this.userAgent);
        if (!allowGzip) {
            connection.setRequestProperty("Accept-Encoding", "identity");
        }
        connection.setInstanceFollowRedirects(followRedirects);
        connection.setDoOutput(postBody != null);
        if (postBody != null) {
            connection.setFixedLengthStreamingMode(postBody.length);
            connection.connect();
            OutputStream os = connection.getOutputStream();
            os.write(postBody);
            os.close();
        } else {
            connection.connect();
        }
        return connection;
    }

    private static URL handleRedirect(URL originalUrl, String location) throws IOException {
        if (location == null) {
            throw new ProtocolException("Null location redirect");
        }
        URL url = new URL(originalUrl, location);
        String protocol = url.getProtocol();
        if (!"https".equals(protocol) && !"http".equals(protocol)) {
            throw new ProtocolException("Unsupported protocol redirect: " + protocol);
        }
        return url;
    }

    private static long getContentLength(HttpURLConnection connection) {
        long contentLength = -1;
        String contentLengthHeader = connection.getHeaderField("Content-Length");
        if (!TextUtils.isEmpty(contentLengthHeader)) {
            try {
                contentLength = Long.parseLong(contentLengthHeader);
            } catch (NumberFormatException e) {
                Log.e(TAG, "Unexpected Content-Length [" + contentLengthHeader + "]");
            }
        }
        String contentRangeHeader = connection.getHeaderField("Content-Range");
        if (!TextUtils.isEmpty(contentRangeHeader)) {
            Matcher matcher = CONTENT_RANGE_HEADER.matcher(contentRangeHeader);
            if (matcher.find()) {
                try {
                    long contentLengthFromRange = (Long.parseLong(matcher.group(2)) - Long.parseLong(matcher.group(1))) + 1;
                    if (contentLength < 0) {
                        contentLength = contentLengthFromRange;
                    } else if (contentLength != contentLengthFromRange) {
                        Log.w(TAG, "Inconsistent headers [" + contentLengthHeader + "] [" + contentRangeHeader + "]");
                        contentLength = Math.max(contentLength, contentLengthFromRange);
                    }
                } catch (NumberFormatException e2) {
                    Log.e(TAG, "Unexpected Content-Range [" + contentRangeHeader + "]");
                }
            }
        }
        return contentLength;
    }

    private void skipInternal() throws IOException {
        if (this.bytesSkipped == this.bytesToSkip) {
            return;
        }
        byte[] skipBuffer = skipBufferReference.getAndSet(null);
        if (skipBuffer == null) {
            skipBuffer = new byte[MpegAudioHeader.MAX_FRAME_SIZE_BYTES];
        }
        while (this.bytesSkipped != this.bytesToSkip) {
            int readLength = (int) Math.min(this.bytesToSkip - this.bytesSkipped, skipBuffer.length);
            int read = this.inputStream.read(skipBuffer, 0, readLength);
            if (Thread.interrupted()) {
                throw new InterruptedIOException();
            }
            if (read == -1) {
                throw new EOFException();
            }
            this.bytesSkipped += read;
            if (this.listener != null) {
                this.listener.onBytesTransferred(read);
            }
        }
        skipBufferReference.set(skipBuffer);
    }

    private int readInternal(byte[] buffer, int offset, int readLength) throws IOException {
        int readLength2 = this.bytesToRead == -1 ? readLength : (int) Math.min(readLength, this.bytesToRead - this.bytesRead);
        if (readLength2 == 0) {
            return -1;
        }
        int read = this.inputStream.read(buffer, offset, readLength2);
        if (read == -1) {
            if (this.bytesToRead != -1 && this.bytesToRead != this.bytesRead) {
                throw new EOFException();
            }
            return -1;
        }
        this.bytesRead += read;
        if (this.listener != null) {
            this.listener.onBytesTransferred(read);
        }
        return read;
    }

    private void closeConnectionQuietly() {
        if (this.connection != null) {
            try {
                this.connection.disconnect();
            } catch (Exception e) {
                Log.e(TAG, "Unexpected error while disconnecting", e);
            }
            this.connection = null;
        }
    }
}
