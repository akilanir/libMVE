package ch.qos.logback.core.joran.action;

import ch.qos.logback.core.joran.spi.ElementPath;
import ch.qos.logback.core.joran.spi.InterpretationContext;
import ch.qos.logback.core.joran.spi.NoAutoStartUtil;
import ch.qos.logback.core.joran.util.PropertySetter;
import ch.qos.logback.core.net.SyslogConstants;
import ch.qos.logback.core.spi.ContextAware;
import ch.qos.logback.core.spi.LifeCycle;
import ch.qos.logback.core.util.AggregationType;
import ch.qos.logback.core.util.Loader;
import ch.qos.logback.core.util.OptionHelper;
import java.util.Stack;
import org.xml.sax.Attributes;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/joran/action/NestedComplexPropertyIA.class */
public class NestedComplexPropertyIA extends ImplicitAction {
    Stack<IADataForComplexProperty> actionDataStack = new Stack<>();

    /* renamed from: ch.qos.logback.core.joran.action.NestedComplexPropertyIA$1, reason: invalid class name */
    /* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/joran/action/NestedComplexPropertyIA$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$ch$qos$logback$core$util$AggregationType = new int[AggregationType.values().length];

        static {
            try {
                $SwitchMap$ch$qos$logback$core$util$AggregationType[AggregationType.NOT_FOUND.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$ch$qos$logback$core$util$AggregationType[AggregationType.AS_BASIC_PROPERTY.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$ch$qos$logback$core$util$AggregationType[AggregationType.AS_BASIC_PROPERTY_COLLECTION.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$ch$qos$logback$core$util$AggregationType[AggregationType.AS_COMPLEX_PROPERTY_COLLECTION.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$ch$qos$logback$core$util$AggregationType[AggregationType.AS_COMPLEX_PROPERTY.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
        }
    }

    @Override // ch.qos.logback.core.joran.action.ImplicitAction
    public boolean isApplicable(ElementPath elementPath, Attributes attributes, InterpretationContext interpretationContext) {
        String peekLast = elementPath.peekLast();
        if (interpretationContext.isEmpty()) {
            return false;
        }
        PropertySetter propertySetter = new PropertySetter(interpretationContext.peekObject());
        propertySetter.setContext(this.context);
        AggregationType computeAggregationType = propertySetter.computeAggregationType(peekLast);
        switch (AnonymousClass1.$SwitchMap$ch$qos$logback$core$util$AggregationType[computeAggregationType.ordinal()]) {
            case 1:
            case 2:
            case SyslogConstants.ERROR_SEVERITY /* 3 */:
                return false;
            case 4:
            case SyslogConstants.NOTICE_SEVERITY /* 5 */:
                this.actionDataStack.push(new IADataForComplexProperty(propertySetter, computeAggregationType, peekLast));
                return true;
            default:
                addError("PropertySetter.computeAggregationType returned " + computeAggregationType);
                return false;
        }
    }

    @Override // ch.qos.logback.core.joran.action.Action
    public void begin(InterpretationContext interpretationContext, String str, Attributes attributes) {
        IADataForComplexProperty peek = this.actionDataStack.peek();
        String subst = interpretationContext.subst(attributes.getValue(Action.CLASS_ATTRIBUTE));
        try {
            Class<?> loadClass = !OptionHelper.isEmpty(subst) ? Loader.loadClass(subst, this.context) : peek.parentBean.getClassNameViaImplicitRules(peek.getComplexPropertyName(), peek.getAggregationType(), interpretationContext.getDefaultNestedComponentRegistry());
            if (loadClass == null) {
                peek.inError = true;
                addError("Could not find an appropriate class for property [" + str + "]");
                return;
            }
            if (OptionHelper.isEmpty(subst)) {
                addInfo("Assuming default type [" + loadClass.getName() + "] for [" + str + "] property");
            }
            peek.setNestedComplexProperty(loadClass.newInstance());
            if (peek.getNestedComplexProperty() instanceof ContextAware) {
                ((ContextAware) peek.getNestedComplexProperty()).setContext(this.context);
            }
            interpretationContext.pushObject(peek.getNestedComplexProperty());
        } catch (Exception e) {
            peek.inError = true;
            addError("Could not create component [" + str + "] of type [" + subst + "]", e);
        }
    }

    @Override // ch.qos.logback.core.joran.action.Action
    public void end(InterpretationContext interpretationContext, String str) {
        IADataForComplexProperty pop = this.actionDataStack.pop();
        if (pop.inError) {
        }
        PropertySetter propertySetter = new PropertySetter(pop.getNestedComplexProperty());
        propertySetter.setContext(this.context);
        if (propertySetter.computeAggregationType("parent") == AggregationType.AS_COMPLEX_PROPERTY) {
            propertySetter.setComplexProperty("parent", pop.parentBean.getObj());
        }
        Object nestedComplexProperty = pop.getNestedComplexProperty();
        if ((nestedComplexProperty instanceof LifeCycle) && NoAutoStartUtil.notMarkedWithNoAutoStart(nestedComplexProperty)) {
            ((LifeCycle) nestedComplexProperty).start();
        }
        if (interpretationContext.peekObject() != pop.getNestedComplexProperty()) {
            addError("The object on the top the of the stack is not the component pushed earlier.");
            return;
        }
        interpretationContext.popObject();
        switch (AnonymousClass1.$SwitchMap$ch$qos$logback$core$util$AggregationType[pop.aggregationType.ordinal()]) {
            case 4:
                pop.parentBean.addComplexProperty(str, pop.getNestedComplexProperty());
                break;
            case SyslogConstants.NOTICE_SEVERITY /* 5 */:
                pop.parentBean.setComplexProperty(str, pop.getNestedComplexProperty());
                break;
        }
    }
}
