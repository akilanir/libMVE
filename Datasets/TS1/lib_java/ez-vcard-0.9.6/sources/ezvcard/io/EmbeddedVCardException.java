package ezvcard.io;

import ezvcard.VCard;
import ezvcard.property.VCardProperty;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/EmbeddedVCardException.class */
public class EmbeddedVCardException extends RuntimeException {
    private final VCard vcard;
    private final InjectionCallback callback;

    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/EmbeddedVCardException$InjectionCallback.class */
    public interface InjectionCallback {
        void injectVCard(VCard vCard);

        VCardProperty getProperty();
    }

    public EmbeddedVCardException(InjectionCallback callback) {
        this.callback = callback;
        this.vcard = null;
    }

    public EmbeddedVCardException(VCard vcard) {
        this.callback = null;
        this.vcard = vcard;
    }

    public VCard getVCard() {
        return this.vcard;
    }

    public void injectVCard(VCard vcard) {
        if (this.callback == null) {
            return;
        }
        this.callback.injectVCard(vcard);
    }

    public VCardProperty getProperty() {
        if (this.callback == null) {
            return null;
        }
        return this.callback.getProperty();
    }
}
