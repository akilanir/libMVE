package com.koushikdutta.ion.mock;

import com.koushikdutta.async.http.AsyncHttpRequest;
import com.koushikdutta.ion.Ion;
import com.koushikdutta.ion.Loader;
import com.koushikdutta.ion.future.ResponseFuture;
import com.koushikdutta.ion.loader.SimpleLoader;
import java.lang.reflect.Type;

/* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/mock/MockLoader.class */
public class MockLoader extends SimpleLoader {
    MockRequestHandler requestHandler;

    public static void install(Ion ion, MockRequestHandler requestHandler) {
        MockLoader mockLoader = new MockLoader(requestHandler);
        for (Loader loader : ion.configure().getLoaders()) {
            if (loader instanceof MockLoader) {
                throw new RuntimeException("MockLoader already installed.");
            }
        }
        ion.configure().addLoader(0, mockLoader);
    }

    private MockLoader(MockRequestHandler requestHandler) {
        this.requestHandler = requestHandler;
    }

    @Override // com.koushikdutta.ion.loader.SimpleLoader, com.koushikdutta.ion.Loader
    public <T> ResponseFuture<T> load(Ion ion, AsyncHttpRequest request, Type type) {
        Object request2 = this.requestHandler.request(request.getUri().toString());
        if (request2 != null) {
            MockResponseFuture<T> ret = new MockResponseFuture<>(request);
            ret.setComplete(request2);
            return ret;
        }
        return super.load(ion, request, type);
    }
}
