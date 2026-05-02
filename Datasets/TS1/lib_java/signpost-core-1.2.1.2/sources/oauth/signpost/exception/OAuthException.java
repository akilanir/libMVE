package oauth.signpost.exception;

/* loaded from: signpost-core-1.2.1.2.jar:oauth/signpost/exception/OAuthException.class */
public abstract class OAuthException extends Exception {
    public OAuthException(String message) {
        super(message);
    }

    public OAuthException(Throwable cause) {
        super(cause);
    }

    public OAuthException(String message, Throwable cause) {
        super(message, cause);
    }
}
