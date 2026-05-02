package org.apache.commons.beanutils.converters;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/converters/CharacterConverter.class */
public final class CharacterConverter extends AbstractConverter {
    static Class class$java$lang$Character;

    public CharacterConverter() {
    }

    public CharacterConverter(Object defaultValue) {
        super(defaultValue);
    }

    @Override // org.apache.commons.beanutils.converters.AbstractConverter
    protected Class getDefaultType() {
        if (class$java$lang$Character != null) {
            return class$java$lang$Character;
        }
        Class class$ = class$("java.lang.Character");
        class$java$lang$Character = class$;
        return class$;
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    @Override // org.apache.commons.beanutils.converters.AbstractConverter
    protected String convertToString(Object value) {
        String strValue = value.toString();
        return strValue.length() == 0 ? "" : strValue.substring(0, 1);
    }

    @Override // org.apache.commons.beanutils.converters.AbstractConverter
    protected Object convertToType(Class type, Object value) throws Exception {
        return new Character(value.toString().charAt(0));
    }
}
