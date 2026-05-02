package ezvcard.property;

import ezvcard.VCard;
import ezvcard.VCardVersion;
import ezvcard.Warning;
import ezvcard.util.GeoUri;
import java.util.EnumSet;
import java.util.List;
import java.util.Set;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/property/PlaceProperty.class */
public class PlaceProperty extends VCardProperty implements HasAltId {
    protected GeoUri geoUri;
    protected String uri;
    protected String text;

    public PlaceProperty() {
    }

    public PlaceProperty(double latitude, double longitude) {
        setCoordinates(latitude, longitude);
    }

    public PlaceProperty(String text) {
        setText(text);
    }

    @Override // ezvcard.property.VCardProperty
    public Set<VCardVersion> _supportedVersions() {
        return EnumSet.of(VCardVersion.V4_0);
    }

    public Double getLatitude() {
        if (this.geoUri == null) {
            return null;
        }
        return this.geoUri.getCoordA();
    }

    public Double getLongitude() {
        if (this.geoUri == null) {
            return null;
        }
        return this.geoUri.getCoordB();
    }

    public GeoUri getGeoUri() {
        return this.geoUri;
    }

    public void setCoordinates(double latitude, double longitude) {
        setGeoUri(new GeoUri.Builder(Double.valueOf(latitude), Double.valueOf(longitude)).build());
    }

    public void setGeoUri(GeoUri geoUri) {
        this.geoUri = geoUri;
        this.uri = null;
        this.text = null;
    }

    public String getUri() {
        return this.uri;
    }

    public void setUri(String uri) {
        this.uri = uri;
        this.geoUri = null;
        this.text = null;
    }

    public String getText() {
        return this.text;
    }

    public void setText(String text) {
        this.text = text;
        this.geoUri = null;
        this.uri = null;
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
    public String getLanguage() {
        return super.getLanguage();
    }

    @Override // ezvcard.property.VCardProperty
    public void setLanguage(String language) {
        super.setLanguage(language);
    }

    @Override // ezvcard.property.VCardProperty
    protected void _validate(List<Warning> warnings, VCardVersion version, VCard vcard) {
        if (this.uri == null && this.text == null && this.geoUri == null) {
            warnings.add(new Warning(8, new Object[0]));
        }
    }
}
