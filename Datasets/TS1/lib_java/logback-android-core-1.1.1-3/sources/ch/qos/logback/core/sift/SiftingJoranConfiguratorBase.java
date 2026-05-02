package ch.qos.logback.core.sift;

import ch.qos.logback.core.Appender;
import ch.qos.logback.core.joran.GenericConfigurator;
import ch.qos.logback.core.joran.action.DefinePropertyAction;
import ch.qos.logback.core.joran.action.NestedBasicPropertyIA;
import ch.qos.logback.core.joran.action.NestedComplexPropertyIA;
import ch.qos.logback.core.joran.action.PropertyAction;
import ch.qos.logback.core.joran.action.TimestampAction;
import ch.qos.logback.core.joran.event.SaxEvent;
import ch.qos.logback.core.joran.spi.ElementSelector;
import ch.qos.logback.core.joran.spi.Interpreter;
import ch.qos.logback.core.joran.spi.JoranException;
import ch.qos.logback.core.joran.spi.RuleStore;
import java.util.List;
import java.util.Map;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/sift/SiftingJoranConfiguratorBase.class */
public abstract class SiftingJoranConfiguratorBase<E> extends GenericConfigurator {
    protected final String key;
    protected final String value;
    protected final Map<String, String> parentPropertyMap;
    static final String ONE_AND_ONLY_ONE_URL = "http://logback.qos.ch/codes.html#1andOnly1";
    int errorEmmissionCount = 0;

    protected SiftingJoranConfiguratorBase(String str, String str2, Map<String, String> map) {
        this.key = str;
        this.value = str2;
        this.parentPropertyMap = map;
    }

    @Override // ch.qos.logback.core.joran.GenericConfigurator
    protected void addImplicitRules(Interpreter interpreter) {
        NestedComplexPropertyIA nestedComplexPropertyIA = new NestedComplexPropertyIA();
        nestedComplexPropertyIA.setContext(this.context);
        interpreter.addImplicitAction(nestedComplexPropertyIA);
        NestedBasicPropertyIA nestedBasicPropertyIA = new NestedBasicPropertyIA();
        nestedBasicPropertyIA.setContext(this.context);
        interpreter.addImplicitAction(nestedBasicPropertyIA);
    }

    @Override // ch.qos.logback.core.joran.GenericConfigurator
    protected void addInstanceRules(RuleStore ruleStore) {
        ruleStore.addRule(new ElementSelector("configuration/property"), new PropertyAction());
        ruleStore.addRule(new ElementSelector("configuration/timestamp"), new TimestampAction());
        ruleStore.addRule(new ElementSelector("configuration/define"), new DefinePropertyAction());
    }

    public abstract Appender<E> getAppender();

    protected void oneAndOnlyOneCheck(Map<?, ?> map) {
        String str = null;
        if (map.size() == 0) {
            this.errorEmmissionCount++;
            str = "No nested appenders found within the <sift> element in SiftingAppender.";
        } else if (map.size() > 1) {
            this.errorEmmissionCount++;
            str = "Only and only one appender can be nested the <sift> element in SiftingAppender. See also http://logback.qos.ch/codes.html#1andOnly1";
        }
        if (str == null || this.errorEmmissionCount >= 4) {
            return;
        }
        addError(str);
    }

    @Override // ch.qos.logback.core.joran.GenericConfigurator
    public void doConfigure(List<SaxEvent> list) throws JoranException {
        super.doConfigure(list);
    }

    public String toString() {
        return getClass().getName() + "{" + this.key + "=" + this.value + '}';
    }
}
