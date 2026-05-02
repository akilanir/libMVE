package com.facebook.stetho.inspector.protocol.module;

import android.content.Context;
import com.facebook.stetho.BuildConfig;
import com.facebook.stetho.common.LogUtil;
import com.facebook.stetho.inspector.console.RuntimeRepl;
import com.facebook.stetho.inspector.console.RuntimeReplFactory;
import com.facebook.stetho.inspector.helper.ObjectIdMapper;
import com.facebook.stetho.inspector.jsonrpc.DisconnectReceiver;
import com.facebook.stetho.inspector.jsonrpc.JsonRpcException;
import com.facebook.stetho.inspector.jsonrpc.JsonRpcPeer;
import com.facebook.stetho.inspector.jsonrpc.JsonRpcResult;
import com.facebook.stetho.inspector.jsonrpc.protocol.JsonRpcError;
import com.facebook.stetho.inspector.protocol.ChromeDevtoolsDomain;
import com.facebook.stetho.inspector.protocol.ChromeDevtoolsMethod;
import com.facebook.stetho.inspector.runtime.RhinoDetectingRuntimeReplFactory;
import com.facebook.stetho.json.ObjectMapper;
import com.facebook.stetho.json.annotation.JsonProperty;
import com.facebook.stetho.json.annotation.JsonValue;
import java.lang.reflect.Array;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Runtime.class */
public class Runtime implements ChromeDevtoolsDomain {
    private final ObjectMapper mObjectMapper;
    private static final Map<JsonRpcPeer, Session> sSessions = Collections.synchronizedMap(new HashMap());
    private final RuntimeReplFactory mReplFactory;

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject.class */
    public static class RemoteObject {

        @JsonProperty(required = true)
        public ObjectType type;

        @JsonProperty
        public ObjectSubType subtype;

        @JsonProperty
        public Object value;

        @JsonProperty
        public String className;

        @JsonProperty
        public String description;

        @JsonProperty
        public String objectId;
    }

    @Deprecated
    public Runtime() {
        this(new RuntimeReplFactory() { // from class: com.facebook.stetho.inspector.protocol.module.Runtime.1
            @Override // com.facebook.stetho.inspector.console.RuntimeReplFactory
            public RuntimeRepl newInstance() {
                return new RuntimeRepl() { // from class: com.facebook.stetho.inspector.protocol.module.Runtime.1.1
                    @Override // com.facebook.stetho.inspector.console.RuntimeRepl
                    public Object evaluate(String expression) throws Throwable {
                        return "Not supported with legacy Runtime module";
                    }
                };
            }
        });
    }

    public Runtime(Context context) {
        this(new RhinoDetectingRuntimeReplFactory(context));
    }

    public Runtime(RuntimeReplFactory replFactory) {
        this.mObjectMapper = new ObjectMapper();
        this.mReplFactory = replFactory;
    }

    public static int mapObject(JsonRpcPeer peer, Object object) {
        return getSession(peer).getObjects().putObject(object);
    }

    @Nonnull
    private static synchronized Session getSession(final JsonRpcPeer peer) {
        Session session = sSessions.get(peer);
        if (session == null) {
            session = new Session();
            sSessions.put(peer, session);
            peer.registerDisconnectReceiver(new DisconnectReceiver() { // from class: com.facebook.stetho.inspector.protocol.module.Runtime.2
                @Override // com.facebook.stetho.inspector.jsonrpc.DisconnectReceiver
                public void onDisconnect() {
                    Runtime.sSessions.remove(peer);
                }
            });
        }
        return session;
    }

    @ChromeDevtoolsMethod
    public void releaseObject(JsonRpcPeer peer, JSONObject params) throws JSONException {
        String objectId = params.getString("objectId");
        getSession(peer).getObjects().removeObjectById(Integer.parseInt(objectId));
    }

    @ChromeDevtoolsMethod
    public void releaseObjectGroup(JsonRpcPeer peer, JSONObject params) {
        LogUtil.w("Ignoring request to releaseObjectGroup: " + params);
    }

    @ChromeDevtoolsMethod
    public CallFunctionOnResponse callFunctionOn(JsonRpcPeer peer, JSONObject params) throws JsonRpcException {
        CallFunctionOnRequest args = (CallFunctionOnRequest) this.mObjectMapper.convertValue(params, CallFunctionOnRequest.class);
        Session session = getSession(peer);
        Object object = session.getObjectOrThrow(args.objectId);
        if (!args.functionDeclaration.startsWith("function protoList(")) {
            throw new JsonRpcException(new JsonRpcError(JsonRpcError.ErrorCode.INTERNAL_ERROR, "Expected protoList, got: " + args.functionDeclaration, null));
        }
        ObjectProtoContainer objectContainer = new ObjectProtoContainer(object);
        RemoteObject result = new RemoteObject();
        result.type = ObjectType.OBJECT;
        result.subtype = ObjectSubType.NODE;
        result.className = object.getClass().getName();
        result.description = getPropertyClassName(object);
        result.objectId = String.valueOf(session.getObjects().putObject(objectContainer));
        CallFunctionOnResponse response = new CallFunctionOnResponse();
        response.result = result;
        response.wasThrown = false;
        return response;
    }

    @ChromeDevtoolsMethod
    public JsonRpcResult evaluate(JsonRpcPeer peer, JSONObject params) {
        return getSession(peer).evaluate(this.mReplFactory, params);
    }

    @ChromeDevtoolsMethod
    public JsonRpcResult getProperties(JsonRpcPeer peer, JSONObject params) throws JsonRpcException {
        return getSession(peer).getProperties(params);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static String getPropertyClassName(Object o) {
        String name = o.getClass().getSimpleName();
        if (name == null || name.length() == 0) {
            name = o.getClass().getName();
        }
        return name;
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Runtime$ObjectProtoContainer.class */
    private static class ObjectProtoContainer {
        public final Object object;

        public ObjectProtoContainer(Object object) {
            this.object = object;
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Runtime$Session.class */
    private static class Session {
        private final ObjectIdMapper mObjects;
        private final ObjectMapper mObjectMapper;

        @Nullable
        private RuntimeRepl mRepl;

        private Session() {
            this.mObjects = new ObjectIdMapper();
            this.mObjectMapper = new ObjectMapper();
        }

        public ObjectIdMapper getObjects() {
            return this.mObjects;
        }

        public Object getObjectOrThrow(String objectId) throws JsonRpcException {
            Object object = getObjects().getObjectForId(Integer.parseInt(objectId));
            if (object == null) {
                throw new JsonRpcException(new JsonRpcError(JsonRpcError.ErrorCode.INVALID_REQUEST, "No object found for " + objectId, null));
            }
            return object;
        }

        public RemoteObject objectForRemote(Object value) {
            RemoteObject result = new RemoteObject();
            if (value == null) {
                result.type = ObjectType.OBJECT;
                result.subtype = ObjectSubType.NULL;
                result.value = JSONObject.NULL;
            } else if (value instanceof Boolean) {
                result.type = ObjectType.BOOLEAN;
                result.value = value;
            } else if (value instanceof Number) {
                result.type = ObjectType.NUMBER;
                result.value = value;
            } else if (value instanceof Character) {
                result.type = ObjectType.NUMBER;
                result.value = Integer.valueOf(((Character) value).charValue());
            } else if (value instanceof String) {
                result.type = ObjectType.STRING;
                result.value = String.valueOf(value);
            } else {
                result.type = ObjectType.OBJECT;
                result.className = "What??";
                result.objectId = String.valueOf(this.mObjects.putObject(value));
                if (value.getClass().isArray()) {
                    result.description = "array";
                } else if (value instanceof List) {
                    result.description = "List";
                } else if (value instanceof Set) {
                    result.description = "Set";
                } else if (value instanceof Map) {
                    result.description = "Map";
                } else {
                    result.description = Runtime.getPropertyClassName(value);
                }
            }
            return result;
        }

        public EvaluateResponse evaluate(RuntimeReplFactory replFactory, JSONObject params) {
            EvaluateRequest request = (EvaluateRequest) this.mObjectMapper.convertValue(params, EvaluateRequest.class);
            try {
                if (!request.objectGroup.equals("console")) {
                    return buildExceptionResponse("Not supported by FAB");
                }
                RuntimeRepl repl = getRepl(replFactory);
                Object result = repl.evaluate(request.expression);
                return buildNormalResponse(result);
            } catch (Throwable t) {
                return buildExceptionResponse(t);
            }
        }

        @Nonnull
        private synchronized RuntimeRepl getRepl(RuntimeReplFactory replFactory) {
            if (this.mRepl == null) {
                this.mRepl = replFactory.newInstance();
            }
            return this.mRepl;
        }

        private EvaluateResponse buildNormalResponse(Object retval) {
            EvaluateResponse response = new EvaluateResponse();
            response.wasThrown = false;
            response.result = objectForRemote(retval);
            return response;
        }

        private EvaluateResponse buildExceptionResponse(Object retval) {
            EvaluateResponse response = new EvaluateResponse();
            response.wasThrown = true;
            response.result = objectForRemote(retval);
            response.exceptionDetails = new ExceptionDetails();
            response.exceptionDetails.text = retval.toString();
            return response;
        }

        public GetPropertiesResponse getProperties(JSONObject params) throws JsonRpcException {
            GetPropertiesRequest request = (GetPropertiesRequest) this.mObjectMapper.convertValue(params, GetPropertiesRequest.class);
            if (!request.ownProperties) {
                GetPropertiesResponse response = new GetPropertiesResponse();
                response.result = new ArrayList();
                return response;
            }
            Object object = getObjectOrThrow(request.objectId);
            if (object.getClass().isArray()) {
                object = arrayToList(object);
            }
            if (object instanceof ObjectProtoContainer) {
                return getPropertiesForProtoContainer((ObjectProtoContainer) object);
            }
            if (object instanceof List) {
                return getPropertiesForIterable((List) object, true);
            }
            if (object instanceof Set) {
                return getPropertiesForIterable((Set) object, false);
            }
            if (object instanceof Map) {
                return getPropertiesForMap(object);
            }
            return getPropertiesForObject(object);
        }

        private List<?> arrayToList(Object object) {
            Class<?> type = object.getClass();
            if (!type.isArray()) {
                throw new IllegalArgumentException("Argument must be an array.  Was " + type);
            }
            Class<?> component = type.getComponentType();
            if (!component.isPrimitive()) {
                return Arrays.asList((Object[]) object);
            }
            int length = Array.getLength(object);
            List<Object> ret = new ArrayList<>(length);
            for (int i = 0; i < length; i++) {
                ret.add(Array.get(object, i));
            }
            return ret;
        }

        private GetPropertiesResponse getPropertiesForProtoContainer(ObjectProtoContainer proto) {
            Object target = proto.object;
            RemoteObject protoRemote = new RemoteObject();
            protoRemote.type = ObjectType.OBJECT;
            protoRemote.subtype = ObjectSubType.NODE;
            protoRemote.className = target.getClass().getName();
            protoRemote.description = Runtime.getPropertyClassName(target);
            protoRemote.objectId = String.valueOf(this.mObjects.putObject(target));
            PropertyDescriptor descriptor = new PropertyDescriptor();
            descriptor.name = "1";
            descriptor.value = protoRemote;
            GetPropertiesResponse response = new GetPropertiesResponse();
            response.result = new ArrayList(1);
            response.result.add(descriptor);
            return response;
        }

        private GetPropertiesResponse getPropertiesForIterable(Iterable<?> object, boolean enumerate) {
            String str;
            GetPropertiesResponse response = new GetPropertiesResponse();
            List<PropertyDescriptor> properties = new ArrayList<>();
            int index = 0;
            for (Object value : object) {
                PropertyDescriptor property = new PropertyDescriptor();
                if (enumerate) {
                    int i = index;
                    index++;
                    str = String.valueOf(i);
                } else {
                    str = null;
                }
                property.name = str;
                property.value = objectForRemote(value);
                properties.add(property);
            }
            response.result = properties;
            return response;
        }

        private GetPropertiesResponse getPropertiesForMap(Object object) {
            GetPropertiesResponse response = new GetPropertiesResponse();
            List<PropertyDescriptor> properties = new ArrayList<>();
            for (Map.Entry<?, ?> entry : ((Map) object).entrySet()) {
                PropertyDescriptor property = new PropertyDescriptor();
                property.name = String.valueOf(entry.getKey());
                property.value = objectForRemote(entry.getValue());
                properties.add(property);
            }
            response.result = properties;
            return response;
        }

        private GetPropertiesResponse getPropertiesForObject(Object object) {
            GetPropertiesResponse response = new GetPropertiesResponse();
            List<PropertyDescriptor> properties = new ArrayList<>();
            Class<?> cls = object.getClass();
            while (true) {
                Class<?> declaringClass = cls;
                if (declaringClass != null) {
                    List<Field> fields = new ArrayList<>(Arrays.asList(declaringClass.getDeclaredFields()));
                    Collections.reverse(fields);
                    String prefix = declaringClass == object.getClass() ? BuildConfig.FLAVOR : declaringClass.getSimpleName() + ".";
                    for (Field field : fields) {
                        if (!Modifier.isStatic(field.getModifiers())) {
                            field.setAccessible(true);
                            try {
                                Object fieldValue = field.get(object);
                                PropertyDescriptor property = new PropertyDescriptor();
                                property.name = prefix + field.getName();
                                property.value = objectForRemote(fieldValue);
                                properties.add(property);
                            } catch (IllegalAccessException e) {
                                throw new RuntimeException(e);
                            }
                        }
                    }
                    cls = declaringClass.getSuperclass();
                } else {
                    Collections.reverse(properties);
                    response.result = properties;
                    return response;
                }
            }
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Runtime$CallFunctionOnRequest.class */
    private static class CallFunctionOnRequest {

        @JsonProperty
        public String objectId;

        @JsonProperty
        public String functionDeclaration;

        @JsonProperty
        public List<CallArgument> arguments;

        @JsonProperty(required = false)
        public Boolean doNotPauseOnExceptionsAndMuteConsole;

        @JsonProperty(required = false)
        public Boolean returnByValue;

        @JsonProperty(required = false)
        public Boolean generatePreview;

        private CallFunctionOnRequest() {
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Runtime$CallFunctionOnResponse.class */
    private static class CallFunctionOnResponse implements JsonRpcResult {

        @JsonProperty
        public RemoteObject result;

        @JsonProperty(required = false)
        public Boolean wasThrown;

        private CallFunctionOnResponse() {
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Runtime$CallArgument.class */
    private static class CallArgument {

        @JsonProperty(required = false)
        public Object value;

        @JsonProperty(required = false)
        public String objectId;

        @JsonProperty(required = false)
        public ObjectType type;

        private CallArgument() {
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Runtime$GetPropertiesRequest.class */
    private static class GetPropertiesRequest implements JsonRpcResult {

        @JsonProperty(required = true)
        public boolean ownProperties;

        @JsonProperty(required = true)
        public String objectId;

        private GetPropertiesRequest() {
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Runtime$GetPropertiesResponse.class */
    private static class GetPropertiesResponse implements JsonRpcResult {

        @JsonProperty(required = true)
        public List<PropertyDescriptor> result;

        private GetPropertiesResponse() {
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Runtime$EvaluateRequest.class */
    private static class EvaluateRequest implements JsonRpcResult {

        @JsonProperty(required = true)
        public String objectGroup;

        @JsonProperty(required = true)
        public String expression;

        private EvaluateRequest() {
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Runtime$EvaluateResponse.class */
    private static class EvaluateResponse implements JsonRpcResult {

        @JsonProperty(required = true)
        public RemoteObject result;

        @JsonProperty(required = true)
        public boolean wasThrown;

        @JsonProperty
        public ExceptionDetails exceptionDetails;

        private EvaluateResponse() {
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Runtime$ExceptionDetails.class */
    private static class ExceptionDetails {

        @JsonProperty(required = true)
        public String text;

        private ExceptionDetails() {
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Runtime$PropertyDescriptor.class */
    private static class PropertyDescriptor {

        @JsonProperty(required = true)
        public String name;

        @JsonProperty(required = true)
        public RemoteObject value;

        @JsonProperty(required = true)
        public final boolean isOwn = true;

        @JsonProperty(required = true)
        public final boolean configurable = false;

        @JsonProperty(required = true)
        public final boolean enumerable = true;

        @JsonProperty(required = true)
        public final boolean writable = false;

        private PropertyDescriptor() {
            this.isOwn = true;
            this.configurable = false;
            this.enumerable = true;
            this.writable = false;
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Runtime$ObjectType.class */
    public enum ObjectType {
        OBJECT("object"),
        FUNCTION("function"),
        UNDEFINED("undefined"),
        STRING("string"),
        NUMBER("number"),
        BOOLEAN("boolean"),
        SYMBOL("symbol");

        private final String mProtocolValue;

        ObjectType(String protocolValue) {
            this.mProtocolValue = protocolValue;
        }

        @JsonValue
        public String getProtocolValue() {
            return this.mProtocolValue;
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType.class */
    public enum ObjectSubType {
        ARRAY("array"),
        NULL("null"),
        NODE("node"),
        REGEXP("regexp"),
        DATE("date"),
        MAP("map"),
        SET("set"),
        ITERATOR("iterator"),
        GENERATOR("generator"),
        ERROR("error");

        private final String mProtocolValue;

        ObjectSubType(String protocolValue) {
            this.mProtocolValue = protocolValue;
        }

        @JsonValue
        public String getProtocolValue() {
            return this.mProtocolValue;
        }
    }
}
