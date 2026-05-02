package ezvcard.parameter;

import java.util.Collection;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/parameter/ExpertiseLevel.class */
public class ExpertiseLevel extends VCardParameter {
    private static final VCardParameterCaseClasses<ExpertiseLevel> enums = new VCardParameterCaseClasses<>(ExpertiseLevel.class);
    public static final ExpertiseLevel BEGINNER = new ExpertiseLevel("beginner");
    public static final ExpertiseLevel AVERAGE = new ExpertiseLevel("average");
    public static final ExpertiseLevel EXPERT = new ExpertiseLevel("expert");

    private ExpertiseLevel(String value) {
        super(value);
    }

    public static ExpertiseLevel find(String value) {
        return enums.find(value);
    }

    public static ExpertiseLevel get(String value) {
        return enums.get(value);
    }

    public static Collection<ExpertiseLevel> all() {
        return enums.all();
    }
}
