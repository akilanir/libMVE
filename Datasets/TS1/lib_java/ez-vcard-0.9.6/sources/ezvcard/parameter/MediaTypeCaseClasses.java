package ezvcard.parameter;

import ezvcard.parameter.MediaTypeParameter;
import ezvcard.util.CaseClasses;
import java.lang.reflect.Constructor;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/parameter/MediaTypeCaseClasses.class */
public class MediaTypeCaseClasses<T extends MediaTypeParameter> extends CaseClasses<T, String[]> {
    public MediaTypeCaseClasses(Class<T> clazz) {
        super(clazz);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.util.CaseClasses
    public T create(String[] value) {
        try {
            Constructor<T> constructor = this.clazz.getDeclaredConstructor(String.class, String.class, String.class);
            constructor.setAccessible(true);
            return constructor.newInstance(value[0], value[1], value[2]);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.util.CaseClasses
    public boolean matches(T object, String[] value) {
        String[] objectValues = {object.getValue(), object.getMediaType(), object.getExtension()};
        for (int i = 0; i < value.length; i++) {
            String v = value[i];
            if (v != null && !v.equalsIgnoreCase(objectValues[i])) {
                return false;
            }
        }
        return true;
    }
}
