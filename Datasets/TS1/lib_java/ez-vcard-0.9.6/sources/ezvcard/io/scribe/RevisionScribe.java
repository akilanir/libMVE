package ezvcard.io.scribe;

import ezvcard.VCardDataType;
import ezvcard.VCardVersion;
import ezvcard.io.CannotParseException;
import ezvcard.io.html.HCardElement;
import ezvcard.io.json.JCardValue;
import ezvcard.io.xml.XCardElement;
import ezvcard.parameter.VCardParameters;
import ezvcard.property.Revision;
import ezvcard.property.VCardProperty;
import java.util.Date;
import java.util.List;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/RevisionScribe.class */
public class RevisionScribe extends VCardPropertyScribe<Revision> {
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

    public RevisionScribe() {
        super(Revision.class, "REV");
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected VCardDataType _defaultDataType(VCardVersion version) {
        return VCardDataType.TIMESTAMP;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public String _writeText(Revision property, VCardVersion version) {
        return write(property, false);
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected Revision _parseText(String value, VCardDataType dataType, VCardVersion version, VCardParameters parameters, List<String> warnings) {
        return parse(value);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public void _writeXml(Revision property, XCardElement parent) {
        parent.append(VCardDataType.TIMESTAMP, write(property, false));
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected Revision _parseXml(XCardElement element, VCardParameters parameters, List<String> warnings) {
        String value = element.first(VCardDataType.TIMESTAMP);
        if (value != null) {
            return parse(value);
        }
        throw missingXmlElements(VCardDataType.TIMESTAMP);
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected Revision _parseHtml(HCardElement element, List<String> warnings) {
        String value = null;
        if ("time".equals(element.tagName())) {
            String datetime = element.attr("datetime");
            if (datetime.length() > 0) {
                value = datetime;
            }
        }
        if (value == null) {
            value = element.value();
        }
        return parse(value);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public JCardValue _writeJson(Revision property) {
        return JCardValue.single(write(property, true));
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected Revision _parseJson(JCardValue value, VCardDataType dataType, VCardParameters parameters, List<String> warnings) {
        String valueStr = value.asSingle();
        return parse(valueStr);
    }

    private String write(Revision property, boolean extended) {
        Date timestamp = property.getValue();
        if (timestamp == null) {
            return "";
        }
        return date(timestamp).time(true).utc(true).extended(extended).write();
    }

    private Revision parse(String value) {
        if (value == null || value.length() == 0) {
            return new Revision(null);
        }
        try {
            return new Revision(date(value));
        } catch (IllegalArgumentException e) {
            throw new CannotParseException(5, new Object[0]);
        }
    }
}
