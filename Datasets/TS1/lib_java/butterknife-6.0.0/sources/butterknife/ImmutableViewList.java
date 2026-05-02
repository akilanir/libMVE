package butterknife;

import android.view.View;
import java.util.AbstractList;
import java.util.RandomAccess;

/* loaded from: butterknife-6.0.0.jar:butterknife/ImmutableViewList.class */
final class ImmutableViewList<T extends View> extends AbstractList<T> implements RandomAccess {
    private final T[] views;

    ImmutableViewList(T[] views) {
        this.views = views;
    }

    @Override // java.util.AbstractList, java.util.List
    public T get(int index) {
        return this.views[index];
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public int size() {
        return this.views.length;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public boolean contains(Object o) {
        for (View view : this.views) {
            if (view == o) {
                return true;
            }
        }
        return false;
    }
}
