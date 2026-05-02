package retrofit;

import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectReader;
import com.fasterxml.jackson.databind.ObjectWriter;
import com.squareup.okhttp.RequestBody;
import com.squareup.okhttp.ResponseBody;
import java.lang.annotation.Annotation;
import java.lang.reflect.Type;
import retrofit.Converter;

/* loaded from: converter-jackson-2.0.0-beta2.jar:retrofit/JacksonConverterFactory.class */
public final class JacksonConverterFactory extends Converter.Factory {
    private final ObjectMapper mapper;

    public static JacksonConverterFactory create() {
        return create(new ObjectMapper());
    }

    public static JacksonConverterFactory create(ObjectMapper mapper) {
        return new JacksonConverterFactory(mapper);
    }

    private JacksonConverterFactory(ObjectMapper mapper) {
        if (mapper == null) {
            throw new NullPointerException("mapper == null");
        }
        this.mapper = mapper;
    }

    public Converter<ResponseBody, ?> fromResponseBody(Type type, Annotation[] annotations) {
        JavaType javaType = this.mapper.getTypeFactory().constructType(type);
        ObjectReader reader = this.mapper.reader(javaType);
        return new JacksonResponseBodyConverter(reader);
    }

    public Converter<?, RequestBody> toRequestBody(Type type, Annotation[] annotations) {
        JavaType javaType = this.mapper.getTypeFactory().constructType(type);
        ObjectWriter writer = this.mapper.writerWithType(javaType);
        return new JacksonRequestBodyConverter(writer);
    }
}
