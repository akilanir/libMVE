package ezvcard.parameter;

import ezvcard.VCardVersion;
import ezvcard.parameter.VCardParameter;
import ezvcard.util.CaseClasses;
import java.lang.reflect.Constructor;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/parameter/VCardParameterCaseClasses.class */
public class VCardParameterCaseClasses<T extends VCardParameter> extends CaseClasses<T, String> {
    public VCardParameterCaseClasses(Class<T> clazz) {
        super(clazz);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.util.CaseClasses
    public T create(String value) {
        try {
            Constructor<T> constructor = this.clazz.getDeclaredConstructor(String.class);
            constructor.setAccessible(true);
            return constructor.newInstance(value);
        } catch (Exception e) {
            try {
                Constructor<T> constructor2 = this.clazz.getDeclaredConstructor(String.class, VCardVersion[].class);
                constructor2.setAccessible(true);
                return constructor2.newInstance(value, new VCardVersion[0]);
            } catch (Exception e2) {
                throw new RuntimeException(e2);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.util.CaseClasses
    public boolean matches(T object, String value) {
        return object.getValue().equalsIgnoreCase(value);
    }
}
