package nl.qbusict.cupboard;

/* loaded from: cupboard-2.1.1.jar:nl/qbusict/cupboard/CupboardFactory.class */
public final class CupboardFactory {
    private static Cupboard INSTANCE = new Cupboard();

    public static void setCupboard(Cupboard cupboard) {
        INSTANCE = cupboard;
    }

    public static Cupboard getInstance() {
        return INSTANCE;
    }

    public static Cupboard cupboard() {
        return INSTANCE;
    }
}
