package javax.jmdns.impl.tasks.resolver;

import java.io.IOException;
import javax.jmdns.impl.DNSOutgoing;
import javax.jmdns.impl.DNSQuestion;
import javax.jmdns.impl.DNSRecord;
import javax.jmdns.impl.JmDNSImpl;
import javax.jmdns.impl.ServiceInfoImpl;
import javax.jmdns.impl.constants.DNSRecordClass;
import javax.jmdns.impl.constants.DNSRecordType;

/* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/tasks/resolver/ServiceInfoResolver.class */
public class ServiceInfoResolver extends DNSResolverTask {
    private final ServiceInfoImpl _info;

    public ServiceInfoResolver(JmDNSImpl jmDNSImpl, ServiceInfoImpl info) {
        super(jmDNSImpl);
        this._info = info;
        info.setDns(getDns());
        getDns().addListener(info, DNSQuestion.newQuestion(info.getQualifiedName(), DNSRecordType.TYPE_ANY, DNSRecordClass.CLASS_IN, false));
    }

    @Override // javax.jmdns.impl.tasks.DNSTask
    public String getName() {
        return "ServiceInfoResolver(" + (getDns() != null ? getDns().getName() : "") + ")";
    }

    @Override // java.util.TimerTask
    public boolean cancel() {
        boolean result = super.cancel();
        if (!this._info.isPersistent()) {
            getDns().removeListener(this._info);
        }
        return result;
    }

    @Override // javax.jmdns.impl.tasks.resolver.DNSResolverTask
    protected DNSOutgoing addAnswers(DNSOutgoing out) throws IOException {
        DNSOutgoing newOut = out;
        if (!this._info.hasData()) {
            long now = System.currentTimeMillis();
            newOut = addAnswer(addAnswer(newOut, (DNSRecord) getDns().getCache().getDNSEntry(this._info.getQualifiedName(), DNSRecordType.TYPE_SRV, DNSRecordClass.CLASS_IN), now), (DNSRecord) getDns().getCache().getDNSEntry(this._info.getQualifiedName(), DNSRecordType.TYPE_TXT, DNSRecordClass.CLASS_IN), now);
            if (this._info.getServer().length() > 0) {
                newOut = addAnswer(addAnswer(newOut, (DNSRecord) getDns().getCache().getDNSEntry(this._info.getServer(), DNSRecordType.TYPE_A, DNSRecordClass.CLASS_IN), now), (DNSRecord) getDns().getCache().getDNSEntry(this._info.getServer(), DNSRecordType.TYPE_AAAA, DNSRecordClass.CLASS_IN), now);
            }
        }
        return newOut;
    }

    @Override // javax.jmdns.impl.tasks.resolver.DNSResolverTask
    protected DNSOutgoing addQuestions(DNSOutgoing out) throws IOException {
        DNSOutgoing newOut = out;
        if (!this._info.hasData()) {
            newOut = addQuestion(addQuestion(newOut, DNSQuestion.newQuestion(this._info.getQualifiedName(), DNSRecordType.TYPE_SRV, DNSRecordClass.CLASS_IN, false)), DNSQuestion.newQuestion(this._info.getQualifiedName(), DNSRecordType.TYPE_TXT, DNSRecordClass.CLASS_IN, false));
            if (this._info.getServer().length() > 0) {
                newOut = addQuestion(addQuestion(newOut, DNSQuestion.newQuestion(this._info.getServer(), DNSRecordType.TYPE_A, DNSRecordClass.CLASS_IN, false)), DNSQuestion.newQuestion(this._info.getServer(), DNSRecordType.TYPE_AAAA, DNSRecordClass.CLASS_IN, false));
            }
        }
        return newOut;
    }

    @Override // javax.jmdns.impl.tasks.resolver.DNSResolverTask
    protected String description() {
        return "querying service info: " + (this._info != null ? this._info.getQualifiedName() : "null");
    }
}
