package retrofit;

import com.fasterxml.jackson.databind.ObjectWriter;
import com.squareup.okhttp.MediaType;
import com.squareup.okhttp.RequestBody;
import java.io.IOException;

/* loaded from: converter-jackson-2.0.0-beta2.jar:retrofit/JacksonRequestBodyConverter.class */
final class JacksonRequestBodyConverter<T> implements Converter<T, RequestBody> {
    private static final MediaType MEDIA_TYPE = MediaType.parse("application/json; charset=UTF-8");
    private final ObjectWriter adapter;

    /* JADX WARN: Multi-variable type inference failed */
    /* renamed from: convert, reason: collision with other method in class */
    public /* bridge */ /* synthetic */ Object m1convert(Object obj) throws IOException {
        return convert((JacksonRequestBodyConverter<T>) obj);
    }

    JacksonRequestBodyConverter(ObjectWriter adapter) {
        this.adapter = adapter;
    }

    public RequestBody convert(T value) throws IOException {
        byte[] bytes = this.adapter.writeValueAsBytes(value);
        return RequestBody.create(MEDIA_TYPE, bytes);
    }
}
