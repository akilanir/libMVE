package rx.observers;

import java.util.Arrays;
import rx.Subscriber;
import rx.exceptions.CompositeException;
import rx.exceptions.Exceptions;
import rx.exceptions.OnErrorFailedException;
import rx.exceptions.OnErrorNotImplementedException;
import rx.plugins.RxJavaPlugins;

/* loaded from: rxjava-1.0.7.jar:rx/observers/SafeSubscriber.class */
public class SafeSubscriber<T> extends Subscriber<T> {
    private final Subscriber<? super T> actual;
    boolean done;

    public SafeSubscriber(Subscriber<? super T> actual) {
        super(actual);
        this.done = false;
        this.actual = actual;
    }

    @Override // rx.Observer
    public void onCompleted() {
        if (!this.done) {
            this.done = true;
            try {
                try {
                    this.actual.onCompleted();
                    unsubscribe();
                } catch (Throwable e) {
                    Exceptions.throwIfFatal(e);
                    _onError(e);
                    unsubscribe();
                }
            } catch (Throwable th) {
                unsubscribe();
                throw th;
            }
        }
    }

    @Override // rx.Observer
    public void onError(Throwable e) {
        Exceptions.throwIfFatal(e);
        if (!this.done) {
            this.done = true;
            _onError(e);
        }
    }

    @Override // rx.Observer
    public void onNext(T args) {
        try {
            if (!this.done) {
                this.actual.onNext(args);
            }
        } catch (Throwable e) {
            Exceptions.throwIfFatal(e);
            onError(e);
        }
    }

    protected void _onError(Throwable e) {
        try {
            RxJavaPlugins.getInstance().getErrorHandler().handleError(e);
        } catch (Throwable pluginException) {
            handlePluginException(pluginException);
        }
        try {
            this.actual.onError(e);
            try {
                unsubscribe();
            } catch (RuntimeException unsubscribeException) {
                try {
                    RxJavaPlugins.getInstance().getErrorHandler().handleError(unsubscribeException);
                } catch (Throwable pluginException2) {
                    handlePluginException(pluginException2);
                }
                throw new OnErrorFailedException(unsubscribeException);
            }
        } catch (Throwable e2) {
            if (e2 instanceof OnErrorNotImplementedException) {
                try {
                    unsubscribe();
                    throw ((OnErrorNotImplementedException) e2);
                } catch (Throwable unsubscribeException2) {
                    try {
                        RxJavaPlugins.getInstance().getErrorHandler().handleError(unsubscribeException2);
                    } catch (Throwable pluginException3) {
                        handlePluginException(pluginException3);
                    }
                    throw new RuntimeException("Observer.onError not implemented and error while unsubscribing.", new CompositeException(Arrays.asList(e, unsubscribeException2)));
                }
            }
            try {
                RxJavaPlugins.getInstance().getErrorHandler().handleError(e2);
            } catch (Throwable pluginException4) {
                handlePluginException(pluginException4);
            }
            try {
                unsubscribe();
                throw new OnErrorFailedException("Error occurred when trying to propagate error to Observer.onError", new CompositeException(Arrays.asList(e, e2)));
            } catch (Throwable unsubscribeException3) {
                try {
                    RxJavaPlugins.getInstance().getErrorHandler().handleError(unsubscribeException3);
                } catch (Throwable pluginException5) {
                    handlePluginException(pluginException5);
                }
                throw new OnErrorFailedException("Error occurred when trying to propagate error to Observer.onError and during unsubscription.", new CompositeException(Arrays.asList(e, e2, unsubscribeException3)));
            }
        }
    }

    private void handlePluginException(Throwable pluginException) {
        System.err.println("RxJavaErrorHandler threw an Exception. It shouldn't. => " + pluginException.getMessage());
        pluginException.printStackTrace();
    }

    public Subscriber<? super T> getActual() {
        return this.actual;
    }
}
