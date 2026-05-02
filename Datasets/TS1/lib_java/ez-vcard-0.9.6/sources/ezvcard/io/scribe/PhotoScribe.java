package ezvcard.io.scribe;

import ezvcard.parameter.ImageType;
import ezvcard.property.Photo;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/PhotoScribe.class */
public class PhotoScribe extends ImagePropertyScribe<Photo> {
    public PhotoScribe() {
        super(Photo.class, "PHOTO");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.BinaryPropertyScribe
    public Photo _newInstance(String uri, ImageType contentType) {
        return new Photo(uri, contentType);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.BinaryPropertyScribe
    public Photo _newInstance(byte[] data, ImageType contentType) {
        return new Photo(data, contentType);
    }
}
