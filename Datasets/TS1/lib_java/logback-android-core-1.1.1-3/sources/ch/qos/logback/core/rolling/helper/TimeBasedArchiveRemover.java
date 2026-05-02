package ch.qos.logback.core.rolling.helper;

import java.io.File;
import java.util.Date;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/rolling/helper/TimeBasedArchiveRemover.class */
public class TimeBasedArchiveRemover extends DefaultArchiveRemover {
    public TimeBasedArchiveRemover(FileNamePattern fileNamePattern, RollingCalendar rollingCalendar) {
        super(fileNamePattern, rollingCalendar);
    }

    @Override // ch.qos.logback.core.rolling.helper.DefaultArchiveRemover
    protected void cleanByPeriodOffset(Date date, int i) {
        File file = new File(this.fileNamePattern.convert(this.rc.getRelativeDate(date, i)));
        if (file.exists() && file.isFile()) {
            file.delete();
            addInfo("deleting " + file);
            if (this.parentClean) {
                removeFolderIfEmpty(file.getParentFile());
            }
        }
    }

    public String toString() {
        return "c.q.l.core.rolling.helper.TimeBasedArchiveRemover";
    }
}
