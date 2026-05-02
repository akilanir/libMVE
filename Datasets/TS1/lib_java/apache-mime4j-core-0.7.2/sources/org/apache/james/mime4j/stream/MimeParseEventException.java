package org.apache.james.mime4j.stream;

import org.apache.james.mime4j.MimeException;

/* loaded from: apache-mime4j-core-0.7.2.jar:org/apache/james/mime4j/stream/MimeParseEventException.class */
public class MimeParseEventException extends MimeException {
    private static final long serialVersionUID = 4632991604246852302L;
    private final Event event;

    public MimeParseEventException(Event event) {
        super(event.toString());
        this.event = event;
    }

    public Event getEvent() {
        return this.event;
    }
}
