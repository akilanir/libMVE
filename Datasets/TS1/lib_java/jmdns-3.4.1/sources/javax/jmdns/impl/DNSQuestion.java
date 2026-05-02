package javax.jmdns.impl;

import java.net.InetAddress;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.jmdns.ServiceInfo;
import javax.jmdns.impl.DNSRecord;
import javax.jmdns.impl.JmDNSImpl;
import javax.jmdns.impl.constants.DNSConstants;
import javax.jmdns.impl.constants.DNSRecordClass;
import javax.jmdns.impl.constants.DNSRecordType;

/* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/DNSQuestion.class */
public class DNSQuestion extends DNSEntry {
    private static Logger logger = Logger.getLogger(DNSQuestion.class.getName());

    /* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/DNSQuestion$DNS4Address.class */
    private static class DNS4Address extends DNSQuestion {
        DNS4Address(String name, DNSRecordType type, DNSRecordClass recordClass, boolean unique) {
            super(name, type, recordClass, unique);
        }

        @Override // javax.jmdns.impl.DNSQuestion
        public void addAnswers(JmDNSImpl jmDNSImpl, Set<DNSRecord> answers) {
            DNSRecord answer = jmDNSImpl.getLocalHost().getDNSAddressRecord(getRecordType(), true, DNSConstants.DNS_TTL);
            if (answer != null) {
                answers.add(answer);
            }
        }

        @Override // javax.jmdns.impl.DNSQuestion
        public boolean iAmTheOnlyOne(JmDNSImpl jmDNSImpl) {
            String name = getName().toLowerCase();
            return jmDNSImpl.getLocalHost().getName().equals(name) || jmDNSImpl.getServices().keySet().contains(name);
        }
    }

    /* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/DNSQuestion$DNS6Address.class */
    private static class DNS6Address extends DNSQuestion {
        DNS6Address(String name, DNSRecordType type, DNSRecordClass recordClass, boolean unique) {
            super(name, type, recordClass, unique);
        }

        @Override // javax.jmdns.impl.DNSQuestion
        public void addAnswers(JmDNSImpl jmDNSImpl, Set<DNSRecord> answers) {
            DNSRecord answer = jmDNSImpl.getLocalHost().getDNSAddressRecord(getRecordType(), true, DNSConstants.DNS_TTL);
            if (answer != null) {
                answers.add(answer);
            }
        }

        @Override // javax.jmdns.impl.DNSQuestion
        public boolean iAmTheOnlyOne(JmDNSImpl jmDNSImpl) {
            String name = getName().toLowerCase();
            return jmDNSImpl.getLocalHost().getName().equals(name) || jmDNSImpl.getServices().keySet().contains(name);
        }
    }

    /* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/DNSQuestion$HostInformation.class */
    private static class HostInformation extends DNSQuestion {
        HostInformation(String name, DNSRecordType type, DNSRecordClass recordClass, boolean unique) {
            super(name, type, recordClass, unique);
        }
    }

    /* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/DNSQuestion$Pointer.class */
    private static class Pointer extends DNSQuestion {
        Pointer(String name, DNSRecordType type, DNSRecordClass recordClass, boolean unique) {
            super(name, type, recordClass, unique);
        }

        @Override // javax.jmdns.impl.DNSQuestion
        public void addAnswers(JmDNSImpl jmDNSImpl, Set<DNSRecord> answers) {
            for (ServiceInfo serviceInfo : jmDNSImpl.getServices().values()) {
                addAnswersForServiceInfo(jmDNSImpl, answers, (ServiceInfoImpl) serviceInfo);
            }
            if (isServicesDiscoveryMetaQuery()) {
                for (String serviceType : jmDNSImpl.getServiceTypes().keySet()) {
                    JmDNSImpl.ServiceTypeEntry typeEntry = jmDNSImpl.getServiceTypes().get(serviceType);
                    answers.add(new DNSRecord.Pointer("_services._dns-sd._udp.local.", DNSRecordClass.CLASS_IN, false, DNSConstants.DNS_TTL, typeEntry.getType()));
                }
                return;
            }
            if (isReverseLookup()) {
                String ipValue = getQualifiedNameMap().get(ServiceInfo.Fields.Instance);
                if (ipValue != null && ipValue.length() > 0) {
                    InetAddress address = jmDNSImpl.getLocalHost().getInetAddress();
                    String hostIPAddress = address != null ? address.getHostAddress() : "";
                    if (ipValue.equalsIgnoreCase(hostIPAddress)) {
                        if (isV4ReverseLookup()) {
                            answers.add(jmDNSImpl.getLocalHost().getDNSReverseAddressRecord(DNSRecordType.TYPE_A, false, DNSConstants.DNS_TTL));
                        }
                        if (isV6ReverseLookup()) {
                            answers.add(jmDNSImpl.getLocalHost().getDNSReverseAddressRecord(DNSRecordType.TYPE_AAAA, false, DNSConstants.DNS_TTL));
                            return;
                        }
                        return;
                    }
                    return;
                }
                return;
            }
            if (isDomainDiscoveryQuery()) {
            }
        }
    }

    /* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/DNSQuestion$Service.class */
    private static class Service extends DNSQuestion {
        Service(String name, DNSRecordType type, DNSRecordClass recordClass, boolean unique) {
            super(name, type, recordClass, unique);
        }

        @Override // javax.jmdns.impl.DNSQuestion
        public void addAnswers(JmDNSImpl jmDNSImpl, Set<DNSRecord> answers) {
            String loname = getName().toLowerCase();
            if (jmDNSImpl.getLocalHost().getName().equalsIgnoreCase(loname)) {
                answers.addAll(jmDNSImpl.getLocalHost().answers(isUnique(), DNSConstants.DNS_TTL));
            } else if (jmDNSImpl.getServiceTypes().containsKey(loname)) {
                DNSQuestion question = new Pointer(getName(), DNSRecordType.TYPE_PTR, getRecordClass(), isUnique());
                question.addAnswers(jmDNSImpl, answers);
            } else {
                addAnswersForServiceInfo(jmDNSImpl, answers, (ServiceInfoImpl) jmDNSImpl.getServices().get(loname));
            }
        }

        @Override // javax.jmdns.impl.DNSQuestion
        public boolean iAmTheOnlyOne(JmDNSImpl jmDNSImpl) {
            String name = getName().toLowerCase();
            return jmDNSImpl.getLocalHost().getName().equals(name) || jmDNSImpl.getServices().keySet().contains(name);
        }
    }

    /* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/DNSQuestion$Text.class */
    private static class Text extends DNSQuestion {
        Text(String name, DNSRecordType type, DNSRecordClass recordClass, boolean unique) {
            super(name, type, recordClass, unique);
        }

        @Override // javax.jmdns.impl.DNSQuestion
        public void addAnswers(JmDNSImpl jmDNSImpl, Set<DNSRecord> answers) {
            addAnswersForServiceInfo(jmDNSImpl, answers, (ServiceInfoImpl) jmDNSImpl.getServices().get(getName().toLowerCase()));
        }

        @Override // javax.jmdns.impl.DNSQuestion
        public boolean iAmTheOnlyOne(JmDNSImpl jmDNSImpl) {
            String name = getName().toLowerCase();
            return jmDNSImpl.getLocalHost().getName().equals(name) || jmDNSImpl.getServices().keySet().contains(name);
        }
    }

    /* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/DNSQuestion$AllRecords.class */
    private static class AllRecords extends DNSQuestion {
        AllRecords(String name, DNSRecordType type, DNSRecordClass recordClass, boolean unique) {
            super(name, type, recordClass, unique);
        }

        @Override // javax.jmdns.impl.DNSEntry
        public boolean isSameType(DNSEntry entry) {
            return entry != null;
        }

        @Override // javax.jmdns.impl.DNSQuestion
        public void addAnswers(JmDNSImpl jmDNSImpl, Set<DNSRecord> answers) {
            String loname = getName().toLowerCase();
            if (jmDNSImpl.getLocalHost().getName().equalsIgnoreCase(loname)) {
                answers.addAll(jmDNSImpl.getLocalHost().answers(isUnique(), DNSConstants.DNS_TTL));
            } else if (jmDNSImpl.getServiceTypes().containsKey(loname)) {
                DNSQuestion question = new Pointer(getName(), DNSRecordType.TYPE_PTR, getRecordClass(), isUnique());
                question.addAnswers(jmDNSImpl, answers);
            } else {
                addAnswersForServiceInfo(jmDNSImpl, answers, (ServiceInfoImpl) jmDNSImpl.getServices().get(loname));
            }
        }

        @Override // javax.jmdns.impl.DNSQuestion
        public boolean iAmTheOnlyOne(JmDNSImpl jmDNSImpl) {
            String name = getName().toLowerCase();
            return jmDNSImpl.getLocalHost().getName().equals(name) || jmDNSImpl.getServices().keySet().contains(name);
        }
    }

    DNSQuestion(String name, DNSRecordType type, DNSRecordClass recordClass, boolean unique) {
        super(name, type, recordClass, unique);
    }

    public static DNSQuestion newQuestion(String name, DNSRecordType type, DNSRecordClass recordClass, boolean unique) {
        switch (type) {
            case TYPE_A:
                return new DNS4Address(name, type, recordClass, unique);
            case TYPE_A6:
                return new DNS6Address(name, type, recordClass, unique);
            case TYPE_AAAA:
                return new DNS6Address(name, type, recordClass, unique);
            case TYPE_ANY:
                return new AllRecords(name, type, recordClass, unique);
            case TYPE_HINFO:
                return new HostInformation(name, type, recordClass, unique);
            case TYPE_PTR:
                return new Pointer(name, type, recordClass, unique);
            case TYPE_SRV:
                return new Service(name, type, recordClass, unique);
            case TYPE_TXT:
                return new Text(name, type, recordClass, unique);
            default:
                return new DNSQuestion(name, type, recordClass, unique);
        }
    }

    boolean answeredBy(DNSEntry rec) {
        return isSameRecordClass(rec) && isSameType(rec) && getName().equals(rec.getName());
    }

    public void addAnswers(JmDNSImpl jmDNSImpl, Set<DNSRecord> answers) {
    }

    protected void addAnswersForServiceInfo(JmDNSImpl jmDNSImpl, Set<DNSRecord> answers, ServiceInfoImpl info) {
        if (info != null && info.isAnnounced()) {
            if (getName().equalsIgnoreCase(info.getQualifiedName()) || getName().equalsIgnoreCase(info.getType())) {
                answers.addAll(jmDNSImpl.getLocalHost().answers(true, DNSConstants.DNS_TTL));
                answers.addAll(info.answers(true, DNSConstants.DNS_TTL, jmDNSImpl.getLocalHost()));
            }
            if (logger.isLoggable(Level.FINER)) {
                logger.finer(jmDNSImpl.getName() + " DNSQuestion(" + getName() + ").addAnswersForServiceInfo(): info: " + info + "\n" + answers);
            }
        }
    }

    @Override // javax.jmdns.impl.DNSEntry
    public boolean isStale(long now) {
        return false;
    }

    @Override // javax.jmdns.impl.DNSEntry
    public boolean isExpired(long now) {
        return false;
    }

    public boolean iAmTheOnlyOne(JmDNSImpl jmDNSImpl) {
        return false;
    }

    @Override // javax.jmdns.impl.DNSEntry
    public void toString(StringBuilder aLog) {
    }
}
