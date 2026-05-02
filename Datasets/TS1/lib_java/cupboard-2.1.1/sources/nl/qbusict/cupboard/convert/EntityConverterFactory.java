package nl.qbusict.cupboard.convert;

import nl.qbusict.cupboard.Cupboard;

/* loaded from: cupboard-2.1.1.jar:nl/qbusict/cupboard/convert/EntityConverterFactory.class */
public interface EntityConverterFactory {
    <T> EntityConverter<T> create(Cupboard cupboard, Class<T> cls);
}
