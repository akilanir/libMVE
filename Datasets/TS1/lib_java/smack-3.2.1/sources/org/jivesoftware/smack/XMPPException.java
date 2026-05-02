package org.jivesoftware.smack;

import java.io.PrintStream;
import java.io.PrintWriter;
import org.jivesoftware.smack.packet.StreamError;
import org.jivesoftware.smack.packet.XMPPError;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/XMPPException.class */
public class XMPPException extends Exception {
    private StreamError streamError;
    private XMPPError error;
    private Throwable wrappedThrowable;

    public XMPPException() {
        this.streamError = null;
        this.error = null;
        this.wrappedThrowable = null;
    }

    public XMPPException(String message) {
        super(message);
        this.streamError = null;
        this.error = null;
        this.wrappedThrowable = null;
    }

    public XMPPException(Throwable wrappedThrowable) {
        this.streamError = null;
        this.error = null;
        this.wrappedThrowable = null;
        this.wrappedThrowable = wrappedThrowable;
    }

    public XMPPException(StreamError streamError) {
        this.streamError = null;
        this.error = null;
        this.wrappedThrowable = null;
        this.streamError = streamError;
    }

    public XMPPException(XMPPError error) {
        this.streamError = null;
        this.error = null;
        this.wrappedThrowable = null;
        this.error = error;
    }

    public XMPPException(String message, Throwable wrappedThrowable) {
        super(message);
        this.streamError = null;
        this.error = null;
        this.wrappedThrowable = null;
        this.wrappedThrowable = wrappedThrowable;
    }

    public XMPPException(String message, XMPPError error, Throwable wrappedThrowable) {
        super(message);
        this.streamError = null;
        this.error = null;
        this.wrappedThrowable = null;
        this.error = error;
        this.wrappedThrowable = wrappedThrowable;
    }

    public XMPPException(String message, XMPPError error) {
        super(message);
        this.streamError = null;
        this.error = null;
        this.wrappedThrowable = null;
        this.error = error;
    }

    public XMPPError getXMPPError() {
        return this.error;
    }

    public StreamError getStreamError() {
        return this.streamError;
    }

    public Throwable getWrappedThrowable() {
        return this.wrappedThrowable;
    }

    @Override // java.lang.Throwable
    public void printStackTrace() {
        printStackTrace(System.err);
    }

    @Override // java.lang.Throwable
    public void printStackTrace(PrintStream out) {
        super.printStackTrace(out);
        if (this.wrappedThrowable != null) {
            out.println("Nested Exception: ");
            this.wrappedThrowable.printStackTrace(out);
        }
    }

    @Override // java.lang.Throwable
    public void printStackTrace(PrintWriter out) {
        super.printStackTrace(out);
        if (this.wrappedThrowable != null) {
            out.println("Nested Exception: ");
            this.wrappedThrowable.printStackTrace(out);
        }
    }

    @Override // java.lang.Throwable
    public String getMessage() {
        String msg = super.getMessage();
        if (msg == null && this.error != null) {
            return this.error.toString();
        }
        if (msg == null && this.streamError != null) {
            return this.streamError.toString();
        }
        return msg;
    }

    @Override // java.lang.Throwable
    public String toString() {
        StringBuilder buf = new StringBuilder();
        String message = super.getMessage();
        if (message != null) {
            buf.append(message).append(": ");
        }
        if (this.error != null) {
            buf.append(this.error);
        }
        if (this.streamError != null) {
            buf.append(this.streamError);
        }
        if (this.wrappedThrowable != null) {
            buf.append("\n  -- caused by: ").append(this.wrappedThrowable);
        }
        return buf.toString();
    }
}
