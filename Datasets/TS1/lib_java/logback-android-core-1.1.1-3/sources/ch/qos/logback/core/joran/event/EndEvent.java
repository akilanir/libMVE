package ch.qos.logback.core.joran.event;

import org.xml.sax.Locator;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/joran/event/EndEvent.class */
public class EndEvent extends SaxEvent {
    EndEvent(String str, String str2, String str3, Locator locator) {
        super(str, str2, str3, locator);
    }

    public String toString() {
        return "  EndEvent(" + getQName() + ")  [" + this.locator.getLineNumber() + "," + this.locator.getColumnNumber() + "]";
    }
}
