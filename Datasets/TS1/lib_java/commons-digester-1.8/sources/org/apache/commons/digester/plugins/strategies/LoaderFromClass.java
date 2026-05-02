package org.apache.commons.digester.plugins.strategies;

import java.lang.reflect.Method;
import org.apache.commons.beanutils.MethodUtils;
import org.apache.commons.digester.Digester;
import org.apache.commons.digester.plugins.PluginException;
import org.apache.commons.digester.plugins.RuleLoader;
import org.apache.commons.logging.Log;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/plugins/strategies/LoaderFromClass.class */
public class LoaderFromClass extends RuleLoader {
    private Class rulesClass;
    private Method rulesMethod;
    static Class class$org$apache$commons$digester$Digester;
    static Class class$java$lang$String;

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    public LoaderFromClass(Class rulesClass, Method rulesMethod) {
        this.rulesClass = rulesClass;
        this.rulesMethod = rulesMethod;
    }

    public LoaderFromClass(Class rulesClass, String methodName) throws PluginException {
        Method method = locateMethod(rulesClass, methodName);
        if (method == null) {
            throw new PluginException(new StringBuffer().append("rule class ").append(rulesClass.getName()).append(" does not have method ").append(methodName).append(" or that method has an invalid signature.").toString());
        }
        this.rulesClass = rulesClass;
        this.rulesMethod = method;
    }

    @Override // org.apache.commons.digester.plugins.RuleLoader
    public void addRules(Digester d, String path) throws PluginException {
        Log log = d.getLogger();
        boolean debug = log.isDebugEnabled();
        if (debug) {
            log.debug(new StringBuffer().append("LoaderFromClass loading rules for plugin at path [").append(path).append("]").toString());
        }
        try {
            Object[] params = {d, path};
            this.rulesMethod.invoke(null, params);
        } catch (Exception e) {
            throw new PluginException(new StringBuffer().append("Unable to invoke rules method ").append(this.rulesMethod).append(" on rules class ").append(this.rulesClass).toString(), e);
        }
    }

    public static Method locateMethod(Class rulesClass, String methodName) throws PluginException {
        Class cls;
        Class cls2;
        Class[] paramSpec = new Class[2];
        if (class$org$apache$commons$digester$Digester == null) {
            cls = class$("org.apache.commons.digester.Digester");
            class$org$apache$commons$digester$Digester = cls;
        } else {
            cls = class$org$apache$commons$digester$Digester;
        }
        paramSpec[0] = cls;
        if (class$java$lang$String == null) {
            cls2 = class$("java.lang.String");
            class$java$lang$String = cls2;
        } else {
            cls2 = class$java$lang$String;
        }
        paramSpec[1] = cls2;
        Method rulesMethod = MethodUtils.getAccessibleMethod(rulesClass, methodName, paramSpec);
        return rulesMethod;
    }
}
