package com.bea.xml.stream.events;

import java.io.IOException;
import java.io.Writer;
import javax.xml.stream.events.ProcessingInstruction;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/events/ProcessingInstructionEvent.class */
public class ProcessingInstructionEvent extends BaseEvent implements ProcessingInstruction {
    String name;
    String content;

    public ProcessingInstructionEvent() {
        init();
    }

    public ProcessingInstructionEvent(String name, String content) {
        init();
        this.name = name;
        this.content = content;
    }

    protected void init() {
        setEventType(3);
    }

    public String getTarget() {
        return this.name;
    }

    public void setTarget(String target) {
        this.name = target;
    }

    public void setData(String data) {
        this.content = data;
    }

    public String getData() {
        return this.content;
    }

    @Override // com.bea.xml.stream.events.BaseEvent
    protected void doWriteAsEncodedUnicode(Writer writer) throws IOException {
        writer.write("<?");
        if (this.name != null) {
            writer.write(this.name);
        }
        if (this.content != null) {
            writer.write(32);
            writer.write(this.content);
        }
        writer.write("?>");
    }
}
