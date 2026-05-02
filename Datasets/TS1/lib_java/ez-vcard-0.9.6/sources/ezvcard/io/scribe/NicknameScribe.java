package ezvcard.io.scribe;

import ezvcard.io.html.HCardElement;
import ezvcard.property.Nickname;
import ezvcard.property.VCardProperty;
import java.util.List;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/NicknameScribe.class */
public class NicknameScribe extends ListPropertyScribe<Nickname> {
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected /* bridge */ /* synthetic */ VCardProperty _parseHtml(HCardElement x0, List x1) {
        return _parseHtml(x0, (List<String>) x1);
    }

    public NicknameScribe() {
        super(Nickname.class, "NICKNAME");
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected Nickname _parseHtml(HCardElement element, List<String> warnings) {
        Nickname property = _newInstance();
        property.addValue(element.value());
        return property;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.ListPropertyScribe
    public Nickname _newInstance() {
        return new Nickname();
    }
}
