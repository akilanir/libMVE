package me.drakeet.mailotto;

import java.lang.reflect.InvocationTargetException;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

/* loaded from: me.drakeet.mailotto.mailotto.1.0.2.jar:me/drakeet/mailotto/Mailbox.class */
public class Mailbox {
    public static final String DEFAULT_IDENTIFIER = "default";
    private final ConcurrentMap<Class<?>, MailHandler> currentAtHomeHandlerByClass;
    private static volatile Mailbox instance = null;
    private final String identifier;
    private final ThreadEnforcer enforcer;
    private final HandlerFinder handlerFinder;
    private final ThreadLocal<LinkedList<Mail>> mailsToDispatch;
    private final ThreadLocal<Boolean> isDispatching;

    public Mailbox() {
        this(DEFAULT_IDENTIFIER);
    }

    public Mailbox(String identifier) {
        this(ThreadEnforcer.MAIN, identifier);
    }

    public Mailbox(ThreadEnforcer enforcer) {
        this(enforcer, DEFAULT_IDENTIFIER);
    }

    public Mailbox(ThreadEnforcer enforcer, String identifier) {
        this(enforcer, identifier, HandlerFinder.ANNOTATED);
    }

    Mailbox(ThreadEnforcer enforcer, String identifier, HandlerFinder handlerFinder) {
        this.currentAtHomeHandlerByClass = new ConcurrentHashMap();
        this.mailsToDispatch = new ThreadLocal<LinkedList<Mail>>() { // from class: me.drakeet.mailotto.Mailbox.1
            /* JADX INFO: Access modifiers changed from: protected */
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // java.lang.ThreadLocal
            public LinkedList<Mail> initialValue() {
                return new LinkedList<>();
            }
        };
        this.isDispatching = new ThreadLocal<Boolean>() { // from class: me.drakeet.mailotto.Mailbox.2
            /* JADX INFO: Access modifiers changed from: protected */
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // java.lang.ThreadLocal
            public Boolean initialValue() {
                return false;
            }
        };
        this.enforcer = enforcer;
        this.identifier = identifier;
        this.handlerFinder = handlerFinder;
    }

    public static Mailbox getInstance() {
        if (instance == null) {
            synchronized (Mailbox.class) {
                if (instance == null) {
                    instance = new Mailbox();
                }
            }
        }
        return instance;
    }

    public void atHome(Object object) {
        if (object == null) {
            throw new NullPointerException("Object to atHome must not be null.");
        }
        this.enforcer.enforce(this);
        MailHandler onMailReceived = this.handlerFinder.findOnMailReceived(object);
        if (onMailReceived != null) {
            this.currentAtHomeHandlerByClass.put(object.getClass(), onMailReceived);
        }
        dispatchMails(object, onMailReceived);
    }

    public void leave(Object object) {
        if (object == null) {
            throw new NullPointerException("Object to leave must not be null.");
        }
        this.enforcer.enforce(this);
        MailHandler findOnMailReceived = this.handlerFinder.findOnMailReceived(object);
        MailHandler cacheCurrentAtHomeHandler = getCacheCurrentAtHomeHandler(object.getClass());
        if (cacheCurrentAtHomeHandler == null || !cacheCurrentAtHomeHandler.equals(findOnMailReceived)) {
            throw new IllegalArgumentException("Missing mail handler for an annotated method. Is " + object.getClass() + " atHome?");
        }
        if (findOnMailReceived.equals(cacheCurrentAtHomeHandler)) {
            cacheCurrentAtHomeHandler.invalidate();
            this.currentAtHomeHandlerByClass.remove(object.getClass());
        }
    }

    MailHandler getCacheCurrentAtHomeHandler(Class<?> type) {
        return this.currentAtHomeHandlerByClass.get(type);
    }

    public void post(Mail mail) {
        if (mail == null) {
            throw new NullPointerException("Mail to post must not be null.");
        }
        this.enforcer.enforce(this);
        Class<?> toClass = mail.to;
        MailHandler handler = getCacheCurrentAtHomeHandler(toClass);
        if (handler != null) {
            dispatch(mail, handler);
        } else {
            enqueue(mail);
        }
    }

    protected void enqueue(Mail mail) {
        this.mailsToDispatch.get().add(mail);
    }

    private void dispatchMails(Object to, MailHandler onMailReceived) {
        if (this.isDispatching.get().booleanValue()) {
            return;
        }
        this.isDispatching.set(true);
        Iterator<Mail> iterator = this.mailsToDispatch.get().iterator();
        while (iterator.hasNext()) {
            Mail _mail = iterator.next();
            if (_mail.to == to.getClass()) {
                if (onMailReceived.isValid()) {
                    dispatch(_mail, onMailReceived);
                }
                iterator.remove();
            }
        }
        this.isDispatching.set(false);
    }

    protected void dispatch(Mail mail, MailHandler wrapper) {
        try {
            wrapper.handleMail(mail);
        } catch (InvocationTargetException e) {
            throwRuntimeException("Could not dispatch mail: " + mail.getClass() + " to handler " + wrapper, e);
        }
    }

    private static void throwRuntimeException(String msg, InvocationTargetException e) {
        Throwable cause = e.getCause();
        if (cause != null) {
            throw new RuntimeException(msg + ": " + cause.getMessage(), cause);
        }
        throw new RuntimeException(msg + ": " + e.getMessage(), e);
    }

    public String toString() {
        return "[Mailbox \"" + this.identifier + "\"]";
    }
}
