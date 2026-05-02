package oauth.signpost.exception;

/* loaded from: signpost-core-1.2.1.2.jar:oauth/signpost/exception/OAuthCommunicationException.class */
public class OAuthCommunicationException extends OAuthException {
    private String responseBody;

    public OAuthCommunicationException(Exception cause) {
        super("Communication with the service provider failed: " + cause.getLocalizedMessage(), cause);
    }

    public OAuthCommunicationException(String message, String responseBody) {
        super(message);
        this.responseBody = responseBody;
    }

    public String getResponseBody() {
        return this.responseBody;
    }
}
