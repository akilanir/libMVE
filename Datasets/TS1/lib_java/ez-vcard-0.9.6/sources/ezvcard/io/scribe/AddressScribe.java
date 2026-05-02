package ezvcard.io.scribe;

import ezvcard.VCard;
import ezvcard.VCardDataType;
import ezvcard.VCardVersion;
import ezvcard.io.html.HCardElement;
import ezvcard.io.json.JCardValue;
import ezvcard.io.scribe.VCardPropertyScribe;
import ezvcard.io.xml.XCardElement;
import ezvcard.parameter.VCardParameters;
import ezvcard.property.Address;
import ezvcard.property.VCardProperty;
import java.util.List;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/AddressScribe.class */
public class AddressScribe extends VCardPropertyScribe<Address> {
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected /* bridge */ /* synthetic */ VCardProperty _parseJson(JCardValue x0, VCardDataType x1, VCardParameters x2, List x3) {
        return _parseJson(x0, x1, x2, (List<String>) x3);
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected /* bridge */ /* synthetic */ VCardProperty _parseHtml(HCardElement x0, List x1) {
        return _parseHtml(x0, (List<String>) x1);
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected /* bridge */ /* synthetic */ VCardProperty _parseXml(XCardElement x0, VCardParameters x1, List x2) {
        return _parseXml(x0, x1, (List<String>) x2);
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected /* bridge */ /* synthetic */ VCardProperty _parseText(String x0, VCardDataType x1, VCardVersion x2, VCardParameters x3, List x4) {
        return _parseText(x0, x1, x2, x3, (List<String>) x4);
    }

    public AddressScribe() {
        super(Address.class, "ADR");
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected VCardDataType _defaultDataType(VCardVersion version) {
        return VCardDataType.TEXT;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public void _prepareParameters(Address property, VCardParameters copy, VCardVersion version, VCard vcard) {
        handlePrefParam(property, copy, version, vcard);
        if (version == VCardVersion.V2_1 || version == VCardVersion.V3_0) {
            copy.removeAll(VCardParameters.LABEL);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public String _writeText(Address property, VCardVersion version) {
        return structured(property.getPoBox(), property.getExtendedAddress(), property.getStreetAddress(), property.getLocality(), property.getRegion(), property.getPostalCode(), property.getCountry());
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected Address _parseText(String value, VCardDataType dataType, VCardVersion version, VCardParameters parameters, List<String> warnings) {
        Address property = new Address();
        VCardPropertyScribe.StructuredIterator it = structured(value);
        property.setPoBox(it.nextString());
        property.setExtendedAddress(it.nextString());
        property.setStreetAddress(it.nextString());
        property.setLocality(it.nextString());
        property.setRegion(it.nextString());
        property.setPostalCode(it.nextString());
        property.setCountry(it.nextString());
        return property;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public void _writeXml(Address property, XCardElement parent) {
        parent.append("pobox", property.getPoBox());
        parent.append("ext", property.getExtendedAddress());
        parent.append("street", property.getStreetAddress());
        parent.append("locality", property.getLocality());
        parent.append("region", property.getRegion());
        parent.append("code", property.getPostalCode());
        parent.append("country", property.getCountry());
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected Address _parseXml(XCardElement element, VCardParameters parameters, List<String> warnings) {
        Address property = new Address();
        property.setPoBox(sanitizeXml(element, "pobox"));
        property.setExtendedAddress(sanitizeXml(element, "ext"));
        property.setStreetAddress(sanitizeXml(element, "street"));
        property.setLocality(sanitizeXml(element, "locality"));
        property.setRegion(sanitizeXml(element, "region"));
        property.setPostalCode(sanitizeXml(element, "code"));
        property.setCountry(sanitizeXml(element, "country"));
        return property;
    }

    private String sanitizeXml(XCardElement element, String name) {
        String value = element.first(name);
        if (value == null || value.length() == 0) {
            return null;
        }
        return value;
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected Address _parseHtml(HCardElement element, List<String> warnings) {
        Address property = new Address();
        property.setPoBox(element.firstValue("post-office-box"));
        property.setExtendedAddress(element.firstValue("extended-address"));
        property.setStreetAddress(element.firstValue("street-address"));
        property.setLocality(element.firstValue("locality"));
        property.setRegion(element.firstValue("region"));
        property.setPostalCode(element.firstValue("postal-code"));
        property.setCountry(element.firstValue("country-name"));
        List<String> types = element.types();
        for (String type : types) {
            property.getParameters().addType(type);
        }
        return property;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public JCardValue _writeJson(Address property) {
        return JCardValue.structured(property.getPoBox(), property.getExtendedAddress(), property.getStreetAddress(), property.getLocality(), property.getRegion(), property.getPostalCode(), property.getCountry());
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected Address _parseJson(JCardValue value, VCardDataType dataType, VCardParameters parameters, List<String> warnings) {
        Address property = new Address();
        VCardPropertyScribe.StructuredIterator it = structured(value);
        property.setPoBox(it.nextString());
        property.setExtendedAddress(it.nextString());
        property.setStreetAddress(it.nextString());
        property.setLocality(it.nextString());
        property.setRegion(it.nextString());
        property.setPostalCode(it.nextString());
        property.setCountry(it.nextString());
        return property;
    }
}
