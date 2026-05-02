package rx.internal.operators;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;
import rx.Observable;
import rx.Subscriber;
import rx.Subscription;
import rx.functions.Action0;
import rx.functions.Action1;
import rx.functions.Func0;
import rx.observables.ConnectableObservable;
import rx.subjects.Subject;
import rx.subscriptions.Subscriptions;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorMulticast.class */
public final class OperatorMulticast<T, R> extends ConnectableObservable<R> {
    final Observable<? extends T> source;
    final Object guard;
    final Func0<? extends Subject<? super T, ? extends R>> subjectFactory;
    private final AtomicReference<Subject<? super T, ? extends R>> connectedSubject;
    private final List<Subscriber<? super R>> waitingForConnect;
    Subscriber<T> subscription;

    public OperatorMulticast(Observable<? extends T> source, Func0<? extends Subject<? super T, ? extends R>> subjectFactory) {
        this(new Object(), new AtomicReference(), new ArrayList(), source, subjectFactory);
    }

    private OperatorMulticast(final Object guard, final AtomicReference<Subject<? super T, ? extends R>> connectedSubject, final List<Subscriber<? super R>> waitingForConnect, Observable<? extends T> source, Func0<? extends Subject<? super T, ? extends R>> subjectFactory) {
        super(new Observable.OnSubscribe<R>() { // from class: rx.internal.operators.OperatorMulticast.1
            @Override // rx.functions.Action1
            public void call(Subscriber<? super R> subscriber) {
                synchronized (guard) {
                    if (connectedSubject.get() == null) {
                        waitingForConnect.add(subscriber);
                    } else {
                        ((Subject) connectedSubject.get()).unsafeSubscribe(subscriber);
                    }
                }
            }
        });
        this.guard = guard;
        this.connectedSubject = connectedSubject;
        this.waitingForConnect = waitingForConnect;
        this.source = source;
        this.subjectFactory = subjectFactory;
    }

    @Override // rx.observables.ConnectableObservable
    public void connect(Action1<? super Subscription> action1) {
        boolean z;
        synchronized (this.guard) {
            if (this.subscription != null) {
                return;
            }
            final Subject<? super T, ? extends R> call = this.subjectFactory.call();
            this.subscription = new Subscriber<T>() { // from class: rx.internal.operators.OperatorMulticast.2
                @Override // rx.Observer
                public void onCompleted() {
                    call.onCompleted();
                }

                @Override // rx.Observer
                public void onError(Throwable e) {
                    call.onError(e);
                }

                @Override // rx.Observer
                public void onNext(T args) {
                    call.onNext(args);
                }
            };
            Iterator<Subscriber<? super R>> it = this.waitingForConnect.iterator();
            while (it.hasNext()) {
                call.unsafeSubscribe((Subscriber) it.next());
            }
            this.waitingForConnect.clear();
            this.connectedSubject.set(call);
            if (1 != 0) {
                action1.call(Subscriptions.create(new Action0() { // from class: rx.internal.operators.OperatorMulticast.3
                    @Override // rx.functions.Action0
                    public void call() {
                        Subscription s;
                        synchronized (OperatorMulticast.this.guard) {
                            s = OperatorMulticast.this.subscription;
                            OperatorMulticast.this.subscription = null;
                            OperatorMulticast.this.connectedSubject.set(null);
                        }
                        if (s != null) {
                            s.unsubscribe();
                        }
                    }
                }));
                synchronized (this.guard) {
                    z = this.subscription == null;
                }
                if (!z) {
                    this.source.subscribe((Subscriber<? super Object>) this.subscription);
                }
            }
        }
    }
}
