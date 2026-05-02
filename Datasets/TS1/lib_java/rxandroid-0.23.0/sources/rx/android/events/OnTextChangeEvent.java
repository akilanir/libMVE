package rx.android.events;

import android.text.SpannableString;
import android.widget.TextView;

/* loaded from: rxandroid-0.23.0.jar:rx/android/events/OnTextChangeEvent.class */
public class OnTextChangeEvent {
    public final TextView view;
    public final CharSequence text;

    public OnTextChangeEvent(TextView view) {
        this(view, new SpannableString(view.getText()));
    }

    public OnTextChangeEvent(TextView view, CharSequence text) {
        this.view = view;
        this.text = text;
    }
}
