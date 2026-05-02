package ezvcard.parameter;

import java.util.Collection;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/parameter/HobbyLevel.class */
public class HobbyLevel extends VCardParameter {
    private static final VCardParameterCaseClasses<HobbyLevel> enums = new VCardParameterCaseClasses<>(HobbyLevel.class);
    public static final HobbyLevel LOW = new HobbyLevel("low");
    public static final HobbyLevel MEDIUM = new HobbyLevel("medium");
    public static final HobbyLevel HIGH = new HobbyLevel("high");

    private HobbyLevel(String value) {
        super(value);
    }

    public static HobbyLevel find(String value) {
        return enums.find(value);
    }

    public static HobbyLevel get(String value) {
        return enums.get(value);
    }

    public static Collection<HobbyLevel> all() {
        return enums.all();
    }
}
