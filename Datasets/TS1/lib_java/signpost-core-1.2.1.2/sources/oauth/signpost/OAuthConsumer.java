package oauth.signpost;

import java.io.Serializable;
import oauth.signpost.exception.OAuthCommunicationException;
import oauth.signpost.exception.OAuthExpectationFailedException;
import oauth.signpost.exception.OAuthMessageSignerException;
import oauth.signpost.http.HttpParameters;
import oauth.signpost.http.HttpRequest;
import oauth.signpost.signature.OAuthMessageSigner;
import oauth.signpost.signature.SigningStrategy;

/* loaded from: signpost-core-1.2.1.2.jar:oauth/signpost/OAuthConsumer.class */
public interface OAuthConsumer extends Serializable {
    void setMessageSigner(OAuthMessageSigner oAuthMessageSigner);

    void setAdditionalParameters(HttpParameters httpParameters);

    void setSigningStrategy(SigningStrategy signingStrategy);

    void setSendEmptyTokens(boolean z);

    HttpRequest sign(HttpRequest httpRequest) throws OAuthMessageSignerException, OAuthExpectationFailedException, OAuthCommunicationException;

    HttpRequest sign(Object obj) throws OAuthMessageSignerException, OAuthExpectationFailedException, OAuthCommunicationException;

    String sign(String str) throws OAuthMessageSignerException, OAuthExpectationFailedException, OAuthCommunicationException;

    void setTokenWithSecret(String str, String str2);

    String getToken();

    String getTokenSecret();

    String getConsumerKey();

    String getConsumerSecret();

    HttpParameters getRequestParameters();
}
