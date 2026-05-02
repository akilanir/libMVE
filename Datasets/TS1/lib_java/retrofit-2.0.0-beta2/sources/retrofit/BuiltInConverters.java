package retrofit;

import com.squareup.okhttp.RequestBody;
import com.squareup.okhttp.ResponseBody;
import java.io.IOException;
import java.lang.annotation.Annotation;
import java.lang.reflect.Type;
import retrofit.Converter;
import retrofit.http.Streaming;

/* loaded from: retrofit-2.0.0-beta2.jar:retrofit/BuiltInConverters.class */
final class BuiltInConverters extends Converter.Factory {
    BuiltInConverters() {
    }

    @Override // retrofit.Converter.Factory
    public Converter<ResponseBody, ?> fromResponseBody(Type type, Annotation[] annotations) {
        if (ResponseBody.class.equals(type)) {
            boolean isStreaming = Utils.isAnnotationPresent(annotations, Streaming.class);
            return new OkHttpResponseBodyConverter(isStreaming);
        }
        if (Void.class.equals(type)) {
            return new VoidConverter();
        }
        return null;
    }

    @Override // retrofit.Converter.Factory
    public Converter<?, RequestBody> toRequestBody(Type type, Annotation[] annotations) {
        if ((type instanceof Class) && RequestBody.class.isAssignableFrom((Class) type)) {
            return new OkHttpRequestBodyConverter();
        }
        return null;
    }

    /* loaded from: retrofit-2.0.0-beta2.jar:retrofit/BuiltInConverters$VoidConverter.class */
    static final class VoidConverter implements Converter<ResponseBody, Void> {
        VoidConverter() {
        }

        @Override // retrofit.Converter
        public Void convert(ResponseBody value) throws IOException {
            value.close();
            return null;
        }
    }

    /* loaded from: retrofit-2.0.0-beta2.jar:retrofit/BuiltInConverters$OkHttpRequestBodyConverter.class */
    static final class OkHttpRequestBodyConverter implements Converter<RequestBody, RequestBody> {
        OkHttpRequestBodyConverter() {
        }

        @Override // retrofit.Converter
        public RequestBody convert(RequestBody value) throws IOException {
            return value;
        }
    }

    /* loaded from: retrofit-2.0.0-beta2.jar:retrofit/BuiltInConverters$OkHttpResponseBodyConverter.class */
    static final class OkHttpResponseBodyConverter implements Converter<ResponseBody, ResponseBody> {
        private final boolean isStreaming;

        OkHttpResponseBodyConverter(boolean isStreaming) {
            this.isStreaming = isStreaming;
        }

        @Override // retrofit.Converter
        public ResponseBody convert(ResponseBody value) throws IOException {
            if (this.isStreaming) {
                return value;
            }
            try {
                return Utils.readBodyToBytesIfNecessary(value);
            } finally {
                Utils.closeQuietly(value);
            }
        }
    }
}
