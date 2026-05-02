package org.piwik.sdk;

import android.os.Process;
import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.Semaphore;
import java.util.concurrent.TimeUnit;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpRequestBase;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicHeader;
import org.apache.http.params.HttpConnectionParams;
import org.json.JSONObject;
import org.piwik.sdk.TrackerBulkURLWrapper;
import org.piwik.sdk.tools.Logy;

/* loaded from: org.piwik.sdk.piwik-sdk.0.0.2.jar:org/piwik/sdk/Dispatcher.class */
public class Dispatcher {
    private static final String LOGGER_TAG = "PIWIK:Dispatcher";
    private final Piwik mPiwik;
    private final URL mApiUrl;
    private final String mAuthToken;
    private final BlockingQueue<String> mDispatchQueue = new LinkedBlockingQueue();
    private final Object mThreadControl = new Object();
    private final Semaphore mSleepToken = new Semaphore(0);
    private List<HttpRequestBase> mDryRunOutput = Collections.synchronizedList(new ArrayList());
    private volatile int mTimeOut = 5000;
    private volatile boolean mRunning = false;
    private volatile long mDispatchInterval = 120000;
    private Runnable mLoop = new Runnable() { // from class: org.piwik.sdk.Dispatcher.1
        @Override // java.lang.Runnable
        public void run() {
            Process.setThreadPriority(10);
            while (Dispatcher.this.mRunning) {
                try {
                    Dispatcher.this.mSleepToken.tryAcquire(Dispatcher.this.mDispatchInterval, TimeUnit.MILLISECONDS);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                int count = 0;
                ArrayList arrayList = new ArrayList();
                Dispatcher.this.mDispatchQueue.drainTo(arrayList);
                Logy.d(Dispatcher.LOGGER_TAG, "Drained " + arrayList.size() + " events.");
                TrackerBulkURLWrapper wrapper = new TrackerBulkURLWrapper(Dispatcher.this.mApiUrl, arrayList, Dispatcher.this.mAuthToken);
                Iterator<TrackerBulkURLWrapper.Page> pageIterator = wrapper.iterator();
                while (pageIterator.hasNext()) {
                    TrackerBulkURLWrapper.Page page = pageIterator.next();
                    if (page.elementsCount() > 1) {
                        if (Dispatcher.this.doPost(wrapper.getApiUrl(), wrapper.getEvents(page))) {
                            count += page.elementsCount();
                        }
                    } else if (Dispatcher.this.doGet(wrapper.getEventUrl(page))) {
                        count++;
                    }
                }
                Logy.d(Dispatcher.LOGGER_TAG, "Dispatched " + count + " events.");
                synchronized (Dispatcher.this.mThreadControl) {
                    if (Dispatcher.this.mDispatchQueue.isEmpty() || Dispatcher.this.mDispatchInterval < 0) {
                        Dispatcher.this.mRunning = false;
                        return;
                    }
                }
            }
        }
    };

    public Dispatcher(Piwik piwik, URL apiUrl, String authToken) {
        this.mPiwik = piwik;
        this.mApiUrl = apiUrl;
        this.mAuthToken = authToken;
    }

    public int getTimeOut() {
        return this.mTimeOut;
    }

    public void setTimeOut(int timeOut) {
        this.mTimeOut = timeOut;
    }

    public void setDispatchInterval(long dispatchInterval) {
        this.mDispatchInterval = dispatchInterval;
        if (this.mDispatchInterval != -1) {
            launch();
        }
    }

    public long getDispatchInterval() {
        return this.mDispatchInterval;
    }

    private boolean launch() {
        synchronized (this.mThreadControl) {
            if (!this.mRunning) {
                this.mRunning = true;
                new Thread(this.mLoop).start();
                return true;
            }
            return false;
        }
    }

    public void forceDispatch() {
        if (!launch()) {
            this.mSleepToken.release();
        }
    }

    public void submit(String query) {
        this.mDispatchQueue.add(query);
        if (this.mDispatchInterval != -1) {
            launch();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean doGet(String trackingEndPointUrl) {
        if (trackingEndPointUrl == null) {
            return false;
        }
        HttpGet get = new HttpGet(trackingEndPointUrl);
        return doRequest(get);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean doPost(URL url, JSONObject json) {
        if (url == null || json == null) {
            return false;
        }
        String jsonBody = json.toString();
        try {
            HttpPost post = new HttpPost(url.toURI());
            StringEntity se = new StringEntity(jsonBody);
            se.setContentType(new BasicHeader("Content-Type", "application/json"));
            post.setEntity(se);
            return doRequest(post);
        } catch (UnsupportedEncodingException e) {
            Logy.w(LOGGER_TAG, String.format("Unsupported Encoding %s", jsonBody), e);
            return false;
        } catch (URISyntaxException e2) {
            Logy.w(LOGGER_TAG, String.format("URI Syntax Error %s", url.toString()), e2);
            return false;
        }
    }

    private boolean doRequest(HttpRequestBase requestBase) {
        HttpClient client = new DefaultHttpClient();
        HttpConnectionParams.setConnectionTimeout(client.getParams(), this.mTimeOut);
        if (this.mPiwik.isDryRun()) {
            Logy.d(LOGGER_TAG, "DryRun, stored HttpRequest, now " + this.mDryRunOutput.size());
            this.mDryRunOutput.add(requestBase);
            return false;
        }
        if (!this.mDryRunOutput.isEmpty()) {
            this.mDryRunOutput.clear();
        }
        try {
            HttpResponse response = client.execute(requestBase);
            int statusCode = response.getStatusLine().getStatusCode();
            Logy.d(LOGGER_TAG, String.format("status code %s", Integer.valueOf(statusCode)));
            return statusCode == 204 || statusCode == 200;
        } catch (Exception e) {
            Logy.w(LOGGER_TAG, "Cannot send request", e);
            return false;
        }
    }

    public static String urlEncodeUTF8(String param) {
        try {
            return URLEncoder.encode(param, "UTF-8").replaceAll("\\+", "%20");
        } catch (UnsupportedEncodingException e) {
            Logy.w(LOGGER_TAG, String.format("Cannot encode %s", param), e);
            return BuildConfig.FLAVOR;
        } catch (NullPointerException e2) {
            return BuildConfig.FLAVOR;
        }
    }

    public static String urlEncodeUTF8(Map<String, String> map) {
        StringBuilder sb = new StringBuilder(100);
        sb.append('?');
        for (Map.Entry<String, String> entry : map.entrySet()) {
            sb.append(urlEncodeUTF8(entry.getKey()));
            sb.append('=');
            sb.append(urlEncodeUTF8(entry.getValue()));
            sb.append('&');
        }
        return sb.substring(0, sb.length() - 1);
    }

    public List<HttpRequestBase> getDryRunOutput() {
        return this.mDryRunOutput;
    }
}
