package rx.subjects;

import java.util.ArrayList;
import java.util.List;
import rx.Observable;
import rx.annotations.Experimental;
import rx.exceptions.Exceptions;
import rx.functions.Action1;
import rx.internal.operators.NotificationLite;
import rx.subjects.SubjectSubscriptionManager;

/* loaded from: rxjava-1.0.7.jar:rx/subjects/AsyncSubject.class */
public final class AsyncSubject<T> extends Subject<T, T> {
    final SubjectSubscriptionManager<T> state;
    volatile Object lastValue;
    private final NotificationLite<T> nl;

    public static <T> AsyncSubject<T> create() {
        final SubjectSubscriptionManager<T> state = new SubjectSubscriptionManager<>();
        state.onTerminated = new Action1<SubjectSubscriptionManager.SubjectObserver<T>>() { // from class: rx.subjects.AsyncSubject.1
            @Override // rx.functions.Action1
            public void call(SubjectSubscriptionManager.SubjectObserver<T> o) {
                Object v = state.get();
                NotificationLite<T> nl = state.nl;
                o.accept(v, nl);
                if (v == null || (!nl.isCompleted(v) && !nl.isError(v))) {
                    o.onCompleted();
                }
            }
        };
        return new AsyncSubject<>(state, state);
    }

    protected AsyncSubject(Observable.OnSubscribe<T> onSubscribe, SubjectSubscriptionManager<T> state) {
        super(onSubscribe);
        this.nl = NotificationLite.instance();
        this.state = state;
    }

    @Override // rx.Observer
    public void onCompleted() {
        if (this.state.active) {
            Object last = this.lastValue;
            if (last == null) {
                last = this.nl.completed();
            }
            SubjectSubscriptionManager.SubjectObserver<T>[] arr$ = this.state.terminate(last);
            for (SubjectSubscriptionManager.SubjectObserver<T> bo : arr$) {
                if (last == this.nl.completed()) {
                    bo.onCompleted();
                } else {
                    bo.onNext(this.nl.getValue(last));
                    bo.onCompleted();
                }
            }
        }
    }

    @Override // rx.Observer
    public void onError(Throwable e) {
        if (this.state.active) {
            Object n = this.nl.error(e);
            List<Throwable> errors = null;
            SubjectSubscriptionManager.SubjectObserver<T>[] arr$ = this.state.terminate(n);
            for (SubjectSubscriptionManager.SubjectObserver<T> bo : arr$) {
                try {
                    bo.onError(e);
                } catch (Throwable e2) {
                    if (errors == null) {
                        errors = new ArrayList<>();
                    }
                    errors.add(e2);
                }
            }
            Exceptions.throwIfAny(errors);
        }
    }

    @Override // rx.Observer
    public void onNext(T v) {
        this.lastValue = this.nl.next(v);
    }

    @Override // rx.subjects.Subject
    public boolean hasObservers() {
        return this.state.observers().length > 0;
    }

    @Experimental
    public boolean hasValue() {
        Object v = this.lastValue;
        Object o = this.state.get();
        return !this.nl.isError(o) && this.nl.isNext(v);
    }

    @Experimental
    public boolean hasThrowable() {
        Object o = this.state.get();
        return this.nl.isError(o);
    }

    @Experimental
    public boolean hasCompleted() {
        Object o = this.state.get();
        return (o == null || this.nl.isError(o)) ? false : true;
    }

    @Experimental
    public T getValue() {
        Object v = this.lastValue;
        Object o = this.state.get();
        if (!this.nl.isError(o) && this.nl.isNext(v)) {
            return this.nl.getValue(v);
        }
        return null;
    }

    @Experimental
    public Throwable getThrowable() {
        Object o = this.state.get();
        if (this.nl.isError(o)) {
            return this.nl.getError(o);
        }
        return null;
    }
}
