package ch.qos.logback.classic.sift;

import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.classic.util.DefaultNestedComponentRules;
import ch.qos.logback.core.Appender;
import ch.qos.logback.core.joran.action.AppenderAction;
import ch.qos.logback.core.joran.spi.DefaultNestedComponentRegistry;
import ch.qos.logback.core.joran.spi.ElementPath;
import ch.qos.logback.core.joran.spi.ElementSelector;
import ch.qos.logback.core.joran.spi.RuleStore;
import ch.qos.logback.core.sift.SiftingJoranConfiguratorBase;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/sift/SiftingJoranConfigurator.class */
public class SiftingJoranConfigurator extends SiftingJoranConfiguratorBase<ILoggingEvent> {
    SiftingJoranConfigurator(String str, String str2, Map<String, String> map) {
        super(str, str2, map);
    }

    protected ElementPath initialElementPath() {
        return new ElementPath("configuration");
    }

    protected void addInstanceRules(RuleStore ruleStore) {
        super.addInstanceRules(ruleStore);
        ruleStore.addRule(new ElementSelector("configuration/appender"), new AppenderAction());
    }

    protected void addDefaultNestedComponentRegistryRules(DefaultNestedComponentRegistry defaultNestedComponentRegistry) {
        DefaultNestedComponentRules.addDefaultNestedComponentRegistryRules(defaultNestedComponentRegistry);
    }

    protected void buildInterpreter() {
        super.buildInterpreter();
        Map objectMap = this.interpreter.getInterpretationContext().getObjectMap();
        objectMap.put("APPENDER_BAG", new HashMap());
        objectMap.put("FILTER_CHAIN_BAG", new HashMap());
        HashMap hashMap = new HashMap();
        hashMap.putAll(this.parentPropertyMap);
        hashMap.put(this.key, this.value);
        this.interpreter.setInterpretationContextPropertiesMap(hashMap);
    }

    public Appender<ILoggingEvent> getAppender() {
        HashMap hashMap = (HashMap) this.interpreter.getInterpretationContext().getObjectMap().get("APPENDER_BAG");
        oneAndOnlyOneCheck(hashMap);
        Collection values = hashMap.values();
        if (values.size() == 0) {
            return null;
        }
        return (Appender) values.iterator().next();
    }
}
