package rx.android.functions;

import android.view.View;

/* loaded from: rxandroid-0.23.0.jar:rx/android/functions/ViewActionSetFocusable.class */
public class ViewActionSetFocusable extends ViewAction1<View, Boolean> {
    public ViewActionSetFocusable(View view) {
        super(view);
    }

    @Override // rx.android.functions.ViewAction1
    public void call(View view, Boolean aBoolean) {
        view.setFocusable(aBoolean.booleanValue());
    }
}
