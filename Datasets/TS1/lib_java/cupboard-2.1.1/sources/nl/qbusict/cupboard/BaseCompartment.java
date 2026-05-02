package nl.qbusict.cupboard;

import nl.qbusict.cupboard.convert.EntityConverter;

/* loaded from: cupboard-2.1.1.jar:nl/qbusict/cupboard/BaseCompartment.class */
class BaseCompartment {
    protected final Cupboard mCupboard;

    protected BaseCompartment(Cupboard cupboard) {
        this.mCupboard = cupboard;
    }

    protected <T> EntityConverter<T> getConverter(Class<T> clz) {
        return this.mCupboard.getEntityConverter(clz);
    }
}
