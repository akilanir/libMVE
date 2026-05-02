package ezvcard.parameter;

import java.util.Collection;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/parameter/InterestLevel.class */
public class InterestLevel extends VCardParameter {
    private static final VCardParameterCaseClasses<InterestLevel> enums = new VCardParameterCaseClasses<>(InterestLevel.class);
    public static final InterestLevel LOW = new InterestLevel("low");
    public static final InterestLevel MEDIUM = new InterestLevel("medium");
    public static final InterestLevel HIGH = new InterestLevel("high");

    private InterestLevel(String value) {
        super(value);
    }

    public static InterestLevel find(String value) {
        return enums.find(value);
    }

    public static InterestLevel get(String value) {
        return enums.get(value);
    }

    public static Collection<InterestLevel> all() {
        return enums.all();
    }
}
