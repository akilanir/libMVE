package org.piwik.sdk.dispatcher;

import android.os.Process;
import android.support.annotation.NonNull;
import java.io.BufferedWriter;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
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
import org.json.JSONObject;
import org.piwik.sdk.BuildConfig;
import org.piwik.sdk.Piwik;
import org.piwik.sdk.TrackerBulkURLWrapper;
import org.piwik.sdk.tools.Logy;

/* loaded from: org.piwik.sdk.piwik-sdk.0.0.4.jar:org/piwik/sdk/dispatcher/Dispatcher.class */
public class Dispatcher {
    private static final String LOGGER_TAG = "PIWIK:Dispatcher";
    private final Piwik mPiwik;
    private final URL mApiUrl;
    private final String mAuthToken;
    public static final int DEFAULT_CONNECTION_TIMEOUT = 5000;
    public static final long DEFAULT_DISPATCH_INTERVAL = 120000;
    private final BlockingQueue<String> mDispatchQueue = new LinkedBlockingQueue();
    private final Object mThreadControl = new Object();
    private final Semaphore mSleepToken = new Semaphore(0);
    private List<Packet> mDryRunOutput = Collections.synchronizedList(new ArrayList());
    private volatile int mTimeOut = DEFAULT_CONNECTION_TIMEOUT;
    private volatile boolean mRunning = false;
    private volatile long mDispatchInterval = DEFAULT_DISPATCH_INTERVAL;
    private Runnable mLoop = new Runnable() { // from class: org.piwik.sdk.dispatcher.Dispatcher.1
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
                        JSONObject eventData = wrapper.getEvents(page);
                        if (eventData != null && Dispatcher.this.dispatch(new Packet(wrapper.getApiUrl(), eventData))) {
                            count += page.elementsCount();
                        }
                    } else {
                        URL targetURL = wrapper.getEventUrl(page);
                        if (targetURL != null && Dispatcher.this.dispatch(new Packet(targetURL))) {
                            count++;
                        }
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

    public int getConnectionTimeOut() {
        return this.mTimeOut;
    }

    public void setConnectionTimeOut(int timeOut) {
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

    public boolean forceDispatch() {
        if (!launch()) {
            this.mSleepToken.release();
            return false;
        }
        return true;
    }

    public void submit(String query) {
        this.mDispatchQueue.add(query);
        if (this.mDispatchInterval != -1) {
            launch();
        }
    }

    public boolean dispatch(@NonNull Packet packet) {
        if (packet.getTargetURL() == null) {
            return false;
        }
        if (packet.getJSONObject() != null && packet.getJSONObject().length() == 0) {
            return false;
        }
        if (this.mPiwik.isDryRun()) {
            Logy.d(LOGGER_TAG, "DryRun, stored HttpRequest, now " + this.mDryRunOutput.size());
            this.mDryRunOutput.add(packet);
            return true;
        }
        if (!this.mDryRunOutput.isEmpty()) {
            this.mDryRunOutput.clear();
        }
        try {
            HttpURLConnection urlConnection = (HttpURLConnection) packet.getTargetURL().openConnection();
            urlConnection.setConnectTimeout(this.mTimeOut);
            urlConnection.setReadTimeout(this.mTimeOut);
            if (packet.getJSONObject() != null) {
                urlConnection.setDoOutput(true);
                urlConnection.setRequestProperty("Content-Type", "application/json");
                urlConnection.setRequestProperty("charset", "utf-8");
                BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(urlConnection.getOutputStream(), "UTF-8"));
                writer.write(packet.getJSONObject().toString());
                writer.flush();
                writer.close();
            } else {
                urlConnection.setDoOutput(false);
            }
            int statusCode = urlConnection.getResponseCode();
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

    public List<Packet> getDryRunOutput() {
        return this.mDryRunOutput;
    }
}
