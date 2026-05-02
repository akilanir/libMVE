package ezvcard.io.scribe;

import ezvcard.Messages;
import ezvcard.VCardDataType;
import ezvcard.VCardVersion;
import ezvcard.io.CannotParseException;
import ezvcard.io.html.HCardElement;
import ezvcard.io.json.JCardValue;
import ezvcard.io.xml.XCardElement;
import ezvcard.parameter.VCardParameters;
import ezvcard.property.Timezone;
import ezvcard.property.VCardProperty;
import ezvcard.util.UtcOffset;
import java.util.List;
import java.util.TimeZone;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/TimezoneScribe.class */
public class TimezoneScribe extends VCardPropertyScribe<Timezone> {
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

    public TimezoneScribe() {
        super(Timezone.class, VCardParameters.TZ);
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected VCardDataType _defaultDataType(VCardVersion version) {
        switch (version) {
            case V2_1:
            case V3_0:
                return VCardDataType.UTC_OFFSET;
            case V4_0:
                return VCardDataType.TEXT;
            default:
                return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public VCardDataType _dataType(Timezone property, VCardVersion version) {
        String text = property.getText();
        UtcOffset offset = property.getOffset();
        switch (version) {
            case V2_1:
                return VCardDataType.UTC_OFFSET;
            case V3_0:
                if (offset != null) {
                    return VCardDataType.UTC_OFFSET;
                }
                if (text != null) {
                    return VCardDataType.TEXT;
                }
                break;
            case V4_0:
                if (text != null) {
                    return VCardDataType.TEXT;
                }
                if (offset != null) {
                    return VCardDataType.UTC_OFFSET;
                }
                break;
        }
        return _defaultDataType(version);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public String _writeText(Timezone property, VCardVersion version) {
        TimeZone timezone;
        String text = property.getText();
        UtcOffset offset = property.getOffset();
        switch (version) {
            case V2_1:
                if (offset != null) {
                    return offset.toString(false);
                }
                if (text != null && (timezone = timezoneFromId(text)) != null) {
                    UtcOffset tzOffset = offsetFromTimezone(timezone);
                    return tzOffset.toString(false);
                }
                return "";
            case V3_0:
                if (offset != null) {
                    return offset.toString(true);
                }
                if (text != null) {
                    return escape(text);
                }
                return "";
            case V4_0:
                if (text != null) {
                    return escape(text);
                }
                if (offset != null) {
                    return offset.toString(false);
                }
                return "";
            default:
                return "";
        }
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected Timezone _parseText(String value, VCardDataType dataType, VCardVersion version, VCardParameters parameters, List<String> warnings) {
        return parse(unescape(value), dataType, version, warnings);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public void _writeXml(Timezone property, XCardElement parent) {
        String text = property.getText();
        if (text != null) {
            parent.append(VCardDataType.TEXT, text);
            return;
        }
        UtcOffset offset = property.getOffset();
        if (offset != null) {
            parent.append(VCardDataType.UTC_OFFSET, offset.toString(false));
        } else {
            parent.append(VCardDataType.TEXT, "");
        }
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected Timezone _parseXml(XCardElement element, VCardParameters parameters, List<String> warnings) {
        String text = element.first(VCardDataType.TEXT);
        if (text != null) {
            return new Timezone(text);
        }
        String utcOffset = element.first(VCardDataType.UTC_OFFSET);
        if (utcOffset == null) {
            throw missingXmlElements(VCardDataType.TEXT, VCardDataType.UTC_OFFSET);
        }
        try {
            return new Timezone(UtcOffset.parse(utcOffset));
        } catch (IllegalArgumentException e) {
            throw new CannotParseException(19, new Object[0]);
        }
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected Timezone _parseHtml(HCardElement element, List<String> warnings) {
        return parse(element.value(), null, VCardVersion.V3_0, warnings);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public JCardValue _writeJson(Timezone property) {
        String text = property.getText();
        if (text != null) {
            return JCardValue.single(text);
        }
        UtcOffset offset = property.getOffset();
        if (offset != null) {
            return JCardValue.single(offset.toString(true));
        }
        return JCardValue.single("");
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected Timezone _parseJson(JCardValue value, VCardDataType dataType, VCardParameters parameters, List<String> warnings) {
        String valueStr = value.asSingle();
        return parse(valueStr, dataType, VCardVersion.V4_0, warnings);
    }

    private Timezone parse(String value, VCardDataType dataType, VCardVersion version, List<String> warnings) {
        if (value == null || value.length() == 0) {
            return new Timezone((String) null);
        }
        switch (version) {
            case V2_1:
                try {
                    return new Timezone(UtcOffset.parse(value));
                } catch (IllegalArgumentException e) {
                    throw new CannotParseException(19, new Object[0]);
                }
            case V3_0:
            case V4_0:
                try {
                    return new Timezone(UtcOffset.parse(value));
                } catch (IllegalArgumentException e2) {
                    if (dataType == VCardDataType.UTC_OFFSET) {
                        warnings.add(Messages.INSTANCE.getParseMessage(20, new Object[0]));
                    }
                    return new Timezone(value);
                }
            default:
                return new Timezone((String) null);
        }
    }

    private UtcOffset offsetFromTimezone(TimeZone timezone) {
        long offsetMs = timezone.getOffset(System.currentTimeMillis());
        int hours = (int) (((offsetMs / 1000) / 60) / 60);
        int minutes = (int) (((offsetMs / 1000) / 60) % 60);
        if (minutes < 0) {
            minutes *= -1;
        }
        return new UtcOffset(hours, minutes);
    }

    private TimeZone timezoneFromId(String id) {
        TimeZone timezone = TimeZone.getTimeZone(id);
        if ("GMT".equals(timezone.getID())) {
            return null;
        }
        return timezone;
    }
}
