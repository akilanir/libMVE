package android.support.v7.widget;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;

/* loaded from: com.android.support.appcompat-v7.23.1.1.jar:android/support/v7/widget/TintContextWrapper.class */
class TintContextWrapper extends ContextWrapper {
    private Resources mResources;

    public static Context wrap(Context context) {
        if (!(context instanceof TintContextWrapper)) {
            context = new TintContextWrapper(context);
        }
        return context;
    }

    private TintContextWrapper(Context base) {
        super(base);
    }

    @Override // android.content.ContextWrapper, android.content.Context
    public Resources getResources() {
        if (this.mResources == null) {
            this.mResources = new TintResources(super.getResources(), TintManager.get(this));
        }
        return this.mResources;
    }

    /* loaded from: com.android.support.appcompat-v7.23.1.1.jar:android/support/v7/widget/TintContextWrapper$TintResources.class */
    static class TintResources extends ResourcesWrapper {
        private final TintManager mTintManager;

        public TintResources(Resources resources, TintManager tintManager) {
            super(resources);
            this.mTintManager = tintManager;
        }

        @Override // android.support.v7.widget.ResourcesWrapper, android.content.res.Resources
        public Drawable getDrawable(int id) throws Resources.NotFoundException {
            Drawable d = super.getDrawable(id);
            if (d != null) {
                this.mTintManager.tintDrawableUsingColorFilter(id, d);
            }
            return d;
        }
    }
}
