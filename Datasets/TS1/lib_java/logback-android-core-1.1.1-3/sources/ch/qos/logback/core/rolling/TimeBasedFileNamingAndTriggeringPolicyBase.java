package ch.qos.logback.core.rolling;

import ch.qos.logback.core.rolling.helper.ArchiveRemover;
import ch.qos.logback.core.rolling.helper.DateTokenConverter;
import ch.qos.logback.core.rolling.helper.RollingCalendar;
import ch.qos.logback.core.spi.ContextAwareBase;
import java.io.File;
import java.util.Date;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/rolling/TimeBasedFileNamingAndTriggeringPolicyBase.class */
public abstract class TimeBasedFileNamingAndTriggeringPolicyBase<E> extends ContextAwareBase implements TimeBasedFileNamingAndTriggeringPolicy<E> {
    protected TimeBasedRollingPolicy<E> tbrp;
    protected String elapsedPeriodsFileName;
    protected RollingCalendar rc;
    protected long nextCheck;
    protected ArchiveRemover archiveRemover = null;
    protected long artificialCurrentTime = -1;
    protected Date dateInCurrentPeriod = null;
    protected boolean started = false;

    @Override // ch.qos.logback.core.spi.LifeCycle
    public boolean isStarted() {
        return this.started;
    }

    public void start() {
        DateTokenConverter primaryDateTokenConverter = this.tbrp.fileNamePattern.getPrimaryDateTokenConverter();
        if (primaryDateTokenConverter == null) {
            throw new IllegalStateException("FileNamePattern [" + this.tbrp.fileNamePattern.getPattern() + "] does not contain a valid DateToken");
        }
        this.rc = new RollingCalendar();
        this.rc.init(primaryDateTokenConverter.getDatePattern());
        addInfo("The date pattern is '" + primaryDateTokenConverter.getDatePattern() + "' from file name pattern '" + this.tbrp.fileNamePattern.getPattern() + "'.");
        this.rc.printPeriodicity(this);
        setDateInCurrentPeriod(new Date(getCurrentTime()));
        if (this.tbrp.getParentsRawFileProperty() != null) {
            File file = new File(this.tbrp.getParentsRawFileProperty());
            if (file.exists() && file.canRead()) {
                setDateInCurrentPeriod(new Date(file.lastModified()));
            }
        }
        addInfo("Setting initial period to " + this.dateInCurrentPeriod);
        computeNextCheck();
    }

    @Override // ch.qos.logback.core.spi.LifeCycle
    public void stop() {
        this.started = false;
    }

    protected void computeNextCheck() {
        this.nextCheck = this.rc.getNextTriggeringMillis(this.dateInCurrentPeriod);
    }

    protected void setDateInCurrentPeriod(long j) {
        this.dateInCurrentPeriod.setTime(j);
    }

    public void setDateInCurrentPeriod(Date date) {
        this.dateInCurrentPeriod = date;
    }

    @Override // ch.qos.logback.core.rolling.TimeBasedFileNamingAndTriggeringPolicy
    public String getElapsedPeriodsFileName() {
        return this.elapsedPeriodsFileName;
    }

    public String getCurrentPeriodsFileNameWithoutCompressionSuffix() {
        return this.tbrp.fileNamePatternWCS.convert(this.dateInCurrentPeriod);
    }

    @Override // ch.qos.logback.core.rolling.TimeBasedFileNamingAndTriggeringPolicy
    public void setCurrentTime(long j) {
        this.artificialCurrentTime = j;
    }

    @Override // ch.qos.logback.core.rolling.TimeBasedFileNamingAndTriggeringPolicy
    public long getCurrentTime() {
        return this.artificialCurrentTime >= 0 ? this.artificialCurrentTime : System.currentTimeMillis();
    }

    @Override // ch.qos.logback.core.rolling.TimeBasedFileNamingAndTriggeringPolicy
    public void setTimeBasedRollingPolicy(TimeBasedRollingPolicy<E> timeBasedRollingPolicy) {
        this.tbrp = timeBasedRollingPolicy;
    }

    @Override // ch.qos.logback.core.rolling.TimeBasedFileNamingAndTriggeringPolicy
    public ArchiveRemover getArchiveRemover() {
        return this.archiveRemover;
    }
}
