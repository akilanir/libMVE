package oauth.signpost.signature;

import java.io.Serializable;
import oauth.signpost.http.HttpParameters;
import oauth.signpost.http.HttpRequest;

/* loaded from: signpost-core-1.2.1.2.jar:oauth/signpost/signature/SigningStrategy.class */
public interface SigningStrategy extends Serializable {
    String writeSignature(String str, HttpRequest httpRequest, HttpParameters httpParameters);
}
