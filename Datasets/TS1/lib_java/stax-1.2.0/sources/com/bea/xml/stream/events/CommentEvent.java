package com.bea.xml.stream.events;

import java.io.IOException;
import java.io.Writer;
import javax.xml.stream.events.Comment;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/events/CommentEvent.class */
public class CommentEvent extends CharactersEvent implements Comment {
    public CommentEvent() {
        init();
    }

    public CommentEvent(String data) {
        init();
        setData(data);
    }

    @Override // com.bea.xml.stream.events.CharactersEvent
    protected void init() {
        setEventType(5);
    }

    public String getText() {
        return getData();
    }

    @Override // com.bea.xml.stream.events.CharactersEvent, com.bea.xml.stream.events.BaseEvent
    protected void doWriteAsEncodedUnicode(Writer writer) throws IOException {
        writer.write("<!--");
        String text = getText();
        if (text.length() > 0) {
            writer.write(text);
        }
        writer.write("-->");
    }
}
