package ezvcard.property;

import ezvcard.VCard;
import ezvcard.VCardVersion;
import ezvcard.Warning;
import ezvcard.util.GeoUri;
import java.util.List;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/property/Geo.class */
public class Geo extends VCardProperty implements HasAltId {
    private GeoUri uri;

    public Geo(Double latitude, Double longitude) {
        this(new GeoUri.Builder(latitude, longitude).build());
    }

    public Geo(GeoUri uri) {
        this.uri = uri;
    }

    public Double getLatitude() {
        if (this.uri == null) {
            return null;
        }
        return this.uri.getCoordA();
    }

    public void setLatitude(Double latitude) {
        if (this.uri == null) {
            this.uri = new GeoUri.Builder(latitude, null).build();
        } else {
            this.uri = new GeoUri.Builder(this.uri).coordA(latitude).build();
        }
    }

    public Double getLongitude() {
        if (this.uri == null) {
            return null;
        }
        return this.uri.getCoordB();
    }

    public void setLongitude(Double longitude) {
        if (this.uri == null) {
            this.uri = new GeoUri.Builder(null, longitude).build();
        } else {
            this.uri = new GeoUri.Builder(this.uri).coordB(longitude).build();
        }
    }

    public GeoUri getGeoUri() {
        return this.uri;
    }

    public void setGeoUri(GeoUri uri) {
        this.uri = uri;
    }

    public String getType() {
        return this.parameters.getType();
    }

    public void setType(String type) {
        this.parameters.setType(type);
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
        if (getLatitude() == null) {
            warnings.add(new Warning(13, new Object[0]));
        }
        if (getLongitude() == null) {
            warnings.add(new Warning(14, new Object[0]));
        }
    }
}
