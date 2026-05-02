package ch.qos.logback.core.rolling.helper;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/rolling/helper/TokenConverter.class */
public class TokenConverter {
    static final int IDENTITY = 0;
    static final int INTEGER = 1;
    static final int DATE = 1;
    int type;
    TokenConverter next;

    protected TokenConverter(int i) {
        this.type = i;
    }

    public TokenConverter getNext() {
        return this.next;
    }

    public void setNext(TokenConverter tokenConverter) {
        this.next = tokenConverter;
    }

    public int getType() {
        return this.type;
    }

    public void setType(int i) {
        this.type = i;
    }
}
