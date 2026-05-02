package android.support.multidex;

import android.app.Application;
import android.content.Context;

/* loaded from: com.android.support.multidex.1.0.1.jar:android/support/multidex/MultiDexApplication.class */
public class MultiDexApplication extends Application {
    @Override // android.content.ContextWrapper
    protected void attachBaseContext(Context base) {
        super.attachBaseContext(base);
        MultiDex.install(this);
    }
}
