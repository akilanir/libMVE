package android.support.v7.widget;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.Resources;
import android.support.annotation.NonNull;
import java.lang.ref.WeakReference;
import java.util.ArrayList;

/* loaded from: com.android.support.appcompat-v7.23.2.0.jar:android/support/v7/widget/TintContextWrapper.class */
public class TintContextWrapper extends ContextWrapper {
    private static final ArrayList<WeakReference<TintContextWrapper>> sCache = new ArrayList<>();
    private Resources mResources;
    private final Resources.Theme mTheme;

    public static Context wrap(@NonNull Context context) {
        if (shouldWrap(context)) {
            int count = sCache.size();
            for (int i = 0; i < count; i++) {
                WeakReference<TintContextWrapper> ref = sCache.get(i);
                TintContextWrapper wrapper = ref != null ? ref.get() : null;
                if (wrapper != null && wrapper.getBaseContext() == context) {
                    return wrapper;
                }
            }
            TintContextWrapper wrapper2 = new TintContextWrapper(context);
            sCache.add(new WeakReference<>(wrapper2));
            return wrapper2;
        }
        return context;
    }

    private static boolean shouldWrap(@NonNull Context context) {
        if ((context instanceof TintContextWrapper) || (context.getResources() instanceof TintResources)) {
            return false;
        }
        return true;
    }

    private TintContextWrapper(@NonNull Context base) {
        super(base);
        this.mTheme = getResources().newTheme();
        this.mTheme.setTo(base.getTheme());
    }

    @Override // android.content.ContextWrapper, android.content.Context
    public Resources.Theme getTheme() {
        return this.mTheme;
    }

    @Override // android.content.ContextWrapper, android.content.Context
    public void setTheme(int resid) {
        this.mTheme.applyStyle(resid, true);
    }

    @Override // android.content.ContextWrapper, android.content.Context
    public Resources getResources() {
        if (this.mResources == null) {
            this.mResources = new TintResources(this, super.getResources());
        }
        return this.mResources;
    }
}
