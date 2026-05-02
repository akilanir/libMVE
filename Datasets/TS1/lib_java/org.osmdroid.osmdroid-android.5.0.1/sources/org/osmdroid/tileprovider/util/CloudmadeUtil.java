package org.osmdroid.tileprovider.util;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import android.provider.Settings;
import android.util.Log;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import org.osmdroid.api.IMapView;
import org.osmdroid.tileprovider.constants.OpenStreetMapTileProviderConstants;

/* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/tileprovider/util/CloudmadeUtil.class */
public class CloudmadeUtil {
    private static final String CLOUDMADE_KEY = "CLOUDMADE_KEY";
    private static final String CLOUDMADE_ID = "CLOUDMADE_ID";
    private static final String CLOUDMADE_TOKEN = "CLOUDMADE_TOKEN";
    private static SharedPreferences.Editor mPreferenceEditor;
    public static boolean DEBUGMODE = false;
    private static String mAndroidId = "android_id";
    private static String mKey = "";
    private static String mToken = "";

    public static void retrieveCloudmadeKey(Context aContext) {
        mAndroidId = Settings.Secure.getString(aContext.getContentResolver(), "android_id");
        mKey = ManifestUtil.retrieveKey(aContext, CLOUDMADE_KEY);
        SharedPreferences pref = PreferenceManager.getDefaultSharedPreferences(aContext);
        mPreferenceEditor = pref.edit();
        String id = pref.getString(CLOUDMADE_ID, "");
        if (id.equals(mAndroidId)) {
            mToken = pref.getString(CLOUDMADE_TOKEN, "");
            if (mToken.length() > 0) {
                mPreferenceEditor = null;
                return;
            }
            return;
        }
        mPreferenceEditor.putString(CLOUDMADE_ID, mAndroidId);
        mPreferenceEditor.commit();
    }

    public static String getCloudmadeKey() {
        return mKey;
    }

    public static void setCloudmadeKey(String key) {
        mKey = key;
    }

    public static String getCloudmadeToken() {
        if (mToken.length() == 0) {
            synchronized (mToken) {
                if (mToken.length() == 0) {
                    String url = "http://auth.cloudmade.com/token/" + mKey + "?userid=" + mAndroidId;
                    HttpURLConnection urlConnection = null;
                    try {
                        try {
                            URL urlToRequest = new URL(url);
                            urlConnection = (HttpURLConnection) urlToRequest.openConnection();
                            urlConnection.setDoOutput(true);
                            urlConnection.setRequestMethod("POST");
                            urlConnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
                            urlConnection.setRequestProperty(OpenStreetMapTileProviderConstants.USER_AGENT, OpenStreetMapTileProviderConstants.getUserAgentValue());
                            urlConnection.connect();
                            if (DEBUGMODE) {
                                Log.d(IMapView.LOGTAG, "Response from Cloudmade auth: " + urlConnection.getResponseMessage());
                            }
                            if (urlConnection.getResponseCode() == 200) {
                                BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()), StreamUtils.IO_BUFFER_SIZE);
                                String line = br.readLine();
                                if (DEBUGMODE) {
                                    Log.d(IMapView.LOGTAG, "First line from Cloudmade auth: " + line);
                                }
                                mToken = line.trim();
                                if (mToken.length() > 0) {
                                    mPreferenceEditor.putString(CLOUDMADE_TOKEN, mToken);
                                    mPreferenceEditor.commit();
                                    mPreferenceEditor = null;
                                } else {
                                    Log.e(IMapView.LOGTAG, "No authorization token received from Cloudmade");
                                }
                            }
                        } finally {
                            if (urlConnection != null) {
                                try {
                                    urlConnection.disconnect();
                                } catch (Exception e) {
                                }
                            }
                        }
                    } catch (IOException e2) {
                        Log.e(IMapView.LOGTAG, "No authorization token received from Cloudmade: " + e2);
                        if (urlConnection != null) {
                            try {
                                urlConnection.disconnect();
                            } catch (Exception e3) {
                            }
                        }
                    }
                }
            }
        }
        return mToken;
    }
}
