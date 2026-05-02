package org.apache.james.mime4j.stream;

/* loaded from: apache-mime4j-core-0.7.2.jar:org/apache/james/mime4j/stream/MimeConfig.class */
public final class MimeConfig implements Cloneable {
    private boolean strictParsing = false;
    private boolean countLineNumbers = false;
    private boolean malformedHeaderStartsBody = false;
    private int maxLineLen = 1000;
    private int maxHeaderCount = 1000;
    private int maxHeaderLen = 10000;
    private long maxContentLen = -1;
    private String headlessParsing = null;

    public boolean isMalformedHeaderStartsBody() {
        return this.malformedHeaderStartsBody;
    }

    public void setMalformedHeaderStartsBody(boolean malformedHeaderStartsBody) {
        this.malformedHeaderStartsBody = malformedHeaderStartsBody;
    }

    public boolean isStrictParsing() {
        return this.strictParsing;
    }

    public void setStrictParsing(boolean strictParsing) {
        this.strictParsing = strictParsing;
    }

    public int getMaxLineLen() {
        return this.maxLineLen;
    }

    public void setMaxLineLen(int maxLineLen) {
        this.maxLineLen = maxLineLen;
    }

    public int getMaxHeaderCount() {
        return this.maxHeaderCount;
    }

    public void setMaxHeaderCount(int maxHeaderCount) {
        this.maxHeaderCount = maxHeaderCount;
    }

    public int getMaxHeaderLen() {
        return this.maxHeaderLen;
    }

    public void setMaxHeaderLen(int maxHeaderLen) {
        this.maxHeaderLen = maxHeaderLen;
    }

    public long getMaxContentLen() {
        return this.maxContentLen;
    }

    public void setMaxContentLen(long maxContentLen) {
        this.maxContentLen = maxContentLen;
    }

    public boolean isCountLineNumbers() {
        return this.countLineNumbers;
    }

    public void setCountLineNumbers(boolean countLineNumbers) {
        this.countLineNumbers = countLineNumbers;
    }

    public String getHeadlessParsing() {
        return this.headlessParsing;
    }

    public void setHeadlessParsing(String contentType) {
        this.headlessParsing = contentType;
    }

    /* renamed from: clone, reason: merged with bridge method [inline-methods] */
    public MimeConfig m12clone() {
        try {
            return (MimeConfig) super.clone();
        } catch (CloneNotSupportedException e) {
            throw new InternalError();
        }
    }

    public String toString() {
        return "[strict parsing: " + this.strictParsing + ", max line length: " + this.maxLineLen + ", max header count: " + this.maxHeaderCount + ", max content length: " + this.maxContentLen + ", count line numbers: " + this.countLineNumbers + "]";
    }
}
