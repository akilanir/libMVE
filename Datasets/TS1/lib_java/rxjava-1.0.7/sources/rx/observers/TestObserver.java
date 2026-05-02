package rx.observers;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import rx.Notification;
import rx.Observer;

/* loaded from: rxjava-1.0.7.jar:rx/observers/TestObserver.class */
public class TestObserver<T> implements Observer<T> {
    private final Observer<T> delegate;
    private final ArrayList<T> onNextEvents;
    private final ArrayList<Throwable> onErrorEvents;
    private final ArrayList<Notification<T>> onCompletedEvents;
    private static Observer<Object> INERT = new Observer<Object>() { // from class: rx.observers.TestObserver.1
        @Override // rx.Observer
        public void onCompleted() {
        }

        @Override // rx.Observer
        public void onError(Throwable e) {
        }

        @Override // rx.Observer
        public void onNext(Object t) {
        }
    };

    public TestObserver(Observer<T> delegate) {
        this.onNextEvents = new ArrayList<>();
        this.onErrorEvents = new ArrayList<>();
        this.onCompletedEvents = new ArrayList<>();
        this.delegate = delegate;
    }

    public TestObserver() {
        this.onNextEvents = new ArrayList<>();
        this.onErrorEvents = new ArrayList<>();
        this.onCompletedEvents = new ArrayList<>();
        this.delegate = (Observer<T>) INERT;
    }

    @Override // rx.Observer
    public void onCompleted() {
        this.onCompletedEvents.add(Notification.createOnCompleted());
        this.delegate.onCompleted();
    }

    public List<Notification<T>> getOnCompletedEvents() {
        return Collections.unmodifiableList(this.onCompletedEvents);
    }

    @Override // rx.Observer
    public void onError(Throwable e) {
        this.onErrorEvents.add(e);
        this.delegate.onError(e);
    }

    public List<Throwable> getOnErrorEvents() {
        return Collections.unmodifiableList(this.onErrorEvents);
    }

    @Override // rx.Observer
    public void onNext(T t) {
        this.onNextEvents.add(t);
        this.delegate.onNext(t);
    }

    public List<T> getOnNextEvents() {
        return Collections.unmodifiableList(this.onNextEvents);
    }

    public List<Object> getEvents() {
        ArrayList<Object> events = new ArrayList<>();
        events.add(this.onNextEvents);
        events.add(this.onErrorEvents);
        events.add(this.onCompletedEvents);
        return Collections.unmodifiableList(events);
    }

    public void assertReceivedOnNext(List<T> items) {
        if (this.onNextEvents.size() != items.size()) {
            throw new AssertionError("Number of items does not match. Provided: " + items.size() + "  Actual: " + this.onNextEvents.size());
        }
        for (int i = 0; i < items.size(); i++) {
            if (items.get(i) == null) {
                if (this.onNextEvents.get(i) != null) {
                    throw new AssertionError("Value at index: " + i + " expected to be [null] but was: [" + this.onNextEvents.get(i) + "]");
                }
            } else if (!items.get(i).equals(this.onNextEvents.get(i))) {
                throw new AssertionError("Value at index: " + i + " expected to be [" + items.get(i) + "] (" + items.get(i).getClass().getSimpleName() + ") but was: [" + this.onNextEvents.get(i) + "] (" + this.onNextEvents.get(i).getClass().getSimpleName() + ")");
            }
        }
    }

    public void assertTerminalEvent() {
        if (this.onErrorEvents.size() > 1) {
            throw new AssertionError("Too many onError events: " + this.onErrorEvents.size());
        }
        if (this.onCompletedEvents.size() > 1) {
            throw new AssertionError("Too many onCompleted events: " + this.onCompletedEvents.size());
        }
        if (this.onCompletedEvents.size() == 1 && this.onErrorEvents.size() == 1) {
            throw new AssertionError("Received both an onError and onCompleted. Should be one or the other.");
        }
        if (this.onCompletedEvents.size() == 0 && this.onErrorEvents.size() == 0) {
            throw new AssertionError("No terminal events received.");
        }
    }
}
