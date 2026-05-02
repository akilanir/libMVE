package android.support.v7.app;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.Window;

/* loaded from: com.android.support.appcompat-v7.23.0.0.jar:android/support/v7/app/AppCompatDelegateImplV11.class */
class AppCompatDelegateImplV11 extends AppCompatDelegateImplV7 {
    AppCompatDelegateImplV11(Context context, Window window, AppCompatCallback callback) {
        super(context, window, callback);
    }

    @Override // android.support.v7.app.AppCompatDelegateImplV7
    View callActivityOnCreateView(View parent, String name, Context context, AttributeSet attrs) {
        return null;
    }
}
