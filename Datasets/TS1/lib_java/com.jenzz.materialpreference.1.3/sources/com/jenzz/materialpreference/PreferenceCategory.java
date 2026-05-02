package com.jenzz.materialpreference;

import android.annotation.TargetApi;
import android.content.Context;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

/* loaded from: com.jenzz.materialpreference.1.3.jar:com/jenzz/materialpreference/PreferenceCategory.class */
public class PreferenceCategory extends android.preference.PreferenceCategory {
    private int accentColor;

    public PreferenceCategory(Context context) {
        super(context);
        init();
    }

    public PreferenceCategory(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public PreferenceCategory(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init();
    }

    @TargetApi(21)
    public PreferenceCategory(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        init();
    }

    private void init() {
        this.accentColor = ThemeUtils.resolveAccentColor(getContext());
    }

    @Override // android.preference.Preference
    protected View onCreateView(ViewGroup parent) {
        LayoutInflater layoutInflater = (LayoutInflater) getContext().getSystemService("layout_inflater");
        return layoutInflater.inflate(R.layout.mp_preference_category, parent, false);
    }

    @Override // android.preference.Preference
    protected void onBindView(View view) {
        super.onBindView(view);
        CharSequence title = getTitle();
        TextView titleView = (TextView) view.findViewById(R.id.title);
        titleView.setText(title);
        titleView.setTextColor(this.accentColor);
        titleView.setVisibility(!TextUtils.isEmpty(title) ? 0 : 8);
        titleView.setTypeface(Typefaces.getRobotoMedium(getContext()));
    }
}
