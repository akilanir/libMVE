package yuku.ambilwarna.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.os.Parcel;
import android.os.Parcelable;
import android.preference.Preference;
import android.util.AttributeSet;
import android.view.View;
import yuku.ambilwarna.AmbilWarnaDialog;
import yuku.ambilwarna.R;

/* loaded from: com.github.yukuku.ambilwarna.2.0.1.jar:yuku/ambilwarna/widget/AmbilWarnaPreference.class */
public class AmbilWarnaPreference extends Preference {
    private final boolean supportsAlpha;
    int value;

    public AmbilWarnaPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
        TypedArray ta = context.obtainStyledAttributes(attrs, R.styleable.AmbilWarnaPreference);
        this.supportsAlpha = ta.getBoolean(R.styleable.AmbilWarnaPreference_supportsAlpha, false);
        setWidgetLayoutResource(R.layout.ambilwarna_pref_widget);
    }

    @Override // android.preference.Preference
    protected void onBindView(View view) {
        super.onBindView(view);
        View box = view.findViewById(R.id.ambilwarna_pref_widget_box);
        if (box != null) {
            box.setBackgroundColor(this.value);
        }
    }

    @Override // android.preference.Preference
    protected void onClick() {
        new AmbilWarnaDialog(getContext(), this.value, this.supportsAlpha, new AmbilWarnaDialog.OnAmbilWarnaListener() { // from class: yuku.ambilwarna.widget.AmbilWarnaPreference.1
            @Override // yuku.ambilwarna.AmbilWarnaDialog.OnAmbilWarnaListener
            public void onOk(AmbilWarnaDialog dialog, int color) {
                if (AmbilWarnaPreference.this.callChangeListener(Integer.valueOf(color))) {
                    AmbilWarnaPreference.this.value = color;
                    AmbilWarnaPreference.this.persistInt(AmbilWarnaPreference.this.value);
                    AmbilWarnaPreference.this.notifyChanged();
                }
            }

            @Override // yuku.ambilwarna.AmbilWarnaDialog.OnAmbilWarnaListener
            public void onCancel(AmbilWarnaDialog dialog) {
            }
        }).show();
    }

    public void forceSetValue(int value) {
        this.value = value;
        persistInt(value);
        notifyChanged();
    }

    @Override // android.preference.Preference
    protected Object onGetDefaultValue(TypedArray a, int index) {
        return Integer.valueOf(a.getInteger(index, 0));
    }

    @Override // android.preference.Preference
    protected void onSetInitialValue(boolean restoreValue, Object defaultValue) {
        if (restoreValue) {
            this.value = getPersistedInt(this.value);
            return;
        }
        int value = ((Integer) defaultValue).intValue();
        this.value = value;
        persistInt(value);
    }

    @Override // android.preference.Preference
    protected Parcelable onSaveInstanceState() {
        Parcelable superState = super.onSaveInstanceState();
        if (isPersistent()) {
            return superState;
        }
        SavedState myState = new SavedState(superState);
        myState.value = this.value;
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
        this.value = myState.value;
        notifyChanged();
    }

    /* loaded from: com.github.yukuku.ambilwarna.2.0.1.jar:yuku/ambilwarna/widget/AmbilWarnaPreference$SavedState.class */
    private static class SavedState extends Preference.BaseSavedState {
        int value;
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator<SavedState>() { // from class: yuku.ambilwarna.widget.AmbilWarnaPreference.SavedState.1
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
            this.value = source.readInt();
        }

        @Override // android.view.AbsSavedState, android.os.Parcelable
        public void writeToParcel(Parcel dest, int flags) {
            super.writeToParcel(dest, flags);
            dest.writeInt(this.value);
        }

        public SavedState(Parcelable superState) {
            super(superState);
        }
    }
}
