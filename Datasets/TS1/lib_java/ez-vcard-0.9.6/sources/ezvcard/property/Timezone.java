package ezvcard.property;

import ezvcard.VCard;
import ezvcard.VCardVersion;
import ezvcard.Warning;
import ezvcard.util.UtcOffset;
import ezvcard.util.VCardDateFormat;
import java.util.List;
import java.util.SimpleTimeZone;
import java.util.TimeZone;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/property/Timezone.class */
public class Timezone extends VCardProperty implements HasAltId {
    private UtcOffset offset;
    private String text;

    public Timezone(String text) {
        this((UtcOffset) null, text);
    }

    public Timezone(Integer hourOffset, Integer minuteOffset) {
        this(new UtcOffset(hourOffset.intValue(), minuteOffset.intValue()));
    }

    public Timezone(UtcOffset offset) {
        this(offset, (String) null);
    }

    public Timezone(Integer hourOffset, Integer minuteOffset, String text) {
        this(new UtcOffset(hourOffset.intValue(), minuteOffset.intValue()), text);
    }

    public Timezone(UtcOffset offset, String text) {
        setOffset(offset);
        setText(text);
    }

    public Timezone(TimeZone timezone) {
        this(UtcOffset.parse(timezone), timezone.getID());
    }

    public Integer getHourOffset() {
        if (this.offset == null) {
            return null;
        }
        return Integer.valueOf(this.offset.getHour());
    }

    public Integer getMinuteOffset() {
        if (this.offset == null) {
            return null;
        }
        return Integer.valueOf(this.offset.getMinute());
    }

    public UtcOffset getOffset() {
        return this.offset;
    }

    public void setOffset(int hourOffset, int minuteOffset) {
        setOffset(new UtcOffset(hourOffset, minuteOffset));
    }

    public void setOffset(UtcOffset offset) {
        this.offset = offset;
    }

    public String getText() {
        return this.text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public TimeZone toTimeZone() {
        TimeZone timezone;
        if (this.text != null && (timezone = VCardDateFormat.parseTimeZoneId(this.text)) != null) {
            return timezone;
        }
        if (this.offset != null) {
            int rawHourOffset = this.offset.getHour() * 60 * 60 * 1000;
            int rawMinuteOffset = this.offset.getMinute() * 60 * 1000;
            if (rawHourOffset < 0) {
                rawMinuteOffset *= -1;
            }
            int rawOffset = rawHourOffset + rawMinuteOffset;
            String id = this.text == null ? "" : this.text;
            return new SimpleTimeZone(rawOffset, id);
        }
        return null;
    }

    public String getType() {
        return this.parameters.getType();
    }

    public void setType(String type) {
        this.parameters.setType(type);
    }

    public String getMediaType() {
        return this.parameters.getMediaType();
    }

    public void setMediaType(String mediaType) {
        this.parameters.setMediaType(mediaType);
    }

    @Override // ezvcard.property.VCardProperty
    public List<Integer[]> getPids() {
        return super.getPids();
    }

    @Override // ezvcard.property.VCardProperty
    public void addPid(int localId, int clientPidMapRef) {
        super.addPid(localId, clientPidMapRef);
    }

    @Override // ezvcard.property.VCardProperty
    public void removePids() {
        super.removePids();
    }

    @Override // ezvcard.property.VCardProperty
    public Integer getPref() {
        return super.getPref();
    }

    @Override // ezvcard.property.VCardProperty
    public void setPref(Integer pref) {
        super.setPref(pref);
    }

    @Override // ezvcard.property.HasAltId
    public String getAltId() {
        return this.parameters.getAltId();
    }

    @Override // ezvcard.property.HasAltId
    public void setAltId(String altId) {
        this.parameters.setAltId(altId);
    }

    @Override // ezvcard.property.VCardProperty
    protected void _validate(List<Warning> warnings, VCardVersion version, VCard vcard) {
        if (this.offset == null && this.text == null) {
            warnings.add(new Warning(8, new Object[0]));
        }
        if (this.offset == null && version == VCardVersion.V2_1) {
            warnings.add(new Warning(20, new Object[0]));
        }
        if (this.offset != null) {
            if (this.offset.getMinute() < 0 || this.offset.getMinute() > 59) {
                warnings.add(new Warning(21, new Object[0]));
            }
        }
    }
}
