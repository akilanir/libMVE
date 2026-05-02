package org.apache.commons.digester;

import java.util.List;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/AbstractRulesImpl.class */
public abstract class AbstractRulesImpl implements Rules {
    private Digester digester;
    private String namespaceURI;

    protected abstract void registerRule(String str, Rule rule);

    @Override // org.apache.commons.digester.Rules
    public abstract void clear();

    @Override // org.apache.commons.digester.Rules
    public abstract List match(String str, String str2);

    @Override // org.apache.commons.digester.Rules
    public abstract List rules();

    @Override // org.apache.commons.digester.Rules
    public Digester getDigester() {
        return this.digester;
    }

    @Override // org.apache.commons.digester.Rules
    public void setDigester(Digester digester) {
        this.digester = digester;
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
        if (this.digester != null) {
            rule.setDigester(this.digester);
        }
        if (this.namespaceURI != null) {
            rule.setNamespaceURI(this.namespaceURI);
        }
        registerRule(pattern, rule);
    }

    @Override // org.apache.commons.digester.Rules
    public List match(String pattern) {
        return match(this.namespaceURI, pattern);
    }
}
