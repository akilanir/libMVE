package ch.qos.logback.classic.pattern;

import ch.qos.logback.classic.spi.ILoggingEvent;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/pattern/NamedConverter.class */
public abstract class NamedConverter extends ClassicConverter {
    Abbreviator abbreviator = null;

    protected abstract String getFullyQualifiedName(ILoggingEvent iLoggingEvent);

    public void start() {
        String firstOption = getFirstOption();
        if (firstOption != null) {
            try {
                int parseInt = Integer.parseInt(firstOption);
                if (parseInt == 0) {
                    this.abbreviator = new ClassNameOnlyAbbreviator();
                } else if (parseInt > 0) {
                    this.abbreviator = new TargetLengthBasedClassNameAbbreviator(parseInt);
                }
            } catch (NumberFormatException e) {
            }
        }
    }

    public String convert(ILoggingEvent iLoggingEvent) {
        String fullyQualifiedName = getFullyQualifiedName(iLoggingEvent);
        return this.abbreviator == null ? fullyQualifiedName : this.abbreviator.abbreviate(fullyQualifiedName);
    }
}
