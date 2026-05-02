package android.support.v7.app;

import android.support.annotation.Nullable;
import android.support.v7.view.ActionMode;

/* loaded from: com.android.support.appcompat-v7.22.2.1.jar:android/support/v7/app/AppCompatCallback.class */
public interface AppCompatCallback {
    void onSupportActionModeStarted(ActionMode actionMode);

    void onSupportActionModeFinished(ActionMode actionMode);

    @Nullable
    ActionMode onWindowStartingSupportActionMode(ActionMode.Callback callback);
}
