package javax.jmdns.impl.tasks.state;

import java.io.IOException;
import java.util.Timer;
import java.util.logging.Logger;
import javax.jmdns.impl.DNSOutgoing;
import javax.jmdns.impl.DNSQuestion;
import javax.jmdns.impl.DNSRecord;
import javax.jmdns.impl.JmDNSImpl;
import javax.jmdns.impl.ServiceInfoImpl;
import javax.jmdns.impl.constants.DNSConstants;
import javax.jmdns.impl.constants.DNSRecordClass;
import javax.jmdns.impl.constants.DNSRecordType;
import javax.jmdns.impl.constants.DNSState;

/* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/tasks/state/Prober.class */
public class Prober extends DNSStateTask {
    static Logger logger = Logger.getLogger(Prober.class.getName());

    public Prober(JmDNSImpl jmDNSImpl) {
        super(jmDNSImpl, defaultTTL());
        setTaskState(DNSState.PROBING_1);
        associate(DNSState.PROBING_1);
    }

    @Override // javax.jmdns.impl.tasks.DNSTask
    public String getName() {
        return "Prober(" + (getDns() != null ? getDns().getName() : "") + ")";
    }

    @Override // javax.jmdns.impl.tasks.DNSTask
    public String toString() {
        return super.toString() + " state: " + getTaskState();
    }

    @Override // javax.jmdns.impl.tasks.DNSTask
    public void start(Timer timer) {
        long now = System.currentTimeMillis();
        if (now - getDns().getLastThrottleIncrement() < DNSConstants.CLOSE_TIMEOUT) {
            getDns().setThrottle(getDns().getThrottle() + 1);
        } else {
            getDns().setThrottle(1);
        }
        getDns().setLastThrottleIncrement(now);
        if (getDns().isAnnounced() && getDns().getThrottle() < 10) {
            timer.schedule(this, JmDNSImpl.getRandom().nextInt(251), 250L);
        } else if (!getDns().isCanceling() && !getDns().isCanceled()) {
            timer.schedule(this, 1000L, 1000L);
        }
    }

    @Override // java.util.TimerTask
    public boolean cancel() {
        removeAssociation();
        return super.cancel();
    }

    @Override // javax.jmdns.impl.tasks.state.DNSStateTask
    public String getTaskDescription() {
        return "probing";
    }

    @Override // javax.jmdns.impl.tasks.state.DNSStateTask
    protected boolean checkRunCondition() {
        return (getDns().isCanceling() || getDns().isCanceled()) ? false : true;
    }

    @Override // javax.jmdns.impl.tasks.state.DNSStateTask
    protected DNSOutgoing createOugoing() {
        return new DNSOutgoing(0);
    }

    @Override // javax.jmdns.impl.tasks.state.DNSStateTask
    protected DNSOutgoing buildOutgoingForDNS(DNSOutgoing out) throws IOException {
        DNSOutgoing newOut = out;
        newOut.addQuestion(DNSQuestion.newQuestion(getDns().getLocalHost().getName(), DNSRecordType.TYPE_ANY, DNSRecordClass.CLASS_IN, false));
        for (DNSRecord answer : getDns().getLocalHost().answers(false, getTTL())) {
            newOut = addAuthoritativeAnswer(newOut, answer);
        }
        return newOut;
    }

    @Override // javax.jmdns.impl.tasks.state.DNSStateTask
    protected DNSOutgoing buildOutgoingForInfo(ServiceInfoImpl info, DNSOutgoing out) throws IOException {
        DNSOutgoing newOut = addQuestion(out, DNSQuestion.newQuestion(info.getQualifiedName(), DNSRecordType.TYPE_ANY, DNSRecordClass.CLASS_IN, false));
        return addAuthoritativeAnswer(newOut, new DNSRecord.Service(info.getQualifiedName(), DNSRecordClass.CLASS_IN, false, getTTL(), info.getPriority(), info.getWeight(), info.getPort(), getDns().getLocalHost().getName()));
    }

    @Override // javax.jmdns.impl.tasks.state.DNSStateTask
    protected void recoverTask(Throwable e) {
        getDns().recover();
    }

    @Override // javax.jmdns.impl.tasks.state.DNSStateTask
    protected void advanceTask() {
        setTaskState(getTaskState().advance());
        if (!getTaskState().isProbing()) {
            cancel();
            getDns().startAnnouncer();
        }
    }
}
