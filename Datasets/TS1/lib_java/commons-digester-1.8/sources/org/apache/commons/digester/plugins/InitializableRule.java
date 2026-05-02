package org.apache.commons.digester.plugins;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/plugins/InitializableRule.class */
public interface InitializableRule {
    void postRegisterInit(String str) throws PluginConfigurationException;
}
