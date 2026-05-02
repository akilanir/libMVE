package org.apache.commons.digester.plugins;

import java.util.List;
import org.apache.commons.digester.Rule;
import org.apache.commons.logging.Log;
import org.xml.sax.Attributes;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/plugins/PluginCreateRule.class */
public class PluginCreateRule extends Rule implements InitializableRule {
    private String pluginClassAttrNs = null;
    private String pluginClassAttr = null;
    private String pluginIdAttrNs = null;
    private String pluginIdAttr = null;
    private String pattern;
    private Class baseClass;
    private Declaration defaultPlugin;
    private PluginConfigurationException initException;
    static Class class$java$lang$Object;

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    public PluginCreateRule(Class baseClass) {
        this.baseClass = null;
        this.baseClass = baseClass;
    }

    public PluginCreateRule(Class baseClass, Class dfltPluginClass) {
        this.baseClass = null;
        this.baseClass = baseClass;
        if (dfltPluginClass != null) {
            this.defaultPlugin = new Declaration(dfltPluginClass);
        }
    }

    public PluginCreateRule(Class baseClass, Class dfltPluginClass, RuleLoader dfltPluginRuleLoader) {
        this.baseClass = null;
        this.baseClass = baseClass;
        if (dfltPluginClass != null) {
            this.defaultPlugin = new Declaration(dfltPluginClass, dfltPluginRuleLoader);
        }
    }

    public void setPluginClassAttribute(String namespaceUri, String attrName) {
        this.pluginClassAttrNs = namespaceUri;
        this.pluginClassAttr = attrName;
    }

    public void setPluginIdAttribute(String namespaceUri, String attrName) {
        this.pluginIdAttrNs = namespaceUri;
        this.pluginIdAttr = attrName;
    }

    @Override // org.apache.commons.digester.plugins.InitializableRule
    public void postRegisterInit(String matchPattern) throws PluginConfigurationException {
        Class cls;
        Log log = LogUtils.getLogger(this.digester);
        boolean debug = log.isDebugEnabled();
        if (debug) {
            log.debug(new StringBuffer().append("PluginCreateRule.postRegisterInit: rule registered for pattern [").append(matchPattern).append("]").toString());
        }
        if (this.digester == null) {
            this.initException = new PluginConfigurationException("Invalid invocation of postRegisterInit: digester not set.");
            throw this.initException;
        }
        if (this.pattern != null) {
            this.initException = new PluginConfigurationException("A single PluginCreateRule instance has been mapped to multiple patterns; this is not supported.");
            throw this.initException;
        }
        if (matchPattern.indexOf(42) != -1) {
            this.initException = new PluginConfigurationException(new StringBuffer().append("A PluginCreateRule instance has been mapped to pattern [").append(matchPattern).append("].").append(" This pattern includes a wildcard character.").append(" This is not supported by the plugin architecture.").toString());
            throw this.initException;
        }
        if (this.baseClass == null) {
            if (class$java$lang$Object == null) {
                cls = class$("java.lang.Object");
                class$java$lang$Object = cls;
            } else {
                cls = class$java$lang$Object;
            }
            this.baseClass = cls;
        }
        PluginRules rules = (PluginRules) this.digester.getRules();
        PluginManager pm = rules.getPluginManager();
        if (this.defaultPlugin != null) {
            if (!this.baseClass.isAssignableFrom(this.defaultPlugin.getPluginClass())) {
                this.initException = new PluginConfigurationException(new StringBuffer().append("Default class [").append(this.defaultPlugin.getPluginClass().getName()).append("] does not inherit from [").append(this.baseClass.getName()).append("].").toString());
                throw this.initException;
            }
            try {
                this.defaultPlugin.init(this.digester, pm);
            } catch (PluginException pwe) {
                throw new PluginConfigurationException(pwe.getMessage(), pwe.getCause());
            }
        }
        this.pattern = matchPattern;
        if (this.pluginClassAttr == null) {
            this.pluginClassAttrNs = rules.getPluginClassAttrNs();
            this.pluginClassAttr = rules.getPluginClassAttr();
            if (debug) {
                log.debug(new StringBuffer().append("init: pluginClassAttr set to per-digester values [ns=").append(this.pluginClassAttrNs).append(", name=").append(this.pluginClassAttr).append("]").toString());
            }
        } else if (debug) {
            log.debug(new StringBuffer().append("init: pluginClassAttr set to rule-specific values [ns=").append(this.pluginClassAttrNs).append(", name=").append(this.pluginClassAttr).append("]").toString());
        }
        if (this.pluginIdAttr == null) {
            this.pluginIdAttrNs = rules.getPluginIdAttrNs();
            this.pluginIdAttr = rules.getPluginIdAttr();
            if (debug) {
                log.debug(new StringBuffer().append("init: pluginIdAttr set to per-digester values [ns=").append(this.pluginIdAttrNs).append(", name=").append(this.pluginIdAttr).append("]").toString());
                return;
            }
            return;
        }
        if (debug) {
            log.debug(new StringBuffer().append("init: pluginIdAttr set to rule-specific values [ns=").append(this.pluginIdAttrNs).append(", name=").append(this.pluginIdAttr).append("]").toString());
        }
    }

    @Override // org.apache.commons.digester.Rule
    public void begin(String namespace, String name, Attributes attributes) throws Exception {
        String pluginClassName;
        String pluginId;
        Declaration currDeclaration;
        Log log = this.digester.getLogger();
        boolean debug = log.isDebugEnabled();
        if (debug) {
            log.debug(new StringBuffer().append("PluginCreateRule.begin: pattern=[").append(this.pattern).append("]").append(" match=[").append(this.digester.getMatch()).append("]").toString());
        }
        if (this.initException != null) {
            throw this.initException;
        }
        PluginRules oldRules = (PluginRules) this.digester.getRules();
        PluginManager pluginManager = oldRules.getPluginManager();
        if (this.pluginClassAttrNs == null) {
            pluginClassName = attributes.getValue(this.pluginClassAttr);
        } else {
            pluginClassName = attributes.getValue(this.pluginClassAttrNs, this.pluginClassAttr);
        }
        if (this.pluginIdAttrNs == null) {
            pluginId = attributes.getValue(this.pluginIdAttr);
        } else {
            pluginId = attributes.getValue(this.pluginIdAttrNs, this.pluginIdAttr);
        }
        if (pluginClassName != null) {
            currDeclaration = pluginManager.getDeclarationByClass(pluginClassName);
            if (currDeclaration == null) {
                currDeclaration = new Declaration(pluginClassName);
                try {
                    currDeclaration.init(this.digester, pluginManager);
                    pluginManager.addDeclaration(currDeclaration);
                } catch (PluginException pwe) {
                    throw new PluginInvalidInputException(pwe.getMessage(), pwe.getCause());
                }
            }
        } else if (pluginId != null) {
            currDeclaration = pluginManager.getDeclarationById(pluginId);
            if (currDeclaration == null) {
                throw new PluginInvalidInputException(new StringBuffer().append("Plugin id [").append(pluginId).append("] is not defined.").toString());
            }
        } else if (this.defaultPlugin != null) {
            currDeclaration = this.defaultPlugin;
        } else {
            throw new PluginInvalidInputException(new StringBuffer().append("No plugin class specified for element ").append(this.pattern).toString());
        }
        Class pluginClass = currDeclaration.getPluginClass();
        String path = this.digester.getMatch();
        PluginRules newRules = new PluginRules(this.digester, path, oldRules, pluginClass);
        this.digester.setRules(newRules);
        if (debug) {
            log.debug(new StringBuffer().append("PluginCreateRule.begin: installing new plugin: oldrules=").append(oldRules.toString()).append(", newrules=").append(newRules.toString()).toString());
        }
        currDeclaration.configure(this.digester, this.pattern);
        Object instance = pluginClass.newInstance();
        getDigester().push(instance);
        if (debug) {
            log.debug(new StringBuffer().append("PluginCreateRule.begin: pattern=[").append(this.pattern).append("]").append(" match=[").append(this.digester.getMatch()).append("]").append(" pushed instance of plugin [").append(pluginClass.getName()).append("]").toString());
        }
        List rules = newRules.getDecoratedRules().match(namespace, path);
        fireBeginMethods(rules, namespace, name, attributes);
    }

    @Override // org.apache.commons.digester.Rule
    public void body(String namespace, String name, String text) throws Exception {
        String path = this.digester.getMatch();
        PluginRules newRules = (PluginRules) this.digester.getRules();
        List rules = newRules.getDecoratedRules().match(namespace, path);
        fireBodyMethods(rules, namespace, name, text);
    }

    @Override // org.apache.commons.digester.Rule
    public void end(String namespace, String name) throws Exception {
        String path = this.digester.getMatch();
        PluginRules newRules = (PluginRules) this.digester.getRules();
        List rules = newRules.getDecoratedRules().match(namespace, path);
        fireEndMethods(rules, namespace, name);
        this.digester.setRules(newRules.getParent());
        this.digester.pop();
    }

    public String getPattern() {
        return this.pattern;
    }

    public void fireBeginMethods(List rules, String namespace, String name, Attributes list) throws Exception {
        if (rules != null && rules.size() > 0) {
            Log log = this.digester.getLogger();
            boolean debug = log.isDebugEnabled();
            for (int i = 0; i < rules.size(); i++) {
                try {
                    Rule rule = (Rule) rules.get(i);
                    if (debug) {
                        log.debug(new StringBuffer().append("  Fire begin() for ").append(rule).toString());
                    }
                    rule.begin(namespace, name, list);
                } catch (Error e) {
                    throw e;
                } catch (Exception e2) {
                    throw this.digester.createSAXException(e2);
                }
            }
        }
    }

    private void fireBodyMethods(List rules, String namespaceURI, String name, String text) throws Exception {
        if (rules != null && rules.size() > 0) {
            Log log = this.digester.getLogger();
            boolean debug = log.isDebugEnabled();
            for (int i = 0; i < rules.size(); i++) {
                try {
                    Rule rule = (Rule) rules.get(i);
                    if (debug) {
                        log.debug(new StringBuffer().append("  Fire body() for ").append(rule).toString());
                    }
                    rule.body(namespaceURI, name, text);
                } catch (Error e) {
                    throw e;
                } catch (Exception e2) {
                    throw this.digester.createSAXException(e2);
                }
            }
        }
    }

    public void fireEndMethods(List rules, String namespaceURI, String name) throws Exception {
        if (rules != null) {
            Log log = this.digester.getLogger();
            boolean debug = log.isDebugEnabled();
            for (int i = 0; i < rules.size(); i++) {
                int j = (rules.size() - i) - 1;
                try {
                    Rule rule = (Rule) rules.get(j);
                    if (debug) {
                        log.debug(new StringBuffer().append("  Fire end() for ").append(rule).toString());
                    }
                    rule.end(namespaceURI, name);
                } catch (Error e) {
                    throw e;
                } catch (Exception e2) {
                    throw this.digester.createSAXException(e2);
                }
            }
        }
    }
}
