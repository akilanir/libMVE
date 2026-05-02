package cz.msebera.android.httpclient.impl.entity;

import cz.msebera.android.httpclient.HttpException;
import cz.msebera.android.httpclient.HttpMessage;
import cz.msebera.android.httpclient.ProtocolException;
import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.entity.ContentLengthStrategy;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/entity/DisallowIdentityContentLengthStrategy.class */
public class DisallowIdentityContentLengthStrategy implements ContentLengthStrategy {
    public static final DisallowIdentityContentLengthStrategy INSTANCE = new DisallowIdentityContentLengthStrategy(new LaxContentLengthStrategy(0));
    private final ContentLengthStrategy contentLengthStrategy;

    public DisallowIdentityContentLengthStrategy(ContentLengthStrategy contentLengthStrategy) {
        this.contentLengthStrategy = contentLengthStrategy;
    }

    @Override // cz.msebera.android.httpclient.entity.ContentLengthStrategy
    public long determineLength(HttpMessage message) throws HttpException {
        long result = this.contentLengthStrategy.determineLength(message);
        if (result == -1) {
            throw new ProtocolException("Identity transfer encoding cannot be used");
        }
        return result;
    }
}
