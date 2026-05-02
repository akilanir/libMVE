package rx.internal.schedulers;

import java.lang.reflect.Method;
import java.util.Iterator;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;
import rx.Scheduler;
import rx.Subscription;
import rx.exceptions.Exceptions;
import rx.functions.Action0;
import rx.internal.util.RxThreadFactory;
import rx.plugins.RxJavaPlugins;
import rx.plugins.RxJavaSchedulersHook;
import rx.subscriptions.Subscriptions;

/* loaded from: rxjava-1.0.7.jar:rx/internal/schedulers/NewThreadWorker.class */
public class NewThreadWorker extends Scheduler.Worker implements Subscription {
    private final ScheduledExecutorService executor;
    private final RxJavaSchedulersHook schedulersHook;
    volatile boolean isUnsubscribed;
    private static final String PURGE_THREAD_PREFIX = "RxSchedulerPurge-";
    private static final ConcurrentHashMap<ScheduledThreadPoolExecutor, ScheduledThreadPoolExecutor> EXECUTORS = new ConcurrentHashMap<>();
    private static final AtomicReference<ScheduledExecutorService> PURGE = new AtomicReference<>();
    private static final String PURGE_FORCE_KEY = "rx.scheduler.jdk6.purge-force";
    private static final boolean PURGE_FORCE = Boolean.getBoolean(PURGE_FORCE_KEY);
    private static final String FREQUENCY_KEY = "rx.scheduler.jdk6.purge-frequency-millis";
    public static final int PURGE_FREQUENCY = Integer.getInteger(FREQUENCY_KEY, 1000).intValue();

    public static void registerExecutor(ScheduledThreadPoolExecutor service) {
        while (true) {
            if (PURGE.get() != null) {
                break;
            }
            ScheduledExecutorService exec = Executors.newScheduledThreadPool(1, new RxThreadFactory(PURGE_THREAD_PREFIX));
            if (PURGE.compareAndSet(null, exec)) {
                exec.scheduleAtFixedRate(new Runnable() { // from class: rx.internal.schedulers.NewThreadWorker.1
                    @Override // java.lang.Runnable
                    public void run() {
                        NewThreadWorker.purgeExecutors();
                    }
                }, PURGE_FREQUENCY, PURGE_FREQUENCY, TimeUnit.MILLISECONDS);
                break;
            }
        }
        EXECUTORS.putIfAbsent(service, service);
    }

    public static void deregisterExecutor(ScheduledExecutorService service) {
        EXECUTORS.remove(service);
    }

    static void purgeExecutors() {
        try {
            Iterator<ScheduledThreadPoolExecutor> it = EXECUTORS.keySet().iterator();
            while (it.hasNext()) {
                ScheduledThreadPoolExecutor exec = it.next();
                if (!exec.isShutdown()) {
                    exec.purge();
                } else {
                    it.remove();
                }
            }
        } catch (Throwable t) {
            Exceptions.throwIfFatal(t);
            RxJavaPlugins.getInstance().getErrorHandler().handleError(t);
        }
    }

    public static boolean tryEnableCancelPolicy(ScheduledExecutorService exec) {
        if (!PURGE_FORCE) {
            Method[] arr$ = exec.getClass().getMethods();
            for (Method m : arr$) {
                if (m.getName().equals("setRemoveOnCancelPolicy") && m.getParameterTypes().length == 1 && m.getParameterTypes()[0] == Boolean.TYPE) {
                    try {
                        m.invoke(exec, true);
                        return true;
                    } catch (Exception ex) {
                        RxJavaPlugins.getInstance().getErrorHandler().handleError(ex);
                    }
                }
            }
            return false;
        }
        return false;
    }

    public NewThreadWorker(ThreadFactory threadFactory) {
        ScheduledExecutorService exec = Executors.newScheduledThreadPool(1, threadFactory);
        boolean cancelSupported = tryEnableCancelPolicy(exec);
        if (!cancelSupported && (exec instanceof ScheduledThreadPoolExecutor)) {
            registerExecutor((ScheduledThreadPoolExecutor) exec);
        }
        this.schedulersHook = RxJavaPlugins.getInstance().getSchedulersHook();
        this.executor = exec;
    }

    @Override // rx.Scheduler.Worker
    public Subscription schedule(Action0 action) {
        return schedule(action, 0L, null);
    }

    @Override // rx.Scheduler.Worker
    public Subscription schedule(Action0 action, long delayTime, TimeUnit unit) {
        if (this.isUnsubscribed) {
            return Subscriptions.unsubscribed();
        }
        return scheduleActual(action, delayTime, unit);
    }

    public ScheduledAction scheduleActual(Action0 action, long delayTime, TimeUnit unit) {
        Future<?> f;
        Action0 decoratedAction = this.schedulersHook.onSchedule(action);
        ScheduledAction run = new ScheduledAction(decoratedAction);
        if (delayTime <= 0) {
            f = this.executor.submit(run);
        } else {
            f = this.executor.schedule(run, delayTime, unit);
        }
        run.add(f);
        return run;
    }

    @Override // rx.Subscription
    public void unsubscribe() {
        this.isUnsubscribed = true;
        this.executor.shutdownNow();
        deregisterExecutor(this.executor);
    }

    @Override // rx.Subscription
    public boolean isUnsubscribed() {
        return this.isUnsubscribed;
    }
}
