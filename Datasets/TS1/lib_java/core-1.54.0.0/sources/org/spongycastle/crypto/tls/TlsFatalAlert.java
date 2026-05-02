package org.spongycastle.crypto.tls;

import java.io.IOException;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/tls/TlsFatalAlert.class */
public class TlsFatalAlert extends IOException {
    private static final long serialVersionUID = 3584313123679111168L;
    protected short alertDescription;
    protected Throwable alertCause;

    public TlsFatalAlert(short alertDescription) {
        this(alertDescription, null);
    }

    public TlsFatalAlert(short alertDescription, Throwable alertCause) {
        super(AlertDescription.getText(alertDescription));
        this.alertDescription = alertDescription;
        this.alertCause = alertCause;
    }

    public short getAlertDescription() {
        return this.alertDescription;
    }

    @Override // java.lang.Throwable
    public Throwable getCause() {
        return this.alertCause;
    }
}
