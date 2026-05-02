package eu.chainfire.libsuperuser;

/* loaded from: eu.chainfire.libsuperuser.1.0.0.201702212052.jar:eu/chainfire/libsuperuser/ShellNotClosedException.class */
public class ShellNotClosedException extends RuntimeException {
    public static final String EXCEPTION_NOT_CLOSED = "Application did not close() interactive shell";

    public ShellNotClosedException() {
        super(EXCEPTION_NOT_CLOSED);
    }
}
