package javax.jmdns.impl.constants;

/* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/constants/DNSResultCode.class */
public enum DNSResultCode {
    Unknown("Unknown", 65535),
    NoError("No Error", 0),
    FormErr("Format Error", 1),
    ServFail("Server Failure", 2),
    NXDomain("Non-Existent Domain", 3),
    NotImp("Not Implemented", 4),
    Refused("Query Refused", 5),
    YXDomain("Name Exists when it should not", 6),
    YXRRSet("RR Set Exists when it should not", 7),
    NXRRSet("RR Set that should exist does not", 8),
    NotAuth("Server Not Authoritative for zone", 9),
    NotZone("NotZone Name not contained in zone", 10);

    static final int RCode_MASK = 15;
    static final int ExtendedRCode_MASK = 255;
    private final String _externalName;
    private final int _index;

    DNSResultCode(String name, int index) {
        this._externalName = name;
        this._index = index;
    }

    public String externalName() {
        return this._externalName;
    }

    public int indexValue() {
        return this._index;
    }

    public static DNSResultCode resultCodeForFlags(int flags) {
        int maskedIndex = flags & RCode_MASK;
        DNSResultCode[] arr$ = values();
        for (DNSResultCode aCode : arr$) {
            if (aCode._index == maskedIndex) {
                return aCode;
            }
        }
        return Unknown;
    }

    public static DNSResultCode resultCodeForFlags(int flags, int extendedRCode) {
        int maskedIndex = ((extendedRCode >> 28) & ExtendedRCode_MASK) | (flags & RCode_MASK);
        DNSResultCode[] arr$ = values();
        for (DNSResultCode aCode : arr$) {
            if (aCode._index == maskedIndex) {
                return aCode;
            }
        }
        return Unknown;
    }

    @Override // java.lang.Enum
    public String toString() {
        return name() + " index " + indexValue();
    }
}
