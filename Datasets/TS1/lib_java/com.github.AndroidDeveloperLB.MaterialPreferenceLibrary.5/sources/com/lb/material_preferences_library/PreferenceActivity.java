package com.lb.material_preferences_library;

import android.app.Activity;
import android.os.Build;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceGroup;
import android.preference.PreferenceScreen;
import android.support.annotation.XmlRes;
import android.support.v7.widget.Toolbar;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import java.util.HashMap;
import java.util.Map;
import java.util.Stack;

/* loaded from: com.github.AndroidDeveloperLB.MaterialPreferenceLibrary.5.jar:com/lb/material_preferences_library/PreferenceActivity.class */
public abstract class PreferenceActivity extends AppCompatPreferenceActivity {
    private Toolbar _toolbar;

    @XmlRes
    protected abstract int getPreferencesXmlId();

    public Toolbar getToolbar() {
        return this._toolbar;
    }

    @Override // com.lb.material_preferences_library.AppCompatPreferenceActivity, android.preference.PreferenceActivity, android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.mpl__preference_activity);
        this._toolbar = findViewById(R.id.abp__toolbar);
        if (Build.VERSION.SDK_INT >= 21) {
            View shadowView = findViewById(R.id.abp__shadowView);
            ViewGroup parent = (ViewGroup) shadowView.getParent();
            parent.removeView(shadowView);
        }
        addPreferencesFromResource(getPreferencesXmlId());
        Map<Preference, PreferenceGroup> preferenceToParentMap = buildPreferenceParentTree(this);
        for (PreferenceGroup preferenceGroup : preferenceToParentMap.values()) {
            if (preferenceGroup != null && (preferenceGroup instanceof PreferenceScreen)) {
                preferenceGroup.setLayoutResource(R.layout.mpl__preference);
            }
        }
        this._toolbar.setClickable(true);
        this._toolbar.setNavigationIcon(getResIdFromAttribute(this, R.attr.homeAsUpIndicator));
        this._toolbar.setNavigationOnClickListener(new View.OnClickListener() { // from class: com.lb.material_preferences_library.PreferenceActivity.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                PreferenceActivity.this.finish();
            }
        });
        this._toolbar.setTitle(getTitle());
    }

    private static int getResIdFromAttribute(Activity activity, int attr) {
        if (attr == 0) {
            return 0;
        }
        TypedValue typedValue = new TypedValue();
        activity.getTheme().resolveAttribute(attr, typedValue, true);
        return typedValue.resourceId;
    }

    public static Map<Preference, PreferenceGroup> buildPreferenceParentTree(android.preference.PreferenceActivity activity) {
        Map<Preference, PreferenceGroup> result = new HashMap<>();
        Stack<PreferenceGroup> curParents = new Stack<>();
        curParents.add(activity.getPreferenceScreen());
        while (!curParents.isEmpty()) {
            PreferenceGroup parent = curParents.pop();
            int childCount = parent.getPreferenceCount();
            for (int i = 0; i < childCount; i++) {
                Preference child = parent.getPreference(i);
                result.put(child, parent);
                if (child instanceof PreferenceGroup) {
                    curParents.push((PreferenceGroup) child);
                }
            }
        }
        return result;
    }
}
