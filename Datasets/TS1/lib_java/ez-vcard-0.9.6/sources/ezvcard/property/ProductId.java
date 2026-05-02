package ezvcard.property;

import ezvcard.VCardVersion;
import java.util.EnumSet;
import java.util.Set;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/property/ProductId.class */
public class ProductId extends TextProperty {
    public ProductId(String prodId) {
        super(prodId);
    }

    @Override // ezvcard.property.VCardProperty
    public Set<VCardVersion> _supportedVersions() {
        return EnumSet.of(VCardVersion.V3_0, VCardVersion.V4_0);
    }
}
