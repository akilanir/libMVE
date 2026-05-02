package org.apache.commons.digester.plugins;

import org.apache.commons.digester.Digester;
import org.apache.commons.digester.Rules;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/plugins/RulesFactory.class */
public abstract class RulesFactory {
    public abstract Rules newRules(Digester digester, Class cls) throws PluginException;
}
