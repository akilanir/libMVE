package javax.jmdns.impl.tasks.state;

import java.io.IOException;
import java.util.Timer;
import java.util.logging.Logger;
import javax.jmdns.impl.DNSIncoming;
import javax.jmdns.impl.DNSOutgoing;
import javax.jmdns.impl.DNSRecord;
import javax.jmdns.impl.JmDNSImpl;
import javax.jmdns.impl.ServiceInfoImpl;
import javax.jmdns.impl.constants.DNSState;

/* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/tasks/state/Renewer.class */
public class Renewer extends DNSStateTask {
    static Logger logger = Logger.getLogger(Renewer.class.getName());

    public Renewer(JmDNSImpl jmDNSImpl) {
        super(jmDNSImpl, defaultTTL());
        setTaskState(DNSState.ANNOUNCED);
        associate(DNSState.ANNOUNCED);
    }

    @Override // javax.jmdns.impl.tasks.DNSTask
    public String getName() {
        return "Renewer(" + (getDns() != null ? getDns().getName() : "") + ")";
    }

    @Override // javax.jmdns.impl.tasks.DNSTask
    public String toString() {
        return super.toString() + " state: " + getTaskState();
    }

    @Override // javax.jmdns.impl.tasks.DNSTask
    public void start(Timer timer) {
        if (!getDns().isCanceling() && !getDns().isCanceled()) {
            timer.schedule(this, 1800000L, 1800000L);
        }
    }

    @Override // java.util.TimerTask
    public boolean cancel() {
        removeAssociation();
        return super.cancel();
    }

    @Override // javax.jmdns.impl.tasks.state.DNSStateTask
    public String getTaskDescription() {
        return "renewing";
    }

    @Override // javax.jmdns.impl.tasks.state.DNSStateTask
    protected boolean checkRunCondition() {
        return (getDns().isCanceling() || getDns().isCanceled()) ? false : true;
    }

    @Override // javax.jmdns.impl.tasks.state.DNSStateTask
    protected DNSOutgoing createOugoing() {
        return new DNSOutgoing(33792);
    }

    @Override // javax.jmdns.impl.tasks.state.DNSStateTask
    protected DNSOutgoing buildOutgoingForDNS(DNSOutgoing out) throws IOException {
        DNSOutgoing newOut = out;
        for (DNSRecord answer : getDns().getLocalHost().answers(true, getTTL())) {
            newOut = addAnswer(newOut, (DNSIncoming) null, answer);
        }
        return newOut;
    }

    @Override // javax.jmdns.impl.tasks.state.DNSStateTask
    protected DNSOutgoing buildOutgoingForInfo(ServiceInfoImpl info, DNSOutgoing out) throws IOException {
        DNSOutgoing newOut = out;
        for (DNSRecord answer : info.answers(true, getTTL(), getDns().getLocalHost())) {
            newOut = addAnswer(newOut, (DNSIncoming) null, answer);
        }
        return newOut;
    }

    @Override // javax.jmdns.impl.tasks.state.DNSStateTask
    protected void recoverTask(Throwable e) {
        getDns().recover();
    }

    @Override // javax.jmdns.impl.tasks.state.DNSStateTask
    protected void advanceTask() {
        setTaskState(getTaskState().advance());
        if (!getTaskState().isAnnounced()) {
            cancel();
        }
    }
}
