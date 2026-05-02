package ch.qos.logback.core.joran.action;

import ch.qos.logback.core.joran.spi.ElementPath;
import ch.qos.logback.core.joran.spi.InterpretationContext;
import ch.qos.logback.core.joran.util.PropertySetter;
import ch.qos.logback.core.net.SyslogConstants;
import ch.qos.logback.core.util.AggregationType;
import java.util.Stack;
import org.xml.sax.Attributes;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/joran/action/NestedBasicPropertyIA.class */
public class NestedBasicPropertyIA extends ImplicitAction {
    Stack<IADataForBasicProperty> actionDataStack = new Stack<>();

    /* renamed from: ch.qos.logback.core.joran.action.NestedBasicPropertyIA$1, reason: invalid class name */
    /* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/joran/action/NestedBasicPropertyIA$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$ch$qos$logback$core$util$AggregationType = new int[AggregationType.values().length];

        static {
            try {
                $SwitchMap$ch$qos$logback$core$util$AggregationType[AggregationType.NOT_FOUND.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$ch$qos$logback$core$util$AggregationType[AggregationType.AS_COMPLEX_PROPERTY.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$ch$qos$logback$core$util$AggregationType[AggregationType.AS_COMPLEX_PROPERTY_COLLECTION.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$ch$qos$logback$core$util$AggregationType[AggregationType.AS_BASIC_PROPERTY.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$ch$qos$logback$core$util$AggregationType[AggregationType.AS_BASIC_PROPERTY_COLLECTION.ordinal()] = 5;
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
                this.actionDataStack.push(new IADataForBasicProperty(propertySetter, computeAggregationType, peekLast));
                return true;
            default:
                addError("PropertySetter.canContainComponent returned " + computeAggregationType);
                return false;
        }
    }

    @Override // ch.qos.logback.core.joran.action.Action
    public void begin(InterpretationContext interpretationContext, String str, Attributes attributes) {
    }

    @Override // ch.qos.logback.core.joran.action.Action
    public void body(InterpretationContext interpretationContext, String str) {
        String subst = interpretationContext.subst(str);
        IADataForBasicProperty peek = this.actionDataStack.peek();
        switch (AnonymousClass1.$SwitchMap$ch$qos$logback$core$util$AggregationType[peek.aggregationType.ordinal()]) {
            case 4:
                peek.parentBean.setProperty(peek.propertyName, subst);
                break;
            case SyslogConstants.NOTICE_SEVERITY /* 5 */:
                peek.parentBean.addBasicProperty(peek.propertyName, subst);
                break;
        }
    }

    @Override // ch.qos.logback.core.joran.action.Action
    public void end(InterpretationContext interpretationContext, String str) {
        this.actionDataStack.pop();
    }
}
