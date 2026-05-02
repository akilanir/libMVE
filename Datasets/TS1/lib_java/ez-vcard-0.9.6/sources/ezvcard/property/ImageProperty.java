package ezvcard.property;

import ezvcard.parameter.ImageType;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/property/ImageProperty.class */
public class ImageProperty extends BinaryProperty<ImageType> {
    public ImageProperty(String url, ImageType type) {
        super(url, type);
    }

    public ImageProperty(byte[] data, ImageType type) {
        super(data, type);
    }

    public ImageProperty(InputStream in, ImageType type) throws IOException {
        super(in, type);
    }

    public ImageProperty(File file, ImageType type) throws IOException {
        super(file, type);
    }
}
