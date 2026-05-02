package ezvcard.property;

import ezvcard.VCard;
import ezvcard.VCardVersion;
import ezvcard.Warning;
import ezvcard.parameter.KeyType;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/property/Key.class */
public class Key extends BinaryProperty<KeyType> {
    private String text;

    public Key() {
    }

    public Key(byte[] data, KeyType type) {
        super(data, type);
    }

    public Key(String url, KeyType type) {
        super(url, type);
    }

    public Key(InputStream in, KeyType type) throws IOException {
        super(in, type);
    }

    public Key(File file, KeyType type) throws IOException {
        super(file, type);
    }

    public void setText(String text, KeyType type) {
        this.text = text;
        this.data = null;
        this.url = null;
        setContentType(type);
    }

    public String getText() {
        return this.text;
    }

    @Override // ezvcard.property.BinaryProperty, ezvcard.property.VCardProperty
    protected void _validate(List<Warning> warnings, VCardVersion version, VCard vcard) {
        if (this.url == null && this.data == null && this.text == null) {
            warnings.add(new Warning(8, new Object[0]));
        }
        if (this.url != null) {
            if (version == VCardVersion.V2_1 || version == VCardVersion.V3_0) {
                warnings.add(new Warning(15, new Object[0]));
            }
        }
    }
}
