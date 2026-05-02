package rx;

/* loaded from: rxjava-1.0.7.jar:rx/Observer.class */
public interface Observer<T> {
    void onCompleted();

    void onError(Throwable th);

    void onNext(T t);
}
