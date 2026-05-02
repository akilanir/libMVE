package javax.jmdns.impl.constants;

/* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/constants/DNSState.class */
public enum DNSState {
    PROBING_1("probing 1", StateClass.probing),
    PROBING_2("probing 2", StateClass.probing),
    PROBING_3("probing 3", StateClass.probing),
    ANNOUNCING_1("announcing 1", StateClass.announcing),
    ANNOUNCING_2("announcing 2", StateClass.announcing),
    ANNOUNCED("announced", StateClass.announced),
    CANCELING_1("canceling 1", StateClass.canceling),
    CANCELING_2("canceling 2", StateClass.canceling),
    CANCELING_3("canceling 3", StateClass.canceling),
    CANCELED("canceled", StateClass.canceled),
    CLOSING("closing", StateClass.closing),
    CLOSED("closed", StateClass.closed);

    private final String _name;
    private final StateClass _state;

    /* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/constants/DNSState$StateClass.class */
    private enum StateClass {
        probing,
        announcing,
        announced,
        canceling,
        canceled,
        closing,
        closed
    }

    DNSState(String name, StateClass state) {
        this._name = name;
        this._state = state;
    }

    @Override // java.lang.Enum
    public final String toString() {
        return this._name;
    }

    /* renamed from: javax.jmdns.impl.constants.DNSState$1, reason: invalid class name */
    /* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/constants/DNSState$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$javax$jmdns$impl$constants$DNSState = new int[DNSState.values().length];

        static {
            try {
                $SwitchMap$javax$jmdns$impl$constants$DNSState[DNSState.PROBING_1.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$javax$jmdns$impl$constants$DNSState[DNSState.PROBING_2.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$javax$jmdns$impl$constants$DNSState[DNSState.PROBING_3.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$javax$jmdns$impl$constants$DNSState[DNSState.ANNOUNCING_1.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$javax$jmdns$impl$constants$DNSState[DNSState.ANNOUNCING_2.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
            try {
                $SwitchMap$javax$jmdns$impl$constants$DNSState[DNSState.ANNOUNCED.ordinal()] = 6;
            } catch (NoSuchFieldError e6) {
            }
            try {
                $SwitchMap$javax$jmdns$impl$constants$DNSState[DNSState.CANCELING_1.ordinal()] = 7;
            } catch (NoSuchFieldError e7) {
            }
            try {
                $SwitchMap$javax$jmdns$impl$constants$DNSState[DNSState.CANCELING_2.ordinal()] = 8;
            } catch (NoSuchFieldError e8) {
            }
            try {
                $SwitchMap$javax$jmdns$impl$constants$DNSState[DNSState.CANCELING_3.ordinal()] = 9;
            } catch (NoSuchFieldError e9) {
            }
            try {
                $SwitchMap$javax$jmdns$impl$constants$DNSState[DNSState.CANCELED.ordinal()] = 10;
            } catch (NoSuchFieldError e10) {
            }
            try {
                $SwitchMap$javax$jmdns$impl$constants$DNSState[DNSState.CLOSING.ordinal()] = 11;
            } catch (NoSuchFieldError e11) {
            }
            try {
                $SwitchMap$javax$jmdns$impl$constants$DNSState[DNSState.CLOSED.ordinal()] = 12;
            } catch (NoSuchFieldError e12) {
            }
        }
    }

    public final DNSState advance() {
        switch (AnonymousClass1.$SwitchMap$javax$jmdns$impl$constants$DNSState[ordinal()]) {
            case 1:
                return PROBING_2;
            case 2:
                return PROBING_3;
            case 3:
                return ANNOUNCING_1;
            case 4:
                return ANNOUNCING_2;
            case 5:
                return ANNOUNCED;
            case 6:
                return ANNOUNCED;
            case 7:
                return CANCELING_2;
            case 8:
                return CANCELING_3;
            case 9:
                return CANCELED;
            case DNSConstants.PROBE_THROTTLE_COUNT /* 10 */:
                return CANCELED;
            case 11:
                return CLOSED;
            case 12:
                return CLOSED;
            default:
                return this;
        }
    }

    public final DNSState revert() {
        switch (AnonymousClass1.$SwitchMap$javax$jmdns$impl$constants$DNSState[ordinal()]) {
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
                return PROBING_1;
            case 7:
            case 8:
            case 9:
                return CANCELING_1;
            case DNSConstants.PROBE_THROTTLE_COUNT /* 10 */:
                return CANCELED;
            case 11:
                return CLOSING;
            case 12:
                return CLOSED;
            default:
                return this;
        }
    }

    public final boolean isProbing() {
        return this._state == StateClass.probing;
    }

    public final boolean isAnnouncing() {
        return this._state == StateClass.announcing;
    }

    public final boolean isAnnounced() {
        return this._state == StateClass.announced;
    }

    public final boolean isCanceling() {
        return this._state == StateClass.canceling;
    }

    public final boolean isCanceled() {
        return this._state == StateClass.canceled;
    }

    public final boolean isClosing() {
        return this._state == StateClass.closing;
    }

    public final boolean isClosed() {
        return this._state == StateClass.closed;
    }
}
