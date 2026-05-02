package ch.qos.logback.classic.util;

import ch.qos.logback.classic.ClassicConstants;
import ch.qos.logback.classic.LoggerContext;
import ch.qos.logback.classic.selector.ContextSelector;
import ch.qos.logback.classic.selector.DefaultContextSelector;
import ch.qos.logback.core.util.Loader;
import ch.qos.logback.core.util.OptionHelper;
import java.lang.reflect.InvocationTargetException;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/util/ContextSelectorStaticBinder.class */
public class ContextSelectorStaticBinder {
    static ContextSelectorStaticBinder singleton = new ContextSelectorStaticBinder();
    ContextSelector contextSelector;
    Object key;

    public static ContextSelectorStaticBinder getSingleton() {
        return singleton;
    }

    public void init(LoggerContext loggerContext, Object obj) throws ClassNotFoundException, NoSuchMethodException, InstantiationException, IllegalAccessException, InvocationTargetException {
        if (this.key == null) {
            this.key = obj;
        } else if (this.key != obj) {
            throw new IllegalAccessException("Only certain classes can access this method.");
        }
        String systemProperty = OptionHelper.getSystemProperty(ClassicConstants.LOGBACK_CONTEXT_SELECTOR);
        if (systemProperty == null) {
            this.contextSelector = new DefaultContextSelector(loggerContext);
        } else {
            if (systemProperty.equals("JNDI")) {
                throw new RuntimeException("JNDI not supported");
            }
            this.contextSelector = dynamicalContextSelector(loggerContext, systemProperty);
        }
    }

    static ContextSelector dynamicalContextSelector(LoggerContext loggerContext, String str) throws ClassNotFoundException, SecurityException, NoSuchMethodException, IllegalArgumentException, InstantiationException, IllegalAccessException, InvocationTargetException {
        return (ContextSelector) Loader.loadClass(str).getConstructor(LoggerContext.class).newInstance(loggerContext);
    }

    public ContextSelector getContextSelector() {
        return this.contextSelector;
    }
}
