package rx.internal.operators;

import rx.Observable;
import rx.Subscriber;
import rx.Subscription;
import rx.functions.Action1;
import rx.functions.Func0;
import rx.functions.Func1;
import rx.observables.ConnectableObservable;
import rx.observers.SafeSubscriber;
import rx.subjects.Subject;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OnSubscribeMulticastSelector.class */
public final class OnSubscribeMulticastSelector<TInput, TIntermediate, TResult> implements Observable.OnSubscribe<TResult> {
    final Observable<? extends TInput> source;
    final Func0<? extends Subject<? super TInput, ? extends TIntermediate>> subjectFactory;
    final Func1<? super Observable<TIntermediate>, ? extends Observable<TResult>> resultSelector;

    public OnSubscribeMulticastSelector(Observable<? extends TInput> source, Func0<? extends Subject<? super TInput, ? extends TIntermediate>> subjectFactory, Func1<? super Observable<TIntermediate>, ? extends Observable<TResult>> resultSelector) {
        this.source = source;
        this.subjectFactory = subjectFactory;
        this.resultSelector = resultSelector;
    }

    @Override // rx.functions.Action1
    public void call(Subscriber<? super TResult> child) {
        try {
            ConnectableObservable<TIntermediate> connectable = new OperatorMulticast<>(this.source, this.subjectFactory);
            Observable<TResult> observable = this.resultSelector.call(connectable);
            final SafeSubscriber<TResult> s = new SafeSubscriber<>(child);
            observable.unsafeSubscribe(s);
            connectable.connect(new Action1<Subscription>() { // from class: rx.internal.operators.OnSubscribeMulticastSelector.1
                @Override // rx.functions.Action1
                public void call(Subscription t1) {
                    s.add(t1);
                }
            });
        } catch (Throwable t) {
            child.onError(t);
        }
    }
}
