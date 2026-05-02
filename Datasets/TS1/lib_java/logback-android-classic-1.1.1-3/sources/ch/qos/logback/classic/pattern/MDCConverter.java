package ch.qos.logback.classic.pattern;

import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.core.util.OptionHelper;
import java.util.Map;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/pattern/MDCConverter.class */
public class MDCConverter extends ClassicConverter {
    private String key;
    private String defaultValue = "";

    public void start() {
        String[] extractDefaultReplacement = OptionHelper.extractDefaultReplacement(getFirstOption());
        this.key = extractDefaultReplacement[0];
        if (extractDefaultReplacement[1] != null) {
            this.defaultValue = extractDefaultReplacement[1];
        }
        super.start();
    }

    public void stop() {
        this.key = null;
        super.stop();
    }

    public String convert(ILoggingEvent iLoggingEvent) {
        Map<String, String> mDCPropertyMap = iLoggingEvent.getMDCPropertyMap();
        if (mDCPropertyMap == null) {
            return this.defaultValue;
        }
        if (this.key == null) {
            return outputMDCForAllKeys(mDCPropertyMap);
        }
        String str = iLoggingEvent.getMDCPropertyMap().get(this.key);
        return str != null ? str : this.defaultValue;
    }

    private String outputMDCForAllKeys(Map<String, String> map) {
        StringBuilder sb = new StringBuilder();
        boolean z = true;
        for (Map.Entry<String, String> entry : map.entrySet()) {
            if (z) {
                z = false;
            } else {
                sb.append(", ");
            }
            sb.append(entry.getKey()).append('=').append(entry.getValue());
        }
        return sb.toString();
    }
}
