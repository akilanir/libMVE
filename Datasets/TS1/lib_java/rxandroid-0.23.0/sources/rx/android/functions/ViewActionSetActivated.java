package rx.android.functions;

import android.view.View;

/* loaded from: rxandroid-0.23.0.jar:rx/android/functions/ViewActionSetActivated.class */
public class ViewActionSetActivated extends ViewAction1<View, Boolean> {
    public ViewActionSetActivated(View view) {
        super(view);
    }

    @Override // rx.android.functions.ViewAction1
    public void call(View view, Boolean aBoolean) {
        view.setActivated(aBoolean.booleanValue());
    }
}
