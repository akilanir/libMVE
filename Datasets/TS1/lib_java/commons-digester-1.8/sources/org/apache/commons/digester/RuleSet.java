package org.apache.commons.digester;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/RuleSet.class */
public interface RuleSet {
    String getNamespaceURI();

    void addRuleInstances(Digester digester);
}
