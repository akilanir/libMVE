package android.support.v4.os;

/* loaded from: com.android.support.support-v4.23.4.0.jar:android/support/v4/os/OperationCanceledException.class */
public class OperationCanceledException extends RuntimeException {
    public OperationCanceledException() {
        this(null);
    }

    public OperationCanceledException(String message) {
        super(message != null ? message : "The operation has been canceled.");
    }
}
