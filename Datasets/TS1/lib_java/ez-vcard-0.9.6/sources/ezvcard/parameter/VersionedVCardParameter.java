package ezvcard.parameter;

import ezvcard.VCardVersion;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.EnumSet;
import java.util.Set;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/parameter/VersionedVCardParameter.class */
public class VersionedVCardParameter extends VCardParameter {
    protected final Set<VCardVersion> supportedVersions;

    public VersionedVCardParameter(String value, VCardVersion... supportedVersions) {
        super(value);
        Set<VCardVersion> set = EnumSet.copyOf((Collection) Arrays.asList(supportedVersions.length == 0 ? VCardVersion.values() : supportedVersions));
        this.supportedVersions = Collections.unmodifiableSet(set);
    }

    public boolean isSupported(VCardVersion version) {
        return this.supportedVersions.contains(version);
    }
}
