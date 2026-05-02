package org.apache.commons.digester.plugins;

import java.util.List;
import org.apache.commons.digester.Digester;
import org.apache.commons.digester.Rule;
import org.apache.commons.digester.Rules;
import org.apache.commons.digester.RulesBase;
import org.apache.commons.logging.Log;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/plugins/PluginRules.class */
public class PluginRules implements Rules {
    protected Digester digester;
    private RulesFactory rulesFactory;
    private Rules decoratedRules;
    private PluginManager pluginManager;
    private String mountPoint;
    private PluginRules parent;
    private PluginContext pluginContext;

    public PluginRules() {
        this(new RulesBase());
    }

    public PluginRules(Rules decoratedRules) {
        this.digester = null;
        this.mountPoint = null;
        this.parent = null;
        this.pluginContext = null;
        this.decoratedRules = decoratedRules;
        this.pluginContext = new PluginContext();
        this.pluginManager = new PluginManager(this.pluginContext);
    }

    PluginRules(Digester digester, String mountPoint, PluginRules parent, Class pluginClass) throws PluginException {
        this.digester = null;
        this.mountPoint = null;
        this.parent = null;
        this.pluginContext = null;
        this.digester = digester;
        this.mountPoint = mountPoint;
        this.parent = parent;
        this.rulesFactory = parent.rulesFactory;
        if (this.rulesFactory == null) {
            this.decoratedRules = new RulesBase();
        } else {
            this.decoratedRules = this.rulesFactory.newRules(digester, pluginClass);
        }
        this.pluginContext = parent.pluginContext;
        this.pluginManager = new PluginManager(parent.pluginManager);
    }

    public Rules getParent() {
        return this.parent;
    }

    @Override // org.apache.commons.digester.Rules
    public Digester getDigester() {
        return this.digester;
    }

    @Override // org.apache.commons.digester.Rules
    public void setDigester(Digester digester) {
        this.digester = digester;
        this.decoratedRules.setDigester(digester);
    }

    @Override // org.apache.commons.digester.Rules
    public String getNamespaceURI() {
        return this.decoratedRules.getNamespaceURI();
    }

    @Override // org.apache.commons.digester.Rules
    public void setNamespaceURI(String namespaceURI) {
        this.decoratedRules.setNamespaceURI(namespaceURI);
    }

    public PluginManager getPluginManager() {
        return this.pluginManager;
    }

    public List getRuleFinders() {
        return this.pluginContext.getRuleFinders();
    }

    public void setRuleFinders(List ruleFinders) {
        this.pluginContext.setRuleFinders(ruleFinders);
    }

    public RulesFactory getRulesFactory() {
        return this.rulesFactory;
    }

    public void setRulesFactory(RulesFactory factory) {
        this.rulesFactory = factory;
    }

    Rules getDecoratedRules() {
        return this.decoratedRules;
    }

    @Override // org.apache.commons.digester.Rules
    public List rules() {
        return this.decoratedRules.rules();
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // org.apache.commons.digester.Rules
    public void add(String pattern, Rule rule) {
        Log log = LogUtils.getLogger(this.digester);
        boolean debug = log.isDebugEnabled();
        if (debug) {
            log.debug(new StringBuffer().append("add entry: mapping pattern [").append(pattern).append("]").append(" to rule of type [").append(rule.getClass().getName()).append("]").toString());
        }
        if (pattern.startsWith("/")) {
            pattern = pattern.substring(1);
        }
        if (this.mountPoint != null && !pattern.equals(this.mountPoint) && !pattern.startsWith(new StringBuffer().append(this.mountPoint).append("/").toString())) {
            log.warn(new StringBuffer().append("An attempt was made to add a rule with a pattern thatis not at or below the mountpoint of the current PluginRules object. Rule pattern: ").append(pattern).append(", mountpoint: ").append(this.mountPoint).append(", rule type: ").append(rule.getClass().getName()).toString());
            return;
        }
        this.decoratedRules.add(pattern, rule);
        if (rule instanceof InitializableRule) {
            try {
                ((InitializableRule) rule).postRegisterInit(pattern);
            } catch (PluginConfigurationException e) {
                if (debug) {
                    log.debug("Rule initialisation failed", e);
                    return;
                }
                return;
            }
        }
        if (debug) {
            log.debug(new StringBuffer().append("add exit: mapped pattern [").append(pattern).append("]").append(" to rule of type [").append(rule.getClass().getName()).append("]").toString());
        }
    }

    @Override // org.apache.commons.digester.Rules
    public void clear() {
        this.decoratedRules.clear();
    }

    @Override // org.apache.commons.digester.Rules
    public List match(String path) {
        return match(null, path);
    }

    @Override // org.apache.commons.digester.Rules
    public List match(String namespaceURI, String path) {
        List matches;
        Log log = LogUtils.getLogger(this.digester);
        boolean debug = log.isDebugEnabled();
        if (debug) {
            log.debug(new StringBuffer().append("Matching path [").append(path).append("] on rules object ").append(toString()).toString());
        }
        if (this.mountPoint != null && path.length() <= this.mountPoint.length()) {
            if (debug) {
                log.debug(new StringBuffer().append("Path [").append(path).append("] delegated to parent.").toString());
            }
            matches = this.parent.match(namespaceURI, path);
        } else {
            log.debug("delegating to decorated rules.");
            matches = this.decoratedRules.match(namespaceURI, path);
        }
        return matches;
    }

    public void setPluginClassAttribute(String namespaceUri, String attrName) {
        this.pluginContext.setPluginClassAttribute(namespaceUri, attrName);
    }

    public void setPluginIdAttribute(String namespaceUri, String attrName) {
        this.pluginContext.setPluginIdAttribute(namespaceUri, attrName);
    }

    public String getPluginClassAttrNs() {
        return this.pluginContext.getPluginClassAttrNs();
    }

    public String getPluginClassAttr() {
        return this.pluginContext.getPluginClassAttr();
    }

    public String getPluginIdAttrNs() {
        return this.pluginContext.getPluginIdAttrNs();
    }

    public String getPluginIdAttr() {
        return this.pluginContext.getPluginIdAttr();
    }
}
