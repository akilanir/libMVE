package android.support.v7.app;

import android.content.Context;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.Window;

/* loaded from: com.android.support.appcompat-v7.22.2.1.jar:android/support/v7/app/AppCompatDelegateImplV11.class */
class AppCompatDelegateImplV11 extends AppCompatDelegateImplV7 {
    AppCompatDelegateImplV11(Context context, Window window, AppCompatCallback callback) {
        super(context, window, callback);
    }

    @Override // android.support.v7.app.AppCompatDelegateImplV7
    View callActivityOnCreateView(View parent, String name, Context context, AttributeSet attrs) {
        View view = super.callActivityOnCreateView(parent, name, context, attrs);
        if (view != null) {
            return view;
        }
        if (this.mOriginalWindowCallback instanceof LayoutInflater.Factory2) {
            return ((LayoutInflater.Factory2) this.mOriginalWindowCallback).onCreateView(parent, name, context, attrs);
        }
        return null;
    }
}
