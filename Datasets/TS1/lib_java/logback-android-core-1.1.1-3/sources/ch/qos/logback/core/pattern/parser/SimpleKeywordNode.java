package ch.qos.logback.core.pattern.parser;

import java.util.List;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/pattern/parser/SimpleKeywordNode.class */
public class SimpleKeywordNode extends FormattingNode {
    List<String> optionList;

    SimpleKeywordNode(Object obj) {
        super(1, obj);
    }

    protected SimpleKeywordNode(int i, Object obj) {
        super(i, obj);
    }

    public List<String> getOptions() {
        return this.optionList;
    }

    public void setOptions(List<String> list) {
        this.optionList = list;
    }

    @Override // ch.qos.logback.core.pattern.parser.FormattingNode, ch.qos.logback.core.pattern.parser.Node
    public boolean equals(Object obj) {
        if (!super.equals(obj) || !(obj instanceof SimpleKeywordNode)) {
            return false;
        }
        SimpleKeywordNode simpleKeywordNode = (SimpleKeywordNode) obj;
        return this.optionList != null ? this.optionList.equals(simpleKeywordNode.optionList) : simpleKeywordNode.optionList == null;
    }

    @Override // ch.qos.logback.core.pattern.parser.FormattingNode, ch.qos.logback.core.pattern.parser.Node
    public int hashCode() {
        return super.hashCode();
    }

    @Override // ch.qos.logback.core.pattern.parser.Node
    public String toString() {
        StringBuffer stringBuffer = new StringBuffer();
        if (this.optionList == null) {
            stringBuffer.append("KeyWord(" + this.value + "," + this.formatInfo + ")");
        } else {
            stringBuffer.append("KeyWord(" + this.value + ", " + this.formatInfo + "," + this.optionList + ")");
        }
        stringBuffer.append(printNext());
        return stringBuffer.toString();
    }
}
