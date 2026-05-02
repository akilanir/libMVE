package ezvcard.io.scribe;

import ezvcard.VCardDataType;
import ezvcard.VCardVersion;
import ezvcard.parameter.VCardParameters;
import ezvcard.property.RawProperty;
import ezvcard.property.VCardProperty;
import java.util.List;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/RawPropertyScribe.class */
public class RawPropertyScribe extends VCardPropertyScribe<RawProperty> {
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected /* bridge */ /* synthetic */ VCardProperty _parseText(String x0, VCardDataType x1, VCardVersion x2, VCardParameters x3, List x4) {
        return _parseText(x0, x1, x2, x3, (List<String>) x4);
    }

    public RawPropertyScribe(String propertyName) {
        super(RawProperty.class, propertyName);
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected VCardDataType _defaultDataType(VCardVersion version) {
        return null;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public VCardDataType _dataType(RawProperty property, VCardVersion version) {
        return property.getDataType();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public String _writeText(RawProperty property, VCardVersion version) {
        String value = property.getValue();
        return value == null ? "" : value;
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected RawProperty _parseText(String value, VCardDataType dataType, VCardVersion version, VCardParameters parameters, List<String> warnings) {
        RawProperty property = new RawProperty(this.propertyName, value);
        property.setDataType(dataType);
        return property;
    }
}
