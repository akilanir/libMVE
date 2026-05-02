package ezvcard.property;

import ezvcard.VCard;
import ezvcard.VCardVersion;
import ezvcard.Warning;
import ezvcard.parameter.MediaTypeParameter;
import ezvcard.util.IOUtils;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/property/BinaryProperty.class */
public abstract class BinaryProperty<T extends MediaTypeParameter> extends VCardProperty implements HasAltId {
    protected byte[] data;
    protected String url;
    protected T contentType;

    public BinaryProperty() {
    }

    public BinaryProperty(String url, T type) {
        setUrl(url, type);
    }

    public BinaryProperty(byte[] data, T type) {
        setData(data, type);
    }

    public BinaryProperty(InputStream in, T type) throws IOException {
        this(IOUtils.toByteArray(in, true), type);
    }

    public BinaryProperty(File file, T type) throws IOException {
        this(new FileInputStream(file), type);
    }

    public byte[] getData() {
        return this.data;
    }

    public void setData(byte[] data, T type) {
        this.url = null;
        this.data = data;
        setContentType(type);
    }

    public String getUrl() {
        return this.url;
    }

    public void setUrl(String url, T type) {
        this.url = url;
        this.data = null;
        setContentType(type);
    }

    public T getContentType() {
        return this.contentType;
    }

    public void setContentType(T contentType) {
        this.contentType = contentType;
    }

    public String getType() {
        return this.parameters.getType();
    }

    public void setType(String type) {
        this.parameters.setType(type);
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
        if (this.url == null && this.data == null) {
            warnings.add(new Warning(8, new Object[0]));
        }
    }
}
