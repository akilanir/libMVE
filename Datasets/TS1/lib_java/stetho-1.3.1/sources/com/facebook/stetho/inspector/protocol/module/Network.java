package com.facebook.stetho.inspector.protocol.module;

import android.content.Context;
import com.facebook.stetho.common.Util;
import com.facebook.stetho.inspector.jsonrpc.JsonRpcException;
import com.facebook.stetho.inspector.jsonrpc.JsonRpcPeer;
import com.facebook.stetho.inspector.jsonrpc.JsonRpcResult;
import com.facebook.stetho.inspector.jsonrpc.protocol.JsonRpcError;
import com.facebook.stetho.inspector.network.AsyncPrettyPrinterInitializer;
import com.facebook.stetho.inspector.network.NetworkPeerManager;
import com.facebook.stetho.inspector.network.ResponseBodyData;
import com.facebook.stetho.inspector.network.ResponseBodyFileManager;
import com.facebook.stetho.inspector.protocol.ChromeDevtoolsDomain;
import com.facebook.stetho.inspector.protocol.ChromeDevtoolsMethod;
import com.facebook.stetho.inspector.protocol.module.Console;
import com.facebook.stetho.inspector.protocol.module.Page;
import com.facebook.stetho.json.annotation.JsonProperty;
import com.facebook.stetho.json.annotation.JsonValue;
import java.io.IOException;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Network.class */
public class Network implements ChromeDevtoolsDomain {
    private final NetworkPeerManager mNetworkPeerManager;
    private final ResponseBodyFileManager mResponseBodyFileManager;

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Network$DataReceivedParams.class */
    public static class DataReceivedParams {

        @JsonProperty(required = true)
        public String requestId;

        @JsonProperty(required = true)
        public double timestamp;

        @JsonProperty(required = true)
        public int dataLength;

        @JsonProperty(required = true)
        public int encodedDataLength;
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Network$Initiator.class */
    public static class Initiator {

        @JsonProperty(required = true)
        public InitiatorType type;

        @JsonProperty
        public List<Console.CallFrame> stackTrace;
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Network$LoadingFailedParams.class */
    public static class LoadingFailedParams {

        @JsonProperty(required = true)
        public String requestId;

        @JsonProperty(required = true)
        public double timestamp;

        @JsonProperty(required = true)
        public String errorText;

        @JsonProperty
        public Page.ResourceType type;
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Network$LoadingFinishedParams.class */
    public static class LoadingFinishedParams {

        @JsonProperty(required = true)
        public String requestId;

        @JsonProperty(required = true)
        public double timestamp;
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Network$Request.class */
    public static class Request {

        @JsonProperty(required = true)
        public String url;

        @JsonProperty(required = true)
        public String method;

        @JsonProperty(required = true)
        public JSONObject headers;

        @JsonProperty
        public String postData;
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Network$RequestWillBeSentParams.class */
    public static class RequestWillBeSentParams {

        @JsonProperty(required = true)
        public String requestId;

        @JsonProperty(required = true)
        public String frameId;

        @JsonProperty(required = true)
        public String loaderId;

        @JsonProperty(required = true)
        public String documentURL;

        @JsonProperty(required = true)
        public Request request;

        @JsonProperty(required = true)
        public double timestamp;

        @JsonProperty(required = true)
        public Initiator initiator;

        @JsonProperty
        public Response redirectResponse;

        @JsonProperty
        public Page.ResourceType type;
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Network$ResourceTiming.class */
    public static class ResourceTiming {

        @JsonProperty(required = true)
        public double requestTime;

        @JsonProperty(required = true)
        public double proxyStart;

        @JsonProperty(required = true)
        public double proxyEnd;

        @JsonProperty(required = true)
        public double dnsStart;

        @JsonProperty(required = true)
        public double dnsEnd;

        @JsonProperty(required = true)
        public double connectionStart;

        @JsonProperty(required = true)
        public double connectionEnd;

        @JsonProperty(required = true)
        public double sslStart;

        @JsonProperty(required = true)
        public double sslEnd;

        @JsonProperty(required = true)
        public double sendStart;

        @JsonProperty(required = true)
        public double sendEnd;

        @JsonProperty(required = true)
        public double receivedHeadersEnd;
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Network$Response.class */
    public static class Response {

        @JsonProperty(required = true)
        public String url;

        @JsonProperty(required = true)
        public int status;

        @JsonProperty(required = true)
        public String statusText;

        @JsonProperty(required = true)
        public JSONObject headers;

        @JsonProperty
        public String headersText;

        @JsonProperty(required = true)
        public String mimeType;

        @JsonProperty
        public JSONObject requestHeaders;

        @JsonProperty
        public String requestHeadersTest;

        @JsonProperty(required = true)
        public boolean connectionReused;

        @JsonProperty(required = true)
        public int connectionId;

        @JsonProperty(required = true)
        public Boolean fromDiskCache;

        @JsonProperty
        public ResourceTiming timing;
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Network$ResponseReceivedParams.class */
    public static class ResponseReceivedParams {

        @JsonProperty(required = true)
        public String requestId;

        @JsonProperty(required = true)
        public String frameId;

        @JsonProperty(required = true)
        public String loaderId;

        @JsonProperty(required = true)
        public double timestamp;

        @JsonProperty(required = true)
        public Page.ResourceType type;

        @JsonProperty(required = true)
        public Response response;
    }

    public Network(Context context) {
        this.mNetworkPeerManager = NetworkPeerManager.getOrCreateInstance(context);
        this.mResponseBodyFileManager = this.mNetworkPeerManager.getResponseBodyFileManager();
    }

    @ChromeDevtoolsMethod
    public void enable(JsonRpcPeer peer, JSONObject params) {
        this.mNetworkPeerManager.addPeer(peer);
    }

    @ChromeDevtoolsMethod
    public void disable(JsonRpcPeer peer, JSONObject params) {
        this.mNetworkPeerManager.removePeer(peer);
    }

    @ChromeDevtoolsMethod
    public void setUserAgentOverride(JsonRpcPeer peer, JSONObject params) {
    }

    @ChromeDevtoolsMethod
    public JsonRpcResult getResponseBody(JsonRpcPeer peer, JSONObject params) throws JsonRpcException {
        try {
            String requestId = params.getString("requestId");
            return readResponseBody(requestId);
        } catch (IOException e) {
            throw new JsonRpcException(new JsonRpcError(JsonRpcError.ErrorCode.INTERNAL_ERROR, e.toString(), null));
        } catch (JSONException e2) {
            throw new JsonRpcException(new JsonRpcError(JsonRpcError.ErrorCode.INTERNAL_ERROR, e2.toString(), null));
        }
    }

    private GetResponseBodyResponse readResponseBody(String requestId) throws IOException, JsonRpcException {
        GetResponseBodyResponse response = new GetResponseBodyResponse();
        try {
            ResponseBodyData bodyData = this.mResponseBodyFileManager.readFile(requestId);
            response.body = bodyData.data;
            response.base64Encoded = bodyData.base64Encoded;
            return response;
        } catch (OutOfMemoryError e) {
            throw new JsonRpcException(new JsonRpcError(JsonRpcError.ErrorCode.INTERNAL_ERROR, e.toString(), null));
        }
    }

    public void setPrettyPrinterInitializer(AsyncPrettyPrinterInitializer initializer) {
        Util.throwIfNull(initializer);
        this.mNetworkPeerManager.setPrettyPrinterInitializer(initializer);
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Network$GetResponseBodyResponse.class */
    private static class GetResponseBodyResponse implements JsonRpcResult {

        @JsonProperty(required = true)
        public String body;

        @JsonProperty(required = true)
        public boolean base64Encoded;

        private GetResponseBodyResponse() {
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Network$InitiatorType.class */
    public enum InitiatorType {
        PARSER("parser"),
        SCRIPT("script"),
        OTHER("other");

        private final String mProtocolValue;

        InitiatorType(String protocolValue) {
            this.mProtocolValue = protocolValue;
        }

        @JsonValue
        public String getProtocolValue() {
            return this.mProtocolValue;
        }
    }
}
