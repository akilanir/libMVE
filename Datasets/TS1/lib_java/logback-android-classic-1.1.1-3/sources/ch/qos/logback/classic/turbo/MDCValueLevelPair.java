package ch.qos.logback.classic.turbo;

import ch.qos.logback.classic.Level;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/turbo/MDCValueLevelPair.class */
public class MDCValueLevelPair {
    private String value;
    private Level level;

    public String getValue() {
        return this.value;
    }

    public void setValue(String str) {
        this.value = str;
    }

    public Level getLevel() {
        return this.level;
    }

    public void setLevel(Level level) {
        this.level = level;
    }
}
