package ch.qos.logback.core.rolling;

import ch.qos.logback.core.LogbackException;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/rolling/RolloverFailure.class */
public class RolloverFailure extends LogbackException {
    private static final long serialVersionUID = -4407533730831239458L;

    public RolloverFailure(String str) {
        super(str);
    }

    public RolloverFailure(String str, Throwable th) {
        super(str, th);
    }
}
