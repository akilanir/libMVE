package rx.android.operators;

import android.text.Editable;
import android.text.TextWatcher;
import android.widget.TextView;
import rx.Observable;
import rx.Subscriber;
import rx.Subscription;
import rx.android.events.OnTextChangeEvent;
import rx.android.observables.Assertions;
import rx.android.subscriptions.AndroidSubscriptions;
import rx.functions.Action0;

/* loaded from: rxandroid-0.23.0.jar:rx/android/operators/OperatorTextViewInput.class */
public class OperatorTextViewInput implements Observable.OnSubscribe<OnTextChangeEvent> {
    private final boolean emitInitialValue;
    private final TextView input;

    public OperatorTextViewInput(TextView input, boolean emitInitialValue) {
        this.input = input;
        this.emitInitialValue = emitInitialValue;
    }

    public void call(final Subscriber<? super OnTextChangeEvent> observer) {
        Assertions.assertUiThread();
        final TextWatcher watcher = new SimpleTextWatcher() { // from class: rx.android.operators.OperatorTextViewInput.1
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            @Override // rx.android.operators.OperatorTextViewInput.SimpleTextWatcher, android.text.TextWatcher
            public void afterTextChanged(Editable editable) {
                observer.onNext(new OnTextChangeEvent(OperatorTextViewInput.this.input));
            }
        };
        Subscription subscription = AndroidSubscriptions.unsubscribeInUiThread(new Action0() { // from class: rx.android.operators.OperatorTextViewInput.2
            public void call() {
                OperatorTextViewInput.this.input.removeTextChangedListener(watcher);
            }
        });
        if (this.emitInitialValue) {
            observer.onNext(new OnTextChangeEvent(this.input));
        }
        this.input.addTextChangedListener(watcher);
        observer.add(subscription);
    }

    /* loaded from: rxandroid-0.23.0.jar:rx/android/operators/OperatorTextViewInput$SimpleTextWatcher.class */
    private static class SimpleTextWatcher implements TextWatcher {
        private SimpleTextWatcher() {
        }

        @Override // android.text.TextWatcher
        public void beforeTextChanged(CharSequence sequence, int start, int count, int after) {
        }

        @Override // android.text.TextWatcher
        public void onTextChanged(CharSequence sequence, int start, int before, int count) {
        }

        @Override // android.text.TextWatcher
        public void afterTextChanged(Editable editable) {
        }
    }
}
