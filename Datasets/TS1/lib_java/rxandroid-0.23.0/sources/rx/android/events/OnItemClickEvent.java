package rx.android.events;

import android.view.View;
import android.widget.AdapterView;

/* loaded from: rxandroid-0.23.0.jar:rx/android/events/OnItemClickEvent.class */
public class OnItemClickEvent {
    public final AdapterView<?> parent;
    public final View view;
    public final int position;
    public final long id;

    public OnItemClickEvent(AdapterView<?> parent, View view, int position, long id) {
        this.parent = parent;
        this.view = view;
        this.position = position;
        this.id = id;
    }
}
