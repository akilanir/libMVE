package com.google.android.apps.muzei.api;

import android.content.ContentValues;
import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import java.net.URISyntaxException;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: muzei-api-2.0.jar:com/google/android/apps/muzei/api/Artwork.class */
public class Artwork {
    private static final String KEY_IMAGE_URI = "imageUri";
    private static final String KEY_TITLE = "title";
    private static final String KEY_BYLINE = "byline";
    private static final String KEY_TOKEN = "token";
    private static final String KEY_VIEW_INTENT = "viewIntent";
    private static final String KEY_DETAILS_URI = "detailsUri";
    private Uri mImageUri;
    private String mTitle;
    private String mByline;
    private String mToken;
    private Intent mViewIntent;

    private Artwork() {
    }

    public Uri getImageUri() {
        return this.mImageUri;
    }

    public String getTitle() {
        return this.mTitle;
    }

    public String getByline() {
        return this.mByline;
    }

    public String getToken() {
        return this.mToken;
    }

    public Intent getViewIntent() {
        return this.mViewIntent;
    }

    /* loaded from: muzei-api-2.0.jar:com/google/android/apps/muzei/api/Artwork$Builder.class */
    public static class Builder {
        private Artwork mArtwork = new Artwork();

        public Builder imageUri(Uri imageUri) {
            this.mArtwork.mImageUri = imageUri;
            return this;
        }

        public Builder title(String title) {
            this.mArtwork.mTitle = title;
            return this;
        }

        public Builder byline(String byline) {
            this.mArtwork.mByline = byline;
            return this;
        }

        public Builder token(String token) {
            this.mArtwork.mToken = token;
            return this;
        }

        public Builder viewIntent(Intent viewIntent) {
            this.mArtwork.mViewIntent = viewIntent;
            return this;
        }

        public Artwork build() {
            return this.mArtwork;
        }
    }

    public Bundle toBundle() {
        Bundle bundle = new Bundle();
        bundle.putString("imageUri", this.mImageUri != null ? this.mImageUri.toString() : null);
        bundle.putString("title", this.mTitle);
        bundle.putString("byline", this.mByline);
        bundle.putString("token", this.mToken);
        bundle.putString("viewIntent", this.mViewIntent != null ? this.mViewIntent.toUri(1) : null);
        return bundle;
    }

    public static Artwork fromBundle(Bundle bundle) {
        Builder builder = new Builder().title(bundle.getString("title")).byline(bundle.getString("byline")).token(bundle.getString("token"));
        String imageUri = bundle.getString("imageUri");
        if (!TextUtils.isEmpty(imageUri)) {
            builder.imageUri(Uri.parse(imageUri));
        }
        try {
            String viewIntent = bundle.getString("viewIntent");
            if (!TextUtils.isEmpty(viewIntent)) {
                builder.viewIntent(Intent.parseUri(viewIntent, 1));
            }
        } catch (URISyntaxException e) {
        }
        return builder.build();
    }

    public JSONObject toJson() throws JSONException {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("imageUri", this.mImageUri != null ? this.mImageUri.toString() : null);
        jsonObject.put("title", this.mTitle);
        jsonObject.put("byline", this.mByline);
        jsonObject.put("token", this.mToken);
        jsonObject.put("viewIntent", this.mViewIntent != null ? this.mViewIntent.toUri(1) : null);
        return jsonObject;
    }

    public static Artwork fromJson(JSONObject jsonObject) throws JSONException {
        Builder builder = new Builder().title(jsonObject.optString("title")).byline(jsonObject.optString("byline")).token(jsonObject.optString("token"));
        String imageUri = jsonObject.optString("imageUri");
        if (!TextUtils.isEmpty(imageUri)) {
            builder.imageUri(Uri.parse(imageUri));
        }
        try {
            String viewIntent = jsonObject.optString("viewIntent");
            String detailsUri = jsonObject.optString(KEY_DETAILS_URI);
            if (!TextUtils.isEmpty(viewIntent)) {
                builder.viewIntent(Intent.parseUri(viewIntent, 1));
            } else if (!TextUtils.isEmpty(detailsUri)) {
                builder.viewIntent(new Intent("android.intent.action.VIEW", Uri.parse(detailsUri)));
            }
        } catch (URISyntaxException e) {
        }
        return builder.build();
    }

    public ContentValues toContentValues() {
        ContentValues values = new ContentValues();
        values.put("imageUri", this.mImageUri != null ? this.mImageUri.toString() : null);
        values.put("title", this.mTitle);
        values.put("byline", this.mByline);
        values.put("token", this.mToken);
        values.put("viewIntent", this.mViewIntent != null ? this.mViewIntent.toUri(1) : null);
        return values;
    }

    public static Artwork fromCursor(Cursor cursor) {
        Builder builder = new Builder();
        int imageUriColumnIndex = cursor.getColumnIndex("imageUri");
        if (imageUriColumnIndex != -1) {
            builder.imageUri(Uri.parse(cursor.getString(imageUriColumnIndex)));
        }
        int titleColumnIndex = cursor.getColumnIndex("title");
        if (titleColumnIndex != -1) {
            builder.title(cursor.getString(titleColumnIndex));
        }
        int bylineColumnIndex = cursor.getColumnIndex("byline");
        if (bylineColumnIndex != -1) {
            builder.byline(cursor.getString(bylineColumnIndex));
        }
        int tokenColumnIndex = cursor.getColumnIndex("token");
        if (tokenColumnIndex != -1) {
            builder.token(cursor.getString(tokenColumnIndex));
        }
        int viewIntentColumnIndex = cursor.getColumnIndex("viewIntent");
        if (viewIntentColumnIndex != -1) {
            try {
                String viewIntent = cursor.getString(viewIntentColumnIndex);
                if (!TextUtils.isEmpty(viewIntent)) {
                    builder.viewIntent(Intent.parseUri(viewIntent, 1));
                }
            } catch (URISyntaxException e) {
            }
        }
        return builder.build();
    }
}
