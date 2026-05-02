package rx.exceptions;

/* loaded from: rxjava-1.0.7.jar:rx/exceptions/OnErrorThrowable.class */
public final class OnErrorThrowable extends RuntimeException {
    private static final long serialVersionUID = -569558213262703934L;
    private final boolean hasValue;
    private final Object value;

    private OnErrorThrowable(Throwable exception) {
        super(exception);
        this.hasValue = false;
        this.value = null;
    }

    private OnErrorThrowable(Throwable exception, Object value) {
        super(exception);
        this.hasValue = true;
        this.value = value;
    }

    public Object getValue() {
        return this.value;
    }

    public boolean isValueNull() {
        return this.hasValue;
    }

    public static OnErrorThrowable from(Throwable t) {
        Throwable cause = Exceptions.getFinalCause(t);
        if (cause instanceof OnNextValue) {
            return new OnErrorThrowable(t, ((OnNextValue) cause).getValue());
        }
        return new OnErrorThrowable(t);
    }

    public static Throwable addValueAsLastCause(Throwable e, Object value) {
        Throwable lastCause = Exceptions.getFinalCause(e);
        if (lastCause != null && (lastCause instanceof OnNextValue) && ((OnNextValue) lastCause).getValue() == value) {
            return e;
        }
        Exceptions.addCause(e, new OnNextValue(value));
        return e;
    }

    /* loaded from: rxjava-1.0.7.jar:rx/exceptions/OnErrorThrowable$OnNextValue.class */
    public static class OnNextValue extends RuntimeException {
        private static final long serialVersionUID = -3454462756050397899L;
        private final Object value;

        public OnNextValue(Object value) {
            super("OnError while emitting onNext value: " + renderValue(value));
            this.value = value;
        }

        public Object getValue() {
            return this.value;
        }

        private static String renderValue(Object value) {
            if (value == null) {
                return "null";
            }
            if (value.getClass().isPrimitive()) {
                return value.toString();
            }
            if (value instanceof String) {
                return (String) value;
            }
            if (value instanceof Enum) {
                return ((Enum) value).name();
            }
            return value.getClass().getName() + ".class";
        }
    }
}
