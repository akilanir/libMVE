package com.mikepenz.iconics.context;

import android.content.Context;
import android.support.v4.view.LayoutInflaterFactory;
import android.support.v7.app.AppCompatDelegate;
import android.util.AttributeSet;
import android.view.View;

/* loaded from: com.mikepenz.iconics-core.2.5.5.jar:com/mikepenz/iconics/context/IconicsLayoutInflater.class */
public class IconicsLayoutInflater implements LayoutInflaterFactory {
    private AppCompatDelegate appCompatDelegate;
    private final IconicsFactory mIconicsFactory = new IconicsFactory();

    public IconicsLayoutInflater(AppCompatDelegate appCompatDelegate) {
        this.appCompatDelegate = appCompatDelegate;
    }

    public View onCreateView(View parent, String name, Context context, AttributeSet attrs) {
        View result = this.appCompatDelegate.createView(parent, name, context, attrs);
        return this.mIconicsFactory.onViewCreated(result, context, attrs);
    }
}
