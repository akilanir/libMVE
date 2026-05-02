package com.mikepenz.aboutlibraries.ui;

import android.graphics.PorterDuff;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Bundle;
import android.support.v4.app.FragmentManager;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.ActionBar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.text.TextUtils;
import android.view.MenuItem;
import com.mikepenz.aboutlibraries.BuildConfig;
import com.mikepenz.aboutlibraries.Libs;
import com.mikepenz.aboutlibraries.R;
import com.mikepenz.aboutlibraries.util.Colors;

/* loaded from: com.mikepenz.aboutlibraries.5.5.0.jar:com/mikepenz/aboutlibraries/ui/LibsActivity.class */
public class LibsActivity extends AppCompatActivity {
    /* JADX WARN: Multi-variable type inference failed */
    public void onCreate(Bundle savedInstanceState) {
        boolean customTheme = false;
        Libs.ActivityStyle activityStyle = Libs.ActivityStyle.DARK;
        Bundle bundle = getIntent().getExtras();
        if (bundle != null) {
            int themeId = bundle.getInt(Libs.BUNDLE_THEME, -1);
            if (themeId != -1) {
                customTheme = true;
                setTheme(themeId);
            }
            String style = bundle.getString(Libs.BUNDLE_STYLE);
            if (style != null) {
                activityStyle = Libs.ActivityStyle.valueOf(style);
            }
        }
        if (!customTheme) {
            if (activityStyle == Libs.ActivityStyle.DARK) {
                setTheme(R.style.AboutLibrariesTheme);
            } else if (activityStyle == Libs.ActivityStyle.LIGHT) {
                setTheme(R.style.AboutLibrariesTheme_Light);
            } else if (activityStyle == Libs.ActivityStyle.LIGHT_DARK_TOOLBAR) {
                setTheme(R.style.AboutLibrariesTheme_Light_DarkToolbar);
            }
        }
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_opensource);
        String title = BuildConfig.FLAVOR;
        if (bundle != null && bundle.containsKey(Libs.BUNDLE_TITLE)) {
            title = bundle.getString(Libs.BUNDLE_TITLE);
        }
        LibsSupportFragment fragment = new LibsSupportFragment();
        fragment.setArguments(bundle);
        Toolbar toolbar = findViewById(R.id.toolbar);
        if (activityStyle == Libs.ActivityStyle.LIGHT_DARK_TOOLBAR) {
            toolbar.setTitleTextColor(-1);
            toolbar.setSubtitleTextColor(-1);
        }
        setSupportActionBar(toolbar);
        if (activityStyle == Libs.ActivityStyle.LIGHT_DARK_TOOLBAR && getSupportActionBar() != null) {
            Drawable upArrow = ContextCompat.getDrawable(this, R.drawable.abc_ic_ab_back_mtrl_am_alpha);
            upArrow.setColorFilter(ContextCompat.getColor(this, android.R.color.white), PorterDuff.Mode.SRC_ATOP);
            getSupportActionBar().setHomeAsUpIndicator(upArrow);
        }
        ActionBar ab = getSupportActionBar();
        if (ab != null) {
            if (bundle != null && bundle.containsKey(Libs.BUNDLE_COLORS)) {
                Colors colors = (Colors) bundle.getSerializable(Libs.BUNDLE_COLORS);
                if (colors != null) {
                    ab.setBackgroundDrawable(new ColorDrawable(colors.appBarColor));
                    if (Build.VERSION.SDK_INT >= 21) {
                        getWindow().setStatusBarColor(colors.statusBarColor);
                    }
                } else {
                    ab.setBackgroundDrawable((Drawable) null);
                }
            }
            ab.setDisplayHomeAsUpEnabled(true);
            if (TextUtils.isEmpty(title)) {
                ab.setDisplayShowTitleEnabled(false);
            } else {
                ab.setDisplayShowTitleEnabled(true);
                ab.setTitle(title);
            }
        }
        FragmentManager fragmentManager = getSupportFragmentManager();
        fragmentManager.beginTransaction().replace(R.id.frame_container, fragment).commit();
    }

    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case android.R.id.home:
                finish();
                return true;
            default:
                return false;
        }
    }
}
