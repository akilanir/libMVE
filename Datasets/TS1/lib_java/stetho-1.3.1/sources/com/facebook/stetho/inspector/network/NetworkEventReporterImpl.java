package com.facebook.stetho.inspector.network;

import android.os.SystemClock;
import com.facebook.stetho.common.Utf8Charset;
import com.facebook.stetho.inspector.console.CLog;
import com.facebook.stetho.inspector.network.NetworkEventReporter;
import com.facebook.stetho.inspector.protocol.module.Console;
import com.facebook.stetho.inspector.protocol.module.Network;
import com.facebook.stetho.inspector.protocol.module.Page;
import com.facebook.stetho.server.http.HttpHeaders;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/network/NetworkEventReporterImpl.class */
public class NetworkEventReporterImpl implements NetworkEventReporter {

    @Nullable
    private ResourceTypeHelper mResourceTypeHelper;
    private static NetworkEventReporter sInstance;

    private NetworkEventReporterImpl() {
    }

    public static synchronized NetworkEventReporter get() {
        if (sInstance == null) {
            sInstance = new NetworkEventReporterImpl();
        }
        return sInstance;
    }

    @Override // com.facebook.stetho.inspector.network.NetworkEventReporter
    public boolean isEnabled() {
        NetworkPeerManager peerManager = getPeerManagerIfEnabled();
        return peerManager != null;
    }

    @Nullable
    private NetworkPeerManager getPeerManagerIfEnabled() {
        NetworkPeerManager peerManager = NetworkPeerManager.getInstanceOrNull();
        if (peerManager != null && peerManager.hasRegisteredPeers()) {
            return peerManager;
        }
        return null;
    }

    @Override // com.facebook.stetho.inspector.network.NetworkEventReporter
    public void requestWillBeSent(NetworkEventReporter.InspectorRequest request) {
        NetworkPeerManager peerManager = getPeerManagerIfEnabled();
        if (peerManager != null) {
            Network.Request requestJSON = new Network.Request();
            requestJSON.url = request.url();
            requestJSON.method = request.method();
            requestJSON.headers = formatHeadersAsJSON(request);
            requestJSON.postData = readBodyAsString(peerManager, request);
            String requestFriendlyName = request.friendlyName();
            Integer requestPriority = request.friendlyNameExtra();
            Network.Initiator initiatorJSON = new Network.Initiator();
            initiatorJSON.type = Network.InitiatorType.SCRIPT;
            initiatorJSON.stackTrace = new ArrayList();
            initiatorJSON.stackTrace.add(new Console.CallFrame(requestFriendlyName, requestFriendlyName, requestPriority != null ? requestPriority.intValue() : 0, 0));
            Network.RequestWillBeSentParams params = new Network.RequestWillBeSentParams();
            params.requestId = request.id();
            params.frameId = "1";
            params.loaderId = "1";
            params.documentURL = request.url();
            params.request = requestJSON;
            params.timestamp = stethoNow() / 1000.0d;
            params.initiator = initiatorJSON;
            params.redirectResponse = null;
            params.type = Page.ResourceType.OTHER;
            peerManager.sendNotificationToPeers("Network.requestWillBeSent", params);
        }
    }

    @Nullable
    private static String readBodyAsString(NetworkPeerManager peerManager, NetworkEventReporter.InspectorRequest request) {
        try {
            byte[] body = request.body();
            if (body != null) {
                return new String(body, Utf8Charset.INSTANCE);
            }
            return null;
        } catch (IOException | OutOfMemoryError e) {
            CLog.writeToConsole(peerManager, Console.MessageLevel.WARNING, Console.MessageSource.NETWORK, "Could not reproduce POST body: " + e);
            return null;
        }
    }

    @Override // com.facebook.stetho.inspector.network.NetworkEventReporter
    public void responseHeadersReceived(NetworkEventReporter.InspectorResponse response) {
        NetworkPeerManager peerManager = getPeerManagerIfEnabled();
        if (peerManager != null) {
            Network.Response responseJSON = new Network.Response();
            responseJSON.url = response.url();
            responseJSON.status = response.statusCode();
            responseJSON.statusText = response.reasonPhrase();
            responseJSON.headers = formatHeadersAsJSON(response);
            String contentType = getContentType(response);
            responseJSON.mimeType = contentType != null ? getResourceTypeHelper().stripContentExtras(contentType) : "application/octet-stream";
            responseJSON.connectionReused = response.connectionReused();
            responseJSON.connectionId = response.connectionId();
            responseJSON.fromDiskCache = Boolean.valueOf(response.fromDiskCache());
            Network.ResponseReceivedParams receivedParams = new Network.ResponseReceivedParams();
            receivedParams.requestId = response.requestId();
            receivedParams.frameId = "1";
            receivedParams.loaderId = "1";
            receivedParams.timestamp = stethoNow() / 1000.0d;
            receivedParams.response = responseJSON;
            AsyncPrettyPrinter asyncPrettyPrinter = initAsyncPrettyPrinterForResponse(response, peerManager);
            receivedParams.type = determineResourceType(asyncPrettyPrinter, contentType, getResourceTypeHelper());
            peerManager.sendNotificationToPeers("Network.responseReceived", receivedParams);
        }
    }

    @Nullable
    private static AsyncPrettyPrinter initAsyncPrettyPrinterForResponse(NetworkEventReporter.InspectorResponse response, NetworkPeerManager peerManager) {
        AsyncPrettyPrinterRegistry registry = peerManager.getAsyncPrettyPrinterRegistry();
        AsyncPrettyPrinter asyncPrettyPrinter = createPrettyPrinterForResponse(response, registry);
        if (asyncPrettyPrinter != null) {
            peerManager.getResponseBodyFileManager().associateAsyncPrettyPrinterWithId(response.requestId(), asyncPrettyPrinter);
        }
        return asyncPrettyPrinter;
    }

    private static Page.ResourceType determineResourceType(AsyncPrettyPrinter asyncPrettyPrinter, String contentType, ResourceTypeHelper resourceTypeHelper) {
        if (asyncPrettyPrinter != null) {
            return asyncPrettyPrinter.getPrettifiedType().getResourceType();
        }
        return contentType != null ? resourceTypeHelper.determineResourceType(contentType) : Page.ResourceType.OTHER;
    }

    @Nullable
    static AsyncPrettyPrinter createPrettyPrinterForResponse(NetworkEventReporter.InspectorResponse response, @Nullable AsyncPrettyPrinterRegistry registry) {
        if (registry != null) {
            int count = response.headerCount();
            for (int i = 0; i < count; i++) {
                AsyncPrettyPrinterFactory factory = registry.lookup(response.headerName(i));
                if (factory != null) {
                    AsyncPrettyPrinter asyncPrettyPrinter = factory.getInstance(response.headerName(i), response.headerValue(i));
                    return asyncPrettyPrinter;
                }
            }
            return null;
        }
        return null;
    }

    @Override // com.facebook.stetho.inspector.network.NetworkEventReporter
    public InputStream interpretResponseStream(String requestId, @Nullable String contentType, @Nullable String contentEncoding, @Nullable InputStream availableInputStream, ResponseHandler responseHandler) {
        NetworkPeerManager peerManager = getPeerManagerIfEnabled();
        if (peerManager != null) {
            if (availableInputStream == null) {
                responseHandler.onEOF();
                return null;
            }
            Page.ResourceType resourceType = contentType != null ? getResourceTypeHelper().determineResourceType(contentType) : null;
            boolean base64Encode = false;
            if (resourceType != null && resourceType == Page.ResourceType.IMAGE) {
                base64Encode = true;
            }
            try {
                OutputStream fileOutputStream = peerManager.getResponseBodyFileManager().openResponseBodyFile(requestId, base64Encode);
                return DecompressionHelper.teeInputWithDecompression(peerManager, requestId, availableInputStream, fileOutputStream, contentEncoding, responseHandler);
            } catch (IOException e) {
                CLog.writeToConsole(peerManager, Console.MessageLevel.ERROR, Console.MessageSource.NETWORK, "Error writing response body data for request #" + requestId);
            }
        }
        return availableInputStream;
    }

    @Override // com.facebook.stetho.inspector.network.NetworkEventReporter
    public void httpExchangeFailed(String requestId, String errorText) {
        loadingFailed(requestId, errorText);
    }

    @Override // com.facebook.stetho.inspector.network.NetworkEventReporter
    public void responseReadFinished(String requestId) {
        loadingFinished(requestId);
    }

    private void loadingFinished(String requestId) {
        NetworkPeerManager peerManager = getPeerManagerIfEnabled();
        if (peerManager != null) {
            Network.LoadingFinishedParams finishedParams = new Network.LoadingFinishedParams();
            finishedParams.requestId = requestId;
            finishedParams.timestamp = stethoNow() / 1000.0d;
            peerManager.sendNotificationToPeers("Network.loadingFinished", finishedParams);
        }
    }

    @Override // com.facebook.stetho.inspector.network.NetworkEventReporter
    public void responseReadFailed(String requestId, String errorText) {
        loadingFailed(requestId, errorText);
    }

    private void loadingFailed(String requestId, String errorText) {
        NetworkPeerManager peerManager = getPeerManagerIfEnabled();
        if (peerManager != null) {
            Network.LoadingFailedParams failedParams = new Network.LoadingFailedParams();
            failedParams.requestId = requestId;
            failedParams.timestamp = stethoNow() / 1000.0d;
            failedParams.errorText = errorText;
            failedParams.type = Page.ResourceType.OTHER;
            peerManager.sendNotificationToPeers("Network.loadingFailed", failedParams);
        }
    }

    @Override // com.facebook.stetho.inspector.network.NetworkEventReporter
    public void dataSent(String requestId, int dataLength, int encodedDataLength) {
        dataReceived(requestId, dataLength, encodedDataLength);
    }

    @Override // com.facebook.stetho.inspector.network.NetworkEventReporter
    public void dataReceived(String requestId, int dataLength, int encodedDataLength) {
        NetworkPeerManager peerManager = getPeerManagerIfEnabled();
        if (peerManager != null) {
            Network.DataReceivedParams dataReceivedParams = new Network.DataReceivedParams();
            dataReceivedParams.requestId = requestId;
            dataReceivedParams.timestamp = stethoNow() / 1000.0d;
            dataReceivedParams.dataLength = dataLength;
            dataReceivedParams.encodedDataLength = encodedDataLength;
            peerManager.sendNotificationToPeers("Network.dataReceived", dataReceivedParams);
        }
    }

    @Nullable
    private String getContentType(NetworkEventReporter.InspectorHeaders headers) {
        return headers.firstHeaderValue(HttpHeaders.CONTENT_TYPE);
    }

    private static JSONObject formatHeadersAsJSON(NetworkEventReporter.InspectorHeaders headers) {
        JSONObject json = new JSONObject();
        for (int i = 0; i < headers.headerCount(); i++) {
            String name = headers.headerName(i);
            String value = headers.headerValue(i);
            try {
                if (json.has(name)) {
                    json.put(name, json.getString(name) + "\n" + value);
                } else {
                    json.put(name, value);
                }
            } catch (JSONException e) {
                throw new RuntimeException(e);
            }
        }
        return json;
    }

    @Nonnull
    private ResourceTypeHelper getResourceTypeHelper() {
        if (this.mResourceTypeHelper == null) {
            this.mResourceTypeHelper = new ResourceTypeHelper();
        }
        return this.mResourceTypeHelper;
    }

    private static long stethoNow() {
        return SystemClock.elapsedRealtime();
    }
}
