package org.apache.commons.digester.plugins;

import java.util.Properties;
import org.apache.commons.digester.Digester;
import org.apache.commons.logging.Log;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/plugins/Declaration.class */
public class Declaration {
    private Class pluginClass;
    private String pluginClassName;
    private String id;
    private Properties properties;
    private boolean initialized;
    private RuleLoader ruleLoader;

    public Declaration(String pluginClassName) {
        this.properties = new Properties();
        this.initialized = false;
        this.ruleLoader = null;
        this.pluginClassName = pluginClassName;
    }

    public Declaration(Class pluginClass) {
        this.properties = new Properties();
        this.initialized = false;
        this.ruleLoader = null;
        this.pluginClass = pluginClass;
        this.pluginClassName = pluginClass.getName();
    }

    public Declaration(Class pluginClass, RuleLoader ruleLoader) {
        this.properties = new Properties();
        this.initialized = false;
        this.ruleLoader = null;
        this.pluginClass = pluginClass;
        this.pluginClassName = pluginClass.getName();
        this.ruleLoader = ruleLoader;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getId() {
        return this.id;
    }

    public void setProperties(Properties p) {
        this.properties.putAll(p);
    }

    public Class getPluginClass() {
        return this.pluginClass;
    }

    public void init(Digester digester, PluginManager pm) throws PluginException {
        Log log = digester.getLogger();
        boolean debug = log.isDebugEnabled();
        if (debug) {
            log.debug("init being called!");
        }
        if (this.initialized) {
            throw new PluginAssertionFailure("Init called multiple times.");
        }
        if (this.pluginClass == null && this.pluginClassName != null) {
            try {
                this.pluginClass = digester.getClassLoader().loadClass(this.pluginClassName);
            } catch (ClassNotFoundException cnfe) {
                throw new PluginException(new StringBuffer().append("Unable to load class ").append(this.pluginClassName).toString(), cnfe);
            }
        }
        if (this.ruleLoader == null) {
            log.debug("Searching for ruleloader...");
            this.ruleLoader = pm.findLoader(digester, this.id, this.pluginClass, this.properties);
        } else {
            log.debug("This declaration has an explicit ruleLoader.");
        }
        if (debug) {
            if (this.ruleLoader == null) {
                log.debug(new StringBuffer().append("No ruleLoader found for plugin declaration id [").append(this.id).append("]").append(", class [").append(this.pluginClass.getClass().getName()).append("].").toString());
            } else {
                log.debug(new StringBuffer().append("RuleLoader of type [").append(this.ruleLoader.getClass().getName()).append("] associated with plugin declaration").append(" id [").append(this.id).append("]").append(", class [").append(this.pluginClass.getClass().getName()).append("].").toString());
            }
        }
        this.initialized = true;
    }

    public void configure(Digester digester, String pattern) throws PluginException {
        Log log = digester.getLogger();
        boolean debug = log.isDebugEnabled();
        if (debug) {
            log.debug("configure being called!");
        }
        if (!this.initialized) {
            throw new PluginAssertionFailure("Not initialized.");
        }
        if (this.ruleLoader != null) {
            this.ruleLoader.addRules(digester, pattern);
        }
    }
}
