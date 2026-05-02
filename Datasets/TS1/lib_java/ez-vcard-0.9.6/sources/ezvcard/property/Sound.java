package ezvcard.property;

import ezvcard.parameter.SoundType;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/property/Sound.class */
public class Sound extends BinaryProperty<SoundType> {
    public Sound(String url, SoundType type) {
        super(url, type);
    }

    public Sound(byte[] data, SoundType type) {
        super(data, type);
    }

    public Sound(InputStream in, SoundType type) throws IOException {
        super(in, type);
    }

    public Sound(File file, SoundType type) throws IOException {
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
