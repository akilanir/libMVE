package android.support.v7.preference;

import android.R;
import android.content.Context;
import android.content.res.TypedArray;
import android.support.v4.content.res.TypedArrayUtils;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.View;
import android.view.accessibility.AccessibilityManager;
import android.widget.Checkable;

/* loaded from: com.android.support.preference-v7.23.1.0.jar:android/support/v7/preference/CheckBoxPreference.class */
public class CheckBoxPreference extends TwoStatePreference {
    public CheckBoxPreference(Context context, AttributeSet attrs, int defStyleAttr) {
        this(context, attrs, defStyleAttr, 0);
    }

    public CheckBoxPreference(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.CheckBoxPreference, defStyleAttr, defStyleRes);
        setSummaryOn(TypedArrayUtils.getString(a, R.styleable.CheckBoxPreference_summaryOn, R.styleable.CheckBoxPreference_android_summaryOn));
        setSummaryOff(TypedArrayUtils.getString(a, R.styleable.CheckBoxPreference_summaryOff, R.styleable.CheckBoxPreference_android_summaryOff));
        setDisableDependentsState(TypedArrayUtils.getBoolean(a, R.styleable.CheckBoxPreference_disableDependentsState, R.styleable.CheckBoxPreference_android_disableDependentsState, false));
        a.recycle();
    }

    public CheckBoxPreference(Context context, AttributeSet attrs) {
        this(context, attrs, R.attr.checkBoxPreferenceStyle);
    }

    public CheckBoxPreference(Context context) {
        this(context, null);
    }

    @Override // android.support.v7.preference.Preference
    public void onBindViewHolder(PreferenceViewHolder holder) {
        super.onBindViewHolder(holder);
        KeyEvent.Callback findViewById = holder.findViewById(R.id.checkbox);
        if (findViewById != null && (findViewById instanceof Checkable)) {
            ((Checkable) findViewById).setChecked(this.mChecked);
        }
        syncSummaryView(holder);
    }

    @Override // android.support.v7.preference.Preference
    protected void performClick(View view) {
        super.performClick(view);
        syncViewIfAccessibilityEnabled(view);
    }

    private void syncViewIfAccessibilityEnabled(View view) {
        AccessibilityManager accessibilityManager = (AccessibilityManager) getContext().getSystemService("accessibility");
        if (!accessibilityManager.isEnabled()) {
            return;
        }
        View checkboxView = view.findViewById(R.id.checkbox);
        syncCheckboxView(checkboxView);
        View summaryView = view.findViewById(R.id.summary);
        syncSummaryView(summaryView);
    }

    /* JADX WARN: Multi-variable type inference failed */
    private void syncCheckboxView(View view) {
        if (view instanceof Checkable) {
            ((Checkable) view).setChecked(this.mChecked);
        }
    }
}
