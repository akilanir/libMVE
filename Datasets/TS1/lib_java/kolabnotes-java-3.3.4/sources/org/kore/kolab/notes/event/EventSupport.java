package org.kore.kolab.notes.event;

import org.kore.kolab.notes.event.EventListener;

/* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/event/EventSupport.class */
public interface EventSupport {
    void addListener(EventListener... eventListenerArr);

    void firePropertyChange(String str, EventListener.Type type, String str2, Object obj, Object obj2);
}
