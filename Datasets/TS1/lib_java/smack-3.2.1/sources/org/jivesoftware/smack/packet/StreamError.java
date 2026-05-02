package org.jivesoftware.smack.packet;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/packet/StreamError.class */
public class StreamError {
    private String code;

    public StreamError(String code) {
        this.code = code;
    }

    public String getCode() {
        return this.code;
    }

    public String toString() {
        StringBuilder txt = new StringBuilder();
        txt.append("stream:error (").append(this.code).append(")");
        return txt.toString();
    }
}
