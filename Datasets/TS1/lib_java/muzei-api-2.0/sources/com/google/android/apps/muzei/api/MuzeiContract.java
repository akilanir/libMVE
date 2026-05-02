package com.google.android.apps.muzei.api;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Looper;
import android.provider.BaseColumns;
import java.io.FileNotFoundException;

/* loaded from: muzei-api-2.0.jar:com/google/android/apps/muzei/api/MuzeiContract.class */
public class MuzeiContract {
    public static final String AUTHORITY = "com.google.android.apps.muzei";
    private static final String SCHEME = "content://";

    private MuzeiContract() {
    }

    /* loaded from: muzei-api-2.0.jar:com/google/android/apps/muzei/api/MuzeiContract$Artwork.class */
    public static final class Artwork implements BaseColumns {
        public static final String COLUMN_NAME_IMAGE_URI = "imageUri";
        public static final String COLUMN_NAME_TITLE = "title";
        public static final String COLUMN_NAME_BYLINE = "byline";
        public static final String COLUMN_NAME_TOKEN = "token";
        public static final String COLUMN_NAME_VIEW_INTENT = "viewIntent";
        public static final String CONTENT_TYPE = "vnd.android.cursor.dir/vnd.google.android.apps.muzei.artwork";
        public static final String TABLE_NAME = "artwork";
        public static final Uri CONTENT_URI = Uri.parse("content://com.google.android.apps.muzei/artwork");
        public static final String ACTION_ARTWORK_CHANGED = "com.google.android.apps.muzei.ACTION_ARTWORK_CHANGED";

        private Artwork() {
        }

        public static com.google.android.apps.muzei.api.Artwork getCurrentArtwork(Context context) {
            ContentResolver contentResolver = context.getContentResolver();
            Cursor cursor = contentResolver.query(CONTENT_URI, null, null, null, null);
            if (cursor == null) {
                return null;
            }
            try {
                if (!cursor.moveToFirst()) {
                    return null;
                }
                com.google.android.apps.muzei.api.Artwork fromCursor = com.google.android.apps.muzei.api.Artwork.fromCursor(cursor);
                cursor.close();
                return fromCursor;
            } finally {
                cursor.close();
            }
        }

        public static Bitmap getCurrentArtworkBitmap(Context context) throws FileNotFoundException {
            if (Looper.myLooper() == Looper.getMainLooper()) {
                throw new IllegalStateException("getCurrentArtworkBitmap cannot be called on the main thread");
            }
            ContentResolver contentResolver = context.getContentResolver();
            return BitmapFactory.decodeStream(contentResolver.openInputStream(CONTENT_URI));
        }
    }
}
