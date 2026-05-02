package org.simpleframework.xml.transform;

import java.util.TimeZone;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/transform/TimeZoneTransform.class */
class TimeZoneTransform implements Transform<TimeZone> {
    TimeZoneTransform() {
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // org.simpleframework.xml.transform.Transform
    public TimeZone read(String zone) {
        return TimeZone.getTimeZone(zone);
    }

    @Override // org.simpleframework.xml.transform.Transform
    public String write(TimeZone zone) {
        return zone.getID();
    }
}
