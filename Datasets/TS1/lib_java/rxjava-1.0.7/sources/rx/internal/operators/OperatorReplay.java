package rx.internal.operators;

import rx.Observable;
import rx.Scheduler;
import rx.Subscriber;
import rx.subjects.Subject;

/* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorReplay.class */
public final class OperatorReplay {
    private OperatorReplay() {
        throw new IllegalStateException("No instances!");
    }

    public static <T> Subject<T, T> createScheduledSubject(Subject<T, T> subject, Scheduler scheduler) {
        final Observable<T> observedOn = subject.observeOn(scheduler);
        SubjectWrapper<T> s = new SubjectWrapper<>(new Observable.OnSubscribe<T>() { // from class: rx.internal.operators.OperatorReplay.1
            @Override // rx.functions.Action1
            public void call(Subscriber<? super T> o) {
                OperatorReplay.subscriberOf(observedOn).call(o);
            }
        }, subject);
        return s;
    }

    public static <T> Observable.OnSubscribe<T> subscriberOf(final Observable<T> target) {
        return new Observable.OnSubscribe<T>() { // from class: rx.internal.operators.OperatorReplay.2
            @Override // rx.functions.Action1
            public void call(Subscriber<? super T> t1) {
                target.unsafeSubscribe(t1);
            }
        };
    }

    /* loaded from: rxjava-1.0.7.jar:rx/internal/operators/OperatorReplay$SubjectWrapper.class */
    public static final class SubjectWrapper<T> extends Subject<T, T> {
        final Subject<T, T> subject;

        public SubjectWrapper(Observable.OnSubscribe<T> func, Subject<T, T> subject) {
            super(func);
            this.subject = subject;
        }

        @Override // rx.Observer
        public void onNext(T args) {
            this.subject.onNext(args);
        }

        @Override // rx.Observer
        public void onError(Throwable e) {
            this.subject.onError(e);
        }

        @Override // rx.Observer
        public void onCompleted() {
            this.subject.onCompleted();
        }

        @Override // rx.subjects.Subject
        public boolean hasObservers() {
            return this.subject.hasObservers();
        }
    }
}
