package android.support.v4.content;

import android.content.SharedPreferences;
import android.support.annotation.NonNull;

/* loaded from: internal_impl-23.2.0.jar:android/support/v4/content/EditorCompatGingerbread.class */
class EditorCompatGingerbread {
    EditorCompatGingerbread() {
    }

    public static void apply(@NonNull SharedPreferences.Editor editor) {
        try {
            editor.apply();
        } catch (AbstractMethodError e) {
            editor.commit();
        }
    }
}
