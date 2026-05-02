package org.openintents.openpgp.util;

import android.app.Activity;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.IntentSender;
import android.content.res.TypedArray;
import android.os.Parcel;
import android.os.Parcelable;
import android.preference.Preference;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.Log;
import org.openintents.openpgp.IOpenPgpService2;
import org.openintents.openpgp.OpenPgpError;
import org.openintents.openpgp.R;
import org.openintents.openpgp.util.OpenPgpApi;
import org.openintents.openpgp.util.OpenPgpServiceConnection;

/* loaded from: org.sufficientlysecure.openpgp-api.9.0.jar:org/openintents/openpgp/util/OpenPgpKeyPreference.class */
public class OpenPgpKeyPreference extends Preference {
    private long mKeyId;
    private String mOpenPgpProvider;
    private OpenPgpServiceConnection mServiceConnection;
    private String mDefaultUserId;
    public static final int REQUEST_CODE_KEY_PREFERENCE = 9999;
    private static final int NO_KEY = 0;

    public OpenPgpKeyPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    @Override // android.preference.Preference
    public CharSequence getSummary() {
        return this.mKeyId == 0 ? getContext().getString(R.string.openpgp_no_key_selected) : getContext().getString(R.string.openpgp_key_selected);
    }

    private void updateEnabled() {
        if (TextUtils.isEmpty(this.mOpenPgpProvider)) {
            setEnabled(false);
        } else {
            setEnabled(true);
        }
    }

    public void setOpenPgpProvider(String packageName) {
        this.mOpenPgpProvider = packageName;
        updateEnabled();
    }

    public void setDefaultUserId(String userId) {
        this.mDefaultUserId = userId;
    }

    @Override // android.preference.Preference
    protected void onClick() {
        this.mServiceConnection = new OpenPgpServiceConnection(getContext().getApplicationContext(), this.mOpenPgpProvider, new OpenPgpServiceConnection.OnBound() { // from class: org.openintents.openpgp.util.OpenPgpKeyPreference.1
            @Override // org.openintents.openpgp.util.OpenPgpServiceConnection.OnBound
            public void onBound(IOpenPgpService2 service) {
                OpenPgpKeyPreference.this.getSignKeyId(new Intent());
            }

            @Override // org.openintents.openpgp.util.OpenPgpServiceConnection.OnBound
            public void onError(Exception e) {
                Log.e(OpenPgpApi.TAG, "exception on binding!", e);
            }
        });
        this.mServiceConnection.bindToService();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void getSignKeyId(Intent data) {
        data.setAction(OpenPgpApi.ACTION_GET_SIGN_KEY_ID);
        data.putExtra(OpenPgpApi.EXTRA_USER_ID, this.mDefaultUserId);
        OpenPgpApi api = new OpenPgpApi(getContext(), this.mServiceConnection.getService());
        api.executeApiAsync(data, null, null, new MyCallback(REQUEST_CODE_KEY_PREFERENCE));
    }

    /* loaded from: org.sufficientlysecure.openpgp-api.9.0.jar:org/openintents/openpgp/util/OpenPgpKeyPreference$MyCallback.class */
    private class MyCallback implements OpenPgpApi.IOpenPgpCallback {
        int requestCode;

        private MyCallback(int requestCode) {
            this.requestCode = requestCode;
        }

        @Override // org.openintents.openpgp.util.OpenPgpApi.IOpenPgpCallback
        public void onReturn(Intent result) {
            switch (result.getIntExtra(OpenPgpApi.RESULT_CODE, 0)) {
                case 0:
                    OpenPgpError error = (OpenPgpError) result.getParcelableExtra(OpenPgpApi.RESULT_ERROR);
                    Log.e(OpenPgpApi.TAG, "RESULT_CODE_ERROR: " + error.getMessage());
                    break;
                case 1:
                    long keyId = result.getLongExtra(OpenPgpApi.EXTRA_SIGN_KEY_ID, 0L);
                    OpenPgpKeyPreference.this.save(keyId);
                    break;
                case 2:
                    PendingIntent pi = (PendingIntent) result.getParcelableExtra(OpenPgpApi.RESULT_INTENT);
                    try {
                        Activity act = (Activity) OpenPgpKeyPreference.this.getContext();
                        act.startIntentSenderFromChild(act, pi.getIntentSender(), this.requestCode, null, 0, 0, 0);
                        break;
                    } catch (IntentSender.SendIntentException e) {
                        Log.e(OpenPgpApi.TAG, "SendIntentException", e);
                        return;
                    }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void save(long newValue) {
        if (!callChangeListener(Long.valueOf(newValue))) {
            return;
        }
        setAndPersist(newValue);
    }

    public void setValue(long keyId) {
        setAndPersist(keyId);
    }

    public long getValue() {
        return this.mKeyId;
    }

    private void setAndPersist(long newValue) {
        this.mKeyId = newValue;
        persistLong(this.mKeyId);
        notifyChanged();
        setSummary(getSummary());
    }

    @Override // android.preference.Preference
    protected Object onGetDefaultValue(TypedArray a, int index) {
        return Long.valueOf(a.getInteger(index, 0));
    }

    @Override // android.preference.Preference
    protected void onSetInitialValue(boolean restoreValue, Object defaultValue) {
        if (restoreValue) {
            this.mKeyId = getPersistedLong(this.mKeyId);
        } else {
            long value = ((Long) defaultValue).longValue();
            setAndPersist(value);
        }
    }

    @Override // android.preference.Preference
    protected Parcelable onSaveInstanceState() {
        Parcelable superState = super.onSaveInstanceState();
        if (isPersistent()) {
            return superState;
        }
        SavedState myState = new SavedState(superState);
        myState.keyId = this.mKeyId;
        myState.openPgpProvider = this.mOpenPgpProvider;
        myState.defaultUserId = this.mDefaultUserId;
        return myState;
    }

    @Override // android.preference.Preference
    protected void onRestoreInstanceState(Parcelable state) {
        if (!state.getClass().equals(SavedState.class)) {
            super.onRestoreInstanceState(state);
            return;
        }
        SavedState myState = (SavedState) state;
        super.onRestoreInstanceState(myState.getSuperState());
        this.mKeyId = myState.keyId;
        this.mOpenPgpProvider = myState.openPgpProvider;
        this.mDefaultUserId = myState.defaultUserId;
        notifyChanged();
    }

    /* loaded from: org.sufficientlysecure.openpgp-api.9.0.jar:org/openintents/openpgp/util/OpenPgpKeyPreference$SavedState.class */
    private static class SavedState extends Preference.BaseSavedState {
        long keyId;
        String openPgpProvider;
        String defaultUserId;
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator<SavedState>() { // from class: org.openintents.openpgp.util.OpenPgpKeyPreference.SavedState.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public SavedState createFromParcel(Parcel in) {
                return new SavedState(in);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public SavedState[] newArray(int size) {
                return new SavedState[size];
            }
        };

        public SavedState(Parcel source) {
            super(source);
            this.keyId = source.readInt();
            this.openPgpProvider = source.readString();
            this.defaultUserId = source.readString();
        }

        @Override // android.view.AbsSavedState, android.os.Parcelable
        public void writeToParcel(Parcel dest, int flags) {
            super.writeToParcel(dest, flags);
            dest.writeLong(this.keyId);
            dest.writeString(this.openPgpProvider);
            dest.writeString(this.defaultUserId);
        }

        public SavedState(Parcelable superState) {
            super(superState);
        }
    }

    public boolean handleOnActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == 9999 && resultCode == -1) {
            getSignKeyId(data);
            return true;
        }
        return false;
    }
}
