package ch.qos.logback.core.pattern;

import java.util.List;
import java.util.regex.Pattern;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/pattern/ReplacingCompositeConverter.class */
public class ReplacingCompositeConverter<E> extends CompositeConverter<E> {
    Pattern pattern;
    String regex;
    String replacement;

    @Override // ch.qos.logback.core.pattern.DynamicConverter, ch.qos.logback.core.spi.LifeCycle
    public void start() {
        List<String> optionList = getOptionList();
        if (optionList == null) {
            addError("at least two options are expected whereas you have declared none");
            return;
        }
        int size = optionList.size();
        if (size < 2) {
            addError("at least two options are expected whereas you have declared only " + size + "as [" + optionList + "]");
            return;
        }
        this.regex = optionList.get(0);
        this.pattern = Pattern.compile(this.regex);
        this.replacement = optionList.get(1);
        super.start();
    }

    @Override // ch.qos.logback.core.pattern.CompositeConverter
    protected String transform(E e, String str) {
        return !this.started ? str : this.pattern.matcher(str).replaceAll(this.replacement);
    }
}
