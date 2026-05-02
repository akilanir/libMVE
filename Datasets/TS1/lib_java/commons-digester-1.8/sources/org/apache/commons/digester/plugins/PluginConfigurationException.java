package org.apache.commons.digester.plugins;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/plugins/PluginConfigurationException.class */
public class PluginConfigurationException extends RuntimeException {
    private Throwable cause;

    public PluginConfigurationException(Throwable cause) {
        this(cause.getMessage());
        this.cause = cause;
    }

    public PluginConfigurationException(String msg) {
        super(msg);
        this.cause = null;
    }

    public PluginConfigurationException(String msg, Throwable cause) {
        this(msg);
        this.cause = cause;
    }

    @Override // java.lang.Throwable
    public Throwable getCause() {
        return this.cause;
    }
}
