package rx.android.functions;

import android.view.View;
import rx.functions.Action1;

/* loaded from: rxandroid-0.23.0.jar:rx/android/functions/ViewActions.class */
public final class ViewActions {
    private ViewActions() {
        throw new IllegalStateException("No instances!");
    }

    public static Action1<? super Boolean> setEnabled(View view) {
        return new ViewActionSetEnabled(view);
    }

    public static Action1<? super Boolean> setActivated(View view) {
        return new ViewActionSetActivated(view);
    }

    public static Action1<? super Boolean> setClickable(View view) {
        return new ViewActionSetClickable(view);
    }

    public static Action1<? super Boolean> setFocusable(View view) {
        return new ViewActionSetFocusable(view);
    }

    public static Action1<? super Boolean> setSelected(View view) {
        return new ViewActionSetSelected(view);
    }

    public static Action1<? super Boolean> setVisibility(View view) {
        return new ViewActionSetVisibility(view);
    }

    public static Action1<? super Boolean> setVisibility(View view, int visibilityOnFalse) {
        return new ViewActionSetVisibility(view, visibilityOnFalse);
    }
}
