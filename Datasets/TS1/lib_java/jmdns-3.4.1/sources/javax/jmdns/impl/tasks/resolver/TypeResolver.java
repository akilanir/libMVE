package javax.jmdns.impl.tasks.resolver;

import java.io.IOException;
import javax.jmdns.impl.DNSOutgoing;
import javax.jmdns.impl.DNSQuestion;
import javax.jmdns.impl.DNSRecord;
import javax.jmdns.impl.JmDNSImpl;
import javax.jmdns.impl.constants.DNSConstants;
import javax.jmdns.impl.constants.DNSRecordClass;
import javax.jmdns.impl.constants.DNSRecordType;

/* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/tasks/resolver/TypeResolver.class */
public class TypeResolver extends DNSResolverTask {
    public TypeResolver(JmDNSImpl jmDNSImpl) {
        super(jmDNSImpl);
    }

    @Override // javax.jmdns.impl.tasks.DNSTask
    public String getName() {
        return "TypeResolver(" + (getDns() != null ? getDns().getName() : "") + ")";
    }

    @Override // javax.jmdns.impl.tasks.resolver.DNSResolverTask
    protected DNSOutgoing addAnswers(DNSOutgoing out) throws IOException {
        DNSOutgoing newOut = out;
        long now = System.currentTimeMillis();
        for (String type : getDns().getServiceTypes().keySet()) {
            JmDNSImpl.ServiceTypeEntry typeEntry = getDns().getServiceTypes().get(type);
            newOut = addAnswer(newOut, new DNSRecord.Pointer("_services._dns-sd._udp.local.", DNSRecordClass.CLASS_IN, false, DNSConstants.DNS_TTL, typeEntry.getType()), now);
        }
        return newOut;
    }

    @Override // javax.jmdns.impl.tasks.resolver.DNSResolverTask
    protected DNSOutgoing addQuestions(DNSOutgoing out) throws IOException {
        return addQuestion(out, DNSQuestion.newQuestion("_services._dns-sd._udp.local.", DNSRecordType.TYPE_PTR, DNSRecordClass.CLASS_IN, false));
    }

    @Override // javax.jmdns.impl.tasks.resolver.DNSResolverTask
    protected String description() {
        return "querying type";
    }
}
