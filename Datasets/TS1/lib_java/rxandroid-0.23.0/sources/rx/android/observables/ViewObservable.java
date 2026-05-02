package rx.android.observables;

import android.view.View;
import android.widget.AdapterView;
import android.widget.CompoundButton;
import android.widget.TextView;
import rx.Observable;
import rx.android.events.OnCheckedChangeEvent;
import rx.android.events.OnClickEvent;
import rx.android.events.OnItemClickEvent;
import rx.android.events.OnTextChangeEvent;
import rx.android.operators.OperatorAdapterViewOnItemClick;
import rx.android.operators.OperatorCompoundButtonInput;
import rx.android.operators.OperatorTextViewInput;
import rx.android.operators.OperatorViewClick;

/* loaded from: rxandroid-0.23.0.jar:rx/android/observables/ViewObservable.class */
public class ViewObservable {
    public static Observable<OnClickEvent> clicks(View view) {
        return clicks(view, false);
    }

    public static Observable<OnClickEvent> clicks(View view, boolean emitInitialValue) {
        return Observable.create(new OperatorViewClick(view, emitInitialValue));
    }

    public static Observable<OnTextChangeEvent> text(TextView input) {
        return text(input, false);
    }

    public static Observable<OnTextChangeEvent> text(TextView input, boolean emitInitialValue) {
        return Observable.create(new OperatorTextViewInput(input, emitInitialValue));
    }

    public static Observable<OnCheckedChangeEvent> input(CompoundButton button) {
        return input(button, false);
    }

    public static Observable<OnCheckedChangeEvent> input(CompoundButton button, boolean emitInitialValue) {
        return Observable.create(new OperatorCompoundButtonInput(button, emitInitialValue));
    }

    public static Observable<OnItemClickEvent> itemClicks(AdapterView<?> adapterView) {
        return Observable.create(new OperatorAdapterViewOnItemClick(adapterView));
    }
}
