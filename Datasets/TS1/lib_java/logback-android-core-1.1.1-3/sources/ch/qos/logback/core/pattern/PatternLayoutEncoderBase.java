package ch.qos.logback.core.pattern;

import ch.qos.logback.core.Layout;
import ch.qos.logback.core.encoder.LayoutWrappingEncoder;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/pattern/PatternLayoutEncoderBase.class */
public class PatternLayoutEncoderBase<E> extends LayoutWrappingEncoder<E> {
    String pattern;
    protected boolean outputPatternAsHeader = false;

    public String getPattern() {
        return this.pattern;
    }

    public void setPattern(String str) {
        this.pattern = str;
    }

    public boolean isOutputPatternAsHeader() {
        return this.outputPatternAsHeader;
    }

    public void setOutputPatternAsHeader(boolean z) {
        this.outputPatternAsHeader = z;
    }

    public boolean isOutputPatternAsPresentationHeader() {
        return this.outputPatternAsHeader;
    }

    public void setOutputPatternAsPresentationHeader(boolean z) {
        addWarn("[outputPatternAsPresentationHeader] property is deprecated. Please use [outputPatternAsHeader] option instead.");
        this.outputPatternAsHeader = z;
    }

    @Override // ch.qos.logback.core.encoder.LayoutWrappingEncoder
    public void setLayout(Layout<E> layout) {
        throw new UnsupportedOperationException("one cannot set the layout of " + getClass().getName());
    }
}
