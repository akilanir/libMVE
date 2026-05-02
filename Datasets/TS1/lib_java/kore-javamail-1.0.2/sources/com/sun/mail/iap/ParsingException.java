package com.sun.mail.iap;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/iap/ParsingException.class */
public class ParsingException extends ProtocolException {
    private static final long serialVersionUID = 7756119840142724839L;

    public ParsingException() {
    }

    public ParsingException(String s) {
        super(s);
    }

    public ParsingException(Response r) {
        super(r);
    }
}
