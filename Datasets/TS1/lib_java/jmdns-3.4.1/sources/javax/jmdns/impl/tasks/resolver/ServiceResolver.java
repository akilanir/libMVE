package javax.jmdns.impl.tasks.resolver;

import java.io.IOException;
import javax.jmdns.ServiceInfo;
import javax.jmdns.impl.DNSOutgoing;
import javax.jmdns.impl.DNSQuestion;
import javax.jmdns.impl.DNSRecord;
import javax.jmdns.impl.JmDNSImpl;
import javax.jmdns.impl.constants.DNSConstants;
import javax.jmdns.impl.constants.DNSRecordClass;
import javax.jmdns.impl.constants.DNSRecordType;

/* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/tasks/resolver/ServiceResolver.class */
public class ServiceResolver extends DNSResolverTask {
    private final String _type;

    public ServiceResolver(JmDNSImpl jmDNSImpl, String type) {
        super(jmDNSImpl);
        this._type = type;
    }

    @Override // javax.jmdns.impl.tasks.DNSTask
    public String getName() {
        return "ServiceResolver(" + (getDns() != null ? getDns().getName() : "") + ")";
    }

    @Override // javax.jmdns.impl.tasks.resolver.DNSResolverTask
    protected DNSOutgoing addAnswers(DNSOutgoing out) throws IOException {
        DNSOutgoing newOut = out;
        long now = System.currentTimeMillis();
        for (ServiceInfo info : getDns().getServices().values()) {
            newOut = addAnswer(newOut, new DNSRecord.Pointer(info.getType(), DNSRecordClass.CLASS_IN, false, DNSConstants.DNS_TTL, info.getQualifiedName()), now);
        }
        return newOut;
    }

    @Override // javax.jmdns.impl.tasks.resolver.DNSResolverTask
    protected DNSOutgoing addQuestions(DNSOutgoing out) throws IOException {
        DNSOutgoing newOut = addQuestion(out, DNSQuestion.newQuestion(this._type, DNSRecordType.TYPE_PTR, DNSRecordClass.CLASS_IN, false));
        return newOut;
    }

    @Override // javax.jmdns.impl.tasks.resolver.DNSResolverTask
    protected String description() {
        return "querying service";
    }
}
