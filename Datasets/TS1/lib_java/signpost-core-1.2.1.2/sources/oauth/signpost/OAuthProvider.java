package oauth.signpost;

import java.io.Serializable;
import java.util.Map;
import oauth.signpost.exception.OAuthCommunicationException;
import oauth.signpost.exception.OAuthExpectationFailedException;
import oauth.signpost.exception.OAuthMessageSignerException;
import oauth.signpost.exception.OAuthNotAuthorizedException;
import oauth.signpost.http.HttpParameters;

/* loaded from: signpost-core-1.2.1.2.jar:oauth/signpost/OAuthProvider.class */
public interface OAuthProvider extends Serializable {
    String retrieveRequestToken(OAuthConsumer oAuthConsumer, String str, String... strArr) throws OAuthMessageSignerException, OAuthNotAuthorizedException, OAuthExpectationFailedException, OAuthCommunicationException;

    void retrieveAccessToken(OAuthConsumer oAuthConsumer, String str, String... strArr) throws OAuthMessageSignerException, OAuthNotAuthorizedException, OAuthExpectationFailedException, OAuthCommunicationException;

    HttpParameters getResponseParameters();

    void setResponseParameters(HttpParameters httpParameters);

    @Deprecated
    void setRequestHeader(String str, String str2);

    @Deprecated
    Map<String, String> getRequestHeaders();

    void setOAuth10a(boolean z);

    boolean isOAuth10a();

    String getRequestTokenEndpointUrl();

    String getAccessTokenEndpointUrl();

    String getAuthorizationWebsiteUrl();

    void setListener(OAuthProviderListener oAuthProviderListener);

    void removeListener(OAuthProviderListener oAuthProviderListener);
}
