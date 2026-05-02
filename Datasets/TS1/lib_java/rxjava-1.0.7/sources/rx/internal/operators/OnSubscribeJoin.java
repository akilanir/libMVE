package rx.internal.operators;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import rx.Observable;
import rx.Subscriber;
import rx.Subscription;
import rx.functions.Func1;
import rx.functions.Func2;
import rx.observers.SerializedSubscriber;
import rx.subscriptions.CompositeSubscription;
import rx.subscriptions.SerialSubscription;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OnSubscribeJoin.class */
public final class OnSubscribeJoin<TLeft, TRight, TLeftDuration, TRightDuration, R> implements Observable.OnSubscribe<R> {
    final Observable<TLeft> left;
    final Observable<TRight> right;
    final Func1<TLeft, Observable<TLeftDuration>> leftDurationSelector;
    final Func1<TRight, Observable<TRightDuration>> rightDurationSelector;
    final Func2<TLeft, TRight, R> resultSelector;

    public OnSubscribeJoin(Observable<TLeft> left, Observable<TRight> right, Func1<TLeft, Observable<TLeftDuration>> leftDurationSelector, Func1<TRight, Observable<TRightDuration>> rightDurationSelector, Func2<TLeft, TRight, R> resultSelector) {
        this.left = left;
        this.right = right;
        this.leftDurationSelector = leftDurationSelector;
        this.rightDurationSelector = rightDurationSelector;
        this.resultSelector = resultSelector;
    }

    @Override // rx.functions.Action1
    public void call(Subscriber<? super R> t1) {
        OnSubscribeJoin<TLeft, TRight, TLeftDuration, TRightDuration, R>.ResultSink result = new ResultSink(new SerializedSubscriber(t1));
        result.run();
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OnSubscribeJoin$ResultSink.class */
    final class ResultSink {
        final Subscriber<? super R> subscriber;
        boolean leftDone;
        int leftId;
        boolean rightDone;
        int rightId;
        final Object guard = new Object();
        final CompositeSubscription group = new CompositeSubscription();
        final Map<Integer, TLeft> leftMap = new HashMap();
        final Map<Integer, TRight> rightMap = new HashMap();

        public ResultSink(Subscriber<? super R> subscriber) {
            this.subscriber = subscriber;
        }

        public void run() {
            this.subscriber.add(this.group);
            LeftSubscriber leftSubscriber = new LeftSubscriber();
            RightSubscriber rightSubscriber = new RightSubscriber();
            this.group.add(leftSubscriber);
            this.group.add(rightSubscriber);
            OnSubscribeJoin.this.left.unsafeSubscribe(leftSubscriber);
            OnSubscribeJoin.this.right.unsafeSubscribe(rightSubscriber);
        }

        /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OnSubscribeJoin$ResultSink$LeftSubscriber.class */
        final class LeftSubscriber extends Subscriber<TLeft> {
            LeftSubscriber() {
            }

            protected void expire(int id, Subscription resource) {
                boolean complete = false;
                synchronized (ResultSink.this.guard) {
                    if (ResultSink.this.leftMap.remove(Integer.valueOf(id)) != null && ResultSink.this.leftMap.isEmpty() && ResultSink.this.leftDone) {
                        complete = true;
                    }
                }
                if (complete) {
                    ResultSink.this.subscriber.onCompleted();
                    ResultSink.this.subscriber.unsubscribe();
                } else {
                    ResultSink.this.group.remove(resource);
                }
            }

            @Override // rx.Observer
            public void onNext(TLeft tleft) {
                int i;
                int i2;
                synchronized (ResultSink.this.guard) {
                    ResultSink resultSink = ResultSink.this;
                    i = resultSink.leftId;
                    resultSink.leftId = i + 1;
                    ResultSink.this.leftMap.put(Integer.valueOf(i), tleft);
                    i2 = ResultSink.this.rightId;
                }
                try {
                    Observable<TLeftDuration> call = OnSubscribeJoin.this.leftDurationSelector.call(tleft);
                    LeftDurationSubscriber leftDurationSubscriber = new LeftDurationSubscriber(i);
                    ResultSink.this.group.add(leftDurationSubscriber);
                    call.unsafeSubscribe(leftDurationSubscriber);
                    ArrayList arrayList = new ArrayList();
                    synchronized (ResultSink.this.guard) {
                        for (Map.Entry<Integer, TRight> entry : ResultSink.this.rightMap.entrySet()) {
                            if (entry.getKey().intValue() < i2) {
                                arrayList.add(entry.getValue());
                            }
                        }
                    }
                    Iterator it = arrayList.iterator();
                    while (it.hasNext()) {
                        ResultSink.this.subscriber.onNext(OnSubscribeJoin.this.resultSelector.call(tleft, it.next()));
                    }
                } catch (Throwable th) {
                    onError(th);
                }
            }

            @Override // rx.Observer
            public void onError(Throwable e) {
                ResultSink.this.subscriber.onError(e);
                ResultSink.this.subscriber.unsubscribe();
            }

            @Override // rx.Observer
            public void onCompleted() {
                boolean complete = false;
                synchronized (ResultSink.this.guard) {
                    ResultSink.this.leftDone = true;
                    if (ResultSink.this.rightDone || ResultSink.this.leftMap.isEmpty()) {
                        complete = true;
                    }
                }
                if (complete) {
                    ResultSink.this.subscriber.onCompleted();
                    ResultSink.this.subscriber.unsubscribe();
                } else {
                    ResultSink.this.group.remove(this);
                }
            }

            /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OnSubscribeJoin$ResultSink$LeftSubscriber$LeftDurationSubscriber.class */
            final class LeftDurationSubscriber extends Subscriber<TLeftDuration> {
                final int id;
                boolean once = true;

                public LeftDurationSubscriber(int id) {
                    this.id = id;
                }

                @Override // rx.Observer
                public void onNext(TLeftDuration args) {
                    onCompleted();
                }

                @Override // rx.Observer
                public void onError(Throwable e) {
                    LeftSubscriber.this.onError(e);
                }

                @Override // rx.Observer
                public void onCompleted() {
                    if (this.once) {
                        this.once = false;
                        LeftSubscriber.this.expire(this.id, this);
                    }
                }
            }
        }

        /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OnSubscribeJoin$ResultSink$RightSubscriber.class */
        final class RightSubscriber extends Subscriber<TRight> {
            RightSubscriber() {
            }

            void expire(int id, Subscription resource) {
                boolean complete = false;
                synchronized (ResultSink.this.guard) {
                    if (ResultSink.this.rightMap.remove(Integer.valueOf(id)) != null && ResultSink.this.rightMap.isEmpty() && ResultSink.this.rightDone) {
                        complete = true;
                    }
                }
                if (complete) {
                    ResultSink.this.subscriber.onCompleted();
                    ResultSink.this.subscriber.unsubscribe();
                } else {
                    ResultSink.this.group.remove(resource);
                }
            }

            @Override // rx.Observer
            public void onNext(TRight tright) {
                int i;
                int i2;
                synchronized (ResultSink.this.guard) {
                    ResultSink resultSink = ResultSink.this;
                    i = resultSink.rightId;
                    resultSink.rightId = i + 1;
                    ResultSink.this.rightMap.put(Integer.valueOf(i), tright);
                    i2 = ResultSink.this.leftId;
                }
                ResultSink.this.group.add(new SerialSubscription());
                try {
                    Observable<TRightDuration> call = OnSubscribeJoin.this.rightDurationSelector.call(tright);
                    RightDurationSubscriber rightDurationSubscriber = new RightDurationSubscriber(i);
                    ResultSink.this.group.add(rightDurationSubscriber);
                    call.unsafeSubscribe(rightDurationSubscriber);
                    ArrayList arrayList = new ArrayList();
                    synchronized (ResultSink.this.guard) {
                        for (Map.Entry<Integer, TLeft> entry : ResultSink.this.leftMap.entrySet()) {
                            if (entry.getKey().intValue() < i2) {
                                arrayList.add(entry.getValue());
                            }
                        }
                    }
                    Iterator it = arrayList.iterator();
                    while (it.hasNext()) {
                        ResultSink.this.subscriber.onNext(OnSubscribeJoin.this.resultSelector.call(it.next(), tright));
                    }
                } catch (Throwable th) {
                    onError(th);
                }
            }

            @Override // rx.Observer
            public void onError(Throwable e) {
                ResultSink.this.subscriber.onError(e);
                ResultSink.this.subscriber.unsubscribe();
            }

            @Override // rx.Observer
            public void onCompleted() {
                boolean complete = false;
                synchronized (ResultSink.this.guard) {
                    ResultSink.this.rightDone = true;
                    if (ResultSink.this.leftDone || ResultSink.this.rightMap.isEmpty()) {
                        complete = true;
                    }
                }
                if (complete) {
                    ResultSink.this.subscriber.onCompleted();
                    ResultSink.this.subscriber.unsubscribe();
                } else {
                    ResultSink.this.group.remove(this);
                }
            }

            /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OnSubscribeJoin$ResultSink$RightSubscriber$RightDurationSubscriber.class */
            final class RightDurationSubscriber extends Subscriber<TRightDuration> {
                final int id;
                boolean once = true;

                public RightDurationSubscriber(int id) {
                    this.id = id;
                }

                @Override // rx.Observer
                public void onNext(TRightDuration args) {
                    onCompleted();
                }

                @Override // rx.Observer
                public void onError(Throwable e) {
                    RightSubscriber.this.onError(e);
                }

                @Override // rx.Observer
                public void onCompleted() {
                    if (this.once) {
                        this.once = false;
                        RightSubscriber.this.expire(this.id, this);
                    }
                }
            }
        }
    }
}
