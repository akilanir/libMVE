package ch.qos.logback.classic.pattern;

import ch.qos.logback.classic.spi.ILoggingEvent;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/pattern/PropertyConverter.class */
public final class PropertyConverter extends ClassicConverter {
    String key;

    public void start() {
        String firstOption = getFirstOption();
        if (firstOption != null) {
            this.key = firstOption;
            super.start();
        }
    }

    public String convert(ILoggingEvent iLoggingEvent) {
        if (this.key == null) {
            return "Property_HAS_NO_KEY";
        }
        String str = iLoggingEvent.getLoggerContextVO().getPropertyMap().get(this.key);
        return str != null ? str : System.getProperty(this.key);
    }
}
