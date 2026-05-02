package org.apache.commons.digester.plugins;

import java.util.Properties;
import org.apache.commons.digester.Digester;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/plugins/RuleFinder.class */
public abstract class RuleFinder {
    public abstract RuleLoader findLoader(Digester digester, Class cls, Properties properties) throws PluginException;
}
