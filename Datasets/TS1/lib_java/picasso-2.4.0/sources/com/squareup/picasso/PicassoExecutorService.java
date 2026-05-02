package com.squareup.picasso;

import android.net.NetworkInfo;
import com.squareup.picasso.Picasso;
import com.squareup.picasso.Utils;
import java.util.concurrent.Future;
import java.util.concurrent.FutureTask;
import java.util.concurrent.PriorityBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* loaded from: picasso-2.4.0.jar:com/squareup/picasso/PicassoExecutorService.class */
class PicassoExecutorService extends ThreadPoolExecutor {
    private static final int DEFAULT_THREAD_COUNT = 3;

    PicassoExecutorService() {
        super(DEFAULT_THREAD_COUNT, DEFAULT_THREAD_COUNT, 0L, TimeUnit.MILLISECONDS, new PriorityBlockingQueue(), new Utils.PicassoThreadFactory());
    }

    void adjustThreadCount(NetworkInfo info) {
        if (info == null || !info.isConnectedOrConnecting()) {
            setThreadCount(DEFAULT_THREAD_COUNT);
            return;
        }
        switch (info.getType()) {
            case 0:
                switch (info.getSubtype()) {
                    case 1:
                    case 2:
                        setThreadCount(1);
                        break;
                    case DEFAULT_THREAD_COUNT /* 3 */:
                    case 4:
                    case 5:
                    case 6:
                    case 12:
                        setThreadCount(2);
                        break;
                    case 7:
                    case 8:
                    case 9:
                    case 10:
                    case 11:
                    default:
                        setThreadCount(DEFAULT_THREAD_COUNT);
                        break;
                    case 13:
                    case 14:
                    case 15:
                        setThreadCount(DEFAULT_THREAD_COUNT);
                        break;
                }
            case 1:
            case 6:
            case 9:
                setThreadCount(4);
                break;
            case 2:
            case DEFAULT_THREAD_COUNT /* 3 */:
            case 4:
            case 5:
            case 7:
            case 8:
            default:
                setThreadCount(DEFAULT_THREAD_COUNT);
                break;
        }
    }

    private void setThreadCount(int threadCount) {
        setCorePoolSize(threadCount);
        setMaximumPoolSize(threadCount);
    }

    @Override // java.util.concurrent.AbstractExecutorService, java.util.concurrent.ExecutorService
    public Future<?> submit(Runnable task) {
        PicassoFutureTask ftask = new PicassoFutureTask((BitmapHunter) task);
        execute(ftask);
        return ftask;
    }

    /* loaded from: picasso-2.4.0.jar:com/squareup/picasso/PicassoExecutorService$PicassoFutureTask.class */
    private static final class PicassoFutureTask extends FutureTask<BitmapHunter> implements Comparable<PicassoFutureTask> {
        private final BitmapHunter hunter;

        public PicassoFutureTask(BitmapHunter hunter) {
            super(hunter, null);
            this.hunter = hunter;
        }

        @Override // java.lang.Comparable
        public int compareTo(PicassoFutureTask other) {
            Picasso.Priority p1 = this.hunter.getPriority();
            Picasso.Priority p2 = other.hunter.getPriority();
            return p1 == p2 ? this.hunter.sequence - other.hunter.sequence : p2.ordinal() - p1.ordinal();
        }
    }
}
