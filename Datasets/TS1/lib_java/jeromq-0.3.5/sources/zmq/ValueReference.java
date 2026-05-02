package zmq;

/* loaded from: jeromq-0.3.5.jar:zmq/ValueReference.class */
public class ValueReference<V> {
    private V value;

    public ValueReference(V value) {
        this.value = value;
    }

    public ValueReference() {
    }

    public final V get() {
        return this.value;
    }

    public final void set(V value) {
        this.value = value;
    }
}
