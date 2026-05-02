package de.greenrobot.dao.converter;

/* loaded from: greendao-2.0.0.jar:de/greenrobot/dao/converter/PropertyConverter.class */
public interface PropertyConverter<P, D> {
    P convertToEntityProperty(D d);

    D convertToDatabaseValue(P p);
}
