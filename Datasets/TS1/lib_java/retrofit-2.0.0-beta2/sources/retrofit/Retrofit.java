package retrofit;

import com.squareup.okhttp.HttpUrl;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.RequestBody;
import com.squareup.okhttp.ResponseBody;
import java.lang.annotation.Annotation;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executor;
import retrofit.CallAdapter;
import retrofit.Converter;

/* loaded from: retrofit-2.0.0-beta2.jar:retrofit/Retrofit.class */
public final class Retrofit {
    private final Map<Method, MethodHandler<?>> methodHandlerCache;
    private final OkHttpClient client;
    private final BaseUrl baseUrl;
    private final List<Converter.Factory> converterFactories;
    private final List<CallAdapter.Factory> adapterFactories;
    private final Executor callbackExecutor;
    private final boolean validateEagerly;

    private Retrofit(OkHttpClient client, BaseUrl baseUrl, List<Converter.Factory> converterFactories, List<CallAdapter.Factory> adapterFactories, Executor callbackExecutor, boolean validateEagerly) {
        this.methodHandlerCache = new LinkedHashMap();
        this.client = client;
        this.baseUrl = baseUrl;
        this.converterFactories = converterFactories;
        this.adapterFactories = adapterFactories;
        this.callbackExecutor = callbackExecutor;
        this.validateEagerly = validateEagerly;
    }

    public <T> T create(final Class<T> cls) {
        Utils.validateServiceInterface(cls);
        if (this.validateEagerly) {
            eagerlyValidateMethods(cls);
        }
        return (T) Proxy.newProxyInstance(cls.getClassLoader(), new Class[]{cls}, new InvocationHandler() { // from class: retrofit.Retrofit.1
            private final Platform platform = Platform.get();

            @Override // java.lang.reflect.InvocationHandler
            public Object invoke(Object proxy, Method method, Object... args) throws Throwable {
                if (method.getDeclaringClass() == Object.class) {
                    return method.invoke(this, args);
                }
                if (this.platform.isDefaultMethod(method)) {
                    return this.platform.invokeDefaultMethod(method, cls, proxy, args);
                }
                return Retrofit.this.loadMethodHandler(method).invoke(args);
            }
        });
    }

    private void eagerlyValidateMethods(Class<?> service) {
        Platform platform = Platform.get();
        for (Method method : service.getDeclaredMethods()) {
            if (!platform.isDefaultMethod(method)) {
                loadMethodHandler(method);
            }
        }
    }

    MethodHandler<?> loadMethodHandler(Method method) {
        MethodHandler<?> handler;
        synchronized (this.methodHandlerCache) {
            handler = this.methodHandlerCache.get(method);
            if (handler == null) {
                handler = MethodHandler.create(this, method);
                this.methodHandlerCache.put(method, handler);
            }
        }
        return handler;
    }

    public OkHttpClient client() {
        return this.client;
    }

    public BaseUrl baseUrl() {
        return this.baseUrl;
    }

    public List<CallAdapter.Factory> callAdapterFactories() {
        return Collections.unmodifiableList(this.adapterFactories);
    }

    public CallAdapter<?> callAdapter(Type returnType, Annotation[] annotations) {
        return nextCallAdapter(null, returnType, annotations);
    }

    public CallAdapter<?> nextCallAdapter(CallAdapter.Factory skipPast, Type returnType, Annotation[] annotations) {
        Utils.checkNotNull(returnType, "returnType == null");
        Utils.checkNotNull(annotations, "annotations == null");
        int start = this.adapterFactories.indexOf(skipPast) + 1;
        int count = this.adapterFactories.size();
        for (int i = start; i < count; i++) {
            CallAdapter<?> adapter = this.adapterFactories.get(i).get(returnType, annotations, this);
            if (adapter != null) {
                return adapter;
            }
        }
        StringBuilder builder = new StringBuilder("Could not locate call adapter for ").append(returnType).append(". Tried:");
        int count2 = this.adapterFactories.size();
        for (int i2 = start; i2 < count2; i2++) {
            builder.append("\n * ").append(this.adapterFactories.get(i2).getClass().getName());
        }
        if (skipPast != null) {
            builder.append("\nSkipped:");
            for (int i3 = 0; i3 < start; i3++) {
                builder.append("\n * ").append(this.adapterFactories.get(i3).getClass().getName());
            }
        }
        throw new IllegalArgumentException(builder.toString());
    }

    public List<Converter.Factory> converterFactories() {
        return Collections.unmodifiableList(this.converterFactories);
    }

    public <T> Converter<T, RequestBody> requestConverter(Type type, Annotation[] annotationArr) {
        Utils.checkNotNull(type, "type == null");
        Utils.checkNotNull(annotationArr, "annotations == null");
        int size = this.converterFactories.size();
        for (int i = 0; i < size; i++) {
            Converter<T, RequestBody> converter = (Converter<T, RequestBody>) this.converterFactories.get(i).toRequestBody(type, annotationArr);
            if (converter != null) {
                return converter;
            }
        }
        StringBuilder append = new StringBuilder("Could not locate RequestBody converter for ").append(type).append(". Tried:");
        Iterator<Converter.Factory> it = this.converterFactories.iterator();
        while (it.hasNext()) {
            append.append("\n * ").append(it.next().getClass().getName());
        }
        throw new IllegalArgumentException(append.toString());
    }

    public <T> Converter<ResponseBody, T> responseConverter(Type type, Annotation[] annotationArr) {
        Utils.checkNotNull(type, "type == null");
        Utils.checkNotNull(annotationArr, "annotations == null");
        int size = this.converterFactories.size();
        for (int i = 0; i < size; i++) {
            Converter<ResponseBody, T> converter = (Converter<ResponseBody, T>) this.converterFactories.get(i).fromResponseBody(type, annotationArr);
            if (converter != null) {
                return converter;
            }
        }
        StringBuilder append = new StringBuilder("Could not locate ResponseBody converter for ").append(type).append(". Tried:");
        Iterator<Converter.Factory> it = this.converterFactories.iterator();
        while (it.hasNext()) {
            append.append("\n * ").append(it.next().getClass().getName());
        }
        throw new IllegalArgumentException(append.toString());
    }

    public Executor callbackExecutor() {
        return this.callbackExecutor;
    }

    /* loaded from: retrofit-2.0.0-beta2.jar:retrofit/Retrofit$Builder.class */
    public static final class Builder {
        private OkHttpClient client;
        private BaseUrl baseUrl;
        private List<Converter.Factory> converterFactories = new ArrayList();
        private List<CallAdapter.Factory> adapterFactories = new ArrayList();
        private Executor callbackExecutor;
        private boolean validateEagerly;

        public Builder() {
            this.converterFactories.add(new BuiltInConverters());
        }

        public Builder client(OkHttpClient client) {
            this.client = (OkHttpClient) Utils.checkNotNull(client, "client == null");
            return this;
        }

        public Builder baseUrl(String baseUrl) {
            Utils.checkNotNull(baseUrl, "baseUrl == null");
            HttpUrl httpUrl = HttpUrl.parse(baseUrl);
            if (httpUrl == null) {
                throw new IllegalArgumentException("Illegal URL: " + baseUrl);
            }
            return baseUrl(httpUrl);
        }

        public Builder baseUrl(final HttpUrl baseUrl) {
            Utils.checkNotNull(baseUrl, "baseUrl == null");
            return baseUrl(new BaseUrl() { // from class: retrofit.Retrofit.Builder.1
                @Override // retrofit.BaseUrl
                public HttpUrl url() {
                    return baseUrl;
                }
            });
        }

        public Builder baseUrl(BaseUrl baseUrl) {
            this.baseUrl = (BaseUrl) Utils.checkNotNull(baseUrl, "baseUrl == null");
            return this;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public Builder addConverterFactory(Converter.Factory converterFactory) {
            this.converterFactories.add(Utils.checkNotNull(converterFactory, "converterFactory == null"));
            return this;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public Builder addCallAdapterFactory(CallAdapter.Factory factory) {
            this.adapterFactories.add(Utils.checkNotNull(factory, "factory == null"));
            return this;
        }

        public Builder callbackExecutor(Executor callbackExecutor) {
            this.callbackExecutor = (Executor) Utils.checkNotNull(callbackExecutor, "callbackExecutor == null");
            return this;
        }

        public Builder validateEagerly() {
            this.validateEagerly = true;
            return this;
        }

        public Retrofit build() {
            if (this.baseUrl == null) {
                throw new IllegalStateException("Base URL required.");
            }
            OkHttpClient client = this.client;
            if (client == null) {
                client = new OkHttpClient();
            }
            List<CallAdapter.Factory> adapterFactories = new ArrayList<>(this.adapterFactories);
            adapterFactories.add(Platform.get().defaultCallAdapterFactory(this.callbackExecutor));
            List<Converter.Factory> converterFactories = new ArrayList<>(this.converterFactories);
            return new Retrofit(client, this.baseUrl, converterFactories, adapterFactories, this.callbackExecutor, this.validateEagerly);
        }
    }
}
