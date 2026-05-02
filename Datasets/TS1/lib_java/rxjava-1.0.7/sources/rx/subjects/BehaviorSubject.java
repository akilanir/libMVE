package rx.subjects;

import java.util.ArrayList;
import java.util.List;
import rx.Observable;
import rx.annotations.Experimental;
import rx.exceptions.Exceptions;
import rx.functions.Action1;
import rx.internal.operators.NotificationLite;
import rx.subjects.SubjectSubscriptionManager;

/* loaded from: rxjava-1.0.7.jar:rx/subjects/BehaviorSubject.class */
public final class BehaviorSubject<T> extends Subject<T, T> {
    private final SubjectSubscriptionManager<T> state;
    private final NotificationLite<T> nl;

    public static <T> BehaviorSubject<T> create() {
        return create(null, false);
    }

    public static <T> BehaviorSubject<T> create(T defaultValue) {
        return create(defaultValue, true);
    }

    private static <T> BehaviorSubject<T> create(T defaultValue, boolean hasDefault) {
        final SubjectSubscriptionManager<T> state = new SubjectSubscriptionManager<>();
        if (hasDefault) {
            state.set(NotificationLite.instance().next(defaultValue));
        }
        state.onAdded = new Action1<SubjectSubscriptionManager.SubjectObserver<T>>() { // from class: rx.subjects.BehaviorSubject.1
            @Override // rx.functions.Action1
            public void call(SubjectSubscriptionManager.SubjectObserver<T> o) {
                o.emitFirst(state.get(), state.nl);
            }
        };
        state.onTerminated = state.onAdded;
        return new BehaviorSubject<>(state, state);
    }

    protected BehaviorSubject(Observable.OnSubscribe<T> onSubscribe, SubjectSubscriptionManager<T> state) {
        super(onSubscribe);
        this.nl = NotificationLite.instance();
        this.state = state;
    }

    @Override // rx.Observer
    public void onCompleted() {
        Object last = this.state.get();
        if (last == null || this.state.active) {
            Object n = this.nl.completed();
            SubjectSubscriptionManager.SubjectObserver<T>[] arr$ = this.state.terminate(n);
            for (SubjectSubscriptionManager.SubjectObserver<T> bo : arr$) {
                bo.emitNext(n, this.state.nl);
            }
        }
    }

    @Override // rx.Observer
    public void onError(Throwable e) {
        Object last = this.state.get();
        if (last == null || this.state.active) {
            Object n = this.nl.error(e);
            List<Throwable> errors = null;
            SubjectSubscriptionManager.SubjectObserver<T>[] arr$ = this.state.terminate(n);
            for (SubjectSubscriptionManager.SubjectObserver<T> bo : arr$) {
                try {
                    bo.emitNext(n, this.state.nl);
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
        Object last = this.state.get();
        if (last == null || this.state.active) {
            Object n = this.nl.next(v);
            SubjectSubscriptionManager.SubjectObserver<T>[] arr$ = this.state.next(n);
            for (SubjectSubscriptionManager.SubjectObserver<T> bo : arr$) {
                bo.emitNext(n, this.state.nl);
            }
        }
    }

    int subscriberCount() {
        return this.state.observers().length;
    }

    @Override // rx.subjects.Subject
    public boolean hasObservers() {
        return this.state.observers().length > 0;
    }

    @Experimental
    public boolean hasValue() {
        Object o = this.state.get();
        return this.nl.isNext(o);
    }

    @Experimental
    public boolean hasThrowable() {
        Object o = this.state.get();
        return this.nl.isError(o);
    }

    @Experimental
    public boolean hasCompleted() {
        Object o = this.state.get();
        return this.nl.isCompleted(o);
    }

    @Experimental
    public T getValue() {
        Object o = this.state.get();
        if (this.nl.isNext(o)) {
            return this.nl.getValue(o);
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
