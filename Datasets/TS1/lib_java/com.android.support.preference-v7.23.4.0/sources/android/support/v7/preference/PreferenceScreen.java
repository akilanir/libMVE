package android.support.v7.preference;

import android.content.Context;
import android.support.v7.preference.PreferenceManager;
import android.util.AttributeSet;

/* loaded from: com.android.support.preference-v7.23.4.0.jar:android/support/v7/preference/PreferenceScreen.class */
public final class PreferenceScreen extends PreferenceGroup {
    private boolean mShouldUseGeneratedIds;

    public PreferenceScreen(Context context, AttributeSet attrs) {
        super(context, attrs, R.attr.preferenceScreenStyle);
        this.mShouldUseGeneratedIds = true;
    }

    @Override // android.support.v7.preference.Preference
    protected void onClick() {
        PreferenceManager.OnNavigateToScreenListener listener;
        if (getIntent() == null && getFragment() == null && getPreferenceCount() != 0 && (listener = getPreferenceManager().getOnNavigateToScreenListener()) != null) {
            listener.onNavigateToScreen(this);
        }
    }

    @Override // android.support.v7.preference.PreferenceGroup
    protected boolean isOnSameScreenAsChildren() {
        return false;
    }

    public boolean shouldUseGeneratedIds() {
        return this.mShouldUseGeneratedIds;
    }

    public void setShouldUseGeneratedIds(boolean shouldUseGeneratedIds) {
        if (isAttached()) {
            throw new IllegalStateException("Cannot change the usage of generated IDs while attached to the preference hierarchy");
        }
        this.mShouldUseGeneratedIds = shouldUseGeneratedIds;
    }
}
