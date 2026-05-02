package ch.qos.logback.classic.turbo;

import ch.qos.logback.classic.LoggerContext;
import ch.qos.logback.classic.joran.JoranConfigurator;
import ch.qos.logback.core.joran.event.SaxEvent;
import ch.qos.logback.core.joran.spi.ConfigurationWatchList;
import ch.qos.logback.core.joran.spi.JoranException;
import ch.qos.logback.core.joran.util.ConfigurationWatchListUtil;
import ch.qos.logback.core.status.StatusUtil;
import java.net.URL;
import java.util.List;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/turbo/ReconfigureOnChangeFilter.class */
public class ReconfigureOnChangeFilter extends TurboFilter {
    public static final long DEFAULT_REFRESH_PERIOD = 60000;
    URL mainConfigurationURL;
    protected volatile long nextCheck;
    ConfigurationWatchList configurationWatchList;
    private static final int MAX_MASK = 65535;
    private static final long MASK_INCREASE_THRESHOLD = 100;
    private static final long MASK_DECREASE_THRESHOLD = 800;
    long refreshPeriod = DEFAULT_REFRESH_PERIOD;
    private long invocationCounter = 0;
    private volatile long mask = 15;
    private volatile long lastMaskCheck = System.currentTimeMillis();

    /* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/turbo/ReconfigureOnChangeFilter$ReconfiguringThread.class */
    class ReconfiguringThread implements Runnable {
        ReconfiguringThread() {
        }

        @Override // java.lang.Runnable
        public void run() {
            if (ReconfigureOnChangeFilter.this.mainConfigurationURL == null) {
                ReconfigureOnChangeFilter.this.addInfo("Due to missing top level configuration file, skipping reconfiguration");
                return;
            }
            LoggerContext loggerContext = (LoggerContext) ReconfigureOnChangeFilter.this.context;
            ReconfigureOnChangeFilter.this.addInfo("Will reset and reconfigure context named [" + ReconfigureOnChangeFilter.this.context.getName() + "]");
            if (ReconfigureOnChangeFilter.this.mainConfigurationURL.toString().endsWith("xml")) {
                performXMLConfiguration(loggerContext);
            }
        }

        private void performXMLConfiguration(LoggerContext loggerContext) {
            JoranConfigurator joranConfigurator = new JoranConfigurator();
            joranConfigurator.setContext(ReconfigureOnChangeFilter.this.context);
            StatusUtil statusUtil = new StatusUtil(ReconfigureOnChangeFilter.this.context);
            List recallSafeConfiguration = joranConfigurator.recallSafeConfiguration();
            URL mainWatchURL = ConfigurationWatchListUtil.getMainWatchURL(ReconfigureOnChangeFilter.this.context);
            loggerContext.reset();
            long currentTimeMillis = System.currentTimeMillis();
            try {
                joranConfigurator.doConfigure(ReconfigureOnChangeFilter.this.mainConfigurationURL);
                if (statusUtil.hasXMLParsingErrors(currentTimeMillis)) {
                    fallbackConfiguration(loggerContext, recallSafeConfiguration, mainWatchURL);
                }
            } catch (JoranException e) {
                fallbackConfiguration(loggerContext, recallSafeConfiguration, mainWatchURL);
            }
        }

        private void fallbackConfiguration(LoggerContext loggerContext, List<SaxEvent> list, URL url) {
            JoranConfigurator joranConfigurator = new JoranConfigurator();
            joranConfigurator.setContext(ReconfigureOnChangeFilter.this.context);
            if (list == null) {
                ReconfigureOnChangeFilter.this.addWarn("No previous configuration to fall back on.");
                return;
            }
            ReconfigureOnChangeFilter.this.addWarn("Falling back to previously registered safe configuration.");
            try {
                loggerContext.reset();
                JoranConfigurator.informContextOfURLUsedForConfiguration(ReconfigureOnChangeFilter.this.context, url);
                joranConfigurator.doConfigure(list);
                ReconfigureOnChangeFilter.this.addInfo("Re-registering previous fallback configuration once more as a fallback configuration point");
                joranConfigurator.registerSafeConfiguration();
            } catch (JoranException e) {
                ReconfigureOnChangeFilter.this.addError("Unexpected exception thrown by a configuration considered safe.", e);
            }
        }
    }

    @Override // ch.qos.logback.classic.turbo.TurboFilter
    public void start() {
        this.configurationWatchList = ConfigurationWatchListUtil.getConfigurationWatchList(this.context);
        if (this.configurationWatchList == null) {
            addWarn("Empty ConfigurationWatchList in context");
            return;
        }
        this.mainConfigurationURL = this.configurationWatchList.getMainURL();
        if (this.mainConfigurationURL == null) {
            addWarn("Due to missing top level configuration file, automatic reconfiguration is impossible.");
            return;
        }
        addInfo("Will scan for changes in [" + this.configurationWatchList.getCopyOfFileWatchList() + "] every " + (this.refreshPeriod / 1000) + " seconds. ");
        synchronized (this.configurationWatchList) {
            updateNextCheck(System.currentTimeMillis());
        }
        super.start();
    }

    public String toString() {
        return "ReconfigureOnChangeFilter{invocationCounter=" + this.invocationCounter + '}';
    }

    /*  JADX ERROR: Failed to decode insn: 0x0010: MOVE_MULTI
        java.lang.ArrayIndexOutOfBoundsException: arraycopy: source index -1 out of bounds for object array[8]
        	at java.base/java.lang.System.arraycopy(Native Method)
        	at jadx.plugins.input.java.data.code.StackState.insert(StackState.java:52)
        	at jadx.plugins.input.java.data.code.CodeDecodeState.insert(CodeDecodeState.java:137)
        	at jadx.plugins.input.java.data.code.JavaInsnsRegister.dup2x1(JavaInsnsRegister.java:313)
        	at jadx.plugins.input.java.data.code.JavaInsnData.decode(JavaInsnData.java:46)
        	at jadx.core.dex.instructions.InsnDecoder.lambda$process$0(InsnDecoder.java:50)
        	at jadx.plugins.input.java.data.code.JavaCodeReader.visitInstructions(JavaCodeReader.java:85)
        	at jadx.core.dex.instructions.InsnDecoder.process(InsnDecoder.java:46)
        	at jadx.core.dex.nodes.MethodNode.load(MethodNode.java:157)
        	at jadx.core.dex.nodes.ClassNode.load(ClassNode.java:458)
        	at jadx.core.ProcessClass.process(ProcessClass.java:69)
        	at jadx.core.ProcessClass.generateCode(ProcessClass.java:117)
        	at jadx.core.dex.nodes.ClassNode.generateClassCode(ClassNode.java:401)
        	at jadx.core.dex.nodes.ClassNode.decompile(ClassNode.java:389)
        	at jadx.core.dex.nodes.ClassNode.getCode(ClassNode.java:339)
        */
    @Override // ch.qos.logback.classic.turbo.TurboFilter
    public ch.qos.logback.core.spi.FilterReply decide(org.slf4j.Marker r9, ch.qos.logback.classic.Logger r10, ch.qos.logback.classic.Level r11, java.lang.String r12, java.lang.Object[] r13, java.lang.Throwable r14) {
        /*
            r8 = this;
            r0 = r8
            boolean r0 = r0.isStarted()
            if (r0 != 0) goto Lb
            ch.qos.logback.core.spi.FilterReply r0 = ch.qos.logback.core.spi.FilterReply.NEUTRAL
            return r0
            r0 = r8
            r1 = r0
            long r1 = r1.invocationCounter
            // decode failed: arraycopy: source index -1 out of bounds for object array[8]
            r2 = 1
            long r1 = r1 + r2
            r0.invocationCounter = r1
            r0 = r8
            long r0 = r0.mask
            long r-1 = r-1 & r0
            r0 = r8
            long r0 = r0.mask
            int r-1 = (r-1 > r0 ? 1 : (r-1 == r0 ? 0 : -1))
            if (r-1 == 0) goto L27
            ch.qos.logback.core.spi.FilterReply r-1 = ch.qos.logback.core.spi.FilterReply.NEUTRAL
            return r-1
            java.lang.System.currentTimeMillis()
            r15 = r-1
            r-1 = r8
            ch.qos.logback.core.joran.spi.ConfigurationWatchList r-1 = r-1.configurationWatchList
            r0 = r-1
            r17 = r0
            monitor-enter(r-1)
            r-1 = r8
            r0 = r15
            r-1.updateMaskIfNecessary(r0)
            r-1 = r8
            r0 = r15
            r-1.changeDetected(r0)
            if (r-1 == 0) goto L4b
            r-1 = r8
            r-1.disableSubsequentReconfiguration()
            r-1 = r8
            r-1.detachReconfigurationToNewThread()
            r-1 = r17
            monitor-exit(r-1)
            goto L59
            r18 = move-exception
            r0 = r17
            monitor-exit(r0)
            r0 = r18
            throw r0
            ch.qos.logback.core.spi.FilterReply r-1 = ch.qos.logback.core.spi.FilterReply.NEUTRAL
            return r-1
        */
        throw new UnsupportedOperationException("Method not decompiled: ch.qos.logback.classic.turbo.ReconfigureOnChangeFilter.decide(org.slf4j.Marker, ch.qos.logback.classic.Logger, ch.qos.logback.classic.Level, java.lang.String, java.lang.Object[], java.lang.Throwable):ch.qos.logback.core.spi.FilterReply");
    }

    private void updateMaskIfNecessary(long j) {
        long j2 = j - this.lastMaskCheck;
        this.lastMaskCheck = j;
        if (j2 < MASK_INCREASE_THRESHOLD && this.mask < 65535) {
            this.mask = (this.mask << 1) | 1;
        } else if (j2 > MASK_DECREASE_THRESHOLD) {
            this.mask >>>= 2;
        }
    }

    void detachReconfigurationToNewThread() {
        addInfo("Detected change in [" + this.configurationWatchList.getCopyOfFileWatchList() + "]");
        this.context.getExecutorService().submit(new ReconfiguringThread());
    }

    void updateNextCheck(long j) {
        this.nextCheck = j + this.refreshPeriod;
    }

    protected boolean changeDetected(long j) {
        if (j < this.nextCheck) {
            return false;
        }
        updateNextCheck(j);
        return this.configurationWatchList.changeDetected();
    }

    void disableSubsequentReconfiguration() {
        this.nextCheck = Long.MAX_VALUE;
    }

    public long getRefreshPeriod() {
        return this.refreshPeriod;
    }

    public void setRefreshPeriod(long j) {
        this.refreshPeriod = j;
    }
}
