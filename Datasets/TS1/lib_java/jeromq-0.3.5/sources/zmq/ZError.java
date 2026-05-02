package zmq;

import java.net.SocketException;
import java.nio.channels.ClosedChannelException;

/* loaded from: jeromq-0.3.5.jar:zmq/ZError.class */
public class ZError {
    public static final int EINTR = 4;
    public static final int EACCESS = 13;
    public static final int EFAULT = 14;
    public static final int EINVAL = 22;
    public static final int EAGAIN = 35;
    public static final int EINPROGRESS = 36;
    public static final int EPROTONOSUPPORT = 43;
    public static final int ENOTSUP = 45;
    public static final int EADDRINUSE = 48;
    public static final int EADDRNOTAVAIL = 49;
    public static final int ENETDOWN = 50;
    public static final int ENOBUFS = 55;
    public static final int EISCONN = 56;
    public static final int ENOTCONN = 57;
    public static final int ECONNREFUSED = 61;
    public static final int EHOSTUNREACH = 65;
    private static final int ZMQ_HAUSNUMERO = 156384712;
    public static final int ENOTSOCK = 156384717;
    public static final int EFSM = 156384763;
    public static final int ENOCOMPATPROTO = 156384764;
    public static final int ETERM = 156384765;
    public static final int EMTHREAD = 156384766;
    public static final int EIOEXC = 156384817;
    public static final int ESOCKET = 156384818;
    public static final int EMFILE = 156384819;

    /* loaded from: jeromq-0.3.5.jar:zmq/ZError$CtxTerminatedException.class */
    public static class CtxTerminatedException extends RuntimeException {
        private static final long serialVersionUID = -4404921838608052956L;
    }

    private ZError() {
    }

    /* loaded from: jeromq-0.3.5.jar:zmq/ZError$InstantiationException.class */
    public static class InstantiationException extends RuntimeException {
        private static final long serialVersionUID = -4404921838608052955L;

        public InstantiationException(Throwable cause) {
            super(cause);
        }
    }

    /* loaded from: jeromq-0.3.5.jar:zmq/ZError$IOException.class */
    public static class IOException extends RuntimeException {
        private static final long serialVersionUID = 9202470691157986262L;

        public IOException(java.io.IOException e) {
            super(e);
        }
    }

    static int exccode(java.io.IOException e) {
        if (e instanceof SocketException) {
            return ESOCKET;
        }
        if (e instanceof ClosedChannelException) {
            return 57;
        }
        return EIOEXC;
    }

    public static String toString(int code) {
        switch (code) {
            case EADDRINUSE /* 48 */:
                return "Address already in use";
            case EFSM /* 156384763 */:
                return "Operation cannot be accomplished in current state";
            case ENOCOMPATPROTO /* 156384764 */:
                return "The protocol is not compatible with the socket type";
            case ETERM /* 156384765 */:
                return "Context was terminated";
            case EMTHREAD /* 156384766 */:
                return "No thread available";
            default:
                return "";
        }
    }
}
