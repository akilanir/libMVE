package ezvcard;

import ezvcard.property.VCardProperty;
import ezvcard.util.ListMultimap;
import ezvcard.util.StringUtils;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/ValidationWarnings.class */
public class ValidationWarnings implements Iterable<Map.Entry<VCardProperty, List<Warning>>> {
    private final ListMultimap<VCardProperty, Warning> warnings = new ListMultimap<>();

    public void add(VCardProperty property, Warning warning) {
        this.warnings.put(property, warning);
    }

    public void add(VCardProperty property, List<Warning> warnings) {
        this.warnings.putAll(property, warnings);
    }

    public ListMultimap<VCardProperty, Warning> getWarnings() {
        return this.warnings;
    }

    public boolean isEmpty() {
        return this.warnings.isEmpty();
    }

    public List<Warning> getByProperty(Class<? extends VCardProperty> propertyClass) {
        List<Warning> propWarnings = new ArrayList<>();
        Iterator i$ = this.warnings.iterator();
        while (i$.hasNext()) {
            Map.Entry<VCardProperty, List<Warning>> entry = i$.next();
            VCardProperty property = entry.getKey();
            if ((property == null && propertyClass == null) || (property != null && propertyClass == property.getClass())) {
                List<Warning> propViolations = entry.getValue();
                propWarnings.addAll(propViolations);
            }
        }
        return propWarnings;
    }

    public String toString() {
        NumberFormat nf = NumberFormat.getIntegerInstance();
        nf.setMinimumIntegerDigits(2);
        StringBuilder sb = new StringBuilder();
        Iterator i$ = this.warnings.iterator();
        while (i$.hasNext()) {
            Map.Entry<VCardProperty, List<Warning>> entry = i$.next();
            VCardProperty property = entry.getKey();
            List<Warning> propViolations = entry.getValue();
            for (Warning propViolation : propViolations) {
                if (property != null) {
                    sb.append('[');
                    sb.append(property.getClass().getSimpleName());
                    sb.append("] | ");
                }
                Integer code = propViolation.getCode();
                if (code != null) {
                    sb.append('W');
                    sb.append(nf.format(code));
                    sb.append(": ");
                }
                sb.append(propViolation.getMessage());
                sb.append(StringUtils.NEWLINE);
            }
        }
        return sb.toString();
    }

    @Override // java.lang.Iterable
    public Iterator<Map.Entry<VCardProperty, List<Warning>>> iterator() {
        return this.warnings.iterator();
    }
}
