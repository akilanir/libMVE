package me.drakeet.mailotto;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/* loaded from: me.drakeet.mailotto.mailotto.1.0.2.jar:me/drakeet/mailotto/MailHandler.class */
class MailHandler {
    private final Object target;
    private final Method method;
    private final int hashCode;
    private boolean valid = true;

    MailHandler(Object target, Method method) {
        if (target == null) {
            throw new NullPointerException("MailHandler target cannot be null.");
        }
        if (method == null) {
            throw new NullPointerException("MailHandler method cannot be null.");
        }
        this.target = target;
        this.method = method;
        method.setAccessible(true);
        this.hashCode = ((31 + method.hashCode()) * 31) + target.hashCode();
    }

    public boolean isValid() {
        return this.valid;
    }

    public void invalidate() {
        this.valid = false;
    }

    public void handleMail(Object mail) throws InvocationTargetException {
        if (!this.valid) {
            throw new IllegalStateException(toString() + " has been invalidated and can no longer handle mails.");
        }
        try {
            this.method.invoke(this.target, mail);
        } catch (IllegalAccessException e) {
            throw new AssertionError(e);
        } catch (InvocationTargetException e2) {
            if (e2.getCause() instanceof Error) {
                throw ((Error) e2.getCause());
            }
            throw e2;
        }
    }

    public String toString() {
        return "[MailHandler " + this.method + "]";
    }

    public int hashCode() {
        return this.hashCode;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        MailHandler other = (MailHandler) obj;
        return this.method.equals(other.method) && this.target == other.target;
    }
}
