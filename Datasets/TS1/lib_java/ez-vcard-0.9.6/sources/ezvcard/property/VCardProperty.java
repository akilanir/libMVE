package ezvcard.property;

import ezvcard.VCard;
import ezvcard.VCardVersion;
import ezvcard.Warning;
import ezvcard.parameter.VCardParameters;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.EnumSet;
import java.util.List;
import java.util.Set;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/property/VCardProperty.class */
public abstract class VCardProperty implements Comparable<VCardProperty> {
    protected String group;
    protected VCardParameters parameters = new VCardParameters();

    public final Set<VCardVersion> getSupportedVersions() {
        return _supportedVersions();
    }

    protected Set<VCardVersion> _supportedVersions() {
        return EnumSet.copyOf((Collection) Arrays.asList(VCardVersion.values()));
    }

    public final List<Warning> validate(VCardVersion version, VCard vcard) {
        List<Warning> warnings = new ArrayList<>(0);
        Set<VCardVersion> supportedVersions = getSupportedVersions();
        if (!supportedVersions.contains(version)) {
            warnings.add(new Warning(2, supportedVersions));
        }
        warnings.addAll(this.parameters.validate(version));
        _validate(warnings, version, vcard);
        return warnings;
    }

    protected void _validate(List<Warning> warnings, VCardVersion version, VCard vcard) {
    }

    public VCardParameters getParameters() {
        return this.parameters;
    }

    public void setParameters(VCardParameters parameters) {
        this.parameters = parameters;
    }

    public String getParameter(String name) {
        return this.parameters.first(name);
    }

    public List<String> getParameters(String name) {
        return this.parameters.get(name);
    }

    public void setParameter(String name, String value) {
        this.parameters.replace((VCardParameters) name, value);
    }

    public void addParameter(String name, String value) {
        this.parameters.put(name, value);
    }

    public void removeParameter(String name) {
        this.parameters.removeAll(name);
    }

    public String getGroup() {
        return this.group;
    }

    public void setGroup(String group) {
        this.group = group;
    }

    @Override // java.lang.Comparable
    public int compareTo(VCardProperty that) {
        Integer pref0 = getParameters().getPref();
        Integer pref1 = that.getParameters().getPref();
        if (pref0 == null && pref1 == null) {
            return 0;
        }
        if (pref0 == null) {
            return 1;
        }
        if (pref1 == null) {
            return -1;
        }
        return pref1.compareTo(pref0);
    }

    List<Integer[]> getPids() {
        return this.parameters.getPids();
    }

    void addPid(int localId, int clientPidMapRef) {
        this.parameters.addPid(localId, clientPidMapRef);
    }

    void removePids() {
        this.parameters.removePids();
    }

    Integer getPref() {
        return this.parameters.getPref();
    }

    void setPref(Integer pref) {
        this.parameters.setPref(pref);
    }

    String getLanguage() {
        return this.parameters.getLanguage();
    }

    void setLanguage(String language) {
        this.parameters.setLanguage(language);
    }

    Integer getIndex() {
        return this.parameters.getIndex();
    }

    void setIndex(Integer index) {
        this.parameters.setIndex(index);
    }
}
