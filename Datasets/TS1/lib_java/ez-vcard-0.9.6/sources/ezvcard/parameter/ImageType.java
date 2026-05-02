package ezvcard.parameter;

import java.util.Collection;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/parameter/ImageType.class */
public class ImageType extends MediaTypeParameter {
    private static final MediaTypeCaseClasses<ImageType> enums = new MediaTypeCaseClasses<>(ImageType.class);
    public static final ImageType GIF = new ImageType("GIF", "image/gif", "gif");
    public static final ImageType JPEG = new ImageType("JPEG", "image/jpeg", "jpg");
    public static final ImageType PNG = new ImageType("PNG", "image/png", "png");

    private ImageType(String value, String mediaType, String extension) {
        super(value, mediaType, extension);
    }

    public static ImageType find(String type, String mediaType, String extension) {
        return enums.find(new String[]{type, mediaType, extension});
    }

    public static ImageType get(String type, String mediaType, String extension) {
        return enums.get(new String[]{type, mediaType, extension});
    }

    public static Collection<ImageType> all() {
        return enums.all();
    }
}
