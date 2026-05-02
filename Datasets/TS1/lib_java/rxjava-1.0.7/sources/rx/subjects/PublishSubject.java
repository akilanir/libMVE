package rx.subjects;

import java.util.ArrayList;
import java.util.List;
import rx.Observable;
import rx.annotations.Experimental;
import rx.exceptions.Exceptions;
import rx.functions.Action1;
import rx.internal.operators.NotificationLite;
import rx.subjects.SubjectSubscriptionManager;

/* loaded from: rxjava-1.0.7.jar:rx/subjects/PublishSubject.class */
public final class PublishSubject<T> extends Subject<T, T> {
    final SubjectSubscriptionManager<T> state;
    private final NotificationLite<T> nl;

    public static <T> PublishSubject<T> create() {
        final SubjectSubscriptionManager<T> state = new SubjectSubscriptionManager<>();
        state.onTerminated = new Action1<SubjectSubscriptionManager.SubjectObserver<T>>() { // from class: rx.subjects.PublishSubject.1
            @Override // rx.functions.Action1
            public void call(SubjectSubscriptionManager.SubjectObserver<T> o) {
                o.emitFirst(state.get(), state.nl);
            }
        };
        return new PublishSubject<>(state, state);
    }

    protected PublishSubject(Observable.OnSubscribe<T> onSubscribe, SubjectSubscriptionManager<T> state) {
        super(onSubscribe);
        this.nl = NotificationLite.instance();
        this.state = state;
    }

    @Override // rx.Observer
    public void onCompleted() {
        if (this.state.active) {
            Object n = this.nl.completed();
            SubjectSubscriptionManager.SubjectObserver<T>[] arr$ = this.state.terminate(n);
            for (SubjectSubscriptionManager.SubjectObserver<T> bo : arr$) {
                bo.emitNext(n, this.state.nl);
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
        SubjectSubscriptionManager.SubjectObserver<T>[] arr$ = this.state.observers();
        for (SubjectSubscriptionManager.SubjectObserver<T> bo : arr$) {
            bo.onNext(v);
        }
    }

    @Override // rx.subjects.Subject
    public boolean hasObservers() {
        return this.state.observers().length > 0;
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
    public Throwable getThrowable() {
        Object o = this.state.get();
        if (this.nl.isError(o)) {
            return this.nl.getError(o);
        }
        return null;
    }
}
