package ch.qos.logback.classic.sift;

import ch.qos.logback.classic.ClassicConstants;
import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.core.joran.spi.DefaultClass;
import ch.qos.logback.core.sift.Discriminator;
import ch.qos.logback.core.sift.SiftingAppenderBase;
import org.slf4j.Marker;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/sift/SiftingAppender.class */
public class SiftingAppender extends SiftingAppenderBase<ILoggingEvent> {
    /* JADX INFO: Access modifiers changed from: protected */
    public long getTimestamp(ILoggingEvent iLoggingEvent) {
        return iLoggingEvent.getTimeStamp();
    }

    @DefaultClass(MDCBasedDiscriminator.class)
    public void setDiscriminator(Discriminator<ILoggingEvent> discriminator) {
        super.setDiscriminator(discriminator);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean eventMarksEndOfLife(ILoggingEvent iLoggingEvent) {
        Marker marker = iLoggingEvent.getMarker();
        if (marker == null) {
            return false;
        }
        return marker.contains(ClassicConstants.FINALIZE_SESSION_MARKER);
    }
}
