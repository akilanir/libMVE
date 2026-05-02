package org.mozilla.javascript;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/ContinuationPending.class */
public class ContinuationPending extends RuntimeException {
    private static final long serialVersionUID = 4956008116771118856L;
    private NativeContinuation continuationState;
    private Object applicationState;

    ContinuationPending(NativeContinuation continuationState) {
        this.continuationState = continuationState;
    }

    public Object getContinuation() {
        return this.continuationState;
    }

    NativeContinuation getContinuationState() {
        return this.continuationState;
    }

    public void setApplicationState(Object applicationState) {
        this.applicationState = applicationState;
    }

    public Object getApplicationState() {
        return this.applicationState;
    }
}
