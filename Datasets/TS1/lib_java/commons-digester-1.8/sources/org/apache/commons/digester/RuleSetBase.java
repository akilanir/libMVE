package org.apache.commons.digester;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/RuleSetBase.class */
public abstract class RuleSetBase implements RuleSet {
    protected String namespaceURI = null;

    @Override // org.apache.commons.digester.RuleSet
    public abstract void addRuleInstances(Digester digester);

    @Override // org.apache.commons.digester.RuleSet
    public String getNamespaceURI() {
        return this.namespaceURI;
    }
}
