package rx.schedulers;

/* loaded from: rxjava-1.0.7.jar:rx/schedulers/Timestamped.class */
public final class Timestamped<T> {
    private final long timestampMillis;
    private final T value;

    public Timestamped(long timestampMillis, T value) {
        this.value = value;
        this.timestampMillis = timestampMillis;
    }

    public long getTimestampMillis() {
        return this.timestampMillis;
    }

    public T getValue() {
        return this.value;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof Timestamped)) {
            return false;
        }
        Timestamped<?> other = (Timestamped) obj;
        if (this.timestampMillis != other.timestampMillis) {
            return false;
        }
        if (this.value == null) {
            if (other.value != null) {
                return false;
            }
            return true;
        }
        if (!this.value.equals(other.value)) {
            return false;
        }
        return true;
    }

    public int hashCode() {
        int result = (31 * 1) + ((int) (this.timestampMillis ^ (this.timestampMillis >>> 32)));
        return (31 * result) + (this.value == null ? 0 : this.value.hashCode());
    }

    public String toString() {
        return String.format("Timestamped(timestampMillis = %d, value = %s)", Long.valueOf(this.timestampMillis), this.value.toString());
    }
}
