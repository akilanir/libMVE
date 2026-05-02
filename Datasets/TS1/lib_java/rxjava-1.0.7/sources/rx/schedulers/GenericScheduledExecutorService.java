package rx.schedulers;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import rx.internal.schedulers.NewThreadWorker;
import rx.internal.util.RxThreadFactory;

/* loaded from: rxjava-1.0.7.jar:rx/schedulers/GenericScheduledExecutorService.class */
final class GenericScheduledExecutorService {
    private static final String THREAD_NAME_PREFIX = "RxScheduledExecutorPool-";
    private static final RxThreadFactory THREAD_FACTORY = new RxThreadFactory(THREAD_NAME_PREFIX);
    private static final GenericScheduledExecutorService INSTANCE = new GenericScheduledExecutorService();
    private final ScheduledExecutorService executor;

    private GenericScheduledExecutorService() {
        int count = Runtime.getRuntime().availableProcessors();
        count = count > 4 ? count / 2 : count;
        ScheduledExecutorService exec = Executors.newScheduledThreadPool(count > 8 ? 8 : count, THREAD_FACTORY);
        if (!NewThreadWorker.tryEnableCancelPolicy(exec) && (exec instanceof ScheduledThreadPoolExecutor)) {
            NewThreadWorker.registerExecutor((ScheduledThreadPoolExecutor) exec);
        }
        this.executor = exec;
    }

    public static ScheduledExecutorService getInstance() {
        return INSTANCE.executor;
    }
}
