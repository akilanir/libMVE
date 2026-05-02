package org.spongycastle.jce.exception;

import java.security.cert.CertPath;
import java.security.cert.CertPathBuilderException;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jce/exception/ExtCertPathBuilderException.class */
public class ExtCertPathBuilderException extends CertPathBuilderException implements ExtException {
    private Throwable cause;

    public ExtCertPathBuilderException(String message, Throwable cause) {
        super(message);
        this.cause = cause;
    }

    public ExtCertPathBuilderException(String msg, Throwable cause, CertPath certPath, int index) {
        super(msg, cause);
        this.cause = cause;
    }

    @Override // java.lang.Throwable, org.spongycastle.jce.exception.ExtException
    public Throwable getCause() {
        return this.cause;
    }
}
