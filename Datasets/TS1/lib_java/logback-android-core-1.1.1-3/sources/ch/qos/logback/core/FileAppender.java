package ch.qos.logback.core;

import ch.qos.logback.core.recovery.ResilientFileOutputStream;
import ch.qos.logback.core.util.EnvUtil;
import ch.qos.logback.core.util.FileUtil;
import java.io.File;
import java.io.IOException;
import java.nio.channels.FileChannel;
import java.nio.channels.FileLock;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/FileAppender.class */
public class FileAppender<E> extends OutputStreamAppender<E> {
    protected boolean append = true;
    protected String fileName = null;
    private boolean prudent = false;
    private boolean initialized = false;
    private boolean lazyInit = false;

    public void setFile(String str) {
        if (str == null) {
            this.fileName = null;
        } else {
            this.fileName = str.trim();
        }
    }

    public boolean isAppend() {
        return this.append;
    }

    public final String rawFileProperty() {
        return this.fileName;
    }

    public String getFile() {
        return this.fileName;
    }

    @Override // ch.qos.logback.core.OutputStreamAppender, ch.qos.logback.core.UnsynchronizedAppenderBase, ch.qos.logback.core.spi.LifeCycle
    public void start() {
        int i = 0;
        String file = getFile();
        if (file != null) {
            String absoluteFilePath = getAbsoluteFilePath(file);
            addInfo("File property is set to [" + absoluteFilePath + "]");
            if (this.prudent && !isAppend()) {
                setAppend(true);
                addWarn("Setting \"Append\" property to true on account of \"Prudent\" mode");
            }
            if (this.lazyInit) {
                setOutputStream(new NOPOutputStream());
            } else {
                try {
                    openFile(absoluteFilePath);
                } catch (IOException e) {
                    i = 0 + 1;
                    addError("openFile(" + absoluteFilePath + "," + this.append + ") failed", e);
                }
            }
        } else {
            i = 0 + 1;
            addError("\"File\" property not set for appender named [" + this.name + "]");
        }
        if (i == 0) {
            super.start();
        }
    }

    protected boolean openFile(String str) throws IOException {
        String absoluteFilePath = getAbsoluteFilePath(str);
        synchronized (this.lock) {
            File file = new File(absoluteFilePath);
            if (FileUtil.isParentDirectoryCreationRequired(file) && !FileUtil.createMissingParentDirectories(file)) {
                addError("Failed to create parent directories for [" + file.getAbsolutePath() + "]");
            }
            ResilientFileOutputStream resilientFileOutputStream = new ResilientFileOutputStream(file, this.append);
            resilientFileOutputStream.setContext(this.context);
            setOutputStream(resilientFileOutputStream);
        }
        return true;
    }

    public boolean isPrudent() {
        return this.prudent;
    }

    public void setPrudent(boolean z) {
        this.prudent = z;
    }

    public void setAppend(boolean z) {
        this.append = z;
    }

    public boolean getLazy() {
        return this.lazyInit;
    }

    public void setLazy(boolean z) {
        this.lazyInit = z;
    }

    private void safeWrite(E e) throws IOException {
        FileChannel channel = ((ResilientFileOutputStream) getOutputStream()).getChannel();
        if (channel == null) {
            return;
        }
        FileLock fileLock = null;
        try {
            fileLock = channel.lock();
            long position = channel.position();
            long size = channel.size();
            if (size != position) {
                channel.position(size);
            }
            super.writeOut(e);
            if (fileLock != null) {
                fileLock.release();
            }
        } catch (Throwable th) {
            if (fileLock != null) {
                fileLock.release();
            }
            throw th;
        }
    }

    @Override // ch.qos.logback.core.OutputStreamAppender
    protected void writeOut(E e) throws IOException {
        if (this.prudent) {
            safeWrite(e);
        } else {
            super.writeOut(e);
        }
    }

    @Override // ch.qos.logback.core.OutputStreamAppender
    protected void subAppend(E e) {
        if (!this.initialized && this.lazyInit) {
            this.initialized = true;
            try {
                openFile(getFile());
            } catch (IOException e2) {
                this.started = false;
                addError("openFile(" + this.fileName + "," + this.append + ") failed", e2);
            }
        }
        super.subAppend(e);
    }

    private String getAbsoluteFilePath(String str) {
        if (EnvUtil.isAndroidOS()) {
            str = FileUtil.prefixRelativePath(this.context.getProperty(CoreConstants.DATA_DIR_KEY), str);
        }
        return str;
    }
}
