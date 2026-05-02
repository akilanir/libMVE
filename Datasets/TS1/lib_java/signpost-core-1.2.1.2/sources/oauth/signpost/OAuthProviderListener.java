package oauth.signpost;

import oauth.signpost.http.HttpRequest;
import oauth.signpost.http.HttpResponse;

/* loaded from: signpost-core-1.2.1.2.jar:oauth/signpost/OAuthProviderListener.class */
public interface OAuthProviderListener {
    void prepareRequest(HttpRequest httpRequest) throws Exception;

    void prepareSubmission(HttpRequest httpRequest) throws Exception;

    boolean onResponseReceived(HttpRequest httpRequest, HttpResponse httpResponse) throws Exception;
}
