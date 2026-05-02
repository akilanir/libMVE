package javax.jmdns.impl.tasks;

import java.util.Timer;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.jmdns.impl.JmDNSImpl;

/* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/tasks/RecordReaper.class */
public class RecordReaper extends DNSTask {
    static Logger logger = Logger.getLogger(RecordReaper.class.getName());

    public RecordReaper(JmDNSImpl jmDNSImpl) {
        super(jmDNSImpl);
    }

    @Override // javax.jmdns.impl.tasks.DNSTask
    public String getName() {
        return "RecordReaper(" + (getDns() != null ? getDns().getName() : "") + ")";
    }

    @Override // javax.jmdns.impl.tasks.DNSTask
    public void start(Timer timer) {
        if (!getDns().isCanceling() && !getDns().isCanceled()) {
            timer.schedule(this, 10000L, 10000L);
        }
    }

    @Override // java.util.TimerTask, java.lang.Runnable
    public void run() {
        if (getDns().isCanceling() || getDns().isCanceled()) {
            return;
        }
        if (logger.isLoggable(Level.FINEST)) {
            logger.finest(getName() + ".run() JmDNS reaping cache");
        }
        getDns().cleanCache();
    }
}
