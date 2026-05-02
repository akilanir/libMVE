package org.apache.james.mime4j.codec;

/* loaded from: apache-mime4j-core-0.7.2.jar:org/apache/james/mime4j/codec/DecodeMonitor.class */
public class DecodeMonitor {
    public static final DecodeMonitor STRICT = new DecodeMonitor() { // from class: org.apache.james.mime4j.codec.DecodeMonitor.1
        @Override // org.apache.james.mime4j.codec.DecodeMonitor
        public boolean warn(String error, String dropDesc) {
            return true;
        }

        @Override // org.apache.james.mime4j.codec.DecodeMonitor
        public boolean isListening() {
            return true;
        }
    };
    public static final DecodeMonitor SILENT = new DecodeMonitor();

    public boolean warn(String error, String dropDesc) {
        return false;
    }

    public boolean isListening() {
        return false;
    }
}
