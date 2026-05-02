package org.apache.commons.digester.plugins;

import org.apache.commons.digester.Digester;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/plugins/RuleLoader.class */
public abstract class RuleLoader {
    public abstract void addRules(Digester digester, String str) throws PluginException;
}
