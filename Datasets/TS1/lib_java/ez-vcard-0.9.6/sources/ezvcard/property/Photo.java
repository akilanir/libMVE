package ezvcard.property;

import ezvcard.parameter.ImageType;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/property/Photo.class */
public class Photo extends ImageProperty {
    public Photo(String url, ImageType type) {
        super(url, type);
    }

    public Photo(byte[] data, ImageType type) {
        super(data, type);
    }

    public Photo(InputStream in, ImageType type) throws IOException {
        super(in, type);
    }

    public Photo(File file, ImageType type) throws IOException {
        super(file, type);
    }
}
