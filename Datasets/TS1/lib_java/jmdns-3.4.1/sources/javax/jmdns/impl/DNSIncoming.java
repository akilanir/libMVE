package javax.jmdns.impl;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.net.DatagramPacket;
import java.net.InetAddress;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.jmdns.impl.DNSRecord;
import javax.jmdns.impl.constants.DNSConstants;
import javax.jmdns.impl.constants.DNSLabel;
import javax.jmdns.impl.constants.DNSOptionCode;
import javax.jmdns.impl.constants.DNSRecordClass;
import javax.jmdns.impl.constants.DNSRecordType;
import javax.jmdns.impl.constants.DNSResultCode;

/* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/DNSIncoming.class */
public final class DNSIncoming extends DNSMessage {
    private final DatagramPacket _packet;
    private final long _receivedTime;
    private final MessageInputStream _messageInputStream;
    private int _senderUDPPayload;
    private static Logger logger = Logger.getLogger(DNSIncoming.class.getName());
    public static boolean USE_DOMAIN_NAME_FORMAT_FOR_SRV_TARGET = true;
    private static final char[] _nibbleToHex = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};

    /* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/DNSIncoming$MessageInputStream.class */
    public static class MessageInputStream extends ByteArrayInputStream {
        private static Logger logger1 = Logger.getLogger(MessageInputStream.class.getName());
        final Map<Integer, String> _names;

        public MessageInputStream(byte[] buffer, int length) {
            this(buffer, 0, length);
        }

        public MessageInputStream(byte[] buffer, int offset, int length) {
            super(buffer, offset, length);
            this._names = new HashMap();
        }

        public int readByte() {
            return read();
        }

        public int readUnsignedShort() {
            return (read() << 8) | read();
        }

        public int readInt() {
            return (readUnsignedShort() << 16) | readUnsignedShort();
        }

        public byte[] readBytes(int len) {
            byte[] bytes = new byte[len];
            read(bytes, 0, len);
            return bytes;
        }

        public String readUTF(int len) {
            StringBuilder buffer = new StringBuilder(len);
            int index = 0;
            while (index < len) {
                int ch = read();
                switch (ch >> 4) {
                    case 0:
                    case 1:
                    case 2:
                    case 3:
                    case 4:
                    case 5:
                    case 6:
                    case 7:
                        break;
                    case 8:
                    case 9:
                    case DNSConstants.PROBE_THROTTLE_COUNT /* 10 */:
                    case 11:
                    default:
                        ch = ((ch & 63) << 4) | (read() & 15);
                        index++;
                        break;
                    case 12:
                    case 13:
                        ch = ((ch & 31) << 6) | (read() & 63);
                        index++;
                        break;
                    case 14:
                        ch = ((ch & 15) << 12) | ((read() & 63) << 6) | (read() & 63);
                        index = index + 1 + 1;
                        break;
                }
                buffer.append((char) ch);
                index++;
            }
            return buffer.toString();
        }

        protected synchronized int peek() {
            if (this.pos < this.count) {
                return this.buf[this.pos] & 255;
            }
            return -1;
        }

        public String readName() {
            int len;
            Map<Integer, StringBuilder> names = new HashMap<>();
            StringBuilder buffer = new StringBuilder();
            boolean finished = false;
            while (!finished && (len = read()) != 0) {
                switch (DNSLabel.labelForByte(len)) {
                    case Standard:
                        int offset = this.pos - 1;
                        String label = readUTF(len) + ".";
                        buffer.append(label);
                        for (StringBuilder previousLabel : names.values()) {
                            previousLabel.append(label);
                        }
                        names.put(Integer.valueOf(offset), new StringBuilder(label));
                        break;
                    case Compressed:
                        int index = (DNSLabel.labelValue(len) << 8) | read();
                        String compressedLabel = this._names.get(Integer.valueOf(index));
                        if (compressedLabel == null) {
                            logger1.severe("bad domain name: possible circular name detected. Bad offset: 0x" + Integer.toHexString(index) + " at 0x" + Integer.toHexString(this.pos - 2));
                            compressedLabel = "";
                        }
                        buffer.append(compressedLabel);
                        for (StringBuilder previousLabel2 : names.values()) {
                            previousLabel2.append(compressedLabel);
                        }
                        finished = true;
                        break;
                    case Extended:
                        logger1.severe("Extended label are not currently supported.");
                        break;
                    case Unknown:
                    default:
                        logger1.severe("unsupported dns label type: '" + Integer.toHexString(len & 192) + "'");
                        break;
                }
            }
            for (Integer index2 : names.keySet()) {
                this._names.put(index2, names.get(index2).toString());
            }
            return buffer.toString();
        }

        public String readNonNameString() {
            int len = read();
            return readUTF(len);
        }
    }

    public DNSIncoming(DatagramPacket packet) throws IOException {
        super(0, 0, packet.getPort() == DNSConstants.MDNS_PORT);
        this._packet = packet;
        InetAddress source = packet.getAddress();
        this._messageInputStream = new MessageInputStream(packet.getData(), packet.getLength());
        this._receivedTime = System.currentTimeMillis();
        this._senderUDPPayload = DNSConstants.MAX_MSG_TYPICAL;
        try {
            setId(this._messageInputStream.readUnsignedShort());
            setFlags(this._messageInputStream.readUnsignedShort());
            int numQuestions = this._messageInputStream.readUnsignedShort();
            int numAnswers = this._messageInputStream.readUnsignedShort();
            int numAuthorities = this._messageInputStream.readUnsignedShort();
            int numAdditionals = this._messageInputStream.readUnsignedShort();
            if (numQuestions > 0) {
                for (int i = 0; i < numQuestions; i++) {
                    this._questions.add(readQuestion());
                }
            }
            if (numAnswers > 0) {
                for (int i2 = 0; i2 < numAnswers; i2++) {
                    DNSRecord rec = readAnswer(source);
                    if (rec != null) {
                        this._answers.add(rec);
                    }
                }
            }
            if (numAuthorities > 0) {
                for (int i3 = 0; i3 < numAuthorities; i3++) {
                    DNSRecord rec2 = readAnswer(source);
                    if (rec2 != null) {
                        this._authoritativeAnswers.add(rec2);
                    }
                }
            }
            if (numAdditionals > 0) {
                for (int i4 = 0; i4 < numAdditionals; i4++) {
                    DNSRecord rec3 = readAnswer(source);
                    if (rec3 != null) {
                        this._additionals.add(rec3);
                    }
                }
            }
        } catch (Exception e) {
            logger.log(Level.WARNING, "DNSIncoming() dump " + print(true) + "\n exception ", (Throwable) e);
            IOException ioe = new IOException("DNSIncoming corrupted message");
            ioe.initCause(e);
            throw ioe;
        }
    }

    private DNSIncoming(int flags, int id, boolean multicast, DatagramPacket packet, long receivedTime) {
        super(flags, id, multicast);
        this._packet = packet;
        this._messageInputStream = new MessageInputStream(packet.getData(), packet.getLength());
        this._receivedTime = receivedTime;
    }

    /* renamed from: clone, reason: merged with bridge method [inline-methods] */
    public DNSIncoming m8clone() {
        DNSIncoming in = new DNSIncoming(getFlags(), getId(), isMulticast(), this._packet, this._receivedTime);
        in._senderUDPPayload = this._senderUDPPayload;
        in._questions.addAll(this._questions);
        in._answers.addAll(this._answers);
        in._authoritativeAnswers.addAll(this._authoritativeAnswers);
        in._additionals.addAll(this._additionals);
        return in;
    }

    private DNSQuestion readQuestion() {
        String domain = this._messageInputStream.readName();
        DNSRecordType type = DNSRecordType.typeForIndex(this._messageInputStream.readUnsignedShort());
        if (type == DNSRecordType.TYPE_IGNORE) {
            logger.log(Level.SEVERE, "Could not find record type: " + print(true));
        }
        int recordClassIndex = this._messageInputStream.readUnsignedShort();
        DNSRecordClass recordClass = DNSRecordClass.classForIndex(recordClassIndex);
        boolean unique = recordClass.isUnique(recordClassIndex);
        return DNSQuestion.newQuestion(domain, type, recordClass, unique);
    }

    private DNSRecord readAnswer(InetAddress source) {
        String target;
        String domain = this._messageInputStream.readName();
        DNSRecordType type = DNSRecordType.typeForIndex(this._messageInputStream.readUnsignedShort());
        if (type == DNSRecordType.TYPE_IGNORE) {
            logger.log(Level.SEVERE, "Could not find record type. domain: " + domain + "\n" + print(true));
        }
        int recordClassIndex = this._messageInputStream.readUnsignedShort();
        DNSRecordClass recordClass = type == DNSRecordType.TYPE_OPT ? DNSRecordClass.CLASS_UNKNOWN : DNSRecordClass.classForIndex(recordClassIndex);
        if (recordClass == DNSRecordClass.CLASS_UNKNOWN && type != DNSRecordType.TYPE_OPT) {
            logger.log(Level.SEVERE, "Could not find record class. domain: " + domain + " type: " + type + "\n" + print(true));
        }
        boolean unique = recordClass.isUnique(recordClassIndex);
        int ttl = this._messageInputStream.readInt();
        int len = this._messageInputStream.readUnsignedShort();
        DNSRecord rec = null;
        switch (type) {
            case TYPE_A:
                rec = new DNSRecord.IPv4Address(domain, recordClass, unique, ttl, this._messageInputStream.readBytes(len));
                break;
            case TYPE_AAAA:
                rec = new DNSRecord.IPv6Address(domain, recordClass, unique, ttl, this._messageInputStream.readBytes(len));
                break;
            case TYPE_CNAME:
            case TYPE_PTR:
                String service = this._messageInputStream.readName();
                if (service.length() > 0) {
                    rec = new DNSRecord.Pointer(domain, recordClass, unique, ttl, service);
                    break;
                } else {
                    logger.log(Level.WARNING, "PTR record of class: " + recordClass + ", there was a problem reading the service name of the answer for domain:" + domain);
                    break;
                }
            case TYPE_TXT:
                rec = new DNSRecord.Text(domain, recordClass, unique, ttl, this._messageInputStream.readBytes(len));
                break;
            case TYPE_SRV:
                int priority = this._messageInputStream.readUnsignedShort();
                int weight = this._messageInputStream.readUnsignedShort();
                int port = this._messageInputStream.readUnsignedShort();
                if (USE_DOMAIN_NAME_FORMAT_FOR_SRV_TARGET) {
                    target = this._messageInputStream.readName();
                } else {
                    target = this._messageInputStream.readNonNameString();
                }
                rec = new DNSRecord.Service(domain, recordClass, unique, ttl, priority, weight, port, target);
                break;
            case TYPE_HINFO:
                StringBuilder buf = new StringBuilder();
                buf.append(this._messageInputStream.readUTF(len));
                int index = buf.indexOf(" ");
                String cpu = (index > 0 ? buf.substring(0, index) : buf.toString()).trim();
                String os = (index > 0 ? buf.substring(index + 1) : "").trim();
                rec = new DNSRecord.HostInformation(domain, recordClass, unique, ttl, cpu, os);
                break;
            case TYPE_OPT:
                DNSResultCode extendedResultCode = DNSResultCode.resultCodeForFlags(getFlags(), ttl);
                int version = (ttl & 16711680) >> 16;
                if (version == 0) {
                    this._senderUDPPayload = recordClassIndex;
                    while (true) {
                        if (this._messageInputStream.available() > 0) {
                            if (this._messageInputStream.available() >= 2) {
                                int optionCodeInt = this._messageInputStream.readUnsignedShort();
                                DNSOptionCode optionCode = DNSOptionCode.resultCodeForFlags(optionCodeInt);
                                if (this._messageInputStream.available() >= 2) {
                                    int optionLength = this._messageInputStream.readUnsignedShort();
                                    byte[] optiondata = new byte[0];
                                    if (this._messageInputStream.available() >= optionLength) {
                                        optiondata = this._messageInputStream.readBytes(optionLength);
                                    }
                                    switch (optionCode) {
                                        case Owner:
                                            int ownerVersion = 0;
                                            int ownerSequence = 0;
                                            byte[] ownerPrimaryMacAddress = null;
                                            byte[] ownerWakeupMacAddress = null;
                                            byte[] ownerPassword = null;
                                            try {
                                                ownerVersion = optiondata[0];
                                                ownerSequence = optiondata[1];
                                                ownerPrimaryMacAddress = new byte[]{optiondata[2], optiondata[3], optiondata[4], optiondata[5], optiondata[6], optiondata[7]};
                                                ownerWakeupMacAddress = ownerPrimaryMacAddress;
                                                if (optiondata.length > 8) {
                                                    ownerWakeupMacAddress = new byte[]{optiondata[8], optiondata[9], optiondata[10], optiondata[11], optiondata[12], optiondata[13]};
                                                }
                                                if (optiondata.length == 18) {
                                                    ownerPassword = new byte[]{optiondata[14], optiondata[15], optiondata[16], optiondata[17]};
                                                }
                                                if (optiondata.length == 22) {
                                                    ownerPassword = new byte[]{optiondata[14], optiondata[15], optiondata[16], optiondata[17], optiondata[18], optiondata[19], optiondata[20], optiondata[21]};
                                                }
                                            } catch (Exception e) {
                                                logger.warning("Malformed OPT answer. Option code: Owner data: " + _hexString(optiondata));
                                            }
                                            if (!logger.isLoggable(Level.FINE)) {
                                                break;
                                            } else {
                                                logger.fine("Unhandled Owner OPT version: " + ownerVersion + " sequence: " + ownerSequence + " MAC address: " + _hexString(ownerPrimaryMacAddress) + (ownerWakeupMacAddress != ownerPrimaryMacAddress ? " wakeup MAC address: " + _hexString(ownerWakeupMacAddress) : "") + (ownerPassword != null ? " password: " + _hexString(ownerPassword) : ""));
                                                break;
                                            }
                                        case LLQ:
                                        case NSID:
                                        case UL:
                                            if (!logger.isLoggable(Level.FINE)) {
                                                break;
                                            } else {
                                                logger.log(Level.FINE, "There was an OPT answer. Option code: " + optionCode + " data: " + _hexString(optiondata));
                                                break;
                                            }
                                        case Unknown:
                                            logger.log(Level.WARNING, "There was an OPT answer. Not currently handled. Option code: " + optionCodeInt + " data: " + _hexString(optiondata));
                                            break;
                                    }
                                } else {
                                    logger.log(Level.WARNING, "There was a problem reading the OPT record. Ignoring.");
                                    break;
                                }
                            } else {
                                logger.log(Level.WARNING, "There was a problem reading the OPT record. Ignoring.");
                                break;
                            }
                        } else {
                            break;
                        }
                    }
                } else {
                    logger.log(Level.WARNING, "There was an OPT answer. Wrong version number: " + version + " result code: " + extendedResultCode);
                    break;
                }
                break;
            default:
                if (logger.isLoggable(Level.FINER)) {
                    logger.finer("DNSIncoming() unknown type:" + type);
                }
                this._messageInputStream.skip(len);
                break;
        }
        if (rec != null) {
            rec.setRecordSource(source);
        }
        return rec;
    }

    String print(boolean dump) {
        StringBuilder buf = new StringBuilder();
        buf.append(print());
        if (dump) {
            byte[] data = new byte[this._packet.getLength()];
            System.arraycopy(this._packet.getData(), 0, data, 0, data.length);
            buf.append(print(data));
        }
        return buf.toString();
    }

    public String toString() {
        StringBuilder buf = new StringBuilder();
        buf.append(isQuery() ? "dns[query," : "dns[response,");
        if (this._packet.getAddress() != null) {
            buf.append(this._packet.getAddress().getHostAddress());
        }
        buf.append(':');
        buf.append(this._packet.getPort());
        buf.append(", length=");
        buf.append(this._packet.getLength());
        buf.append(", id=0x");
        buf.append(Integer.toHexString(getId()));
        if (getFlags() != 0) {
            buf.append(", flags=0x");
            buf.append(Integer.toHexString(getFlags()));
            if ((getFlags() & 32768) != 0) {
                buf.append(":r");
            }
            if ((getFlags() & DNSConstants.FLAGS_AA) != 0) {
                buf.append(":aa");
            }
            if ((getFlags() & DNSConstants.FLAGS_TC) != 0) {
                buf.append(":tc");
            }
        }
        if (getNumberOfQuestions() > 0) {
            buf.append(", questions=");
            buf.append(getNumberOfQuestions());
        }
        if (getNumberOfAnswers() > 0) {
            buf.append(", answers=");
            buf.append(getNumberOfAnswers());
        }
        if (getNumberOfAuthorities() > 0) {
            buf.append(", authorities=");
            buf.append(getNumberOfAuthorities());
        }
        if (getNumberOfAdditionals() > 0) {
            buf.append(", additionals=");
            buf.append(getNumberOfAdditionals());
        }
        if (getNumberOfQuestions() > 0) {
            buf.append("\nquestions:");
            for (DNSQuestion question : this._questions) {
                buf.append("\n\t");
                buf.append(question);
            }
        }
        if (getNumberOfAnswers() > 0) {
            buf.append("\nanswers:");
            for (DNSRecord record : this._answers) {
                buf.append("\n\t");
                buf.append(record);
            }
        }
        if (getNumberOfAuthorities() > 0) {
            buf.append("\nauthorities:");
            for (DNSRecord record2 : this._authoritativeAnswers) {
                buf.append("\n\t");
                buf.append(record2);
            }
        }
        if (getNumberOfAdditionals() > 0) {
            buf.append("\nadditionals:");
            for (DNSRecord record3 : this._additionals) {
                buf.append("\n\t");
                buf.append(record3);
            }
        }
        buf.append("]");
        return buf.toString();
    }

    void append(DNSIncoming that) {
        if (isQuery() && isTruncated() && that.isQuery()) {
            this._questions.addAll(that.getQuestions());
            this._answers.addAll(that.getAnswers());
            this._authoritativeAnswers.addAll(that.getAuthorities());
            this._additionals.addAll(that.getAdditionals());
            return;
        }
        throw new IllegalArgumentException();
    }

    public int elapseSinceArrival() {
        return (int) (System.currentTimeMillis() - this._receivedTime);
    }

    public int getSenderUDPPayload() {
        return this._senderUDPPayload;
    }

    private String _hexString(byte[] bytes) {
        StringBuilder result = new StringBuilder(2 * bytes.length);
        for (byte b : bytes) {
            int b2 = b & 255;
            result.append(_nibbleToHex[b2 / 16]);
            result.append(_nibbleToHex[b2 % 16]);
        }
        return result.toString();
    }
}
