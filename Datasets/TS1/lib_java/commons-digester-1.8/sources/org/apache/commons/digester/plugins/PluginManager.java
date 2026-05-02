package org.apache.commons.digester.plugins;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import org.apache.commons.digester.Digester;
import org.apache.commons.logging.Log;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/plugins/PluginManager.class */
public class PluginManager {
    private HashMap declarationsByClass = new HashMap();
    private HashMap declarationsById = new HashMap();
    private PluginManager parent;
    private PluginContext pluginContext;

    public PluginManager(PluginContext r) {
        this.pluginContext = r;
    }

    public PluginManager(PluginManager parent) {
        this.parent = parent;
        this.pluginContext = parent.pluginContext;
    }

    public void addDeclaration(Declaration decl) {
        Log log = LogUtils.getLogger(null);
        boolean debug = log.isDebugEnabled();
        Class pluginClass = decl.getPluginClass();
        String id = decl.getId();
        this.declarationsByClass.put(pluginClass.getName(), decl);
        if (id != null) {
            this.declarationsById.put(id, decl);
            if (debug) {
                log.debug(new StringBuffer().append("Indexing plugin-id [").append(id).append("]").append(" -> class [").append(pluginClass.getName()).append("]").toString());
            }
        }
    }

    public Declaration getDeclarationByClass(String className) {
        Declaration decl = (Declaration) this.declarationsByClass.get(className);
        if (decl == null && this.parent != null) {
            decl = this.parent.getDeclarationByClass(className);
        }
        return decl;
    }

    public Declaration getDeclarationById(String id) {
        Declaration decl = (Declaration) this.declarationsById.get(id);
        if (decl == null && this.parent != null) {
            decl = this.parent.getDeclarationById(id);
        }
        return decl;
    }

    public RuleLoader findLoader(Digester digester, String id, Class pluginClass, Properties props) throws PluginException {
        Log log = LogUtils.getLogger(digester);
        boolean debug = log.isDebugEnabled();
        log.debug("scanning ruleFinders to locate loader..");
        List ruleFinders = this.pluginContext.getRuleFinders();
        RuleLoader ruleLoader = null;
        try {
            Iterator i = ruleFinders.iterator();
            while (i.hasNext() && ruleLoader == null) {
                RuleFinder finder = (RuleFinder) i.next();
                if (debug) {
                    log.debug(new StringBuffer().append("checking finder of type ").append(finder.getClass().getName()).toString());
                }
                ruleLoader = finder.findLoader(digester, pluginClass, props);
            }
            log.debug("scanned ruleFinders.");
            return ruleLoader;
        } catch (PluginException e) {
            throw new PluginException(new StringBuffer().append("Unable to locate plugin rules for plugin with id [").append(id).append("]").append(", and class [").append(pluginClass.getName()).append("]").append(":").append(e.getMessage()).toString(), e.getCause());
        }
    }
}
