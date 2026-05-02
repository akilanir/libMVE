package ezvcard.io.scribe;

import ezvcard.VCard;
import ezvcard.VCardVersion;
import ezvcard.io.html.HCardElement;
import ezvcard.parameter.VCardParameters;
import ezvcard.property.Email;
import ezvcard.property.VCardProperty;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/EmailScribe.class */
public class EmailScribe extends StringPropertyScribe<Email> {
    @Override // ezvcard.io.scribe.SimplePropertyScribe, ezvcard.io.scribe.VCardPropertyScribe
    protected /* bridge */ /* synthetic */ VCardProperty _parseHtml(HCardElement x0, List x1) {
        return _parseHtml(x0, (List<String>) x1);
    }

    public EmailScribe() {
        super(Email.class, "EMAIL");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public void _prepareParameters(Email property, VCardParameters copy, VCardVersion version, VCard vcard) {
        handlePrefParam(property, copy, version, vcard);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.SimplePropertyScribe
    public Email _parseValue(String value) {
        return new Email(value);
    }

    @Override // ezvcard.io.scribe.SimplePropertyScribe, ezvcard.io.scribe.VCardPropertyScribe
    protected Email _parseHtml(HCardElement element, List<String> warnings) {
        String email;
        String href = element.attr("href");
        if (href.length() > 0) {
            Pattern p = Pattern.compile("^mailto:(.*)$", 2);
            Matcher m = p.matcher(href);
            email = m.find() ? m.group(1) : element.value();
        } else {
            email = element.value();
        }
        Email property = new Email(email);
        List<String> types = element.types();
        for (String type : types) {
            property.getParameters().addType(type);
        }
        return property;
    }
}
