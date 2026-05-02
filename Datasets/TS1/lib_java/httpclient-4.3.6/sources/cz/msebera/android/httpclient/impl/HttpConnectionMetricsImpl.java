package cz.msebera.android.httpclient.impl;

import cz.msebera.android.httpclient.HttpConnectionMetrics;
import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.io.HttpTransportMetrics;
import java.util.HashMap;
import java.util.Map;

@NotThreadSafe
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/HttpConnectionMetricsImpl.class */
public class HttpConnectionMetricsImpl implements HttpConnectionMetrics {
    public static final String REQUEST_COUNT = "http.request-count";
    public static final String RESPONSE_COUNT = "http.response-count";
    public static final String SENT_BYTES_COUNT = "http.sent-bytes-count";
    public static final String RECEIVED_BYTES_COUNT = "http.received-bytes-count";
    private final HttpTransportMetrics inTransportMetric;
    private final HttpTransportMetrics outTransportMetric;
    private long requestCount = 0;
    private long responseCount = 0;
    private Map<String, Object> metricsCache;

    public HttpConnectionMetricsImpl(HttpTransportMetrics inTransportMetric, HttpTransportMetrics outTransportMetric) {
        this.inTransportMetric = inTransportMetric;
        this.outTransportMetric = outTransportMetric;
    }

    @Override // cz.msebera.android.httpclient.HttpConnectionMetrics
    public long getReceivedBytesCount() {
        if (this.inTransportMetric != null) {
            return this.inTransportMetric.getBytesTransferred();
        }
        return -1L;
    }

    @Override // cz.msebera.android.httpclient.HttpConnectionMetrics
    public long getSentBytesCount() {
        if (this.outTransportMetric != null) {
            return this.outTransportMetric.getBytesTransferred();
        }
        return -1L;
    }

    @Override // cz.msebera.android.httpclient.HttpConnectionMetrics
    public long getRequestCount() {
        return this.requestCount;
    }

    public void incrementRequestCount() {
        this.requestCount++;
    }

    @Override // cz.msebera.android.httpclient.HttpConnectionMetrics
    public long getResponseCount() {
        return this.responseCount;
    }

    public void incrementResponseCount() {
        this.responseCount++;
    }

    @Override // cz.msebera.android.httpclient.HttpConnectionMetrics
    public Object getMetric(String metricName) {
        Object value = null;
        if (this.metricsCache != null) {
            value = this.metricsCache.get(metricName);
        }
        if (value == null) {
            if (REQUEST_COUNT.equals(metricName)) {
                value = Long.valueOf(this.requestCount);
            } else if (RESPONSE_COUNT.equals(metricName)) {
                value = Long.valueOf(this.responseCount);
            } else {
                if (RECEIVED_BYTES_COUNT.equals(metricName)) {
                    if (this.inTransportMetric != null) {
                        return Long.valueOf(this.inTransportMetric.getBytesTransferred());
                    }
                    return null;
                }
                if (SENT_BYTES_COUNT.equals(metricName)) {
                    if (this.outTransportMetric != null) {
                        return Long.valueOf(this.outTransportMetric.getBytesTransferred());
                    }
                    return null;
                }
            }
        }
        return value;
    }

    public void setMetric(String metricName, Object obj) {
        if (this.metricsCache == null) {
            this.metricsCache = new HashMap();
        }
        this.metricsCache.put(metricName, obj);
    }

    @Override // cz.msebera.android.httpclient.HttpConnectionMetrics
    public void reset() {
        if (this.outTransportMetric != null) {
            this.outTransportMetric.reset();
        }
        if (this.inTransportMetric != null) {
            this.inTransportMetric.reset();
        }
        this.requestCount = 0L;
        this.responseCount = 0L;
        this.metricsCache = null;
    }
}
