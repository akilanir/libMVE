package org.spongycastle.util.encoders;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/util/encoders/DecoderException.class */
public class DecoderException extends IllegalStateException {
    private Throwable cause;

    DecoderException(String msg, Throwable cause) {
        super(msg);
        this.cause = cause;
    }

    @Override // java.lang.Throwable
    public Throwable getCause() {
        return this.cause;
    }
}
