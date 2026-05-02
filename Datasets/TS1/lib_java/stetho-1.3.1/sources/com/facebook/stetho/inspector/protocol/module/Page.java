package com.facebook.stetho.inspector.protocol.module;

import android.content.Context;
import android.support.annotation.Nullable;
import com.facebook.stetho.BuildConfig;
import com.facebook.stetho.common.ProcessUtil;
import com.facebook.stetho.inspector.domstorage.SharedPreferencesHelper;
import com.facebook.stetho.inspector.jsonrpc.JsonRpcPeer;
import com.facebook.stetho.inspector.jsonrpc.JsonRpcResult;
import com.facebook.stetho.inspector.protocol.ChromeDevtoolsDomain;
import com.facebook.stetho.inspector.protocol.ChromeDevtoolsMethod;
import com.facebook.stetho.inspector.protocol.module.Console;
import com.facebook.stetho.inspector.screencast.ScreencastDispatcher;
import com.facebook.stetho.json.ObjectMapper;
import com.facebook.stetho.json.annotation.JsonProperty;
import com.facebook.stetho.json.annotation.JsonValue;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import org.json.JSONObject;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Page.class */
public class Page implements ChromeDevtoolsDomain {
    private final Context mContext;
    private final ObjectMapper mObjectMapper = new ObjectMapper();

    @Nullable
    private ScreencastDispatcher mScreencastDispatcher;

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Page$ScreencastFrameEvent.class */
    public static class ScreencastFrameEvent {

        @JsonProperty(required = true)
        public String data;

        @JsonProperty(required = true)
        public ScreencastFrameEventMetadata metadata;
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Page$ScreencastFrameEventMetadata.class */
    public static class ScreencastFrameEventMetadata {

        @JsonProperty(required = true)
        public int pageScaleFactor;

        @JsonProperty(required = true)
        public int offsetTop;

        @JsonProperty(required = true)
        public int deviceWidth;

        @JsonProperty(required = true)
        public int deviceHeight;

        @JsonProperty(required = true)
        public int scrollOffsetX;

        @JsonProperty(required = true)
        public int scrollOffsetY;
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Page$StartScreencastRequest.class */
    public static class StartScreencastRequest {

        @JsonProperty
        public String format;

        @JsonProperty
        public int quality;

        @JsonProperty
        public int maxWidth;

        @JsonProperty
        public int maxHeight;
    }

    public Page(Context context) {
        this.mContext = context;
    }

    @ChromeDevtoolsMethod
    public void enable(JsonRpcPeer peer, JSONObject params) {
        notifyExecutionContexts(peer);
        sendWelcomeMessage(peer);
    }

    @ChromeDevtoolsMethod
    public void disable(JsonRpcPeer peer, JSONObject params) {
    }

    private void notifyExecutionContexts(JsonRpcPeer peer) {
        ExecutionContextDescription context = new ExecutionContextDescription();
        context.frameId = "1";
        context.id = 1;
        ExecutionContextCreatedParams params = new ExecutionContextCreatedParams();
        params.context = context;
        peer.invokeMethod("Runtime.executionContextCreated", params, null);
    }

    private void sendWelcomeMessage(JsonRpcPeer peer) {
        Console.ConsoleMessage message = new Console.ConsoleMessage();
        message.source = Console.MessageSource.JAVASCRIPT;
        message.level = Console.MessageLevel.LOG;
        message.text = "_____/\\\\\\\\\\\\\\\\\\\\\\_______________________________________________/\\\\\\_______________________\n ___/\\\\\\/////////\\\\\\____________________________________________\\/\\\\\\_______________________\n  __\\//\\\\\\______\\///______/\\\\\\_________________________/\\\\\\______\\/\\\\\\_______________________\n   ___\\////\\\\\\__________/\\\\\\\\\\\\\\\\\\\\\\_____/\\\\\\\\\\\\\\\\___/\\\\\\\\\\\\\\\\\\\\\\_\\/\\\\\\_____________/\\\\\\\\\\____\n    ______\\////\\\\\\______\\////\\\\\\////____/\\\\\\/////\\\\\\_\\////\\\\\\////__\\/\\\\\\\\\\\\\\\\\\\\____/\\\\\\///\\\\\\__\n     _________\\////\\\\\\______\\/\\\\\\_______/\\\\\\\\\\\\\\\\\\\\\\_____\\/\\\\\\______\\/\\\\\\/////\\\\\\__/\\\\\\__\\//\\\\\\_\n      __/\\\\\\______\\//\\\\\\_____\\/\\\\\\_/\\\\__\\//\\\\///////______\\/\\\\\\_/\\\\__\\/\\\\\\___\\/\\\\\\_\\//\\\\\\__/\\\\\\__\n       _\\///\\\\\\\\\\\\\\\\\\\\\\/______\\//\\\\\\\\\\____\\//\\\\\\\\\\\\\\\\\\\\____\\//\\\\\\\\\\___\\/\\\\\\___\\/\\\\\\__\\///\\\\\\\\\\/___\n        ___\\///////////_________\\/////______\\//////////______\\/////____\\///____\\///_____\\/////_____\n         Welcome to Stetho\n          Attached to " + ProcessUtil.getProcessName() + "\n";
        Console.MessageAddedRequest messageAddedRequest = new Console.MessageAddedRequest();
        messageAddedRequest.message = message;
        peer.invokeMethod("Console.messageAdded", messageAddedRequest, null);
    }

    @ChromeDevtoolsMethod
    public JsonRpcResult getResourceTree(JsonRpcPeer peer, JSONObject params) {
        List<String> prefsTags = SharedPreferencesHelper.getSharedPreferenceTags(this.mContext);
        Iterator<String> prefsTagsIter = prefsTags.iterator();
        FrameResourceTree tree = createSimpleFrameResourceTree("1", null, "Stetho", prefsTagsIter.hasNext() ? prefsTagsIter.next() : BuildConfig.FLAVOR);
        if (tree.childFrames == null) {
            tree.childFrames = new ArrayList();
        }
        int nextChildFrameId = 1;
        while (prefsTagsIter.hasNext()) {
            int i = nextChildFrameId;
            nextChildFrameId++;
            String frameId = "1." + i;
            String prefsTag = prefsTagsIter.next();
            FrameResourceTree child = createSimpleFrameResourceTree(frameId, "1", "Child #" + frameId, prefsTag);
            tree.childFrames.add(child);
        }
        GetResourceTreeParams resultParams = new GetResourceTreeParams();
        resultParams.frameTree = tree;
        return resultParams;
    }

    private static FrameResourceTree createSimpleFrameResourceTree(String id, String parentId, String name, String securityOrigin) {
        Frame frame = new Frame();
        frame.id = id;
        frame.parentId = parentId;
        frame.loaderId = "1";
        frame.name = name;
        frame.url = BuildConfig.FLAVOR;
        frame.securityOrigin = securityOrigin;
        frame.mimeType = "text/plain";
        FrameResourceTree tree = new FrameResourceTree();
        tree.frame = frame;
        tree.resources = Collections.emptyList();
        tree.childFrames = null;
        return tree;
    }

    @ChromeDevtoolsMethod
    public JsonRpcResult canScreencast(JsonRpcPeer peer, JSONObject params) {
        return new SimpleBooleanResult(true);
    }

    @ChromeDevtoolsMethod
    public JsonRpcResult hasTouchInputs(JsonRpcPeer peer, JSONObject params) {
        return new SimpleBooleanResult(false);
    }

    @ChromeDevtoolsMethod
    public void setDeviceMetricsOverride(JsonRpcPeer peer, JSONObject params) {
    }

    @ChromeDevtoolsMethod
    public void clearDeviceOrientationOverride(JsonRpcPeer peer, JSONObject params) {
    }

    @ChromeDevtoolsMethod
    public void startScreencast(JsonRpcPeer peer, JSONObject params) {
        StartScreencastRequest request = (StartScreencastRequest) this.mObjectMapper.convertValue(params, StartScreencastRequest.class);
        if (this.mScreencastDispatcher == null) {
            this.mScreencastDispatcher = new ScreencastDispatcher();
            this.mScreencastDispatcher.startScreencast(peer, request);
        }
    }

    @ChromeDevtoolsMethod
    public void stopScreencast(JsonRpcPeer peer, JSONObject params) {
        if (this.mScreencastDispatcher != null) {
            this.mScreencastDispatcher.stopScreencast();
            this.mScreencastDispatcher = null;
        }
    }

    @ChromeDevtoolsMethod
    public void screencastFrameAck(JsonRpcPeer peer, JSONObject params) {
    }

    @ChromeDevtoolsMethod
    public void clearGeolocationOverride(JsonRpcPeer peer, JSONObject params) {
    }

    @ChromeDevtoolsMethod
    public void setTouchEmulationEnabled(JsonRpcPeer peer, JSONObject params) {
    }

    @ChromeDevtoolsMethod
    public void setEmulatedMedia(JsonRpcPeer peer, JSONObject params) {
    }

    @ChromeDevtoolsMethod
    public void setShowViewportSizeOnResize(JsonRpcPeer peer, JSONObject params) {
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Page$GetResourceTreeParams.class */
    private static class GetResourceTreeParams implements JsonRpcResult {

        @JsonProperty(required = true)
        public FrameResourceTree frameTree;

        private GetResourceTreeParams() {
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Page$FrameResourceTree.class */
    private static class FrameResourceTree {

        @JsonProperty(required = true)
        public Frame frame;

        @JsonProperty
        public List<FrameResourceTree> childFrames;

        @JsonProperty(required = true)
        public List<Resource> resources;

        private FrameResourceTree() {
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Page$Frame.class */
    private static class Frame {

        @JsonProperty(required = true)
        public String id;

        @JsonProperty
        public String parentId;

        @JsonProperty(required = true)
        public String loaderId;

        @JsonProperty
        public String name;

        @JsonProperty(required = true)
        public String url;

        @JsonProperty(required = true)
        public String securityOrigin;

        @JsonProperty(required = true)
        public String mimeType;

        private Frame() {
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Page$Resource.class */
    private static class Resource {
        private Resource() {
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Page$ResourceType.class */
    public enum ResourceType {
        DOCUMENT("Document"),
        STYLESHEET("Stylesheet"),
        IMAGE("Image"),
        FONT("Font"),
        SCRIPT("Script"),
        XHR("XHR"),
        WEBSOCKET("WebSocket"),
        OTHER("Other");

        private final String mProtocolValue;

        ResourceType(String protocolValue) {
            this.mProtocolValue = protocolValue;
        }

        @JsonValue
        public String getProtocolValue() {
            return this.mProtocolValue;
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Page$ExecutionContextCreatedParams.class */
    private static class ExecutionContextCreatedParams {

        @JsonProperty(required = true)
        public ExecutionContextDescription context;

        private ExecutionContextCreatedParams() {
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Page$ExecutionContextDescription.class */
    private static class ExecutionContextDescription {

        @JsonProperty(required = true)
        public String frameId;

        @JsonProperty(required = true)
        public int id;

        private ExecutionContextDescription() {
        }
    }
}
