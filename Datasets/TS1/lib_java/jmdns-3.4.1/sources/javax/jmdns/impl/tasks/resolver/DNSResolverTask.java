package javax.jmdns.impl.tasks.resolver;

import java.io.IOException;
import java.util.Timer;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.jmdns.impl.DNSOutgoing;
import javax.jmdns.impl.JmDNSImpl;
import javax.jmdns.impl.tasks.DNSTask;

/* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/tasks/resolver/DNSResolverTask.class */
public abstract class DNSResolverTask extends DNSTask {
    private static Logger logger = Logger.getLogger(DNSResolverTask.class.getName());
    protected int _count;

    protected abstract DNSOutgoing addQuestions(DNSOutgoing dNSOutgoing) throws IOException;

    protected abstract DNSOutgoing addAnswers(DNSOutgoing dNSOutgoing) throws IOException;

    protected abstract String description();

    public DNSResolverTask(JmDNSImpl jmDNSImpl) {
        super(jmDNSImpl);
        this._count = 0;
    }

    @Override // javax.jmdns.impl.tasks.DNSTask
    public String toString() {
        return super.toString() + " count: " + this._count;
    }

    @Override // javax.jmdns.impl.tasks.DNSTask
    public void start(Timer timer) {
        if (!getDns().isCanceling() && !getDns().isCanceled()) {
            timer.schedule(this, 225L, 225L);
        }
    }

    @Override // java.util.TimerTask, java.lang.Runnable
    public void run() {
        try {
            if (getDns().isCanceling() || getDns().isCanceled()) {
                cancel();
            } else {
                int i = this._count;
                this._count = i + 1;
                if (i < 3) {
                    if (logger.isLoggable(Level.FINER)) {
                        logger.finer(getName() + ".run() JmDNS " + description());
                    }
                    DNSOutgoing out = addQuestions(new DNSOutgoing(0));
                    if (getDns().isAnnounced()) {
                        out = addAnswers(out);
                    }
                    if (!out.isEmpty()) {
                        getDns().send(out);
                    }
                } else {
                    cancel();
                }
            }
        } catch (Throwable e) {
            logger.log(Level.WARNING, getName() + ".run() exception ", e);
            getDns().recover();
        }
    }
}
