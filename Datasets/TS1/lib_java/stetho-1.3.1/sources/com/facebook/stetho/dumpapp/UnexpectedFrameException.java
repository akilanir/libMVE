package com.facebook.stetho.dumpapp;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/dumpapp/UnexpectedFrameException.class */
class UnexpectedFrameException extends DumpappFramingException {
    public UnexpectedFrameException(byte expected, byte got) {
        super("Expected '" + ((int) expected) + "', got: '" + ((int) got) + "'");
    }
}
