package ezvcard.io.scribe;

import ezvcard.property.ProductId;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/ProductIdScribe.class */
public class ProductIdScribe extends StringPropertyScribe<ProductId> {
    public ProductIdScribe() {
        super(ProductId.class, "PRODID");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.SimplePropertyScribe
    public ProductId _parseValue(String value) {
        return new ProductId(value);
    }
}
