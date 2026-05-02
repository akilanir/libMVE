package freemarker.template.utility;

import freemarker.template.utility.DateUtil;
import java.util.Date;
import java.util.TimeZone;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/utility/J2SE14TimeZoneOffsetCalculator.class */
class J2SE14TimeZoneOffsetCalculator implements DateUtil.TimeZoneOffsetCalculator {
    J2SE14TimeZoneOffsetCalculator() {
    }

    @Override // freemarker.template.utility.DateUtil.TimeZoneOffsetCalculator
    public int getOffset(TimeZone tz, Date date) {
        return tz.getOffset(date.getTime());
    }
}
