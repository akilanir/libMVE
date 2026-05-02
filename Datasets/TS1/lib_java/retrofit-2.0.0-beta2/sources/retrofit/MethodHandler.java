package retrofit;

import com.squareup.okhttp.ResponseBody;
import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.lang.reflect.Type;

/* loaded from: retrofit-2.0.0-beta2.jar:retrofit/MethodHandler.class */
final class MethodHandler<T> {

    /* renamed from: retrofit, reason: collision with root package name */
    private final Retrofit f0retrofit;
    private final RequestFactory requestFactory;
    private final CallAdapter<T> callAdapter;
    private final Converter<ResponseBody, T> responseConverter;

    static MethodHandler<?> create(Retrofit retrofit2, Method method) {
        CallAdapter<Object> callAdapter = createCallAdapter(method, retrofit2);
        Type responseType = callAdapter.responseType();
        Converter<ResponseBody, Object> responseConverter = createResponseConverter(method, retrofit2, responseType);
        RequestFactory requestFactory = RequestFactoryParser.parse(method, responseType, retrofit2);
        return new MethodHandler<>(retrofit2, requestFactory, callAdapter, responseConverter);
    }

    private static CallAdapter<?> createCallAdapter(Method method, Retrofit retrofit2) {
        Type returnType = method.getGenericReturnType();
        if (Utils.hasUnresolvableType(returnType)) {
            throw Utils.methodError(method, "Method return type must not include a type variable or wildcard: %s", returnType);
        }
        if (returnType == Void.TYPE) {
            throw Utils.methodError(method, "Service methods cannot return void.", new Object[0]);
        }
        Annotation[] annotations = method.getAnnotations();
        try {
            return retrofit2.callAdapter(returnType, annotations);
        } catch (RuntimeException e) {
            throw Utils.methodError(e, method, "Unable to create call adapter for %s", returnType);
        }
    }

    private static Converter<ResponseBody, ?> createResponseConverter(Method method, Retrofit retrofit2, Type responseType) {
        Annotation[] annotations = method.getAnnotations();
        try {
            return retrofit2.responseConverter(responseType, annotations);
        } catch (RuntimeException e) {
            throw Utils.methodError(e, method, "Unable to create converter for %s", responseType);
        }
    }

    private MethodHandler(Retrofit retrofit2, RequestFactory requestFactory, CallAdapter<T> callAdapter, Converter<ResponseBody, T> responseConverter) {
        this.f0retrofit = retrofit2;
        this.requestFactory = requestFactory;
        this.callAdapter = callAdapter;
        this.responseConverter = responseConverter;
    }

    Object invoke(Object... args) {
        return this.callAdapter.adapt2(new OkHttpCall(this.f0retrofit, this.requestFactory, this.responseConverter, args));
    }
}
