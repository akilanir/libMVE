package oauth.signpost.exception;

/* loaded from: signpost-core-1.2.1.2.jar:oauth/signpost/exception/OAuthMessageSignerException.class */
public class OAuthMessageSignerException extends OAuthException {
    public OAuthMessageSignerException(String message) {
        super(message);
    }

    public OAuthMessageSignerException(Exception cause) {
        super(cause);
    }
}
