package org.apache.commons.digester.plugins.strategies;

import java.util.Properties;
import org.apache.commons.digester.Digester;
import org.apache.commons.digester.plugins.RuleFinder;
import org.apache.commons.digester.plugins.RuleLoader;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/plugins/strategies/FinderSetProperties.class */
public class FinderSetProperties extends RuleFinder {
    public static String DFLT_PROPS_ATTR = "setprops";
    public static String DFLT_FALSEVAL = "false";
    private String propsAttr;
    private String falseval;

    public FinderSetProperties() {
        this(DFLT_PROPS_ATTR, DFLT_FALSEVAL);
    }

    public FinderSetProperties(String propsAttr, String falseval) {
        this.propsAttr = propsAttr;
        this.falseval = falseval;
    }

    @Override // org.apache.commons.digester.plugins.RuleFinder
    public RuleLoader findLoader(Digester d, Class pluginClass, Properties p) {
        String state = p.getProperty(this.propsAttr);
        if (state != null && state.equals(this.falseval)) {
            return null;
        }
        return new LoaderSetProperties();
    }
}
