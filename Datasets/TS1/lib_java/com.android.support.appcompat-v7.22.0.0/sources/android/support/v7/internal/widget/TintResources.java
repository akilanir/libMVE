package android.support.v7.internal.widget;

import android.content.res.Resources;
import android.graphics.drawable.Drawable;

/* loaded from: com.android.support.appcompat-v7.22.0.0.jar:android/support/v7/internal/widget/TintResources.class */
class TintResources extends ResourcesWrapper {
    private final TintManager mTintManager;

    public TintResources(Resources resources, TintManager tintManager) {
        super(resources);
        this.mTintManager = tintManager;
    }

    @Override // android.support.v7.internal.widget.ResourcesWrapper, android.content.res.Resources
    public Drawable getDrawable(int id) throws Resources.NotFoundException {
        Drawable d = super.getDrawable(id);
        if (d != null) {
            this.mTintManager.tintDrawable(id, d);
        }
        return d;
    }
}
