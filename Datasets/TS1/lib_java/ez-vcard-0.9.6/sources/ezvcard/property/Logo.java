package ezvcard.property;

import ezvcard.parameter.ImageType;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/property/Logo.class */
public class Logo extends ImageProperty {
    public Logo(String url, ImageType type) {
        super(url, type);
    }

    public Logo(byte[] data, ImageType type) {
        super(data, type);
    }

    public Logo(InputStream in, ImageType type) throws IOException {
        super(in, type);
    }

    public Logo(File file, ImageType type) throws IOException {
        super(file, type);
    }

    @Override // ezvcard.property.VCardProperty
    public String getLanguage() {
        return super.getLanguage();
    }

    @Override // ezvcard.property.VCardProperty
    public void setLanguage(String language) {
        super.setLanguage(language);
    }
}
