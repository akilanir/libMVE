package rx.android.functions;

import android.view.View;
import java.lang.ref.WeakReference;
import rx.functions.Action1;

/* loaded from: rxandroid-0.23.0.jar:rx/android/functions/ViewAction1.class */
public abstract class ViewAction1<V extends View, T> implements Action1<T> {
    private final WeakReference<V> viewReference;

    public abstract void call(V v, T t);

    public ViewAction1(V view) {
        this.viewReference = new WeakReference<>(view);
    }

    public final void call(T t) {
        V view = this.viewReference.get();
        if (view != null) {
            call(view, t);
        }
    }
}
