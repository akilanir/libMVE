package ezvcard.io.scribe;

import ezvcard.VCardDataType;
import ezvcard.VCardVersion;
import ezvcard.io.html.HCardElement;
import ezvcard.io.json.JCardValue;
import ezvcard.io.scribe.VCardPropertyScribe;
import ezvcard.io.xml.XCardElement;
import ezvcard.parameter.VCardParameters;
import ezvcard.property.Organization;
import ezvcard.property.VCardProperty;
import java.util.List;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/OrganizationScribe.class */
public class OrganizationScribe extends VCardPropertyScribe<Organization> {
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

    public OrganizationScribe() {
        super(Organization.class, "ORG");
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected VCardDataType _defaultDataType(VCardVersion version) {
        return VCardDataType.TEXT;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public String _writeText(Organization property, VCardVersion version) {
        return structured(property.getValues().toArray());
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected Organization _parseText(String value, VCardDataType dataType, VCardVersion version, VCardParameters parameters, List<String> warnings) {
        Organization property = new Organization();
        VCardPropertyScribe.SemiStructuredIterator it = semistructured(value);
        while (it.hasNext()) {
            property.addValue(it.next());
        }
        return property;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public void _writeXml(Organization property, XCardElement parent) {
        parent.append(VCardDataType.TEXT.getName().toLowerCase(), property.getValues());
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected Organization _parseXml(XCardElement element, VCardParameters parameters, List<String> warnings) {
        List<String> values = element.all(VCardDataType.TEXT);
        if (values.isEmpty()) {
            throw missingXmlElements(VCardDataType.TEXT);
        }
        Organization property = new Organization();
        property.getValues().addAll(values);
        return property;
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected Organization _parseHtml(HCardElement element, List<String> warnings) {
        Organization property = new Organization();
        String orgName = element.firstValue("organization-name");
        if (orgName != null) {
            property.addValue(orgName);
        }
        String orgUnit = element.firstValue("organization-unit");
        if (orgUnit != null) {
            property.addValue(orgUnit);
        }
        if (property.getValues().isEmpty()) {
            property.addValue(element.value());
        }
        return property;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public JCardValue _writeJson(Organization property) {
        List<String> values = property.getValues();
        if (values.isEmpty()) {
            return JCardValue.single("");
        }
        return values.size() == 1 ? JCardValue.single(values.get(0)) : JCardValue.structured(values);
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected Organization _parseJson(JCardValue value, VCardDataType dataType, VCardParameters parameters, List<String> warnings) {
        Organization property = new Organization();
        VCardPropertyScribe.StructuredIterator it = structured(value);
        while (it.hasNext()) {
            property.addValue(it.nextString());
        }
        return property;
    }
}
