package org.simpleframework.xml.transform;

import java.util.Date;
import java.util.GregorianCalendar;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/transform/GregorianCalendarTransform.class */
class GregorianCalendarTransform implements Transform<GregorianCalendar> {
    private final DateTransform transform;

    public GregorianCalendarTransform() throws Exception {
        this(Date.class);
    }

    public GregorianCalendarTransform(Class type) throws Exception {
        this.transform = new DateTransform(type);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // org.simpleframework.xml.transform.Transform
    public GregorianCalendar read(String date) throws Exception {
        return read(this.transform.read(date));
    }

    private GregorianCalendar read(Date date) throws Exception {
        GregorianCalendar calendar = new GregorianCalendar();
        if (date != null) {
            calendar.setTime(date);
        }
        return calendar;
    }

    @Override // org.simpleframework.xml.transform.Transform
    public String write(GregorianCalendar date) throws Exception {
        return this.transform.write((DateTransform) date.getTime());
    }
}
