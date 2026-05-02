package zmq;

/* loaded from: jeromq-0.3.5.jar:zmq/Config.class */
public enum Config {
    MESSAGE_PIPE_GRANULARITY(256),
    COMMAND_PIPE_GRANULARITY(16),
    INBOUND_POLL_RATE(100),
    IN_BATCH_SIZE(8192),
    OUT_BATCH_SIZE(8192),
    MAX_WM_DELTA(1024),
    MAX_IO_EVENTS(256),
    MAX_COMMAND_DELAY(3000000),
    CLOCK_PRECISION(1000000),
    PGM_MAX_TPDU(1500),
    SIGNALER_PORT(5905);

    private final int value;

    Config(int value) {
        this.value = value;
    }

    public int getValue() {
        return this.value;
    }
}
