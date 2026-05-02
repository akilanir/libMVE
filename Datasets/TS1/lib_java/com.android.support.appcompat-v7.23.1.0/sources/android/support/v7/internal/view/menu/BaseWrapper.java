package android.support.v7.internal.view.menu;

/* loaded from: com.android.support.appcompat-v7.23.1.0.jar:android/support/v7/internal/view/menu/BaseWrapper.class */
class BaseWrapper<T> {
    final T mWrappedObject;

    BaseWrapper(T object) {
        if (null == object) {
            throw new IllegalArgumentException("Wrapped Object can not be null.");
        }
        this.mWrappedObject = object;
    }

    public T getWrappedObject() {
        return this.mWrappedObject;
    }
}
