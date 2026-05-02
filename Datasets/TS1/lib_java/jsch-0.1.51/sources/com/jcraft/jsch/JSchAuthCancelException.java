package com.jcraft.jsch;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/JSchAuthCancelException.class */
class JSchAuthCancelException extends JSchException {
    String method;

    JSchAuthCancelException() {
    }

    JSchAuthCancelException(String s) {
        super(s);
        this.method = s;
    }

    public String getMethod() {
        return this.method;
    }
}
