package ch.qos.logback.classic.sift;

import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.core.sift.AbstractDiscriminator;
import ch.qos.logback.core.util.OptionHelper;
import java.util.Map;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/sift/MDCBasedDiscriminator.class */
public class MDCBasedDiscriminator extends AbstractDiscriminator<ILoggingEvent> {
    private String key;
    private String defaultValue;

    public String getDiscriminatingValue(ILoggingEvent iLoggingEvent) {
        String str;
        Map<String, String> mDCPropertyMap = iLoggingEvent.getMDCPropertyMap();
        if (mDCPropertyMap != null && (str = mDCPropertyMap.get(this.key)) != null) {
            return str;
        }
        return this.defaultValue;
    }

    public void start() {
        int i = 0;
        if (OptionHelper.isEmpty(this.key)) {
            i = 0 + 1;
            addError("The \"Key\" property must be set");
        }
        if (OptionHelper.isEmpty(this.defaultValue)) {
            i++;
            addError("The \"DefaultValue\" property must be set");
        }
        if (i == 0) {
            this.started = true;
        }
    }

    public String getKey() {
        return this.key;
    }

    public void setKey(String str) {
        this.key = str;
    }

    public String getDefaultValue() {
        return this.defaultValue;
    }

    public void setDefaultValue(String str) {
        this.defaultValue = str;
    }
}
