package org.apache.commons.digester.plugins;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/plugins/PluginException.class */
public class PluginException extends Exception {
    private Throwable cause;

    public PluginException(Throwable cause) {
        this(cause.getMessage());
        this.cause = cause;
    }

    public PluginException(String msg) {
        super(msg);
        this.cause = null;
    }

    public PluginException(String msg, Throwable cause) {
        this(msg);
        this.cause = cause;
    }

    @Override // java.lang.Throwable
    public Throwable getCause() {
        return this.cause;
    }
}
