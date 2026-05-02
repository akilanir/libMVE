package org.kore.kolab.notes.event;

/* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/event/EventListener.class */
public interface EventListener {

    /* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/event/EventListener$Type.class */
    public enum Type {
        NEW,
        DELETE,
        UPDATE
    }

    void propertyChanged(String str, Type type, String str2, Object obj, Object obj2);
}
