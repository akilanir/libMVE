package rx.android.functions;

import android.view.View;

/* loaded from: rxandroid-0.23.0.jar:rx/android/functions/ViewActionSetVisibility.class */
public class ViewActionSetVisibility extends ViewAction1<View, Boolean> {
    private final int visibilityOnFalse;

    public ViewActionSetVisibility(View view) {
        this(view, 8);
    }

    public ViewActionSetVisibility(View view, int visibilityOnFalse) {
        super(view);
        if (visibilityOnFalse != 8 && visibilityOnFalse != 4 && visibilityOnFalse != 0) {
            throw new IllegalArgumentException(visibilityOnFalse + " is not a valid visibility value. See android.view.View VISIBLE, GONE, and INVISIBLE");
        }
        this.visibilityOnFalse = visibilityOnFalse;
    }

    @Override // rx.android.functions.ViewAction1
    public void call(View view, Boolean aBoolean) {
        int visibility = aBoolean.booleanValue() ? 0 : this.visibilityOnFalse;
        view.setVisibility(visibility);
    }
}
