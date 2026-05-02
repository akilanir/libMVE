package com.jcraft.jsch;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/JSchPartialAuthException.class */
class JSchPartialAuthException extends JSchException {
    String methods;

    public JSchPartialAuthException() {
    }

    public JSchPartialAuthException(String s) {
        super(s);
        this.methods = s;
    }

    public String getMethods() {
        return this.methods;
    }
}
