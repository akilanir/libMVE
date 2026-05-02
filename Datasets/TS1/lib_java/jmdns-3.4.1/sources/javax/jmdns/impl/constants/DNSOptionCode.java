package javax.jmdns.impl.constants;

/* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/constants/DNSOptionCode.class */
public enum DNSOptionCode {
    Unknown("Unknown", 65535),
    LLQ("LLQ", 1),
    UL("UL", 2),
    NSID("NSID", 3),
    Owner("Owner", 4);

    private final String _externalName;
    private final int _index;

    DNSOptionCode(String name, int index) {
        this._externalName = name;
        this._index = index;
    }

    public String externalName() {
        return this._externalName;
    }

    public int indexValue() {
        return this._index;
    }

    public static DNSOptionCode resultCodeForFlags(int optioncode) {
        DNSOptionCode[] arr$ = values();
        for (DNSOptionCode aCode : arr$) {
            if (aCode._index == optioncode) {
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
