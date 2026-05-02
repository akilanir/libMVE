package com.facebook.stetho.dumpapp;

import com.facebook.stetho.server.SocketLike;
import com.facebook.stetho.server.SocketLikeHandler;
import com.facebook.stetho.server.http.ExactPathMatcher;
import com.facebook.stetho.server.http.HandlerRegistry;
import com.facebook.stetho.server.http.HttpHandler;
import com.facebook.stetho.server.http.HttpStatus;
import com.facebook.stetho.server.http.LightHttpBody;
import com.facebook.stetho.server.http.LightHttpRequest;
import com.facebook.stetho.server.http.LightHttpResponse;
import com.facebook.stetho.server.http.LightHttpServer;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.List;

@Deprecated
/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/dumpapp/DumpappHttpSocketLikeHandler.class */
public class DumpappHttpSocketLikeHandler implements SocketLikeHandler {
    private final LightHttpServer mServer;

    public DumpappHttpSocketLikeHandler(Dumper dumper) {
        HandlerRegistry registry = new HandlerRegistry();
        registry.register(new ExactPathMatcher("/dumpapp"), new DumpappLegacyHttpHandler(dumper));
        this.mServer = new LightHttpServer(registry);
    }

    @Override // com.facebook.stetho.server.SocketLikeHandler
    public void onAccepted(SocketLike socket) throws IOException {
        this.mServer.serve(socket);
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/dumpapp/DumpappHttpSocketLikeHandler$DumpappLegacyHttpHandler.class */
    private static class DumpappLegacyHttpHandler implements HttpHandler {
        private static final String QUERY_PARAM_ARGV = "argv";
        private static final String RESPONSE_HEADER_ALLOW_ORIGIN = "Access-Control-Allow-Origin";
        private static final String CONTENT_TYPE = "application/octet-stream";
        private final Dumper mDumper;

        public DumpappLegacyHttpHandler(Dumper dumper) {
            this.mDumper = dumper;
        }

        @Override // com.facebook.stetho.server.http.HttpHandler
        public boolean handleRequest(SocketLike socket, LightHttpRequest request, LightHttpResponse response) throws IOException {
            boolean postMethod = "POST".equals(request.method);
            boolean getMethod = !postMethod && "GET".equals(request.method);
            if (getMethod || postMethod) {
                List<String> argv = request.uri.getQueryParameters(QUERY_PARAM_ARGV);
                ByteArrayOutputStream outputBuffer = new ByteArrayOutputStream();
                Framer framer = new Framer(new ByteArrayInputStream(new byte[0]), outputBuffer);
                String warningPrefix = postMethod ? "ERROR" : "WARNING";
                framer.getStderr().println("*** " + warningPrefix + ": Using legacy HTTP protocol; update dumpapp script! ***");
                if (getMethod) {
                    DumpappSocketLikeHandler.dump(this.mDumper, framer, (String[]) argv.toArray(new String[argv.size()]));
                } else {
                    framer.writeExitCode(1);
                }
                response.code = HttpStatus.HTTP_OK;
                response.reasonPhrase = "OK";
                response.addHeader(RESPONSE_HEADER_ALLOW_ORIGIN, "*");
                response.body = LightHttpBody.create(outputBuffer.toByteArray(), CONTENT_TYPE);
                return true;
            }
            response.code = HttpStatus.HTTP_NOT_IMPLEMENTED;
            response.reasonPhrase = "Not implemented";
            response.body = LightHttpBody.create(request.method + " not implemented", "text/plain");
            return true;
        }
    }
}
