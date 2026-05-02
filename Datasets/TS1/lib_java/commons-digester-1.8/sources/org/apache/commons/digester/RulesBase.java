package org.apache.commons.digester;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/RulesBase.class */
public class RulesBase implements Rules {
    protected HashMap cache = new HashMap();
    protected Digester digester = null;
    protected String namespaceURI = null;
    protected ArrayList rules = new ArrayList();

    @Override // org.apache.commons.digester.Rules
    public Digester getDigester() {
        return this.digester;
    }

    @Override // org.apache.commons.digester.Rules
    public void setDigester(Digester digester) {
        this.digester = digester;
        Iterator items = this.rules.iterator();
        while (items.hasNext()) {
            Rule item = (Rule) items.next();
            item.setDigester(digester);
        }
    }

    @Override // org.apache.commons.digester.Rules
    public String getNamespaceURI() {
        return this.namespaceURI;
    }

    @Override // org.apache.commons.digester.Rules
    public void setNamespaceURI(String namespaceURI) {
        this.namespaceURI = namespaceURI;
    }

    @Override // org.apache.commons.digester.Rules
    public void add(String pattern, Rule rule) {
        int patternLength = pattern.length();
        if (patternLength > 1 && pattern.endsWith("/")) {
            pattern = pattern.substring(0, patternLength - 1);
        }
        List list = (List) this.cache.get(pattern);
        if (list == null) {
            list = new ArrayList();
            this.cache.put(pattern, list);
        }
        list.add(rule);
        this.rules.add(rule);
        if (this.digester != null) {
            rule.setDigester(this.digester);
        }
        if (this.namespaceURI != null) {
            rule.setNamespaceURI(this.namespaceURI);
        }
    }

    @Override // org.apache.commons.digester.Rules
    public void clear() {
        this.cache.clear();
        this.rules.clear();
    }

    @Override // org.apache.commons.digester.Rules
    public List match(String pattern) {
        return match(null, pattern);
    }

    @Override // org.apache.commons.digester.Rules
    public List match(String namespaceURI, String pattern) {
        List rulesList = lookup(namespaceURI, pattern);
        if (rulesList == null || rulesList.size() < 1) {
            String longKey = "";
            for (String key : this.cache.keySet()) {
                if (key.startsWith("*/") && (pattern.equals(key.substring(2)) || pattern.endsWith(key.substring(1)))) {
                    if (key.length() > longKey.length()) {
                        rulesList = lookup(namespaceURI, key);
                        longKey = key;
                    }
                }
            }
        }
        if (rulesList == null) {
            rulesList = new ArrayList();
        }
        return rulesList;
    }

    @Override // org.apache.commons.digester.Rules
    public List rules() {
        return this.rules;
    }

    protected List lookup(String namespaceURI, String pattern) {
        List<Rule> list = (List) this.cache.get(pattern);
        if (list == null) {
            return null;
        }
        if (namespaceURI == null || namespaceURI.length() == 0) {
            return list;
        }
        ArrayList results = new ArrayList();
        for (Rule item : list) {
            if (namespaceURI.equals(item.getNamespaceURI()) || item.getNamespaceURI() == null) {
                results.add(item);
            }
        }
        return results;
    }
}
