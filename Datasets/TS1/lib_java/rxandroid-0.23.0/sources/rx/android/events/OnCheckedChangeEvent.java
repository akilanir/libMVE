package rx.android.events;

import android.widget.CompoundButton;

/* loaded from: rxandroid-0.23.0.jar:rx/android/events/OnCheckedChangeEvent.class */
public class OnCheckedChangeEvent {
    public final CompoundButton view;
    public final boolean value;

    public OnCheckedChangeEvent(CompoundButton view) {
        this(view, view.isChecked());
    }

    public OnCheckedChangeEvent(CompoundButton view, boolean value) {
        this.view = view;
        this.value = value;
    }
}
