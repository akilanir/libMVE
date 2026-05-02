package com.jcraft.jsch;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/SftpException.class */
public class SftpException extends Exception {
    public int id;
    private Throwable cause;

    public SftpException(int id, String message) {
        super(message);
        this.cause = null;
        this.id = id;
    }

    public SftpException(int id, String message, Throwable e) {
        super(message);
        this.cause = null;
        this.id = id;
        this.cause = e;
    }

    @Override // java.lang.Throwable
    public String toString() {
        return this.id + ": " + getMessage();
    }

    @Override // java.lang.Throwable
    public Throwable getCause() {
        return this.cause;
    }
}
