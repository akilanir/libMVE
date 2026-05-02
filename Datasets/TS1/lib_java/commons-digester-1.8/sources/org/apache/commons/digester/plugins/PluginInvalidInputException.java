package org.apache.commons.digester.plugins;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/plugins/PluginInvalidInputException.class */
public class PluginInvalidInputException extends PluginException {
    private Throwable cause;

    public PluginInvalidInputException(Throwable cause) {
        this(cause.getMessage());
        this.cause = cause;
    }

    public PluginInvalidInputException(String msg) {
        super(msg);
        this.cause = null;
    }

    public PluginInvalidInputException(String msg, Throwable cause) {
        this(msg);
        this.cause = cause;
    }

    @Override // org.apache.commons.digester.plugins.PluginException, java.lang.Throwable
    public Throwable getCause() {
        return this.cause;
    }
}
