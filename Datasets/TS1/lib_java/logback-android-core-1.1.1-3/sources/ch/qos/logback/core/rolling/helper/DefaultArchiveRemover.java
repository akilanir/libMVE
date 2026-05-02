package ch.qos.logback.core.rolling.helper;

import ch.qos.logback.core.pattern.Converter;
import ch.qos.logback.core.pattern.LiteralConverter;
import ch.qos.logback.core.spi.ContextAwareBase;
import java.io.File;
import java.util.Date;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/rolling/helper/DefaultArchiveRemover.class */
public abstract class DefaultArchiveRemover extends ContextAwareBase implements ArchiveRemover {
    protected static final long UNINITIALIZED = -1;
    protected static final long INACTIVITY_TOLERANCE_IN_MILLIS = 5529600000L;
    static final int MAX_VALUE_FOR_INACTIVITY_PERIODS = 336;
    final FileNamePattern fileNamePattern;
    final RollingCalendar rc;
    int periodOffsetForDeletionTarget;
    final boolean parentClean;
    long lastHeartBeat = UNINITIALIZED;

    public DefaultArchiveRemover(FileNamePattern fileNamePattern, RollingCalendar rollingCalendar) {
        this.fileNamePattern = fileNamePattern;
        this.rc = rollingCalendar;
        this.parentClean = computeParentCleaningFlag(fileNamePattern);
    }

    int computeElapsedPeriodsSinceLastClean(long j) {
        long periodsElapsed;
        if (this.lastHeartBeat == UNINITIALIZED) {
            addInfo("first clean up after appender initialization");
            periodsElapsed = this.rc.periodsElapsed(j, j + INACTIVITY_TOLERANCE_IN_MILLIS);
            if (periodsElapsed > 336) {
                periodsElapsed = 336;
            }
        } else {
            periodsElapsed = this.rc.periodsElapsed(this.lastHeartBeat, j);
            if (periodsElapsed < 1) {
                addWarn("Unexpected periodsElapsed value " + periodsElapsed);
                periodsElapsed = 1;
            }
        }
        return (int) periodsElapsed;
    }

    @Override // ch.qos.logback.core.rolling.helper.ArchiveRemover
    public void clean(Date date) {
        long time = date.getTime();
        int computeElapsedPeriodsSinceLastClean = computeElapsedPeriodsSinceLastClean(time);
        this.lastHeartBeat = time;
        if (computeElapsedPeriodsSinceLastClean > 1) {
            addInfo("periodsElapsed = " + computeElapsedPeriodsSinceLastClean);
        }
        for (int i = 0; i < computeElapsedPeriodsSinceLastClean; i++) {
            cleanByPeriodOffset(date, this.periodOffsetForDeletionTarget - i);
        }
    }

    abstract void cleanByPeriodOffset(Date date, int i);

    boolean computeParentCleaningFlag(FileNamePattern fileNamePattern) {
        Converter<Object> converter;
        if (fileNamePattern.getPrimaryDateTokenConverter().getDatePattern().indexOf(47) != -1) {
            return true;
        }
        Converter<Object> converter2 = fileNamePattern.headTokenConverter;
        while (true) {
            converter = converter2;
            if (converter == null || (converter instanceof DateTokenConverter)) {
                break;
            }
            converter2 = converter.getNext();
        }
        while (converter != null) {
            if ((converter instanceof LiteralConverter) && converter.convert(null).indexOf(47) != -1) {
                return true;
            }
            converter = converter.getNext();
        }
        return false;
    }

    void removeFolderIfEmpty(File file) {
        removeFolderIfEmpty(file, 0);
    }

    private void removeFolderIfEmpty(File file, int i) {
        if (i < 3 && file.isDirectory() && FileFilterUtil.isEmptyDirectory(file)) {
            addInfo("deleting folder [" + file + "]");
            file.delete();
            removeFolderIfEmpty(file.getParentFile(), i + 1);
        }
    }

    @Override // ch.qos.logback.core.rolling.helper.ArchiveRemover
    public void setMaxHistory(int i) {
        this.periodOffsetForDeletionTarget = (-i) - 1;
    }
}
