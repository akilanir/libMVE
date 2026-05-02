package ch.qos.logback.core.joran.event;

import org.xml.sax.Locator;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/joran/event/BodyEvent.class */
public class BodyEvent extends SaxEvent {
    private String text;

    BodyEvent(String str, Locator locator) {
        super(null, null, null, locator);
        this.text = str;
    }

    public String getText() {
        return this.text != null ? this.text.trim() : this.text;
    }

    public String toString() {
        return "BodyEvent(" + getText() + ")" + this.locator.getLineNumber() + "," + this.locator.getColumnNumber();
    }

    public void append(String str) {
        this.text += str;
    }
}
