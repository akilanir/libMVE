package org.androidannotations.api;

import android.os.Looper;
import android.util.Log;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: androidannotations-api-3.3.2.jar:org/androidannotations/api/BackgroundExecutor.class */
public class BackgroundExecutor {
    private static final String TAG = "BackgroundExecutor";
    public static final Executor DEFAULT_EXECUTOR = Executors.newScheduledThreadPool(2 * Runtime.getRuntime().availableProcessors());
    private static Executor executor = DEFAULT_EXECUTOR;
    public static final WrongThreadListener DEFAULT_WRONG_THREAD_LISTENER = new WrongThreadListener() { // from class: org.androidannotations.api.BackgroundExecutor.1
        @Override // org.androidannotations.api.BackgroundExecutor.WrongThreadListener
        public void onUiExpected() {
            throw new IllegalStateException("Method invocation is expected from the UI thread");
        }

        @Override // org.androidannotations.api.BackgroundExecutor.WrongThreadListener
        public void onBgExpected(String... expectedSerials) {
            if (expectedSerials.length == 0) {
                throw new IllegalStateException("Method invocation is expected from a background thread, but it was called from the UI thread");
            }
            throw new IllegalStateException("Method invocation is expected from one of serials " + Arrays.toString(expectedSerials) + ", but it was called from the UI thread");
        }

        @Override // org.androidannotations.api.BackgroundExecutor.WrongThreadListener
        public void onWrongBgSerial(String currentSerial, String... expectedSerials) {
            if (currentSerial == null) {
                currentSerial = "anonymous";
            }
            throw new IllegalStateException("Method invocation is expected from one of serials " + Arrays.toString(expectedSerials) + ", but it was called from " + currentSerial + " serial");
        }
    };
    private static WrongThreadListener wrongThreadListener = DEFAULT_WRONG_THREAD_LISTENER;
    private static final List<Task> TASKS = new ArrayList();
    private static final ThreadLocal<String> CURRENT_SERIAL = new ThreadLocal<>();

    /* loaded from: androidannotations-api-3.3.2.jar:org/androidannotations/api/BackgroundExecutor$WrongThreadListener.class */
    public interface WrongThreadListener {
        void onUiExpected();

        void onBgExpected(String... strArr);

        void onWrongBgSerial(String str, String... strArr);
    }

    private BackgroundExecutor() {
    }

    private static Future<?> directExecute(Runnable runnable, int delay) {
        Future<?> future = null;
        if (delay > 0) {
            if (!(executor instanceof ScheduledExecutorService)) {
                throw new IllegalArgumentException("The executor set does not support scheduling");
            }
            ScheduledExecutorService scheduledExecutorService = (ScheduledExecutorService) executor;
            future = scheduledExecutorService.schedule(runnable, delay, TimeUnit.MILLISECONDS);
        } else if (executor instanceof ExecutorService) {
            ExecutorService executorService = (ExecutorService) executor;
            future = executorService.submit(runnable);
        } else {
            executor.execute(runnable);
        }
        return future;
    }

    public static synchronized void execute(Task task) {
        Future<?> future = null;
        if (task.serial == null || !hasSerialRunning(task.serial)) {
            task.executionAsked = true;
            future = directExecute(task, task.remainingDelay);
        }
        if (task.id == null && task.serial == null) {
            return;
        }
        task.future = future;
        TASKS.add(task);
    }

    public static void execute(final Runnable runnable, String id, int delay, String serial) {
        execute(new Task(id, delay, serial) { // from class: org.androidannotations.api.BackgroundExecutor.2
            @Override // org.androidannotations.api.BackgroundExecutor.Task
            public void execute() {
                runnable.run();
            }
        });
    }

    public static void execute(Runnable runnable, int delay) {
        directExecute(runnable, delay);
    }

    public static void execute(Runnable runnable) {
        directExecute(runnable, 0);
    }

    public static void execute(Runnable runnable, String id, String serial) {
        execute(runnable, id, 0, serial);
    }

    public static void setExecutor(Executor executor2) {
        executor = executor2;
    }

    public static void setWrongThreadListener(WrongThreadListener listener) {
        wrongThreadListener = listener;
    }

    public static synchronized void cancelAll(String id, boolean mayInterruptIfRunning) {
        for (int i = TASKS.size() - 1; i >= 0; i--) {
            Task task = TASKS.get(i);
            if (id.equals(task.id)) {
                if (task.future != null) {
                    task.future.cancel(mayInterruptIfRunning);
                    if (!task.managed.getAndSet(true)) {
                        task.postExecute();
                    }
                } else if (task.executionAsked) {
                    Log.w(TAG, "A task with id " + task.id + " cannot be cancelled (the executor set does not support it)");
                } else {
                    TASKS.remove(i);
                }
            }
        }
    }

    public static void checkUiThread() {
        if (Looper.getMainLooper().getThread() != Thread.currentThread()) {
            wrongThreadListener.onUiExpected();
        }
    }

    public static void checkBgThread(String... serials) {
        if (serials.length == 0) {
            if (Looper.getMainLooper().getThread() == Thread.currentThread()) {
                wrongThreadListener.onBgExpected(serials);
                return;
            }
            return;
        }
        String current = CURRENT_SERIAL.get();
        if (current == null) {
            wrongThreadListener.onWrongBgSerial(null, serials);
            return;
        }
        for (String serial : serials) {
            if (serial.equals(current)) {
                return;
            }
        }
        wrongThreadListener.onWrongBgSerial(current, serials);
    }

    private static boolean hasSerialRunning(String serial) {
        for (Task task : TASKS) {
            if (task.executionAsked && serial.equals(task.serial)) {
                return true;
            }
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static Task take(String serial) {
        int len = TASKS.size();
        for (int i = 0; i < len; i++) {
            if (serial.equals(TASKS.get(i).serial)) {
                return TASKS.remove(i);
            }
        }
        return null;
    }

    /* loaded from: androidannotations-api-3.3.2.jar:org/androidannotations/api/BackgroundExecutor$Task.class */
    public static abstract class Task implements Runnable {
        private String id;
        private int remainingDelay;
        private long targetTimeMillis;
        private String serial;
        private boolean executionAsked;
        private Future<?> future;
        private AtomicBoolean managed = new AtomicBoolean();

        public abstract void execute();

        public Task(String id, int delay, String serial) {
            if (!"".equals(id)) {
                this.id = id;
            }
            if (delay > 0) {
                this.remainingDelay = delay;
                this.targetTimeMillis = System.currentTimeMillis() + delay;
            }
            if (!"".equals(serial)) {
                this.serial = serial;
            }
        }

        @Override // java.lang.Runnable
        public void run() {
            if (!this.managed.getAndSet(true)) {
                try {
                    BackgroundExecutor.CURRENT_SERIAL.set(this.serial);
                    execute();
                } finally {
                    postExecute();
                }
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void postExecute() {
            Task next;
            if (this.id != null || this.serial != null) {
                BackgroundExecutor.CURRENT_SERIAL.set(null);
                synchronized (BackgroundExecutor.class) {
                    BackgroundExecutor.TASKS.remove(this);
                    if (this.serial != null && (next = BackgroundExecutor.take(this.serial)) != null) {
                        if (next.remainingDelay != 0) {
                            next.remainingDelay = Math.max(0, (int) (this.targetTimeMillis - System.currentTimeMillis()));
                        }
                        BackgroundExecutor.execute(next);
                    }
                }
            }
        }
    }
}
