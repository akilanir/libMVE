package ezvcard.io.scribe;

import ezvcard.io.html.HCardElement;
import ezvcard.parameter.VCardParameters;
import ezvcard.property.Label;
import ezvcard.property.VCardProperty;
import java.util.List;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/LabelScribe.class */
public class LabelScribe extends StringPropertyScribe<Label> {
    @Override // ezvcard.io.scribe.SimplePropertyScribe, ezvcard.io.scribe.VCardPropertyScribe
    protected /* bridge */ /* synthetic */ VCardProperty _parseHtml(HCardElement x0, List x1) {
        return _parseHtml(x0, (List<String>) x1);
    }

    public LabelScribe() {
        super(Label.class, VCardParameters.LABEL);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.SimplePropertyScribe
    public Label _parseValue(String value) {
        return new Label(value);
    }

    @Override // ezvcard.io.scribe.SimplePropertyScribe, ezvcard.io.scribe.VCardPropertyScribe
    protected Label _parseHtml(HCardElement element, List<String> warnings) {
        Label property = new Label(element.value());
        List<String> types = element.types();
        for (String type : types) {
            property.getParameters().addType(type);
        }
        return property;
    }
}
