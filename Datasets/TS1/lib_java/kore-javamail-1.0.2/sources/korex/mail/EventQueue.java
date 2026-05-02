package korex.mail;

import java.util.Vector;
import java.util.WeakHashMap;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.Executor;
import java.util.concurrent.LinkedBlockingQueue;
import korex.mail.event.MailEvent;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/EventQueue.class */
class EventQueue implements Runnable {
    private volatile BlockingQueue<QueueElement> q;
    private Executor executor;
    private static WeakHashMap<ClassLoader, EventQueue> appq;

    /* loaded from: kore-javamail-1.0.2.jar:korex/mail/EventQueue$TerminatorEvent.class */
    static class TerminatorEvent extends MailEvent {
        TerminatorEvent() {
            super(new Object());
        }

        @Override // korex.mail.event.MailEvent
        public void dispatch(Object listener) {
            Thread.currentThread().interrupt();
        }
    }

    /* loaded from: kore-javamail-1.0.2.jar:korex/mail/EventQueue$QueueElement.class */
    static class QueueElement {
        MailEvent event;
        Vector vector;

        QueueElement(MailEvent event, Vector vector) {
            this.event = null;
            this.vector = null;
            this.event = event;
            this.vector = vector;
        }
    }

    EventQueue(Executor ex) {
        this.executor = ex;
    }

    synchronized void enqueue(MailEvent event, Vector vector) {
        if (this.q == null) {
            this.q = new LinkedBlockingQueue();
            if (this.executor != null) {
                this.executor.execute(this);
            } else {
                Thread qThread = new Thread(this, "JavaMail-EventQueue");
                qThread.setDaemon(true);
                qThread.start();
            }
        }
        this.q.add(new QueueElement(event, vector));
    }

    synchronized void terminateQueue() {
        if (this.q != null) {
            Vector dummyListeners = new Vector();
            dummyListeners.setSize(1);
            this.q.add(new QueueElement(new TerminatorEvent(), dummyListeners));
            this.q = null;
        }
    }

    static synchronized EventQueue getApplicationEventQueue(Executor ex) {
        ClassLoader cl = Session.getContextClassLoader();
        if (appq == null) {
            appq = new WeakHashMap<>();
        }
        EventQueue q = appq.get(cl);
        if (q == null) {
            q = new EventQueue(ex);
            appq.put(cl, q);
        }
        return q;
    }

    @Override // java.lang.Runnable
    public void run() {
        BlockingQueue<QueueElement> bq = this.q;
        if (bq == null) {
            return;
        }
        while (true) {
            try {
                QueueElement qe = bq.take();
                MailEvent e = qe.event;
                Vector v = qe.vector;
                for (int i = 0; i < v.size(); i++) {
                    try {
                        e.dispatch(v.elementAt(i));
                    } catch (Throwable t) {
                        if (t instanceof InterruptedException) {
                            return;
                        }
                    }
                }
            } catch (InterruptedException e2) {
                return;
            }
        }
    }
}
