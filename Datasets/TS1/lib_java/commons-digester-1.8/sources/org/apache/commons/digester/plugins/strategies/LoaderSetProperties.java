package org.apache.commons.digester.plugins.strategies;

import org.apache.commons.digester.Digester;
import org.apache.commons.digester.plugins.RuleLoader;
import org.apache.commons.logging.Log;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/plugins/strategies/LoaderSetProperties.class */
public class LoaderSetProperties extends RuleLoader {
    @Override // org.apache.commons.digester.plugins.RuleLoader
    public void addRules(Digester digester, String path) {
        Log log = digester.getLogger();
        boolean debug = log.isDebugEnabled();
        if (debug) {
            log.debug(new StringBuffer().append("LoaderSetProperties loading rules for plugin at path [").append(path).append("]").toString());
        }
        digester.addSetProperties(path);
    }
}
