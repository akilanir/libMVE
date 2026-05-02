package ezvcard.property;

import ezvcard.VCard;
import ezvcard.VCardVersion;
import ezvcard.Warning;
import ezvcard.parameter.ImppType;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.EnumSet;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/property/Impp.class */
public class Impp extends VCardProperty implements HasAltId {
    private static final String AIM = "aim";
    private static final String ICQ = "icq";
    private static final String IRC = "irc";
    private static final String MSN = "msnim";
    private static final String SIP = "sip";
    private static final String SKYPE = "skype";
    private static final String XMPP = "xmpp";
    private static final String YAHOO = "ymsgr";
    private URI uri;

    public Impp(String uri) {
        setUri(uri);
    }

    public Impp(URI uri) {
        setUri(uri);
    }

    public Impp(String protocol, String handle) {
        setUri(protocol, handle);
    }

    @Override // ezvcard.property.VCardProperty
    public Set<VCardVersion> _supportedVersions() {
        return EnumSet.of(VCardVersion.V3_0, VCardVersion.V4_0);
    }

    public static Impp aim(String handle) {
        return new Impp("aim", handle);
    }

    public boolean isAim() {
        return isProtocol("aim");
    }

    public static Impp yahoo(String handle) {
        return new Impp("ymsgr", handle);
    }

    public boolean isYahoo() {
        return isProtocol("ymsgr");
    }

    public static Impp msn(String handle) {
        return new Impp("msnim", handle);
    }

    public boolean isMsn() {
        return isProtocol("msnim");
    }

    public static Impp icq(String handle) {
        return new Impp("icq", handle);
    }

    public boolean isIcq() {
        return isProtocol("icq");
    }

    public static Impp irc(String handle) {
        return new Impp("irc", handle);
    }

    public boolean isIrc() {
        return isProtocol("irc");
    }

    public static Impp sip(String handle) {
        return new Impp("sip", handle);
    }

    public boolean isSip() {
        return isProtocol("sip");
    }

    public static Impp skype(String handle) {
        return new Impp("skype", handle);
    }

    public boolean isSkype() {
        return isProtocol("skype");
    }

    public static Impp xmpp(String handle) {
        return new Impp("xmpp", handle);
    }

    public boolean isXmpp() {
        return isProtocol("xmpp");
    }

    private boolean isProtocol(String protocol) {
        return this.uri != null && protocol.equals(this.uri.getScheme());
    }

    public URI getUri() {
        return this.uri;
    }

    public void setUri(String uri) {
        setUri(uri == null ? null : URI.create(uri));
    }

    public void setUri(URI uri) {
        this.uri = uri;
    }

    public void setUri(String protocol, String handle) {
        try {
            this.uri = new URI(protocol, handle, null);
        } catch (URISyntaxException e) {
            throw new IllegalArgumentException(e);
        }
    }

    public String getProtocol() {
        if (this.uri == null) {
            return null;
        }
        return this.uri.getScheme();
    }

    public String getHandle() {
        if (this.uri == null) {
            return null;
        }
        return this.uri.getSchemeSpecificPart();
    }

    public Set<ImppType> getTypes() {
        Set<String> values = this.parameters.getTypes();
        Set<ImppType> types = new HashSet<>(values.size());
        for (String value : values) {
            types.add(ImppType.get(value));
        }
        return types;
    }

    public void addType(ImppType type) {
        this.parameters.addType(type.getValue());
    }

    public void removeType(ImppType type) {
        this.parameters.removeType(type.getValue());
    }

    public String getMediaType() {
        return this.parameters.getMediaType();
    }

    public void setMediaType(String mediaType) {
        this.parameters.setMediaType(mediaType);
    }

    @Override // ezvcard.property.VCardProperty
    public List<Integer[]> getPids() {
        return super.getPids();
    }

    @Override // ezvcard.property.VCardProperty
    public void addPid(int localId, int clientPidMapRef) {
        super.addPid(localId, clientPidMapRef);
    }

    @Override // ezvcard.property.VCardProperty
    public void removePids() {
        super.removePids();
    }

    @Override // ezvcard.property.VCardProperty
    public Integer getPref() {
        return super.getPref();
    }

    @Override // ezvcard.property.VCardProperty
    public void setPref(Integer pref) {
        super.setPref(pref);
    }

    @Override // ezvcard.property.HasAltId
    public String getAltId() {
        return this.parameters.getAltId();
    }

    @Override // ezvcard.property.HasAltId
    public void setAltId(String altId) {
        this.parameters.setAltId(altId);
    }

    @Override // ezvcard.property.VCardProperty
    protected void _validate(List<Warning> warnings, VCardVersion version, VCard vcard) {
        if (this.uri == null) {
            warnings.add(new Warning(8, new Object[0]));
        }
    }
}
