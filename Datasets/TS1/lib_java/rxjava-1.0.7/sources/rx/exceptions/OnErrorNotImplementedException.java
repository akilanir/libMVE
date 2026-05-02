package rx.exceptions;

/* loaded from: rxjava-1.0.7.jar:rx/exceptions/OnErrorNotImplementedException.class */
public class OnErrorNotImplementedException extends RuntimeException {
    private static final long serialVersionUID = -6298857009889503852L;

    public OnErrorNotImplementedException(String message, Throwable e) {
        super(message, e);
    }

    public OnErrorNotImplementedException(Throwable e) {
        super(e.getMessage(), e);
    }
}
