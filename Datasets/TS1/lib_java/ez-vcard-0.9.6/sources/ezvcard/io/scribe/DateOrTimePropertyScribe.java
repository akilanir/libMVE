package ezvcard.io.scribe;

import ezvcard.Messages;
import ezvcard.VCardDataType;
import ezvcard.VCardVersion;
import ezvcard.io.CannotParseException;
import ezvcard.io.html.HCardElement;
import ezvcard.io.json.JCardValue;
import ezvcard.io.xml.XCardElement;
import ezvcard.parameter.VCardParameters;
import ezvcard.property.DateOrTimeProperty;
import ezvcard.property.VCardProperty;
import ezvcard.util.PartialDate;
import java.util.Date;
import java.util.List;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/DateOrTimePropertyScribe.class */
public abstract class DateOrTimePropertyScribe<T extends DateOrTimeProperty> extends VCardPropertyScribe<T> {
    protected abstract T newInstance(String str);

    protected abstract T newInstance(Date date, boolean z);

    protected abstract T newInstance(PartialDate partialDate);

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

    public DateOrTimePropertyScribe(Class<T> clazz, String propertyName) {
        super(clazz, propertyName);
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected VCardDataType _defaultDataType(VCardVersion version) {
        switch (version) {
            case V2_1:
            case V3_0:
                return null;
            case V4_0:
                return VCardDataType.DATE_AND_OR_TIME;
            default:
                return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public VCardDataType _dataType(T property, VCardVersion version) {
        switch (version) {
            case V2_1:
            case V3_0:
                return null;
            case V4_0:
                if (property.getText() != null) {
                    return VCardDataType.TEXT;
                }
                if (property.getDate() == null && property.getPartialDate() == null) {
                    return VCardDataType.DATE_AND_OR_TIME;
                }
                return property.hasTime() ? VCardDataType.DATE_TIME : VCardDataType.DATE;
            default:
                return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public String _writeText(T property, VCardVersion version) {
        Date date = property.getDate();
        if (date != null) {
            boolean extended = version == VCardVersion.V3_0;
            return date(date).time(property.hasTime()).extended(extended).utc(false).write();
        }
        if (version == VCardVersion.V4_0) {
            String text = property.getText();
            if (text != null) {
                return escape(text);
            }
            PartialDate partialDate = property.getPartialDate();
            if (partialDate != null) {
                return partialDate.toDateAndOrTime(false);
            }
            return "";
        }
        return "";
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected T _parseText(String str, VCardDataType vCardDataType, VCardVersion vCardVersion, VCardParameters vCardParameters, List<String> list) {
        String unescape = unescape(str);
        if (vCardVersion == VCardVersion.V4_0 && vCardDataType == VCardDataType.TEXT) {
            return (T) newInstance(unescape);
        }
        return (T) parse(unescape, vCardVersion, list);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public void _writeXml(T property, XCardElement parent) {
        VCardDataType dataType;
        Date date = property.getDate();
        if (date != null) {
            boolean hasTime = property.hasTime();
            String value = date(date).time(hasTime).extended(false).utc(false).write();
            VCardDataType dataType2 = hasTime ? VCardDataType.DATE_TIME : VCardDataType.DATE;
            parent.append(dataType2, value);
            return;
        }
        PartialDate partialDate = property.getPartialDate();
        if (partialDate != null) {
            if (partialDate.hasTimeComponent() && partialDate.hasDateComponent()) {
                dataType = VCardDataType.DATE_TIME;
            } else if (partialDate.hasTimeComponent()) {
                dataType = VCardDataType.TIME;
            } else if (partialDate.hasDateComponent()) {
                dataType = VCardDataType.DATE;
            } else {
                dataType = VCardDataType.DATE_AND_OR_TIME;
            }
            parent.append(dataType, partialDate.toDateAndOrTime(false));
            return;
        }
        String text = property.getText();
        if (text != null) {
            parent.append(VCardDataType.TEXT, text);
        } else {
            parent.append(VCardDataType.DATE_AND_OR_TIME, "");
        }
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected T _parseXml(XCardElement xCardElement, VCardParameters vCardParameters, List<String> list) {
        String first = xCardElement.first(VCardDataType.DATE, VCardDataType.DATE_TIME, VCardDataType.DATE_AND_OR_TIME);
        if (first != null) {
            return (T) parse(first, xCardElement.version(), list);
        }
        String first2 = xCardElement.first(VCardDataType.TEXT);
        if (first2 != null) {
            return (T) newInstance(first2);
        }
        throw missingXmlElements(VCardDataType.DATE, VCardDataType.DATE_TIME, VCardDataType.DATE_AND_OR_TIME, VCardDataType.TEXT);
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected T _parseHtml(HCardElement hCardElement, List<String> list) {
        String str = null;
        if ("time".equals(hCardElement.tagName())) {
            String attr = hCardElement.attr("datetime");
            if (attr.length() > 0) {
                str = attr;
            }
        }
        if (str == null) {
            str = hCardElement.value();
        }
        return (T) parse(str, VCardVersion.V3_0, list);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public JCardValue _writeJson(T property) {
        Date date = property.getDate();
        if (date != null) {
            boolean hasTime = property.hasTime();
            String value = date(date).time(hasTime).extended(true).utc(false).write();
            return JCardValue.single(value);
        }
        PartialDate partialDate = property.getPartialDate();
        if (partialDate != null) {
            String value2 = partialDate.toDateAndOrTime(true);
            return JCardValue.single(value2);
        }
        String text = property.getText();
        if (text != null) {
            return JCardValue.single(text);
        }
        return JCardValue.single("");
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected T _parseJson(JCardValue jCardValue, VCardDataType vCardDataType, VCardParameters vCardParameters, List<String> list) {
        String asSingle = jCardValue.asSingle();
        if (vCardDataType == VCardDataType.TEXT) {
            return (T) newInstance(asSingle);
        }
        return (T) parse(asSingle, VCardVersion.V4_0, list);
    }

    private T parse(String str, VCardVersion vCardVersion, List<String> list) {
        try {
            return (T) newInstance(date(str), str.contains("T"));
        } catch (IllegalArgumentException e) {
            if (vCardVersion == VCardVersion.V2_1 || vCardVersion == VCardVersion.V3_0) {
                throw new CannotParseException(5, new Object[0]);
            }
            try {
                return (T) newInstance(new PartialDate(str));
            } catch (IllegalArgumentException e2) {
                list.add(Messages.INSTANCE.getParseMessage(6, new Object[0]));
                return (T) newInstance(str);
            }
        }
    }
}
