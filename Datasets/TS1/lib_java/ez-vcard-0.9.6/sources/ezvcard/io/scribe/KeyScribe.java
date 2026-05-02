package ezvcard.io.scribe;

import ezvcard.parameter.KeyType;
import ezvcard.property.Key;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/KeyScribe.class */
public class KeyScribe extends BinaryPropertyScribe<Key, KeyType> {
    public KeyScribe() {
        super(Key.class, "KEY");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.BinaryPropertyScribe
    public KeyType _buildTypeObj(String type) {
        return KeyType.get(type, null, null);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.BinaryPropertyScribe
    public KeyType _buildMediaTypeObj(String mediaType) {
        return KeyType.get(null, mediaType, null);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.BinaryPropertyScribe
    public Key _newInstance(String uri, KeyType contentType) {
        return new Key(uri, contentType);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.BinaryPropertyScribe
    public Key _newInstance(byte[] data, KeyType contentType) {
        return new Key(data, contentType);
    }
}
