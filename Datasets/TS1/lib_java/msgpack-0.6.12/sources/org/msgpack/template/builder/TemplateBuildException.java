package org.msgpack.template.builder;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/builder/TemplateBuildException.class */
public class TemplateBuildException extends RuntimeException {
    public TemplateBuildException(String reason) {
        super(reason);
    }

    public TemplateBuildException(String reason, Throwable t) {
        super(reason, t);
    }

    public TemplateBuildException(Throwable t) {
        super(t);
    }
}
