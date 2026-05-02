package android.support.v7.internal.widget;

import android.content.res.Resources;
import android.graphics.drawable.Drawable;

/* loaded from: com.android.support.appcompat-v7.21.0.2.jar:android/support/v7/internal/widget/TintResources.class */
class TintResources extends Resources {
    private final TintManager mTintManager;

    public TintResources(Resources resources, TintManager tintManager) {
        super(resources.getAssets(), resources.getDisplayMetrics(), resources.getConfiguration());
        this.mTintManager = tintManager;
    }

    @Override // android.content.res.Resources
    public Drawable getDrawable(int id) throws Resources.NotFoundException {
        Drawable d = super.getDrawable(id);
        if (d != null) {
            this.mTintManager.tintDrawable(id, d);
        }
        return d;
    }
}
