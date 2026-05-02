package ezvcard.property;

import ezvcard.VCard;
import ezvcard.VCardVersion;
import ezvcard.Warning;
import java.util.EnumSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/property/ClientPidMap.class */
public class ClientPidMap extends VCardProperty {
    private Integer pid;
    private String uri;

    public ClientPidMap(Integer pid, String uri) {
        this.pid = pid;
        this.uri = uri;
    }

    public static ClientPidMap random(Integer pid) {
        String uuid = UUID.randomUUID().toString();
        return new ClientPidMap(pid, "urn:uuid:" + uuid);
    }

    @Override // ezvcard.property.VCardProperty
    public Set<VCardVersion> _supportedVersions() {
        return EnumSet.of(VCardVersion.V4_0);
    }

    public Integer getPid() {
        return this.pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getUri() {
        return this.uri;
    }

    public void setUri(String uri) {
        this.uri = uri;
    }

    @Override // ezvcard.property.VCardProperty
    protected void _validate(List<Warning> warnings, VCardVersion version, VCard vcard) {
        if (this.pid == null && this.uri == null) {
            warnings.add(new Warning(8, new Object[0]));
        }
    }
}
