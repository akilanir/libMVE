package ch.qos.logback.core.rolling;

import ch.qos.logback.core.FileAppender;
import ch.qos.logback.core.rolling.helper.CompressionMode;
import ch.qos.logback.core.rolling.helper.FileNamePattern;
import java.io.File;
import java.io.IOException;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/rolling/RollingFileAppender.class */
public class RollingFileAppender<E> extends FileAppender<E> {
    File currentlyActiveFile;
    TriggeringPolicy<E> triggeringPolicy;
    RollingPolicy rollingPolicy;
    private static String RFA_NO_TP_URL = "http://logback.qos.ch/codes.html#rfa_no_tp";
    private static String RFA_NO_RP_URL = "http://logback.qos.ch/codes.html#rfa_no_rp";
    private static String COLLISION_URL = "http://logback.qos.ch/codes.html#rfa_collision";

    @Override // ch.qos.logback.core.FileAppender, ch.qos.logback.core.OutputStreamAppender, ch.qos.logback.core.UnsynchronizedAppenderBase, ch.qos.logback.core.spi.LifeCycle
    public void start() {
        if (this.triggeringPolicy == null) {
            addWarn("No TriggeringPolicy was set for the RollingFileAppender named " + getName());
            addWarn("For more information, please visit " + RFA_NO_TP_URL);
            return;
        }
        if (!this.append) {
            addWarn("Append mode is mandatory for RollingFileAppender");
            this.append = true;
        }
        if (this.rollingPolicy == null) {
            addError("No RollingPolicy was set for the RollingFileAppender named " + getName());
            addError("For more information, please visit " + RFA_NO_RP_URL);
            return;
        }
        if (fileAndPatternCollide()) {
            addError("File property collides with fileNamePattern. Aborting.");
            addError("For more information, please visit " + COLLISION_URL);
            return;
        }
        if (isPrudent()) {
            if (rawFileProperty() != null) {
                addWarn("Setting \"File\" property to null on account of prudent mode");
                setFile(null);
            }
            if (this.rollingPolicy.getCompressionMode() != CompressionMode.NONE) {
                addError("Compression is not supported in prudent mode. Aborting");
                return;
            }
        }
        this.currentlyActiveFile = new File(getFile());
        addInfo("Active log file name: " + getFile());
        super.start();
    }

    private boolean fileAndPatternCollide() {
        FileNamePattern fileNamePattern;
        if (!(this.triggeringPolicy instanceof RollingPolicyBase) || (fileNamePattern = ((RollingPolicyBase) this.triggeringPolicy).fileNamePattern) == null || this.fileName == null) {
            return false;
        }
        return this.fileName.matches(fileNamePattern.toRegex());
    }

    @Override // ch.qos.logback.core.OutputStreamAppender, ch.qos.logback.core.UnsynchronizedAppenderBase, ch.qos.logback.core.spi.LifeCycle
    public void stop() {
        if (this.rollingPolicy != null) {
            this.rollingPolicy.stop();
        }
        if (this.triggeringPolicy != null) {
            this.triggeringPolicy.stop();
        }
        super.stop();
    }

    @Override // ch.qos.logback.core.FileAppender
    public void setFile(String str) {
        if (str != null && (this.triggeringPolicy != null || this.rollingPolicy != null)) {
            addError("File property must be set before any triggeringPolicy or rollingPolicy properties");
            addError("Visit http://logback.qos.ch/codes.html#rfa_file_after for more information");
        }
        super.setFile(str);
    }

    @Override // ch.qos.logback.core.FileAppender
    public String getFile() {
        return this.rollingPolicy.getActiveFileName();
    }

    public void rollover() {
        synchronized (this.lock) {
            closeOutputStream();
            try {
                this.rollingPolicy.rollover();
            } catch (RolloverFailure e) {
                addWarn("RolloverFailure occurred. Deferring rollover");
                this.append = true;
            }
            String activeFileName = this.rollingPolicy.getActiveFileName();
            try {
                this.currentlyActiveFile = new File(activeFileName);
                openFile(activeFileName);
            } catch (IOException e2) {
                addError("openFile(" + activeFileName + ") failed", e2);
            }
        }
    }

    @Override // ch.qos.logback.core.FileAppender, ch.qos.logback.core.OutputStreamAppender
    protected void subAppend(E e) {
        synchronized (this.triggeringPolicy) {
            if (this.triggeringPolicy.isTriggeringEvent(this.currentlyActiveFile, e)) {
                rollover();
            }
        }
        super.subAppend(e);
    }

    public RollingPolicy getRollingPolicy() {
        return this.rollingPolicy;
    }

    public TriggeringPolicy<E> getTriggeringPolicy() {
        return this.triggeringPolicy;
    }

    public void setRollingPolicy(RollingPolicy rollingPolicy) {
        this.rollingPolicy = rollingPolicy;
        if (this.rollingPolicy instanceof TriggeringPolicy) {
            this.triggeringPolicy = (TriggeringPolicy) rollingPolicy;
        }
    }

    public void setTriggeringPolicy(TriggeringPolicy<E> triggeringPolicy) {
        this.triggeringPolicy = triggeringPolicy;
        if (triggeringPolicy instanceof RollingPolicy) {
            this.rollingPolicy = (RollingPolicy) triggeringPolicy;
        }
    }
}
