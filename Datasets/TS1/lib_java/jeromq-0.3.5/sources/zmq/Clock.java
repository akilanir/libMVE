package zmq;

/* loaded from: jeromq-0.3.5.jar:zmq/Clock.class */
public class Clock {
    private Clock() {
    }

    public static long nowUS() {
        return System.nanoTime() * 1000;
    }

    public static long nowMS() {
        return System.currentTimeMillis();
    }

    public static long rdtsc() {
        return 0L;
    }
}
