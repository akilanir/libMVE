package ezvcard.property;

import ezvcard.VCard;
import ezvcard.VCardVersion;
import ezvcard.Warning;
import ezvcard.parameter.Calscale;
import ezvcard.util.PartialDate;
import java.util.Date;
import java.util.List;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/property/DateOrTimeProperty.class */
public class DateOrTimeProperty extends VCardProperty implements HasAltId {
    private String text;
    private Date date;
    private PartialDate partialDate;
    private boolean dateHasTime;

    public DateOrTimeProperty(Date date) {
        this(date, false);
    }

    public DateOrTimeProperty(Date date, boolean hasTime) {
        setDate(date, hasTime);
    }

    public DateOrTimeProperty(PartialDate partialDate) {
        setPartialDate(partialDate);
    }

    public DateOrTimeProperty(String text) {
        setText(text);
    }

    public Date getDate() {
        return this.date;
    }

    public void setDate(Date date, boolean hasTime) {
        this.date = date;
        this.dateHasTime = date == null ? false : hasTime;
        this.text = null;
        this.partialDate = null;
    }

    public PartialDate getPartialDate() {
        return this.partialDate;
    }

    public void setPartialDate(PartialDate partialDate) {
        this.partialDate = partialDate;
        this.dateHasTime = partialDate == null ? false : partialDate.hasTimeComponent();
        this.text = null;
        this.date = null;
    }

    public String getText() {
        return this.text;
    }

    public void setText(String text) {
        this.text = text;
        this.date = null;
        this.partialDate = null;
        this.dateHasTime = false;
    }

    public boolean hasTime() {
        return this.dateHasTime;
    }

    public Calscale getCalscale() {
        return this.parameters.getCalscale();
    }

    public void setCalscale(Calscale calscale) {
        this.parameters.setCalscale(calscale);
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
        if (this.date == null && this.partialDate == null && this.text == null) {
            warnings.add(new Warning(8, new Object[0]));
        }
        if (version == VCardVersion.V2_1 || version == VCardVersion.V3_0) {
            if (this.text != null) {
                warnings.add(new Warning(11, new Object[0]));
            }
            if (this.partialDate != null) {
                warnings.add(new Warning(12, new Object[0]));
            }
        }
    }
}
