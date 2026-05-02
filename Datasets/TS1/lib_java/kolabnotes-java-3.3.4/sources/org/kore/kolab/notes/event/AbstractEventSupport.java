package org.kore.kolab.notes.event;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.kore.kolab.notes.event.EventListener;

/* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/event/AbstractEventSupport.class */
public class AbstractEventSupport implements EventSupport {
    private final List<EventListener> listener = new ArrayList();

    @Override // org.kore.kolab.notes.event.EventSupport
    public void addListener(EventListener... listener) {
        this.listener.addAll(Arrays.asList(listener));
    }

    @Override // org.kore.kolab.notes.event.EventSupport
    public void firePropertyChange(String uid, EventListener.Type type, String propertyName, Object oldValue, Object newValue) {
        for (EventListener list : this.listener) {
            list.propertyChanged(uid, type, propertyName, oldValue, newValue);
        }
    }

    public List<EventListener> getEventListener() {
        return Collections.unmodifiableList(this.listener);
    }
}
