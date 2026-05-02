package org.piwik.sdk;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.io.File;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.UUID;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.piwik.sdk.ecommerce.EcommerceItems;
import org.piwik.sdk.tools.Checksum;
import org.piwik.sdk.tools.CurrencyFormatter;
import org.piwik.sdk.tools.DeviceHelper;
import org.piwik.sdk.tools.Logy;

/* loaded from: org.piwik.sdk.piwik-sdk.0.0.3.jar:org/piwik/sdk/Tracker.class */
public class Tracker {
    protected static final String LOGGER_TAG = "PIWIK:Tracker";
    private static final String DEFAULT_UNKNOWN_VALUE = "unknown";
    private static final String DEFAULT_TRUE_VALUE = "1";
    private static final String DEFAULT_RECORD_VALUE = "1";
    private static final String DEFAULT_API_VERSION_VALUE = "1";
    protected static final String PREF_KEY_TRACKER_USERID = "tracker.userid";
    protected static final String PREF_KEY_TRACKER_FIRSTVISIT = "tracker.firstvisit";
    protected static final String PREF_KEY_TRACKER_VISITCOUNT = "tracker.visitcount";
    protected static final String PREF_KEY_TRACKER_PREVIOUSVISIT = "tracker.previousvisit";
    private final int mSiteId;
    private final URL mApiUrl;
    private final Piwik mPiwik;
    private String mLastEvent;
    private String mApplicationDomain;
    private long mSessionStartTime;
    private final Dispatcher mDispatcher;
    private static final Pattern PATTERN_VISITOR_ID = Pattern.compile("^[0-9a-f]{16}$");
    private long mSessionTimeout = 1800000;
    private final Object mSessionLock = new Object();
    private final CustomVariables mVisitCustomVariable = new CustomVariables();
    private final Random mRandomAntiCachingValue = new Random(new Date().getTime());
    private final TrackMe mDefaultTrackMe = new TrackMe();
    private CountDownLatch mSessionStartLatch = new CountDownLatch(0);

    /* loaded from: org.piwik.sdk.piwik-sdk.0.0.3.jar:org/piwik/sdk/Tracker$ExtraIdentifier.class */
    public enum ExtraIdentifier {
        APK_CHECKSUM,
        INSTALLER_PACKAGENAME
    }

    protected Tracker(@NonNull String url, int siteId, String authToken, @NonNull Piwik piwik) throws MalformedURLException {
        String checkUrl = url;
        if (checkUrl.endsWith("piwik.php") || checkUrl.endsWith("piwik-proxy.php")) {
            this.mApiUrl = new URL(checkUrl);
        } else {
            this.mApiUrl = new URL((checkUrl.endsWith("/") ? checkUrl : checkUrl + "/") + "piwik.php");
        }
        this.mPiwik = piwik;
        this.mSiteId = siteId;
        this.mDispatcher = new Dispatcher(this.mPiwik, this.mApiUrl, authToken);
        String userId = getSharedPreferences().getString(PREF_KEY_TRACKER_USERID, null);
        if (userId == null) {
            userId = UUID.randomUUID().toString();
            getSharedPreferences().edit().putString(PREF_KEY_TRACKER_USERID, userId).apply();
        }
        this.mDefaultTrackMe.set(QueryParams.USER_ID, userId);
        this.mDefaultTrackMe.set(QueryParams.SESSION_START, "1");
        String resolution = DEFAULT_UNKNOWN_VALUE;
        int[] res = DeviceHelper.getResolution(this.mPiwik.getContext());
        this.mDefaultTrackMe.set(QueryParams.SCREEN_RESOLUTION, res != null ? String.format("%sx%s", Integer.valueOf(res[0]), Integer.valueOf(res[1])) : resolution);
        this.mDefaultTrackMe.set(QueryParams.USER_AGENT, DeviceHelper.getUserAgent());
        this.mDefaultTrackMe.set(QueryParams.LANGUAGE, DeviceHelper.getUserLanguage());
        this.mDefaultTrackMe.set(QueryParams.COUNTRY, DeviceHelper.getUserCountry());
        this.mDefaultTrackMe.set(QueryParams.VISITOR_ID, makeRandomVisitorId());
    }

    public Piwik getPiwik() {
        return this.mPiwik;
    }

    protected URL getAPIUrl() {
        return this.mApiUrl;
    }

    protected int getSiteId() {
        return this.mSiteId;
    }

    public TrackMe getDefaultTrackMe() {
        return this.mDefaultTrackMe;
    }

    public void startNewSession() {
        synchronized (this.mSessionLock) {
            this.mSessionStartTime = 0L;
        }
    }

    public void setSessionTimeout(int milliseconds) {
        synchronized (this.mSessionLock) {
            this.mSessionTimeout = milliseconds;
        }
    }

    protected boolean tryNewSession() {
        boolean expired;
        synchronized (this.mSessionLock) {
            expired = System.currentTimeMillis() - this.mSessionStartTime > this.mSessionTimeout;
            this.mSessionStartTime = System.currentTimeMillis();
        }
        return expired;
    }

    public long getSessionTimeout() {
        return this.mSessionTimeout;
    }

    public boolean dispatch() {
        if (!this.mPiwik.isOptOut()) {
            this.mDispatcher.forceDispatch();
            return true;
        }
        return false;
    }

    public Tracker setDispatchInterval(long dispatchInterval) {
        this.mDispatcher.setDispatchInterval(dispatchInterval);
        return this;
    }

    public long getDispatchInterval() {
        return this.mDispatcher.getDispatchInterval();
    }

    public Tracker setUserId(String userId) {
        this.mDefaultTrackMe.set(QueryParams.USER_ID, userId);
        getSharedPreferences().edit().putString(PREF_KEY_TRACKER_USERID, userId).apply();
        return this;
    }

    public String getUserId() {
        return this.mDefaultTrackMe.get(QueryParams.USER_ID);
    }

    public Tracker setVisitorId(String visitorId) throws IllegalArgumentException {
        if (confirmVisitorIdFormat(visitorId)) {
            this.mDefaultTrackMe.set(QueryParams.VISITOR_ID, visitorId);
        }
        return this;
    }

    public String getVisitorId() {
        return this.mDefaultTrackMe.get(QueryParams.VISITOR_ID);
    }

    private boolean confirmVisitorIdFormat(String visitorId) throws IllegalArgumentException {
        Matcher visitorIdMatcher = PATTERN_VISITOR_ID.matcher(visitorId);
        if (visitorIdMatcher.matches()) {
            return true;
        }
        throw new IllegalArgumentException("VisitorId: " + visitorId + " is not of valid format,  the format must match the regular expression: " + PATTERN_VISITOR_ID.pattern());
    }

    public Tracker setApplicationDomain(String domain) {
        this.mApplicationDomain = domain;
        return this;
    }

    protected String getApplicationDomain() {
        return this.mApplicationDomain != null ? this.mApplicationDomain : this.mPiwik.getApplicationDomain();
    }

    public Tracker trackScreenView(String path) {
        return trackScreenView(path, (String) null);
    }

    public Tracker trackScreenView(TrackMe trackMe, String path) {
        return trackScreenView(trackMe, path, null);
    }

    public Tracker trackScreenView(String path, String title) {
        return trackScreenView(new TrackMe(), path, title);
    }

    public Tracker trackScreenView(TrackMe trackMe, String path, String title) {
        if (path == null) {
            return this;
        }
        trackMe.set(QueryParams.URL_PATH, path);
        trackMe.set(QueryParams.ACTION_NAME, title);
        return track(trackMe);
    }

    public Tracker trackEvent(String category, String action) {
        return track(new TrackMe().set(QueryParams.EVENT_CATEGORY, category).set(QueryParams.EVENT_ACTION, action));
    }

    public Tracker trackEvent(String category, String action, String label) {
        return track(new TrackMe().set(QueryParams.EVENT_CATEGORY, category).set(QueryParams.EVENT_ACTION, action).set(QueryParams.EVENT_NAME, label));
    }

    public Tracker trackEvent(String category, String action, String label, float value) {
        return track(new TrackMe().set(QueryParams.EVENT_CATEGORY, category).set(QueryParams.EVENT_ACTION, action).set(QueryParams.EVENT_NAME, label).set(QueryParams.EVENT_VALUE, value));
    }

    public Tracker trackGoal(int idGoal) {
        if (idGoal < 0) {
            return this;
        }
        return track(new TrackMe().set(QueryParams.GOAL_ID, idGoal));
    }

    public Tracker trackGoal(int idGoal, float revenue) {
        if (idGoal < 0) {
            return this;
        }
        return track(new TrackMe().set(QueryParams.GOAL_ID, idGoal).set(QueryParams.REVENUE, revenue));
    }

    public Tracker trackOutlink(URL url) {
        if (url.getProtocol().equals("http") || url.getProtocol().equals("https") || url.getProtocol().equals("ftp")) {
            return track(new TrackMe().set(QueryParams.LINK, url.toExternalForm()).set(QueryParams.URL_PATH, url.toExternalForm()));
        }
        return this;
    }

    public Tracker trackAppDownload() {
        return trackAppDownload(this.mPiwik.getContext(), ExtraIdentifier.INSTALLER_PACKAGENAME);
    }

    public Tracker trackAppDownload(Context app, ExtraIdentifier extra) {
        try {
            PackageInfo pkgInfo = app.getPackageManager().getPackageInfo(app.getPackageName(), 0);
            String firedKey = "downloaded:" + pkgInfo.packageName + ":" + pkgInfo.versionCode;
            if (!getSharedPreferences().getBoolean(firedKey, false)) {
                trackNewAppDownload(app, extra);
                getSharedPreferences().edit().putBoolean(firedKey, true).apply();
            }
        } catch (PackageManager.NameNotFoundException e) {
            e.printStackTrace();
        }
        return this;
    }

    public Tracker trackNewAppDownload(Context app, ExtraIdentifier extra) {
        StringBuilder installationIdentifier = new StringBuilder();
        try {
            String pkg = app.getPackageName();
            installationIdentifier.append("http://").append(pkg);
            PackageManager packMan = app.getPackageManager();
            PackageInfo pkgInfo = packMan.getPackageInfo(pkg, 0);
            installationIdentifier.append(":").append(pkgInfo.versionCode);
            String installerPackageName = packMan.getInstallerPackageName(pkg);
            if (installerPackageName == null || installerPackageName.length() > 200) {
                installerPackageName = DEFAULT_UNKNOWN_VALUE;
            }
            String extraIdentifier = DEFAULT_UNKNOWN_VALUE;
            if (extra == ExtraIdentifier.APK_CHECKSUM) {
                ApplicationInfo appInfo = packMan.getApplicationInfo(pkg, 0);
                if (appInfo.sourceDir != null) {
                    try {
                        extraIdentifier = Checksum.getMD5Checksum(new File(appInfo.sourceDir));
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            } else if (extra == ExtraIdentifier.INSTALLER_PACKAGENAME) {
                extraIdentifier = installerPackageName;
            }
            installationIdentifier.append("/").append(extraIdentifier);
            return track(new TrackMe().set(QueryParams.EVENT_CATEGORY, "Application").set(QueryParams.EVENT_ACTION, "downloaded").set(QueryParams.ACTION_NAME, "application/downloaded").set(QueryParams.URL_PATH, "/application/downloaded").set(QueryParams.DOWNLOAD, installationIdentifier.toString()).set(QueryParams.REFERRER, installerPackageName));
        } catch (PackageManager.NameNotFoundException e2) {
            e2.printStackTrace();
            return this;
        }
    }

    public Tracker trackContentImpression(String contentName, String contentPiece, String contentTarget) {
        if (contentName == null || contentName.length() < 1) {
            return this;
        }
        return track(new TrackMe().set(QueryParams.CONTENT_NAME, contentName).set(QueryParams.CONTENT_PIECE, contentPiece).set(QueryParams.CONTENT_TARGET, contentTarget));
    }

    public Tracker trackContentInteraction(String interaction, String contentName, String contentPiece, String contentTarget) {
        if (contentName == null || contentName.length() < 1 || interaction == null || interaction.length() < 1) {
            return this;
        }
        return track(new TrackMe().set(QueryParams.CONTENT_NAME, contentName).set(QueryParams.CONTENT_PIECE, contentPiece).set(QueryParams.CONTENT_TARGET, contentTarget).set(QueryParams.CONTENT_INTERACTION, interaction));
    }

    public void trackEcommerceCartUpdate(int grandTotal, @Nullable EcommerceItems items) {
        if (items == null) {
            items = new EcommerceItems();
        }
        track(new TrackMe().set(QueryParams.GOAL_ID, 0).set(QueryParams.REVENUE, CurrencyFormatter.priceString(grandTotal)).set(QueryParams.ECOMMERCE_ITEMS, items.toJson()));
    }

    public void trackEcommerceOrder(String orderId, Integer grandTotal, @Nullable Integer subTotal, @Nullable Integer tax, @Nullable Integer shipping, @Nullable Integer discount, @Nullable EcommerceItems items) {
        if (items == null) {
            items = new EcommerceItems();
        }
        TrackMe trackMe = new TrackMe().set(QueryParams.GOAL_ID, 0).set(QueryParams.ORDER_ID, orderId).set(QueryParams.REVENUE, CurrencyFormatter.priceString(grandTotal.intValue())).set(QueryParams.ECOMMERCE_ITEMS, items.toJson());
        if (subTotal != null) {
            trackMe.set(QueryParams.SUBTOTAL, CurrencyFormatter.priceString(subTotal.intValue()));
        }
        if (tax != null) {
            trackMe.set(QueryParams.TAX, CurrencyFormatter.priceString(tax.intValue()));
        }
        if (shipping != null) {
            trackMe.set(QueryParams.SHIPPING, CurrencyFormatter.priceString(shipping.intValue()));
        }
        if (discount != null) {
            trackMe.set(QueryParams.DISCOUNT, CurrencyFormatter.priceString(discount.intValue()));
        }
        track(trackMe);
    }

    public void trackException(Throwable ex, String description, boolean isFatal) {
        String className;
        try {
            StackTraceElement trace = ex.getStackTrace()[0];
            className = trace.getClassName() + "/" + trace.getMethodName() + ":" + trace.getLineNumber();
        } catch (Exception e) {
            Logy.w(LOGGER_TAG, "Couldn't get stack info", e);
            className = ex.getClass().getName();
        }
        String actionName = "exception/" + (isFatal ? "fatal/" : BuildConfig.FLAVOR) + className + "/" + description;
        track(new TrackMe().set(QueryParams.ACTION_NAME, actionName).set(QueryParams.EVENT_CATEGORY, "Exception").set(QueryParams.EVENT_ACTION, className).set(QueryParams.EVENT_NAME, description).set(QueryParams.EVENT_VALUE, isFatal ? 1 : 0));
    }

    private void injectInitialParams(TrackMe trackMe) {
        int visitCount;
        long firstVisitTime;
        long previousVisit;
        synchronized (getSharedPreferences()) {
            visitCount = 1 + getSharedPreferences().getInt(PREF_KEY_TRACKER_VISITCOUNT, 0);
            getSharedPreferences().edit().putInt(PREF_KEY_TRACKER_VISITCOUNT, visitCount).apply();
        }
        synchronized (getSharedPreferences()) {
            firstVisitTime = getSharedPreferences().getLong(PREF_KEY_TRACKER_FIRSTVISIT, -1L);
            if (firstVisitTime == -1) {
                firstVisitTime = System.currentTimeMillis() / 1000;
                getSharedPreferences().edit().putLong(PREF_KEY_TRACKER_FIRSTVISIT, firstVisitTime).apply();
            }
        }
        synchronized (getSharedPreferences()) {
            previousVisit = getSharedPreferences().getLong(PREF_KEY_TRACKER_PREVIOUSVISIT, -1L);
            getSharedPreferences().edit().putLong(PREF_KEY_TRACKER_PREVIOUSVISIT, System.currentTimeMillis() / 1000).apply();
        }
        this.mDefaultTrackMe.trySet(QueryParams.FIRST_VISIT_TIMESTAMP, firstVisitTime);
        this.mDefaultTrackMe.trySet(QueryParams.TOTAL_NUMBER_OF_VISITS, visitCount);
        if (previousVisit != -1) {
            this.mDefaultTrackMe.trySet(QueryParams.PREVIOUS_VISIT_TIMESTAMP, previousVisit);
        }
        trackMe.trySet(QueryParams.SESSION_START, this.mDefaultTrackMe.get(QueryParams.SESSION_START));
        trackMe.trySet(QueryParams.SCREEN_RESOLUTION, this.mDefaultTrackMe.get(QueryParams.SCREEN_RESOLUTION));
        trackMe.trySet(QueryParams.USER_AGENT, this.mDefaultTrackMe.get(QueryParams.USER_AGENT));
        trackMe.trySet(QueryParams.LANGUAGE, this.mDefaultTrackMe.get(QueryParams.LANGUAGE));
        trackMe.trySet(QueryParams.COUNTRY, this.mDefaultTrackMe.get(QueryParams.COUNTRY));
        trackMe.trySet(QueryParams.FIRST_VISIT_TIMESTAMP, this.mDefaultTrackMe.get(QueryParams.FIRST_VISIT_TIMESTAMP));
        trackMe.trySet(QueryParams.TOTAL_NUMBER_OF_VISITS, this.mDefaultTrackMe.get(QueryParams.TOTAL_NUMBER_OF_VISITS));
        trackMe.trySet(QueryParams.PREVIOUS_VISIT_TIMESTAMP, this.mDefaultTrackMe.get(QueryParams.PREVIOUS_VISIT_TIMESTAMP));
    }

    private void injectBaseParams(TrackMe trackMe) {
        trackMe.trySet(QueryParams.SITE_ID, this.mSiteId);
        trackMe.trySet(QueryParams.RECORD, "1");
        trackMe.trySet(QueryParams.API_VERSION, "1");
        trackMe.trySet(QueryParams.RANDOM_NUMBER, this.mRandomAntiCachingValue.nextInt(100000));
        trackMe.trySet(QueryParams.DATETIME_OF_REQUEST, new SimpleDateFormat("yyyy-MM-dd HH:mm:ssZ").format(new Date()));
        trackMe.trySet(QueryParams.SEND_IMAGE, "0");
        trackMe.trySet(QueryParams.VISITOR_ID, this.mDefaultTrackMe.get(QueryParams.VISITOR_ID));
        trackMe.trySet(QueryParams.USER_ID, this.mDefaultTrackMe.get(QueryParams.USER_ID));
        trackMe.trySet(QueryParams.VISIT_SCOPE_CUSTOM_VARIABLES, this.mVisitCustomVariable.toString());
        String urlPath = trackMe.get(QueryParams.URL_PATH);
        if (urlPath == null) {
            urlPath = getApplicationBaseURL() + "/";
        } else if (urlPath.startsWith("/")) {
            urlPath = getApplicationBaseURL() + urlPath;
        } else if (!urlPath.startsWith("http://") && !urlPath.startsWith("https://") && !urlPath.startsWith("ftp://") && !urlPath.startsWith("/")) {
            urlPath = getApplicationBaseURL() + "/" + urlPath;
        }
        trackMe.set(QueryParams.URL_PATH, urlPath);
    }

    public Tracker track(TrackMe trackMe) {
        boolean newSession;
        synchronized (this.mSessionLock) {
            newSession = tryNewSession();
            if (newSession) {
                this.mSessionStartLatch = new CountDownLatch(1);
            }
        }
        if (newSession) {
            injectInitialParams(trackMe);
        } else {
            try {
                this.mSessionStartLatch.await(this.mDispatcher.getTimeOut(), TimeUnit.MILLISECONDS);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        injectBaseParams(trackMe);
        String event = trackMe.build();
        if (this.mPiwik.isOptOut()) {
            this.mLastEvent = event;
            Logy.d(LOGGER_TAG, String.format("URL omitted due to opt out: %s", event));
        } else {
            Logy.d(LOGGER_TAG, String.format("URL added to the queue: %s", event));
            this.mDispatcher.submit(event);
        }
        if (newSession) {
            this.mSessionStartLatch.countDown();
        }
        return this;
    }

    public static String makeRandomVisitorId() {
        return UUID.randomUUID().toString().replaceAll("-", BuildConfig.FLAVOR).substring(0, 16);
    }

    public Tracker setVisitCustomVariable(int index, String name, String value) {
        this.mVisitCustomVariable.put(index, name, value);
        return this;
    }

    public SharedPreferences getSharedPreferences() {
        return this.mPiwik.getSharedPreferences();
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Tracker tracker = (Tracker) o;
        return this.mSiteId == tracker.mSiteId && this.mApiUrl.equals(tracker.mApiUrl);
    }

    public int hashCode() {
        int result = this.mSiteId;
        return (31 * result) + this.mApiUrl.hashCode();
    }

    protected String getApplicationBaseURL() {
        return String.format("http://%s", getApplicationDomain());
    }

    protected String getLastEvent() {
        return this.mLastEvent;
    }

    protected void clearLastEvent() {
        this.mLastEvent = null;
    }

    protected Dispatcher getDispatcher() {
        return this.mDispatcher;
    }
}
