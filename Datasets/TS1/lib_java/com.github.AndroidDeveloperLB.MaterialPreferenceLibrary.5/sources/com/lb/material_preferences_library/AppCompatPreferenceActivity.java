package com.lb.material_preferences_library;

import android.content.res.Configuration;
import android.os.Bundle;
import android.support.annotation.LayoutRes;
import android.support.annotation.Nullable;
import android.support.v7.app.ActionBar;
import android.support.v7.app.AppCompatCallback;
import android.support.v7.app.AppCompatDelegate;
import android.support.v7.widget.Toolbar;
import android.view.MenuInflater;
import android.view.View;
import android.view.ViewGroup;

/* loaded from: com.github.AndroidDeveloperLB.MaterialPreferenceLibrary.5.jar:com/lb/material_preferences_library/AppCompatPreferenceActivity.class */
public abstract class AppCompatPreferenceActivity extends android.preference.PreferenceActivity {
    private AppCompatDelegate mDelegate;

    @Override // android.preference.PreferenceActivity, android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        getDelegate().installViewFactory();
        getDelegate().onCreate(savedInstanceState);
        super.onCreate(savedInstanceState);
    }

    @Override // android.app.Activity
    protected void onPostCreate(Bundle savedInstanceState) {
        super.onPostCreate(savedInstanceState);
        getDelegate().onPostCreate(savedInstanceState);
    }

    public ActionBar getSupportActionBar() {
        return getDelegate().getSupportActionBar();
    }

    public void setSupportActionBar(@Nullable Toolbar toolbar) {
        getDelegate().setSupportActionBar(toolbar);
    }

    @Override // android.app.Activity
    public MenuInflater getMenuInflater() {
        return getDelegate().getMenuInflater();
    }

    @Override // android.app.Activity
    public void setContentView(@LayoutRes int layoutResID) {
        getDelegate().setContentView(layoutResID);
    }

    @Override // android.app.Activity
    public void setContentView(View view) {
        getDelegate().setContentView(view);
    }

    @Override // android.app.Activity
    public void setContentView(View view, ViewGroup.LayoutParams params) {
        getDelegate().setContentView(view, params);
    }

    @Override // android.app.Activity
    public void addContentView(View view, ViewGroup.LayoutParams params) {
        getDelegate().addContentView(view, params);
    }

    @Override // android.app.Activity
    protected void onPostResume() {
        super.onPostResume();
        getDelegate().onPostResume();
    }

    @Override // android.app.Activity
    protected void onTitleChanged(CharSequence title, int color) {
        super.onTitleChanged(title, color);
        getDelegate().setTitle(title);
    }

    @Override // android.app.Activity, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        getDelegate().onConfigurationChanged(newConfig);
    }

    @Override // android.preference.PreferenceActivity, android.app.Activity
    protected void onStop() {
        super.onStop();
        getDelegate().onStop();
    }

    @Override // android.preference.PreferenceActivity, android.app.ListActivity, android.app.Activity
    protected void onDestroy() {
        super.onDestroy();
        getDelegate().onDestroy();
    }

    @Override // android.app.Activity
    public void invalidateOptionsMenu() {
        getDelegate().invalidateOptionsMenu();
    }

    private AppCompatDelegate getDelegate() {
        if (this.mDelegate == null) {
            this.mDelegate = AppCompatDelegate.create(this, (AppCompatCallback) null);
        }
        return this.mDelegate;
    }
}
