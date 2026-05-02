package com.rey.material.drawable;

import android.graphics.drawable.Drawable;
import android.graphics.drawable.LevelListDrawable;
import com.rey.material.app.ThemeManager;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/drawable/ThemeDrawable.class */
public class ThemeDrawable extends LevelListDrawable implements ThemeManager.OnThemeChangedListener {
    private int mStyleId;

    public ThemeDrawable(int styleId) {
        this.mStyleId = styleId;
        if (this.mStyleId != 0) {
            ThemeManager.getInstance().registerOnThemeChangedListener(this);
            initDrawables();
        }
    }

    private void initDrawables() {
        ThemeManager themeManager = ThemeManager.getInstance();
        int count = themeManager.getThemeCount();
        for (int i = 0; i < count; i++) {
            Drawable drawable = themeManager.getContext().getResources().getDrawable(themeManager.getStyle(this.mStyleId, i));
            addLevel(i, i, drawable);
        }
        setLevel(themeManager.getCurrentTheme());
    }

    @Override // com.rey.material.app.ThemeManager.OnThemeChangedListener
    public void onThemeChanged(ThemeManager.OnThemeChangedEvent event) {
        if (getLevel() != event.theme) {
            setLevel(event.theme);
        }
    }
}
