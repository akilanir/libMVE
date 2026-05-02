package android.support.v4.content;

import android.content.SharedPreferences;
import android.os.Build;
import android.support.annotation.NonNull;

/* loaded from: com.android.support.support-v4.23.0.1.jar:android/support/v4/content/SharedPreferencesCompat.class */
public class SharedPreferencesCompat {

    /* loaded from: com.android.support.support-v4.23.0.1.jar:android/support/v4/content/SharedPreferencesCompat$EditorCompat.class */
    public static class EditorCompat {
        private static EditorCompat sInstance;
        private final Helper mHelper;

        /* loaded from: com.android.support.support-v4.23.0.1.jar:android/support/v4/content/SharedPreferencesCompat$EditorCompat$Helper.class */
        private interface Helper {
            void apply(@NonNull SharedPreferences.Editor editor);
        }

        /* loaded from: com.android.support.support-v4.23.0.1.jar:android/support/v4/content/SharedPreferencesCompat$EditorCompat$EditorHelperBaseImpl.class */
        private static class EditorHelperBaseImpl implements Helper {
            private EditorHelperBaseImpl() {
            }

            @Override // android.support.v4.content.SharedPreferencesCompat.EditorCompat.Helper
            public void apply(@NonNull SharedPreferences.Editor editor) {
                editor.commit();
            }
        }

        /* loaded from: com.android.support.support-v4.23.0.1.jar:android/support/v4/content/SharedPreferencesCompat$EditorCompat$EditorHelperApi9Impl.class */
        private static class EditorHelperApi9Impl implements Helper {
            private EditorHelperApi9Impl() {
            }

            @Override // android.support.v4.content.SharedPreferencesCompat.EditorCompat.Helper
            public void apply(@NonNull SharedPreferences.Editor editor) {
                EditorCompatGingerbread.apply(editor);
            }
        }

        private EditorCompat() {
            if (Build.VERSION.SDK_INT >= 9) {
                this.mHelper = new EditorHelperApi9Impl();
            } else {
                this.mHelper = new EditorHelperBaseImpl();
            }
        }

        public static EditorCompat getInstance() {
            if (sInstance == null) {
                sInstance = new EditorCompat();
            }
            return sInstance;
        }

        public void apply(@NonNull SharedPreferences.Editor editor) {
            this.mHelper.apply(editor);
        }
    }
}
