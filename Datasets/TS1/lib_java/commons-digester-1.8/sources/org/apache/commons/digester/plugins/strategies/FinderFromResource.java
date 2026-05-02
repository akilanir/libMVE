package org.apache.commons.digester.plugins.strategies;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import org.apache.commons.digester.Digester;
import org.apache.commons.digester.plugins.PluginException;
import org.apache.commons.digester.plugins.RuleFinder;
import org.apache.commons.digester.plugins.RuleLoader;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/plugins/strategies/FinderFromResource.class */
public class FinderFromResource extends RuleFinder {
    public static String DFLT_RESOURCE_ATTR = "resource";
    private String resourceAttr;

    public FinderFromResource() {
        this(DFLT_RESOURCE_ATTR);
    }

    public FinderFromResource(String resourceAttr) {
        this.resourceAttr = resourceAttr;
    }

    @Override // org.apache.commons.digester.plugins.RuleFinder
    public RuleLoader findLoader(Digester d, Class pluginClass, Properties p) throws PluginException {
        String resourceName = p.getProperty(this.resourceAttr);
        if (resourceName == null) {
            return null;
        }
        InputStream is = pluginClass.getClassLoader().getResourceAsStream(resourceName);
        if (is == null) {
            throw new PluginException(new StringBuffer().append("Resource ").append(resourceName).append(" not found.").toString());
        }
        return loadRules(d, pluginClass, is, resourceName);
    }

    public static RuleLoader loadRules(Digester d, Class pluginClass, InputStream is, String resourceName) throws PluginException {
        try {
            try {
                try {
                    RuleLoader loader = new LoaderFromStream(is);
                    return loader;
                } catch (Exception e) {
                    throw new PluginException(new StringBuffer().append("Unable to load xmlrules from resource [").append(resourceName).append("]").toString(), e);
                }
            } catch (IOException ioe) {
                throw new PluginException(new StringBuffer().append("Unable to close stream for resource [").append(resourceName).append("]").toString(), ioe);
            }
        } finally {
            is.close();
        }
    }
}
