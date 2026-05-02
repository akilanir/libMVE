package rx.internal.util.unsafe;

/* loaded from: rxjava-1.0.7.jar:rx/internal/util/unsafe/Pow2.class */
public final class Pow2 {
    private Pow2() {
        throw new IllegalStateException("No instances!");
    }

    public static int roundToPowerOfTwo(int value) {
        return 1 << (32 - Integer.numberOfLeadingZeros(value - 1));
    }

    public static boolean isPowerOfTwo(int value) {
        return (value & (value - 1)) == 0;
    }
}
