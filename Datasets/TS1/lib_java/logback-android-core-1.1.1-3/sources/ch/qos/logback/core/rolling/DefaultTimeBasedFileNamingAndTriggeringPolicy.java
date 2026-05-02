package ch.qos.logback.core.rolling;

import ch.qos.logback.core.rolling.helper.TimeBasedArchiveRemover;
import java.io.File;
import java.util.Date;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/rolling/DefaultTimeBasedFileNamingAndTriggeringPolicy.class */
public class DefaultTimeBasedFileNamingAndTriggeringPolicy<E> extends TimeBasedFileNamingAndTriggeringPolicyBase<E> {
    @Override // ch.qos.logback.core.rolling.TimeBasedFileNamingAndTriggeringPolicyBase, ch.qos.logback.core.spi.LifeCycle
    public void start() {
        super.start();
        this.archiveRemover = new TimeBasedArchiveRemover(this.tbrp.fileNamePattern, this.rc);
        this.archiveRemover.setContext(this.context);
        this.started = true;
    }

    @Override // ch.qos.logback.core.rolling.TriggeringPolicy
    public boolean isTriggeringEvent(File file, E e) {
        long currentTime = getCurrentTime();
        if (currentTime < this.nextCheck) {
            return false;
        }
        Date date = this.dateInCurrentPeriod;
        addInfo("Elapsed period: " + date);
        this.elapsedPeriodsFileName = this.tbrp.fileNamePatternWCS.convert(date);
        setDateInCurrentPeriod(currentTime);
        computeNextCheck();
        return true;
    }

    public String toString() {
        return "c.q.l.core.rolling.DefaultTimeBasedFileNamingAndTriggeringPolicy";
    }
}
