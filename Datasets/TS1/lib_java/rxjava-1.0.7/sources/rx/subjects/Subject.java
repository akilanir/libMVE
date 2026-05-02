package rx.subjects;

import rx.Observable;
import rx.Observer;

/* loaded from: rxjava-1.0.7.jar:rx/subjects/Subject.class */
public abstract class Subject<T, R> extends Observable<R> implements Observer<T> {
    public abstract boolean hasObservers();

    protected Subject(Observable.OnSubscribe<R> onSubscribe) {
        super(onSubscribe);
    }

    public final SerializedSubject<T, R> toSerialized() {
        return new SerializedSubject<>(this);
    }
}
