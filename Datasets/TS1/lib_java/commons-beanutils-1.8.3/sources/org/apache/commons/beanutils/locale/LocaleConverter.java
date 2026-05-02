package org.apache.commons.beanutils.locale;

import org.apache.commons.beanutils.Converter;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/locale/LocaleConverter.class */
public interface LocaleConverter extends Converter {
    Object convert(Class cls, Object obj, String str);
}
