package org.apache.commons.digester;

import java.util.ArrayList;
import java.util.List;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/WithDefaultsRulesWrapper.class */
public class WithDefaultsRulesWrapper implements Rules {
    private Rules wrappedRules;
    private List defaultRules = new ArrayList();
    private List allRules = new ArrayList();

    public WithDefaultsRulesWrapper(Rules wrappedRules) {
        if (wrappedRules == null) {
            throw new IllegalArgumentException("Wrapped rules must not be null");
        }
        this.wrappedRules = wrappedRules;
    }

    @Override // org.apache.commons.digester.Rules
    public Digester getDigester() {
        return this.wrappedRules.getDigester();
    }

    @Override // org.apache.commons.digester.Rules
    public void setDigester(Digester digester) {
        this.wrappedRules.setDigester(digester);
        for (Rule rule : this.defaultRules) {
            rule.setDigester(digester);
        }
    }

    @Override // org.apache.commons.digester.Rules
    public String getNamespaceURI() {
        return this.wrappedRules.getNamespaceURI();
    }

    @Override // org.apache.commons.digester.Rules
    public void setNamespaceURI(String namespaceURI) {
        this.wrappedRules.setNamespaceURI(namespaceURI);
    }

    public List getDefaults() {
        return this.defaultRules;
    }

    @Override // org.apache.commons.digester.Rules
    public List match(String pattern) {
        return match("", pattern);
    }

    @Override // org.apache.commons.digester.Rules
    public List match(String namespaceURI, String pattern) {
        List matches = this.wrappedRules.match(namespaceURI, pattern);
        if (matches == null || matches.isEmpty()) {
            return new ArrayList(this.defaultRules);
        }
        return matches;
    }

    public void addDefault(Rule rule) {
        if (this.wrappedRules.getDigester() != null) {
            rule.setDigester(this.wrappedRules.getDigester());
        }
        if (this.wrappedRules.getNamespaceURI() != null) {
            rule.setNamespaceURI(this.wrappedRules.getNamespaceURI());
        }
        this.defaultRules.add(rule);
        this.allRules.add(rule);
    }

    @Override // org.apache.commons.digester.Rules
    public List rules() {
        return this.allRules;
    }

    @Override // org.apache.commons.digester.Rules
    public void clear() {
        this.wrappedRules.clear();
        this.allRules.clear();
        this.defaultRules.clear();
    }

    @Override // org.apache.commons.digester.Rules
    public void add(String pattern, Rule rule) {
        this.wrappedRules.add(pattern, rule);
        this.allRules.add(rule);
    }
}
