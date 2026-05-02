package android.support.v7.widget;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.support.annotation.NonNull;
import java.lang.ref.WeakReference;

/* loaded from: com.android.support.appcompat-v7.23.2.1.jar:android/support/v7/widget/TintResources.class */
public class TintResources extends Resources {
    private final WeakReference<Context> mContextRef;

    public TintResources(@NonNull Context context, @NonNull Resources res) {
        super(res.getAssets(), res.getDisplayMetrics(), res.getConfiguration());
        this.mContextRef = new WeakReference<>(context);
    }

    @Override // android.content.res.Resources
    public Drawable getDrawable(int id) throws Resources.NotFoundException {
        Context context = this.mContextRef.get();
        if (context != null) {
            return AppCompatDrawableManager.get().onDrawableLoadedFromResources(context, this, id);
        }
        return super.getDrawable(id);
    }

    final Drawable superGetDrawable(int id) {
        return super.getDrawable(id);
    }
}
