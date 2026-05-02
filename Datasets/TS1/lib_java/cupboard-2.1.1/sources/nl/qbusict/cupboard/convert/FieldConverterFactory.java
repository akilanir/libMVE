package nl.qbusict.cupboard.convert;

import java.lang.reflect.Type;
import nl.qbusict.cupboard.Cupboard;

/* loaded from: cupboard-2.1.1.jar:nl/qbusict/cupboard/convert/FieldConverterFactory.class */
public interface FieldConverterFactory {
    FieldConverter<?> create(Cupboard cupboard, Type type);
}
