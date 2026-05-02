package retrofit;

import com.squareup.okhttp.RequestBody;
import com.squareup.okhttp.ResponseBody;
import java.io.IOException;
import java.lang.annotation.Annotation;
import java.lang.reflect.Type;

/* loaded from: retrofit-2.0.0-beta2.jar:retrofit/Converter.class */
public interface Converter<F, T> {
    T convert(F f) throws IOException;

    /* loaded from: retrofit-2.0.0-beta2.jar:retrofit/Converter$Factory.class */
    public static abstract class Factory {
        public Converter<ResponseBody, ?> fromResponseBody(Type type, Annotation[] annotations) {
            return null;
        }

        public Converter<?, RequestBody> toRequestBody(Type type, Annotation[] annotations) {
            return null;
        }
    }
}
