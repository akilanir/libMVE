package org.osmdroid.tileprovider.util;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import android.provider.Settings;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.osmdroid.http.HttpClientFactory;
import org.osmdroid.tileprovider.constants.OpenStreetMapTileProviderConstants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/* loaded from: osmdroid-android-4.3.jar:org/osmdroid/tileprovider/util/CloudmadeUtil.class */
public class CloudmadeUtil implements OpenStreetMapTileProviderConstants {
    private static final String CLOUDMADE_KEY = "CLOUDMADE_KEY";
    private static final String CLOUDMADE_ID = "CLOUDMADE_ID";
    private static final String CLOUDMADE_TOKEN = "CLOUDMADE_TOKEN";
    private static SharedPreferences.Editor mPreferenceEditor;
    private static final Logger logger = LoggerFactory.getLogger(CloudmadeUtil.class);
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

    public static String getCloudmadeToken() {
        if (mToken.length() == 0) {
            synchronized (mToken) {
                if (mToken.length() == 0) {
                    String url = "http://auth.cloudmade.com/token/" + mKey + "?userid=" + mAndroidId;
                    HttpClient httpClient = HttpClientFactory.createHttpClient();
                    HttpPost httpPost = new HttpPost(url);
                    try {
                        httpPost.setEntity(new StringEntity("", "utf-8"));
                        HttpResponse response = httpClient.execute(httpPost);
                        if (response.getStatusLine().getStatusCode() == 200) {
                            BufferedReader br = new BufferedReader(new InputStreamReader(response.getEntity().getContent()), StreamUtils.IO_BUFFER_SIZE);
                            String line = br.readLine();
                            mToken = line.trim();
                            if (mToken.length() > 0) {
                                mPreferenceEditor.putString(CLOUDMADE_TOKEN, mToken);
                                mPreferenceEditor.commit();
                                mPreferenceEditor = null;
                            } else {
                                logger.error("No authorization token received from Cloudmade");
                            }
                        }
                    } catch (IOException e) {
                        logger.error("No authorization token received from Cloudmade: " + e);
                    }
                }
            }
        }
        return mToken;
    }
}
