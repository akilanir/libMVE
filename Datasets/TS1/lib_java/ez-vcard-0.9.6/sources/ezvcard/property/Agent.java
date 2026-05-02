package ezvcard.property;

import ezvcard.VCard;
import ezvcard.VCardVersion;
import ezvcard.ValidationWarnings;
import ezvcard.Warning;
import java.text.NumberFormat;
import java.util.EnumSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/property/Agent.class */
public class Agent extends VCardProperty {
    private String url;
    private VCard vcard;

    public Agent() {
    }

    public Agent(String url) {
        setUrl(url);
    }

    public Agent(VCard vcard) {
        setVCard(vcard);
    }

    @Override // ezvcard.property.VCardProperty
    public Set<VCardVersion> _supportedVersions() {
        return EnumSet.of(VCardVersion.V2_1, VCardVersion.V3_0);
    }

    public String getUrl() {
        return this.url;
    }

    public void setUrl(String url) {
        this.url = url;
        this.vcard = null;
    }

    public VCard getVCard() {
        return this.vcard;
    }

    public void setVCard(VCard vcard) {
        this.vcard = vcard;
        this.url = null;
    }

    @Override // ezvcard.property.VCardProperty
    protected void _validate(List<Warning> warnings, VCardVersion version, VCard vcard) {
        if (this.url == null && this.vcard == null) {
            warnings.add(new Warning(8, new Object[0]));
        }
        if (this.vcard != null) {
            NumberFormat nf = NumberFormat.getIntegerInstance();
            nf.setMinimumIntegerDigits(2);
            ValidationWarnings validationWarnings = this.vcard.validate(version);
            Iterator i$ = validationWarnings.iterator();
            while (i$.hasNext()) {
                Map.Entry<VCardProperty, List<Warning>> entry = i$.next();
                VCardProperty property = entry.getKey();
                List<Warning> propViolations = entry.getValue();
                for (Warning propViolation : propViolations) {
                    String className = property == null ? "" : property.getClass().getSimpleName();
                    int code = propViolation.getCode().intValue();
                    String codeStr = code >= 0 ? "W" + nf.format(code) : "";
                    String message = propViolation.getMessage();
                    warnings.add(new Warning(10, className, codeStr, message));
                }
            }
        }
    }
}
