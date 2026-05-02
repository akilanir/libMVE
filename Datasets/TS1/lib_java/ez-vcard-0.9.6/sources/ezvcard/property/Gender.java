package ezvcard.property;

import ezvcard.VCard;
import ezvcard.VCardVersion;
import ezvcard.Warning;
import java.util.EnumSet;
import java.util.List;
import java.util.Set;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/property/Gender.class */
public class Gender extends VCardProperty {
    public static final String MALE = "M";
    public static final String FEMALE = "F";
    public static final String OTHER = "O";
    public static final String NONE = "N";
    public static final String UNKNOWN = "U";
    private String gender;
    private String text;

    public Gender(String gender) {
        this.gender = gender;
    }

    @Override // ezvcard.property.VCardProperty
    public Set<VCardVersion> _supportedVersions() {
        return EnumSet.of(VCardVersion.V4_0);
    }

    public String getText() {
        return this.text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getGender() {
        return this.gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public boolean isMale() {
        return MALE.equals(this.gender);
    }

    public boolean isFemale() {
        return FEMALE.equals(this.gender);
    }

    public boolean isOther() {
        return OTHER.equals(this.gender);
    }

    public boolean isNone() {
        return NONE.equals(this.gender);
    }

    public boolean isUnknown() {
        return UNKNOWN.equals(this.gender);
    }

    public static Gender male() {
        return new Gender(MALE);
    }

    public static Gender female() {
        return new Gender(FEMALE);
    }

    public static Gender other() {
        return new Gender(OTHER);
    }

    public static Gender none() {
        return new Gender(NONE);
    }

    public static Gender unknown() {
        return new Gender(UNKNOWN);
    }

    @Override // ezvcard.property.VCardProperty
    protected void _validate(List<Warning> warnings, VCardVersion version, VCard vcard) {
        if (this.gender == null) {
            warnings.add(new Warning(8, new Object[0]));
        }
    }
}
