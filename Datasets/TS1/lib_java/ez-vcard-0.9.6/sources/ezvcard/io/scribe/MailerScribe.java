package ezvcard.io.scribe;

import ezvcard.property.Mailer;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/MailerScribe.class */
public class MailerScribe extends StringPropertyScribe<Mailer> {
    public MailerScribe() {
        super(Mailer.class, "MAILER");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.SimplePropertyScribe
    public Mailer _parseValue(String value) {
        return new Mailer(value);
    }
}
