package oauth.signpost.signature;

import java.util.Iterator;
import oauth.signpost.OAuth;
import oauth.signpost.http.HttpParameters;
import oauth.signpost.http.HttpRequest;

/* loaded from: signpost-core-1.2.1.2.jar:oauth/signpost/signature/QueryStringSigningStrategy.class */
public class QueryStringSigningStrategy implements SigningStrategy {
    private static final long serialVersionUID = 1;

    @Override // oauth.signpost.signature.SigningStrategy
    public String writeSignature(String signature, HttpRequest request, HttpParameters requestParameters) {
        HttpParameters oauthParams = requestParameters.getOAuthParameters();
        oauthParams.put(OAuth.OAUTH_SIGNATURE, signature, true);
        Iterator<String> iter = oauthParams.keySet().iterator();
        String firstKey = iter.next();
        StringBuilder sb = new StringBuilder(OAuth.addQueryString(request.getRequestUrl(), oauthParams.getAsQueryString(firstKey)));
        while (iter.hasNext()) {
            sb.append("&");
            String key = iter.next();
            sb.append(oauthParams.getAsQueryString(key));
        }
        String signedUrl = sb.toString();
        request.setRequestUrl(signedUrl);
        return signedUrl;
    }
}
