package ezvcard.parameter;

import java.util.Collection;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/parameter/ImppType.class */
public class ImppType extends VCardParameter {
    private static final VCardParameterCaseClasses<ImppType> enums = new VCardParameterCaseClasses<>(ImppType.class);
    public static final ImppType PERSONAL = new ImppType("personal");
    public static final ImppType BUSINESS = new ImppType("business");
    public static final ImppType HOME = new ImppType("home");
    public static final ImppType WORK = new ImppType("work");
    public static final ImppType MOBILE = new ImppType("mobile");
    public static final ImppType PREF = new ImppType("pref");

    private ImppType(String value) {
        super(value);
    }

    public static ImppType find(String value) {
        return enums.find(value);
    }

    public static ImppType get(String value) {
        return enums.get(value);
    }

    public static Collection<ImppType> all() {
        return enums.all();
    }
}
