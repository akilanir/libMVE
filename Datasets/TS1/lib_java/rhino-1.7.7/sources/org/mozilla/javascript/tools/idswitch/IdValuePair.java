package org.mozilla.javascript.tools.idswitch;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/idswitch/IdValuePair.class */
public class IdValuePair {
    public final int idLength;
    public final String id;
    public final String value;
    private int lineNumber;

    public IdValuePair(String id, String value) {
        this.idLength = id.length();
        this.id = id;
        this.value = value;
    }

    public int getLineNumber() {
        return this.lineNumber;
    }

    public void setLineNumber(int value) {
        this.lineNumber = value;
    }
}
