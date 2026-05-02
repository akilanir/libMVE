package ezvcard.parameter;

import java.util.Collection;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/parameter/Calscale.class */
public class Calscale extends VCardParameter {
    private static final VCardParameterCaseClasses<Calscale> enums = new VCardParameterCaseClasses<>(Calscale.class);
    public static final Calscale GREGORIAN = new Calscale("gregorian");

    private Calscale(String value) {
        super(value);
    }

    public static Calscale find(String value) {
        return enums.find(value);
    }

    public static Calscale get(String value) {
        return enums.get(value);
    }

    public static Collection<Calscale> all() {
        return enums.all();
    }
}
