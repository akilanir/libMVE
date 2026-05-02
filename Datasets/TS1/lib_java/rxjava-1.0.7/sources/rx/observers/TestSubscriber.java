package rx.observers;

import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import rx.Notification;
import rx.Observer;
import rx.Subscriber;

/* loaded from: rxjava-1.0.7.jar:rx/observers/TestSubscriber.class */
public class TestSubscriber<T> extends Subscriber<T> {
    private final TestObserver<T> testObserver;
    private final CountDownLatch latch;
    private volatile Thread lastSeenThread;

    public TestSubscriber(Subscriber<T> delegate) {
        this.latch = new CountDownLatch(1);
        this.testObserver = new TestObserver<>(delegate);
    }

    public TestSubscriber(Observer<T> delegate) {
        this.latch = new CountDownLatch(1);
        this.testObserver = new TestObserver<>(delegate);
    }

    public TestSubscriber() {
        this.latch = new CountDownLatch(1);
        this.testObserver = new TestObserver<>(new Observer<T>() { // from class: rx.observers.TestSubscriber.1
            @Override // rx.Observer
            public void onCompleted() {
            }

            @Override // rx.Observer
            public void onError(Throwable e) {
            }

            @Override // rx.Observer
            public void onNext(T t) {
            }
        });
    }

    @Override // rx.Observer
    public void onCompleted() {
        try {
            this.lastSeenThread = Thread.currentThread();
            this.testObserver.onCompleted();
            this.latch.countDown();
        } catch (Throwable th) {
            this.latch.countDown();
            throw th;
        }
    }

    public List<Notification<T>> getOnCompletedEvents() {
        return this.testObserver.getOnCompletedEvents();
    }

    @Override // rx.Observer
    public void onError(Throwable e) {
        try {
            this.lastSeenThread = Thread.currentThread();
            this.testObserver.onError(e);
            this.latch.countDown();
        } catch (Throwable th) {
            this.latch.countDown();
            throw th;
        }
    }

    public List<Throwable> getOnErrorEvents() {
        return this.testObserver.getOnErrorEvents();
    }

    @Override // rx.Observer
    public void onNext(T t) {
        this.lastSeenThread = Thread.currentThread();
        this.testObserver.onNext(t);
    }

    public void requestMore(long n) {
        request(n);
    }

    public List<T> getOnNextEvents() {
        return this.testObserver.getOnNextEvents();
    }

    public void assertReceivedOnNext(List<T> items) {
        this.testObserver.assertReceivedOnNext(items);
    }

    public void assertTerminalEvent() {
        this.testObserver.assertTerminalEvent();
    }

    public void assertUnsubscribed() {
        if (!isUnsubscribed()) {
            throw new AssertionError("Not unsubscribed.");
        }
    }

    public void assertNoErrors() {
        if (getOnErrorEvents().size() > 0) {
            throw new RuntimeException("Unexpected onError events: " + getOnErrorEvents().size(), getOnErrorEvents().get(0));
        }
    }

    public void awaitTerminalEvent() {
        try {
            this.latch.await();
        } catch (InterruptedException e) {
            throw new RuntimeException("Interrupted", e);
        }
    }

    public void awaitTerminalEvent(long timeout, TimeUnit unit) {
        try {
            this.latch.await(timeout, unit);
        } catch (InterruptedException e) {
            throw new RuntimeException("Interrupted", e);
        }
    }

    public void awaitTerminalEventAndUnsubscribeOnTimeout(long timeout, TimeUnit unit) {
        try {
            awaitTerminalEvent(timeout, unit);
        } catch (RuntimeException e) {
            unsubscribe();
        }
    }

    public Thread getLastSeenThread() {
        return this.lastSeenThread;
    }
}
