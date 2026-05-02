package retrofit.converter;

import java.lang.reflect.Type;
import retrofit.mime.TypedInput;
import retrofit.mime.TypedOutput;

/* loaded from: retrofit-1.9.0.jar:retrofit/converter/Converter.class */
public interface Converter {
    Object fromBody(TypedInput typedInput, Type type) throws ConversionException;

    TypedOutput toBody(Object obj);
}
