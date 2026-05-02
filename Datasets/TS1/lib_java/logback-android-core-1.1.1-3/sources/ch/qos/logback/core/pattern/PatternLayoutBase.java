package ch.qos.logback.core.pattern;

import ch.qos.logback.core.Context;
import ch.qos.logback.core.CoreConstants;
import ch.qos.logback.core.LayoutBase;
import ch.qos.logback.core.pattern.parser.Parser;
import ch.qos.logback.core.spi.ScanException;
import ch.qos.logback.core.status.ErrorStatus;
import java.util.HashMap;
import java.util.Map;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/pattern/PatternLayoutBase.class */
public abstract class PatternLayoutBase<E> extends LayoutBase<E> {
    Converter<E> head;
    String pattern;
    protected PostCompileProcessor<E> postCompileProcessor;
    Map<String, String> instanceConverterMap = new HashMap();
    protected boolean outputPatternAsHeader = false;

    public abstract Map<String, String> getDefaultConverterMap();

    public Map<String, String> getEffectiveConverterMap() {
        Map map;
        HashMap hashMap = new HashMap();
        Map<String, String> defaultConverterMap = getDefaultConverterMap();
        if (defaultConverterMap != null) {
            hashMap.putAll(defaultConverterMap);
        }
        Context context = getContext();
        if (context != null && (map = (Map) context.getObject(CoreConstants.PATTERN_RULE_REGISTRY)) != null) {
            hashMap.putAll(map);
        }
        hashMap.putAll(this.instanceConverterMap);
        return hashMap;
    }

    @Override // ch.qos.logback.core.LayoutBase, ch.qos.logback.core.spi.LifeCycle
    public void start() {
        if (this.pattern == null || this.pattern.length() == 0) {
            addError("Empty or null pattern.");
            return;
        }
        try {
            Parser parser = new Parser(this.pattern);
            if (getContext() != null) {
                parser.setContext(getContext());
            }
            this.head = parser.compile(parser.parse(), getEffectiveConverterMap());
            if (this.postCompileProcessor != null) {
                this.postCompileProcessor.process(this.head);
            }
            ConverterUtil.setContextForConverters(getContext(), this.head);
            ConverterUtil.startConverters(this.head);
            super.start();
        } catch (ScanException e) {
            getContext().getStatusManager().add(new ErrorStatus("Failed to parse pattern \"" + getPattern() + "\".", this, e));
        }
    }

    public void setPostCompileProcessor(PostCompileProcessor<E> postCompileProcessor) {
        this.postCompileProcessor = postCompileProcessor;
    }

    protected void setContextForConverters(Converter<E> converter) {
        ConverterUtil.setContextForConverters(getContext(), converter);
    }

    protected String writeLoopOnConverters(E e) {
        StringBuilder sb = new StringBuilder(128);
        Converter<E> converter = this.head;
        while (true) {
            Converter<E> converter2 = converter;
            if (converter2 == null) {
                return sb.toString();
            }
            converter2.write(sb, e);
            converter = converter2.getNext();
        }
    }

    public String getPattern() {
        return this.pattern;
    }

    public void setPattern(String str) {
        this.pattern = str;
    }

    public String toString() {
        return getClass().getName() + "(\"" + getPattern() + "\")";
    }

    public Map<String, String> getInstanceConverterMap() {
        return this.instanceConverterMap;
    }

    protected String getPresentationHeaderPrefix() {
        return CoreConstants.EMPTY_STRING;
    }

    public boolean isOutputPatternAsHeader() {
        return this.outputPatternAsHeader;
    }

    public void setOutputPatternAsHeader(boolean z) {
        this.outputPatternAsHeader = z;
    }

    @Override // ch.qos.logback.core.LayoutBase, ch.qos.logback.core.Layout
    public String getPresentationHeader() {
        return this.outputPatternAsHeader ? getPresentationHeaderPrefix() + this.pattern : super.getPresentationHeader();
    }
}
