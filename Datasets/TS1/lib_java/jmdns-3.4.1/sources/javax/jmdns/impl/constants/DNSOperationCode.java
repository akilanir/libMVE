package javax.jmdns.impl.constants;

/* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/constants/DNSOperationCode.class */
public enum DNSOperationCode {
    Query("Query", 0),
    IQuery("Inverse Query", 1),
    Status("Status", 2),
    Unassigned("Unassigned", 3),
    Notify("Notify", 4),
    Update("Update", 5);

    static final int OpCode_MASK = 30720;
    private final String _externalName;
    private final int _index;

    DNSOperationCode(String name, int index) {
        this._externalName = name;
        this._index = index;
    }

    public String externalName() {
        return this._externalName;
    }

    public int indexValue() {
        return this._index;
    }

    public static DNSOperationCode operationCodeForFlags(int flags) {
        int maskedIndex = (flags & OpCode_MASK) >> 11;
        DNSOperationCode[] arr$ = values();
        for (DNSOperationCode aCode : arr$) {
            if (aCode._index == maskedIndex) {
                return aCode;
            }
        }
        return Unassigned;
    }

    @Override // java.lang.Enum
    public String toString() {
        return name() + " index " + indexValue();
    }
}
