package nl.qbusict.cupboard;

import nl.qbusict.cupboard.convert.EntityConverterFactory;
import nl.qbusict.cupboard.convert.FieldConverter;
import nl.qbusict.cupboard.convert.FieldConverterFactory;

/* loaded from: cupboard-2.1.1.jar:nl/qbusict/cupboard/CupboardBuilder.class */
public class CupboardBuilder {
    private Cupboard mCupboard = new Cupboard();

    public CupboardBuilder() {
    }

    public CupboardBuilder(Cupboard cupboard) {
        for (Class<?> entity : cupboard.getRegisteredEntities()) {
            this.mCupboard.register(entity);
        }
    }

    public CupboardBuilder registerEntityConverterFactory(EntityConverterFactory factory) {
        this.mCupboard.registerEntityConverterFactory(factory);
        return this;
    }

    public CupboardBuilder registerFieldConverterFactory(FieldConverterFactory factory) {
        this.mCupboard.registerFieldConverterFactory(factory);
        return this;
    }

    public <T> CupboardBuilder registerFieldConverter(Class<T> fieldClass, FieldConverter<T> converter) {
        this.mCupboard.registerFieldConverter(fieldClass, converter);
        return this;
    }

    public CupboardBuilder useAnnotations() {
        this.mCupboard.setUseAnnotations(true);
        return this;
    }

    public Cupboard build() {
        return this.mCupboard;
    }
}
