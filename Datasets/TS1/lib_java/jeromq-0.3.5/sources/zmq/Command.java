package zmq;

/* loaded from: jeromq-0.3.5.jar:zmq/Command.class */
class Command {
    private final ZObject destination;
    private final Type type;
    Object arg;

    /* loaded from: jeromq-0.3.5.jar:zmq/Command$Type.class */
    public enum Type {
        STOP,
        PLUG,
        OWN,
        ATTACH,
        BIND,
        ACTIVATE_READ,
        ACTIVATE_WRITE,
        HICCUP,
        PIPE_TERM,
        PIPE_TERM_ACK,
        TERM_REQ,
        TERM,
        TERM_ACK,
        REAP,
        REAPED,
        DONE
    }

    public Command(ZObject destination, Type type) {
        this(destination, type, null);
    }

    public Command(ZObject destination, Type type, Object arg) {
        this.destination = destination;
        this.type = type;
        this.arg = arg;
    }

    public ZObject destination() {
        return this.destination;
    }

    public Type type() {
        return this.type;
    }

    public String toString() {
        return super.toString() + "[" + this.type + ", " + this.destination + "]";
    }
}
