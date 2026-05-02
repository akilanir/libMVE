package ezvcard.io.scribe;

import ezvcard.parameter.ImageType;
import ezvcard.property.Logo;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/LogoScribe.class */
public class LogoScribe extends ImagePropertyScribe<Logo> {
    public LogoScribe() {
        super(Logo.class, "LOGO");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.BinaryPropertyScribe
    public Logo _newInstance(String uri, ImageType contentType) {
        return new Logo(uri, contentType);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.BinaryPropertyScribe
    public Logo _newInstance(byte[] data, ImageType contentType) {
        return new Logo(data, contentType);
    }
}
