package ch.qos.logback.core.rolling;

import ch.qos.logback.core.CoreConstants;
import ch.qos.logback.core.rolling.helper.ArchiveRemover;
import ch.qos.logback.core.rolling.helper.AsynchronousCompressor;
import ch.qos.logback.core.rolling.helper.CompressionMode;
import ch.qos.logback.core.rolling.helper.Compressor;
import ch.qos.logback.core.rolling.helper.FileFilterUtil;
import ch.qos.logback.core.rolling.helper.FileNamePattern;
import ch.qos.logback.core.rolling.helper.RenameUtil;
import java.io.File;
import java.util.Date;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/rolling/TimeBasedRollingPolicy.class */
public class TimeBasedRollingPolicy<E> extends RollingPolicyBase implements TriggeringPolicy<E> {
    static final String FNP_NOT_SET = "The FileNamePattern option must be set before using TimeBasedRollingPolicy. ";
    static final int INFINITE_HISTORY = 0;
    FileNamePattern fileNamePatternWCS;
    private Compressor compressor;
    Future<?> future;
    private ArchiveRemover archiveRemover;
    TimeBasedFileNamingAndTriggeringPolicy<E> timeBasedFileNamingAndTriggeringPolicy;
    private RenameUtil renameUtil = new RenameUtil();
    private int maxHistory = 0;
    boolean cleanHistoryOnStart = false;

    @Override // ch.qos.logback.core.rolling.RollingPolicyBase, ch.qos.logback.core.spi.LifeCycle
    public void start() {
        this.renameUtil.setContext(this.context);
        if (this.fileNamePatternStr == null) {
            addWarn(FNP_NOT_SET);
            addWarn(CoreConstants.SEE_FNP_NOT_SET);
            throw new IllegalStateException("The FileNamePattern option must be set before using TimeBasedRollingPolicy. See also http://logback.qos.ch/codes.html#tbr_fnp_not_set");
        }
        this.fileNamePattern = new FileNamePattern(this.fileNamePatternStr, this.context);
        determineCompressionMode();
        this.compressor = new Compressor(this.compressionMode);
        this.compressor.setContext(this.context);
        this.fileNamePatternWCS = new FileNamePattern(Compressor.computeFileNameStr_WCS(this.fileNamePatternStr, this.compressionMode), this.context);
        addInfo("Will use the pattern " + this.fileNamePatternWCS + " for the active file");
        if (this.compressionMode == CompressionMode.ZIP) {
            this.zipEntryFileNamePattern = new FileNamePattern(transformFileNamePattern2ZipEntry(this.fileNamePatternStr), this.context);
        }
        if (this.timeBasedFileNamingAndTriggeringPolicy == null) {
            this.timeBasedFileNamingAndTriggeringPolicy = new DefaultTimeBasedFileNamingAndTriggeringPolicy();
        }
        this.timeBasedFileNamingAndTriggeringPolicy.setContext(this.context);
        this.timeBasedFileNamingAndTriggeringPolicy.setTimeBasedRollingPolicy(this);
        this.timeBasedFileNamingAndTriggeringPolicy.start();
        if (this.maxHistory != 0) {
            this.archiveRemover = this.timeBasedFileNamingAndTriggeringPolicy.getArchiveRemover();
            this.archiveRemover.setMaxHistory(this.maxHistory);
            if (this.cleanHistoryOnStart) {
                addInfo("Cleaning on start up");
                this.archiveRemover.clean(new Date(this.timeBasedFileNamingAndTriggeringPolicy.getCurrentTime()));
            }
        }
        super.start();
    }

    @Override // ch.qos.logback.core.rolling.RollingPolicyBase, ch.qos.logback.core.spi.LifeCycle
    public void stop() {
        if (isStarted()) {
            waitForAsynchronousJobToStop();
            super.stop();
        }
    }

    private void waitForAsynchronousJobToStop() {
        if (this.future != null) {
            try {
                this.future.get(30L, TimeUnit.SECONDS);
            } catch (TimeoutException e) {
                addError("Timeout while waiting for compression job to finish", e);
            } catch (Exception e2) {
                addError("Unexpected exception while waiting for compression job to finish", e2);
            }
        }
    }

    private String transformFileNamePattern2ZipEntry(String str) {
        return FileFilterUtil.afterLastSlash(FileFilterUtil.slashify(str));
    }

    public void setTimeBasedFileNamingAndTriggeringPolicy(TimeBasedFileNamingAndTriggeringPolicy<E> timeBasedFileNamingAndTriggeringPolicy) {
        this.timeBasedFileNamingAndTriggeringPolicy = timeBasedFileNamingAndTriggeringPolicy;
    }

    public TimeBasedFileNamingAndTriggeringPolicy<E> getTimeBasedFileNamingAndTriggeringPolicy() {
        return this.timeBasedFileNamingAndTriggeringPolicy;
    }

    @Override // ch.qos.logback.core.rolling.RollingPolicy
    public void rollover() throws RolloverFailure {
        String elapsedPeriodsFileName = this.timeBasedFileNamingAndTriggeringPolicy.getElapsedPeriodsFileName();
        String afterLastSlash = FileFilterUtil.afterLastSlash(elapsedPeriodsFileName);
        if (this.compressionMode == CompressionMode.NONE) {
            if (getParentsRawFileProperty() != null) {
                this.renameUtil.rename(getParentsRawFileProperty(), elapsedPeriodsFileName);
            }
        } else if (getParentsRawFileProperty() == null) {
            this.future = asyncCompress(elapsedPeriodsFileName, elapsedPeriodsFileName, afterLastSlash);
        } else {
            this.future = renamedRawAndAsyncCompress(elapsedPeriodsFileName, afterLastSlash);
        }
        if (this.archiveRemover != null) {
            this.archiveRemover.clean(new Date(this.timeBasedFileNamingAndTriggeringPolicy.getCurrentTime()));
        }
    }

    Future asyncCompress(String str, String str2, String str3) throws RolloverFailure {
        return new AsynchronousCompressor(this.compressor).compressAsynchronously(str, str2, str3);
    }

    Future renamedRawAndAsyncCompress(String str, String str2) throws RolloverFailure {
        String parentsRawFileProperty = getParentsRawFileProperty();
        String str3 = parentsRawFileProperty + System.nanoTime() + ".tmp";
        this.renameUtil.rename(parentsRawFileProperty, str3);
        return asyncCompress(str3, str, str2);
    }

    @Override // ch.qos.logback.core.rolling.RollingPolicy
    public String getActiveFileName() {
        String parentsRawFileProperty = getParentsRawFileProperty();
        return parentsRawFileProperty != null ? parentsRawFileProperty : this.timeBasedFileNamingAndTriggeringPolicy.getCurrentPeriodsFileNameWithoutCompressionSuffix();
    }

    @Override // ch.qos.logback.core.rolling.TriggeringPolicy
    public boolean isTriggeringEvent(File file, E e) {
        return this.timeBasedFileNamingAndTriggeringPolicy.isTriggeringEvent(file, e);
    }

    public int getMaxHistory() {
        return this.maxHistory;
    }

    public void setMaxHistory(int i) {
        this.maxHistory = i;
    }

    public boolean isCleanHistoryOnStart() {
        return this.cleanHistoryOnStart;
    }

    public void setCleanHistoryOnStart(boolean z) {
        this.cleanHistoryOnStart = z;
    }

    public String toString() {
        return "c.q.l.core.rolling.TimeBasedRollingPolicy";
    }
}
