package ch.qos.logback.core.pattern.parser;

import ch.qos.logback.core.pattern.FormatInfo;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/pattern/parser/FormattingNode.class */
public class FormattingNode extends Node {
    FormatInfo formatInfo;

    FormattingNode(int i) {
        super(i);
    }

    FormattingNode(int i, Object obj) {
        super(i, obj);
    }

    public FormatInfo getFormatInfo() {
        return this.formatInfo;
    }

    public void setFormatInfo(FormatInfo formatInfo) {
        this.formatInfo = formatInfo;
    }

    @Override // ch.qos.logback.core.pattern.parser.Node
    public boolean equals(Object obj) {
        if (!super.equals(obj) || !(obj instanceof FormattingNode)) {
            return false;
        }
        FormattingNode formattingNode = (FormattingNode) obj;
        return this.formatInfo != null ? this.formatInfo.equals(formattingNode.formatInfo) : formattingNode.formatInfo == null;
    }

    @Override // ch.qos.logback.core.pattern.parser.Node
    public int hashCode() {
        return (31 * super.hashCode()) + (this.formatInfo != null ? this.formatInfo.hashCode() : 0);
    }
}
