package ezvcard.property;

import java.util.ArrayList;
import java.util.List;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/property/StructuredName.class */
public class StructuredName extends VCardProperty implements HasAltId {
    private String family;
    private String given;
    private List<String> additional = new ArrayList();
    private List<String> prefixes = new ArrayList();
    private List<String> suffixes = new ArrayList();

    public String getFamily() {
        return this.family;
    }

    public void setFamily(String family) {
        this.family = family;
    }

    public String getGiven() {
        return this.given;
    }

    public void setGiven(String given) {
        this.given = given;
    }

    public List<String> getAdditional() {
        return this.additional;
    }

    public void addAdditional(String additional) {
        this.additional.add(additional);
    }

    public List<String> getPrefixes() {
        return this.prefixes;
    }

    public void addPrefix(String prefix) {
        this.prefixes.add(prefix);
    }

    public List<String> getSuffixes() {
        return this.suffixes;
    }

    public void addSuffix(String suffix) {
        this.suffixes.add(suffix);
    }

    public List<String> getSortAs() {
        return this.parameters.getSortAs();
    }

    public void setSortAs(String family) {
        if (family == null) {
            this.parameters.setSortAs(new String[0]);
        } else {
            this.parameters.setSortAs(family);
        }
    }

    public void setSortAs(String family, String given) {
        this.parameters.setSortAs(family, given);
    }

    @Override // ezvcard.property.VCardProperty
    public String getLanguage() {
        return super.getLanguage();
    }

    @Override // ezvcard.property.VCardProperty
    public void setLanguage(String language) {
        super.setLanguage(language);
    }

    @Override // ezvcard.property.HasAltId
    public String getAltId() {
        return this.parameters.getAltId();
    }

    @Override // ezvcard.property.HasAltId
    public void setAltId(String altId) {
        this.parameters.setAltId(altId);
    }
}
