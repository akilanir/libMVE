package ezvcard.parameter;

import java.util.Collection;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/parameter/RelatedType.class */
public class RelatedType extends VCardParameter {
    private static final VCardParameterCaseClasses<RelatedType> enums = new VCardParameterCaseClasses<>(RelatedType.class);
    public static final RelatedType ACQUAINTANCE = new RelatedType("acquaintance");
    public static final RelatedType AGENT = new RelatedType("agent");
    public static final RelatedType CHILD = new RelatedType("child");
    public static final RelatedType CO_RESIDENT = new RelatedType("co-resident");
    public static final RelatedType CO_WORKER = new RelatedType("co-worker");
    public static final RelatedType COLLEAGUE = new RelatedType("colleague");
    public static final RelatedType CONTACT = new RelatedType("contact");
    public static final RelatedType CRUSH = new RelatedType("crush");
    public static final RelatedType DATE = new RelatedType("date");
    public static final RelatedType EMERGENCY = new RelatedType("emergency");
    public static final RelatedType FRIEND = new RelatedType("friend");
    public static final RelatedType KIN = new RelatedType("kin");
    public static final RelatedType ME = new RelatedType("me");
    public static final RelatedType MET = new RelatedType("met");
    public static final RelatedType MUSE = new RelatedType("muse");
    public static final RelatedType NEIGHBOR = new RelatedType("neighbor");
    public static final RelatedType PARENT = new RelatedType("parent");
    public static final RelatedType SIBLING = new RelatedType("sibling");
    public static final RelatedType SPOUSE = new RelatedType("spouse");
    public static final RelatedType SWEETHEART = new RelatedType("sweetheart");

    private RelatedType(String value) {
        super(value);
    }

    public static RelatedType find(String value) {
        return enums.find(value);
    }

    public static RelatedType get(String value) {
        return enums.get(value);
    }

    public static Collection<RelatedType> all() {
        return enums.all();
    }
}
