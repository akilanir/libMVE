package rx.internal.operators;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.atomic.AtomicReference;
import rx.Observable;
import rx.Producer;
import rx.Subscriber;
import rx.functions.Action0;
import rx.subscriptions.Subscriptions;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OnSubscribeAmb.class */
public final class OnSubscribeAmb<T> implements Observable.OnSubscribe<T> {
    private final Iterable<? extends Observable<? extends T>> sources;
    private final Selection<T> selection = new Selection<>();

    public static <T> Observable.OnSubscribe<T> amb(Observable<? extends T> o1, Observable<? extends T> o2) {
        List<Observable<? extends T>> sources = new ArrayList<>();
        sources.add(o1);
        sources.add(o2);
        return amb(sources);
    }

    public static <T> Observable.OnSubscribe<T> amb(Observable<? extends T> o1, Observable<? extends T> o2, Observable<? extends T> o3) {
        List<Observable<? extends T>> sources = new ArrayList<>();
        sources.add(o1);
        sources.add(o2);
        sources.add(o3);
        return amb(sources);
    }

    public static <T> Observable.OnSubscribe<T> amb(Observable<? extends T> o1, Observable<? extends T> o2, Observable<? extends T> o3, Observable<? extends T> o4) {
        List<Observable<? extends T>> sources = new ArrayList<>();
        sources.add(o1);
        sources.add(o2);
        sources.add(o3);
        sources.add(o4);
        return amb(sources);
    }

    public static <T> Observable.OnSubscribe<T> amb(Observable<? extends T> o1, Observable<? extends T> o2, Observable<? extends T> o3, Observable<? extends T> o4, Observable<? extends T> o5) {
        List<Observable<? extends T>> sources = new ArrayList<>();
        sources.add(o1);
        sources.add(o2);
        sources.add(o3);
        sources.add(o4);
        sources.add(o5);
        return amb(sources);
    }

    public static <T> Observable.OnSubscribe<T> amb(Observable<? extends T> o1, Observable<? extends T> o2, Observable<? extends T> o3, Observable<? extends T> o4, Observable<? extends T> o5, Observable<? extends T> o6) {
        List<Observable<? extends T>> sources = new ArrayList<>();
        sources.add(o1);
        sources.add(o2);
        sources.add(o3);
        sources.add(o4);
        sources.add(o5);
        sources.add(o6);
        return amb(sources);
    }

    public static <T> Observable.OnSubscribe<T> amb(Observable<? extends T> o1, Observable<? extends T> o2, Observable<? extends T> o3, Observable<? extends T> o4, Observable<? extends T> o5, Observable<? extends T> o6, Observable<? extends T> o7) {
        List<Observable<? extends T>> sources = new ArrayList<>();
        sources.add(o1);
        sources.add(o2);
        sources.add(o3);
        sources.add(o4);
        sources.add(o5);
        sources.add(o6);
        sources.add(o7);
        return amb(sources);
    }

    public static <T> Observable.OnSubscribe<T> amb(Observable<? extends T> o1, Observable<? extends T> o2, Observable<? extends T> o3, Observable<? extends T> o4, Observable<? extends T> o5, Observable<? extends T> o6, Observable<? extends T> o7, Observable<? extends T> o8) {
        List<Observable<? extends T>> sources = new ArrayList<>();
        sources.add(o1);
        sources.add(o2);
        sources.add(o3);
        sources.add(o4);
        sources.add(o5);
        sources.add(o6);
        sources.add(o7);
        sources.add(o8);
        return amb(sources);
    }

    public static <T> Observable.OnSubscribe<T> amb(Observable<? extends T> o1, Observable<? extends T> o2, Observable<? extends T> o3, Observable<? extends T> o4, Observable<? extends T> o5, Observable<? extends T> o6, Observable<? extends T> o7, Observable<? extends T> o8, Observable<? extends T> o9) {
        List<Observable<? extends T>> sources = new ArrayList<>();
        sources.add(o1);
        sources.add(o2);
        sources.add(o3);
        sources.add(o4);
        sources.add(o5);
        sources.add(o6);
        sources.add(o7);
        sources.add(o8);
        sources.add(o9);
        return amb(sources);
    }

    public static <T> Observable.OnSubscribe<T> amb(Iterable<? extends Observable<? extends T>> sources) {
        return new OnSubscribeAmb(sources);
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OnSubscribeAmb$AmbSubscriber.class */
    private static final class AmbSubscriber<T> extends Subscriber<T> {
        private final Subscriber<? super T> subscriber;
        private final Selection<T> selection;

        private AmbSubscriber(long requested, Subscriber<? super T> subscriber, Selection<T> selection) {
            this.subscriber = subscriber;
            this.selection = selection;
            request(requested);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public final void requestMore(long n) {
            request(n);
        }

        @Override // rx.Observer
        public void onNext(T args) {
            if (!isSelected()) {
                return;
            }
            this.subscriber.onNext(args);
        }

        @Override // rx.Observer
        public void onCompleted() {
            if (!isSelected()) {
                return;
            }
            this.subscriber.onCompleted();
        }

        @Override // rx.Observer
        public void onError(Throwable e) {
            if (!isSelected()) {
                return;
            }
            this.subscriber.onError(e);
        }

        private boolean isSelected() {
            if (this.selection.choice.get() == this) {
                return true;
            }
            if (this.selection.choice.compareAndSet(null, this)) {
                this.selection.unsubscribeOthers(this);
                return true;
            }
            this.selection.unsubscribeLosers();
            return false;
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OnSubscribeAmb$Selection.class */
    private static class Selection<T> {
        final AtomicReference<AmbSubscriber<T>> choice;
        final Collection<AmbSubscriber<T>> ambSubscribers;

        private Selection() {
            this.choice = new AtomicReference<>();
            this.ambSubscribers = new ConcurrentLinkedQueue();
        }

        public void unsubscribeLosers() {
            AmbSubscriber<T> winner = this.choice.get();
            if (winner != null) {
                unsubscribeOthers(winner);
            }
        }

        public void unsubscribeOthers(AmbSubscriber<T> notThis) {
            for (AmbSubscriber<T> other : this.ambSubscribers) {
                if (other != notThis) {
                    other.unsubscribe();
                }
            }
            this.ambSubscribers.clear();
        }
    }

    private OnSubscribeAmb(Iterable<? extends Observable<? extends T>> sources) {
        this.sources = sources;
    }

    @Override // rx.functions.Action1
    public void call(final Subscriber<? super T> subscriber) {
        subscriber.add(Subscriptions.create(new Action0() { // from class: rx.internal.operators.OnSubscribeAmb.1
            @Override // rx.functions.Action0
            public void call() {
                if (OnSubscribeAmb.this.selection.choice.get() != null) {
                    OnSubscribeAmb.this.selection.choice.get().unsubscribe();
                }
                if (!OnSubscribeAmb.this.selection.ambSubscribers.isEmpty()) {
                    for (AmbSubscriber<T> other : OnSubscribeAmb.this.selection.ambSubscribers) {
                        other.unsubscribe();
                    }
                    OnSubscribeAmb.this.selection.ambSubscribers.clear();
                }
            }
        }));
        subscriber.setProducer(new Producer() { // from class: rx.internal.operators.OnSubscribeAmb.2
            @Override // rx.Producer
            public void request(long n) {
                if (OnSubscribeAmb.this.selection.choice.get() == null) {
                    for (Observable<? extends T> source : OnSubscribeAmb.this.sources) {
                        if (!subscriber.isUnsubscribed()) {
                            AmbSubscriber<T> ambSubscriber = new AmbSubscriber<>(n, subscriber, OnSubscribeAmb.this.selection);
                            OnSubscribeAmb.this.selection.ambSubscribers.add(ambSubscriber);
                            if (OnSubscribeAmb.this.selection.choice.get() != null) {
                                OnSubscribeAmb.this.selection.unsubscribeOthers(OnSubscribeAmb.this.selection.choice.get());
                                return;
                            }
                            source.unsafeSubscribe(ambSubscriber);
                        } else {
                            return;
                        }
                    }
                    return;
                }
                OnSubscribeAmb.this.selection.choice.get().requestMore(n);
            }
        });
    }
}
