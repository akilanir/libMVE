package retrofit;

import com.fasterxml.jackson.databind.ObjectReader;
import com.squareup.okhttp.ResponseBody;
import java.io.IOException;
import java.io.Reader;

/* loaded from: converter-jackson-2.0.0-beta2.jar:retrofit/JacksonResponseBodyConverter.class */
final class JacksonResponseBodyConverter<T> implements Converter<ResponseBody, T> {
    private final ObjectReader adapter;

    JacksonResponseBodyConverter(ObjectReader adapter) {
        this.adapter = adapter;
    }

    public T convert(ResponseBody responseBody) throws IOException {
        Reader charStream = responseBody.charStream();
        try {
            T t = (T) this.adapter.readValue(charStream);
            Utils.closeQuietly(charStream);
            return t;
        } catch (Throwable th) {
            Utils.closeQuietly(charStream);
            throw th;
        }
    }
}
