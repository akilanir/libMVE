package ezvcard.io.scribe;

import ezvcard.io.html.HCardElement;
import ezvcard.property.Categories;
import ezvcard.property.VCardProperty;
import java.util.List;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/CategoriesScribe.class */
public class CategoriesScribe extends ListPropertyScribe<Categories> {
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected /* bridge */ /* synthetic */ VCardProperty _parseHtml(HCardElement x0, List x1) {
        return _parseHtml(x0, (List<String>) x1);
    }

    public CategoriesScribe() {
        super(Categories.class, "CATEGORIES");
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected Categories _parseHtml(HCardElement element, List<String> warnings) {
        String value = element.attr("rel");
        if (value.length() == 0) {
            value = element.value();
        }
        Categories property = _newInstance();
        property.addValue(value);
        return property;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.ListPropertyScribe
    public Categories _newInstance() {
        return new Categories();
    }
}
