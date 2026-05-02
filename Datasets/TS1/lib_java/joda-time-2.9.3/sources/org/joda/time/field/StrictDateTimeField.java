package org.joda.time.field;

import org.joda.time.DateTimeField;

/* loaded from: joda-time-2.9.3.jar:org/joda/time/field/StrictDateTimeField.class */
public class StrictDateTimeField extends DelegatedDateTimeField {
    private static final long serialVersionUID = 3154803964207950910L;

    public static DateTimeField getInstance(DateTimeField dateTimeField) {
        if (dateTimeField == null) {
            return null;
        }
        if (dateTimeField instanceof LenientDateTimeField) {
            dateTimeField = ((LenientDateTimeField) dateTimeField).getWrappedField();
        }
        if (!dateTimeField.isLenient()) {
            return dateTimeField;
        }
        return new StrictDateTimeField(dateTimeField);
    }

    protected StrictDateTimeField(DateTimeField dateTimeField) {
        super(dateTimeField);
    }

    @Override // org.joda.time.field.DelegatedDateTimeField, org.joda.time.DateTimeField
    public final boolean isLenient() {
        return false;
    }

    @Override // org.joda.time.field.DelegatedDateTimeField, org.joda.time.DateTimeField
    public long set(long j, int i) {
        FieldUtils.verifyValueBounds(this, i, getMinimumValue(j), getMaximumValue(j));
        return super.set(j, i);
    }
}
