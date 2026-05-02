package ch.qos.logback.core.joran.action;

import ch.qos.logback.core.joran.spi.InterpretationContext;
import ch.qos.logback.core.net.SyslogConstants;
import ch.qos.logback.core.util.ContextUtil;
import ch.qos.logback.core.util.OptionHelper;
import java.util.Properties;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/joran/action/ActionUtil.class */
public class ActionUtil {

    /* renamed from: ch.qos.logback.core.joran.action.ActionUtil$1, reason: invalid class name */
    /* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/joran/action/ActionUtil$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$ch$qos$logback$core$joran$action$ActionUtil$Scope = new int[Scope.values().length];

        static {
            try {
                $SwitchMap$ch$qos$logback$core$joran$action$ActionUtil$Scope[Scope.LOCAL.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$ch$qos$logback$core$joran$action$ActionUtil$Scope[Scope.CONTEXT.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$ch$qos$logback$core$joran$action$ActionUtil$Scope[Scope.SYSTEM.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
        }
    }

    /* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/joran/action/ActionUtil$Scope.class */
    public enum Scope {
        LOCAL,
        CONTEXT,
        SYSTEM
    }

    public static Scope stringToScope(String str) {
        return Scope.SYSTEM.toString().equalsIgnoreCase(str) ? Scope.SYSTEM : Scope.CONTEXT.toString().equalsIgnoreCase(str) ? Scope.CONTEXT : Scope.LOCAL;
    }

    public static void setProperty(InterpretationContext interpretationContext, String str, String str2, Scope scope) {
        switch (AnonymousClass1.$SwitchMap$ch$qos$logback$core$joran$action$ActionUtil$Scope[scope.ordinal()]) {
            case 1:
                interpretationContext.addSubstitutionProperty(str, str2);
                break;
            case 2:
                interpretationContext.getContext().putProperty(str, str2);
                break;
            case SyslogConstants.ERROR_SEVERITY /* 3 */:
                OptionHelper.setSystemProperty(interpretationContext, str, str2);
                break;
        }
    }

    public static void setProperties(InterpretationContext interpretationContext, Properties properties, Scope scope) {
        switch (AnonymousClass1.$SwitchMap$ch$qos$logback$core$joran$action$ActionUtil$Scope[scope.ordinal()]) {
            case 1:
                interpretationContext.addSubstitutionProperties(properties);
                break;
            case 2:
                new ContextUtil(interpretationContext.getContext()).addProperties(properties);
                break;
            case SyslogConstants.ERROR_SEVERITY /* 3 */:
                OptionHelper.setSystemProperties(interpretationContext, properties);
                break;
        }
    }
}
