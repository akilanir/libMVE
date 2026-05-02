package android.support.v4.content;

import android.content.ContentResolver;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.support.v4.os.CancellationSignal;

/* loaded from: com.android.support.support-v4.23.0.0.jar:android/support/v4/content/ContentResolverCompat.class */
public class ContentResolverCompat {
    private static final ContentResolverCompatImpl IMPL;

    /* loaded from: com.android.support.support-v4.23.0.0.jar:android/support/v4/content/ContentResolverCompat$ContentResolverCompatImpl.class */
    interface ContentResolverCompatImpl {
        Cursor query(ContentResolver contentResolver, Uri uri, String[] strArr, String str, String[] strArr2, String str2, CancellationSignal cancellationSignal);
    }

    /* loaded from: com.android.support.support-v4.23.0.0.jar:android/support/v4/content/ContentResolverCompat$ContentResolverCompatImplBase.class */
    static class ContentResolverCompatImplBase implements ContentResolverCompatImpl {
        ContentResolverCompatImplBase() {
        }

        @Override // android.support.v4.content.ContentResolverCompat.ContentResolverCompatImpl
        public Cursor query(ContentResolver resolver, Uri uri, String[] projection, String selection, String[] selectionArgs, String sortOrder, CancellationSignal cancellationSignal) {
            if (cancellationSignal != null) {
                cancellationSignal.throwIfCanceled();
            }
            return resolver.query(uri, projection, selection, selectionArgs, sortOrder);
        }
    }

    /* loaded from: com.android.support.support-v4.23.0.0.jar:android/support/v4/content/ContentResolverCompat$ContentResolverCompatImplJB.class */
    static class ContentResolverCompatImplJB extends ContentResolverCompatImplBase {
        ContentResolverCompatImplJB() {
        }

        @Override // android.support.v4.content.ContentResolverCompat.ContentResolverCompatImplBase, android.support.v4.content.ContentResolverCompat.ContentResolverCompatImpl
        public Cursor query(ContentResolver resolver, Uri uri, String[] projection, String selection, String[] selectionArgs, String sortOrder, CancellationSignal cancellationSignal) {
            return ContentResolverCompatJellybean.query(resolver, uri, projection, selection, selectionArgs, sortOrder, cancellationSignal != null ? cancellationSignal.getCancellationSignalObject() : null);
        }
    }

    static {
        int version = Build.VERSION.SDK_INT;
        if (version >= 16) {
            IMPL = new ContentResolverCompatImplJB();
        } else {
            IMPL = new ContentResolverCompatImplBase();
        }
    }

    private ContentResolverCompat() {
    }

    public static Cursor query(ContentResolver resolver, Uri uri, String[] projection, String selection, String[] selectionArgs, String sortOrder, CancellationSignal cancellationSignal) {
        return IMPL.query(resolver, uri, projection, selection, selectionArgs, sortOrder, cancellationSignal);
    }
}
