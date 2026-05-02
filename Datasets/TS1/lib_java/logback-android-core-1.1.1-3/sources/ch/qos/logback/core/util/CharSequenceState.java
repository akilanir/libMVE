package ch.qos.logback.core.util;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/util/CharSequenceState.class */
class CharSequenceState {
    final char c;
    int occurrences = 1;

    public CharSequenceState(char c) {
        this.c = c;
    }

    void incrementOccurrences() {
        this.occurrences++;
    }
}
