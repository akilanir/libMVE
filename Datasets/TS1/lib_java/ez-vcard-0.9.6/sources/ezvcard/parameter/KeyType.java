package ezvcard.parameter;

import java.util.Collection;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/parameter/KeyType.class */
public class KeyType extends MediaTypeParameter {
    private static final MediaTypeCaseClasses<KeyType> enums = new MediaTypeCaseClasses<>(KeyType.class);
    public static final KeyType PGP = new KeyType("PGP", "application/pgp-keys", "pgp");
    public static final KeyType GPG = new KeyType("GPG", "application/gpg", "gpg");
    public static final KeyType X509 = new KeyType("X509", "application/x509", null);

    private KeyType(String value, String mediaType, String extension) {
        super(value, mediaType, extension);
    }

    public static KeyType find(String type, String mediaType, String extension) {
        return enums.find(new String[]{type, mediaType, extension});
    }

    public static KeyType get(String type, String mediaType, String extension) {
        return enums.get(new String[]{type, mediaType, extension});
    }

    public static Collection<KeyType> all() {
        return enums.all();
    }
}
