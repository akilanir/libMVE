package org.apache.commons.digester.plugins.strategies;

import java.util.Properties;
import org.apache.commons.digester.Digester;
import org.apache.commons.digester.plugins.PluginException;
import org.apache.commons.digester.plugins.RuleFinder;
import org.apache.commons.digester.plugins.RuleLoader;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/plugins/strategies/FinderFromClass.class */
public class FinderFromClass extends RuleFinder {
    public static String DFLT_RULECLASS_ATTR = "ruleclass";
    public static String DFLT_METHOD_ATTR = "method";
    public static String DFLT_METHOD_NAME = "addRules";
    private String ruleClassAttr;
    private String methodAttr;
    private String dfltMethodName;

    public FinderFromClass() {
        this(DFLT_RULECLASS_ATTR, DFLT_METHOD_ATTR, DFLT_METHOD_NAME);
    }

    public FinderFromClass(String ruleClassAttr, String methodAttr, String dfltMethodName) {
        this.ruleClassAttr = ruleClassAttr;
        this.methodAttr = methodAttr;
        this.dfltMethodName = dfltMethodName;
    }

    @Override // org.apache.commons.digester.plugins.RuleFinder
    public RuleLoader findLoader(Digester digester, Class pluginClass, Properties p) throws PluginException {
        String ruleClassName = p.getProperty(this.ruleClassAttr);
        if (ruleClassName == null) {
            return null;
        }
        String methodName = null;
        if (this.methodAttr != null) {
            methodName = p.getProperty(this.methodAttr);
        }
        if (methodName == null) {
            methodName = this.dfltMethodName;
        }
        if (methodName == null) {
            methodName = DFLT_METHOD_NAME;
        }
        try {
            Class ruleClass = digester.getClassLoader().loadClass(ruleClassName);
            return new LoaderFromClass(ruleClass, methodName);
        } catch (ClassNotFoundException cnfe) {
            throw new PluginException(new StringBuffer().append("Unable to load class ").append(ruleClassName).toString(), cnfe);
        }
    }
}
