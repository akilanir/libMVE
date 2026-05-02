package de.greenrobot.dao.async;

import android.database.sqlite.SQLiteDatabase;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import de.greenrobot.dao.DaoException;
import de.greenrobot.dao.DaoLog;
import de.greenrobot.dao.async.AsyncOperation;
import de.greenrobot.dao.query.Query;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;

/* loaded from: greendao-2.0.0.jar:de/greenrobot/dao/async/AsyncOperationExecutor.class */
class AsyncOperationExecutor implements Runnable, Handler.Callback {
    private static ExecutorService executorService = Executors.newCachedThreadPool();
    private volatile boolean executorRunning;
    private volatile AsyncOperationListener listener;
    private volatile AsyncOperationListener listenerMainThread;
    private int countOperationsEnqueued;
    private int countOperationsCompleted;
    private Handler handlerMainThread;
    private int lastSequenceNumber;
    private final BlockingQueue<AsyncOperation> queue = new LinkedBlockingQueue();
    private volatile int maxOperationCountToMerge = 50;
    private volatile int waitForMergeMillis = 50;

    AsyncOperationExecutor() {
    }

    public void enqueue(AsyncOperation operation) {
        synchronized (this) {
            int i = this.lastSequenceNumber + 1;
            this.lastSequenceNumber = i;
            operation.sequenceNumber = i;
            this.queue.add(operation);
            this.countOperationsEnqueued++;
            if (!this.executorRunning) {
                this.executorRunning = true;
                executorService.execute(this);
            }
        }
    }

    public int getMaxOperationCountToMerge() {
        return this.maxOperationCountToMerge;
    }

    public void setMaxOperationCountToMerge(int maxOperationCountToMerge) {
        this.maxOperationCountToMerge = maxOperationCountToMerge;
    }

    public int getWaitForMergeMillis() {
        return this.waitForMergeMillis;
    }

    public void setWaitForMergeMillis(int waitForMergeMillis) {
        this.waitForMergeMillis = waitForMergeMillis;
    }

    public AsyncOperationListener getListener() {
        return this.listener;
    }

    public void setListener(AsyncOperationListener listener) {
        this.listener = listener;
    }

    public AsyncOperationListener getListenerMainThread() {
        return this.listenerMainThread;
    }

    public void setListenerMainThread(AsyncOperationListener listenerMainThread) {
        this.listenerMainThread = listenerMainThread;
    }

    public synchronized boolean isCompleted() {
        return this.countOperationsEnqueued == this.countOperationsCompleted;
    }

    public synchronized void waitForCompletion() {
        while (!isCompleted()) {
            try {
                wait();
            } catch (InterruptedException e) {
                throw new DaoException("Interrupted while waiting for all operations to complete", e);
            }
        }
    }

    public synchronized boolean waitForCompletion(int maxMillis) {
        if (!isCompleted()) {
            try {
                wait(maxMillis);
            } catch (InterruptedException e) {
                throw new DaoException("Interrupted while waiting for all operations to complete", e);
            }
        }
        return isCompleted();
    }

    @Override // java.lang.Runnable
    public void run() {
        AsyncOperation operation2;
        while (true) {
            try {
                try {
                    AsyncOperation operation = this.queue.poll(1L, TimeUnit.SECONDS);
                    if (operation == null) {
                        synchronized (this) {
                            operation = this.queue.poll();
                            if (operation == null) {
                                this.executorRunning = false;
                                this.executorRunning = false;
                                return;
                            }
                        }
                    }
                    if (operation.isMergeTx() && (operation2 = this.queue.poll(this.waitForMergeMillis, TimeUnit.MILLISECONDS)) != null) {
                        if (operation.isMergeableWith(operation2)) {
                            mergeTxAndExecute(operation, operation2);
                        } else {
                            executeOperationAndPostCompleted(operation);
                            executeOperationAndPostCompleted(operation2);
                        }
                    } else {
                        executeOperationAndPostCompleted(operation);
                    }
                } catch (InterruptedException e) {
                    DaoLog.w(Thread.currentThread().getName() + " was interruppted", e);
                    this.executorRunning = false;
                    return;
                }
            } catch (Throwable th) {
                this.executorRunning = false;
                throw th;
            }
        }
    }

    private void mergeTxAndExecute(AsyncOperation operation1, AsyncOperation operation2) {
        ArrayList<AsyncOperation> mergedOps = new ArrayList<>();
        mergedOps.add(operation1);
        mergedOps.add(operation2);
        SQLiteDatabase db = operation1.getDatabase();
        db.beginTransaction();
        boolean success = false;
        for (int i = 0; i < mergedOps.size(); i++) {
            try {
                AsyncOperation operation = mergedOps.get(i);
                executeOperation(operation);
                if (operation.isFailed()) {
                    break;
                }
                if (i == mergedOps.size() - 1) {
                    AsyncOperation peekedOp = this.queue.peek();
                    if (i < this.maxOperationCountToMerge && operation.isMergeableWith(peekedOp)) {
                        AsyncOperation removedOp = this.queue.remove();
                        if (removedOp != peekedOp) {
                            throw new DaoException("Internal error: peeked op did not match removed op");
                        }
                        mergedOps.add(removedOp);
                    } else {
                        db.setTransactionSuccessful();
                        success = true;
                        break;
                    }
                }
            } catch (Throwable th) {
                try {
                    db.endTransaction();
                } catch (RuntimeException e) {
                    DaoLog.i("Async transaction could not be ended, success so far was: false", e);
                }
                throw th;
            }
        }
        try {
            db.endTransaction();
        } catch (RuntimeException e2) {
            DaoLog.i("Async transaction could not be ended, success so far was: " + success, e2);
            success = false;
        }
        if (success) {
            int mergedCount = mergedOps.size();
            Iterator i$ = mergedOps.iterator();
            while (i$.hasNext()) {
                AsyncOperation asyncOperation = i$.next();
                asyncOperation.mergedOperationsCount = mergedCount;
                handleOperationCompleted(asyncOperation);
            }
            return;
        }
        DaoLog.i("Reverted merged transaction because one of the operations failed. Executing operations one by one instead...");
        Iterator i$2 = mergedOps.iterator();
        while (i$2.hasNext()) {
            AsyncOperation asyncOperation2 = i$2.next();
            asyncOperation2.reset();
            executeOperationAndPostCompleted(asyncOperation2);
        }
    }

    private void handleOperationCompleted(AsyncOperation operation) {
        operation.setCompleted();
        AsyncOperationListener listenerToCall = this.listener;
        if (listenerToCall != null) {
            listenerToCall.onAsyncOperationCompleted(operation);
        }
        if (this.listenerMainThread != null) {
            if (this.handlerMainThread == null) {
                this.handlerMainThread = new Handler(Looper.getMainLooper(), this);
            }
            Message msg = this.handlerMainThread.obtainMessage(1, operation);
            this.handlerMainThread.sendMessage(msg);
        }
        synchronized (this) {
            this.countOperationsCompleted++;
            if (this.countOperationsCompleted == this.countOperationsEnqueued) {
                notifyAll();
            }
        }
    }

    private void executeOperationAndPostCompleted(AsyncOperation operation) {
        executeOperation(operation);
        handleOperationCompleted(operation);
    }

    private void executeOperation(AsyncOperation operation) {
        operation.timeStarted = System.currentTimeMillis();
        try {
            switch (AnonymousClass1.$SwitchMap$de$greenrobot$dao$async$AsyncOperation$OperationType[operation.type.ordinal()]) {
                case AsyncOperation.FLAG_MERGE_TX /* 1 */:
                    operation.dao.delete(operation.parameter);
                    break;
                case 2:
                    operation.dao.deleteInTx((Iterable<Object>) operation.parameter);
                    break;
                case DaoLog.DEBUG /* 3 */:
                    operation.dao.deleteInTx((Object[]) operation.parameter);
                    break;
                case 4:
                    operation.dao.insert(operation.parameter);
                    break;
                case DaoLog.WARN /* 5 */:
                    operation.dao.insertInTx((Iterable<Object>) operation.parameter);
                    break;
                case DaoLog.ERROR /* 6 */:
                    operation.dao.insertInTx((Object[]) operation.parameter);
                    break;
                case DaoLog.ASSERT /* 7 */:
                    operation.dao.insertOrReplace(operation.parameter);
                    break;
                case 8:
                    operation.dao.insertOrReplaceInTx((Iterable<Object>) operation.parameter);
                    break;
                case 9:
                    operation.dao.insertOrReplaceInTx((Object[]) operation.parameter);
                    break;
                case 10:
                    operation.dao.update(operation.parameter);
                    break;
                case 11:
                    operation.dao.updateInTx((Iterable<Object>) operation.parameter);
                    break;
                case 12:
                    operation.dao.updateInTx((Object[]) operation.parameter);
                    break;
                case 13:
                    executeTransactionRunnable(operation);
                    break;
                case 14:
                    executeTransactionCallable(operation);
                    break;
                case 15:
                    operation.result = ((Query) operation.parameter).list();
                    break;
                case 16:
                    operation.result = ((Query) operation.parameter).unique();
                    break;
                case 17:
                    operation.dao.deleteByKey(operation.parameter);
                    break;
                case 18:
                    operation.dao.deleteAll();
                    break;
                case 19:
                    operation.result = operation.dao.load(operation.parameter);
                    break;
                case 20:
                    operation.result = operation.dao.loadAll();
                    break;
                case 21:
                    operation.result = Long.valueOf(operation.dao.count());
                    break;
                case 22:
                    operation.dao.refresh(operation.parameter);
                    break;
                default:
                    throw new DaoException("Unsupported operation: " + operation.type);
            }
        } catch (Throwable th) {
            operation.throwable = th;
        }
        operation.timeCompleted = System.currentTimeMillis();
    }

    /* renamed from: de.greenrobot.dao.async.AsyncOperationExecutor$1, reason: invalid class name */
    /* loaded from: greendao-2.0.0.jar:de/greenrobot/dao/async/AsyncOperationExecutor$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$de$greenrobot$dao$async$AsyncOperation$OperationType = new int[AsyncOperation.OperationType.values().length];

        static {
            try {
                $SwitchMap$de$greenrobot$dao$async$AsyncOperation$OperationType[AsyncOperation.OperationType.Delete.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$de$greenrobot$dao$async$AsyncOperation$OperationType[AsyncOperation.OperationType.DeleteInTxIterable.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$de$greenrobot$dao$async$AsyncOperation$OperationType[AsyncOperation.OperationType.DeleteInTxArray.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$de$greenrobot$dao$async$AsyncOperation$OperationType[AsyncOperation.OperationType.Insert.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$de$greenrobot$dao$async$AsyncOperation$OperationType[AsyncOperation.OperationType.InsertInTxIterable.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
            try {
                $SwitchMap$de$greenrobot$dao$async$AsyncOperation$OperationType[AsyncOperation.OperationType.InsertInTxArray.ordinal()] = 6;
            } catch (NoSuchFieldError e6) {
            }
            try {
                $SwitchMap$de$greenrobot$dao$async$AsyncOperation$OperationType[AsyncOperation.OperationType.InsertOrReplace.ordinal()] = 7;
            } catch (NoSuchFieldError e7) {
            }
            try {
                $SwitchMap$de$greenrobot$dao$async$AsyncOperation$OperationType[AsyncOperation.OperationType.InsertOrReplaceInTxIterable.ordinal()] = 8;
            } catch (NoSuchFieldError e8) {
            }
            try {
                $SwitchMap$de$greenrobot$dao$async$AsyncOperation$OperationType[AsyncOperation.OperationType.InsertOrReplaceInTxArray.ordinal()] = 9;
            } catch (NoSuchFieldError e9) {
            }
            try {
                $SwitchMap$de$greenrobot$dao$async$AsyncOperation$OperationType[AsyncOperation.OperationType.Update.ordinal()] = 10;
            } catch (NoSuchFieldError e10) {
            }
            try {
                $SwitchMap$de$greenrobot$dao$async$AsyncOperation$OperationType[AsyncOperation.OperationType.UpdateInTxIterable.ordinal()] = 11;
            } catch (NoSuchFieldError e11) {
            }
            try {
                $SwitchMap$de$greenrobot$dao$async$AsyncOperation$OperationType[AsyncOperation.OperationType.UpdateInTxArray.ordinal()] = 12;
            } catch (NoSuchFieldError e12) {
            }
            try {
                $SwitchMap$de$greenrobot$dao$async$AsyncOperation$OperationType[AsyncOperation.OperationType.TransactionRunnable.ordinal()] = 13;
            } catch (NoSuchFieldError e13) {
            }
            try {
                $SwitchMap$de$greenrobot$dao$async$AsyncOperation$OperationType[AsyncOperation.OperationType.TransactionCallable.ordinal()] = 14;
            } catch (NoSuchFieldError e14) {
            }
            try {
                $SwitchMap$de$greenrobot$dao$async$AsyncOperation$OperationType[AsyncOperation.OperationType.QueryList.ordinal()] = 15;
            } catch (NoSuchFieldError e15) {
            }
            try {
                $SwitchMap$de$greenrobot$dao$async$AsyncOperation$OperationType[AsyncOperation.OperationType.QueryUnique.ordinal()] = 16;
            } catch (NoSuchFieldError e16) {
            }
            try {
                $SwitchMap$de$greenrobot$dao$async$AsyncOperation$OperationType[AsyncOperation.OperationType.DeleteByKey.ordinal()] = 17;
            } catch (NoSuchFieldError e17) {
            }
            try {
                $SwitchMap$de$greenrobot$dao$async$AsyncOperation$OperationType[AsyncOperation.OperationType.DeleteAll.ordinal()] = 18;
            } catch (NoSuchFieldError e18) {
            }
            try {
                $SwitchMap$de$greenrobot$dao$async$AsyncOperation$OperationType[AsyncOperation.OperationType.Load.ordinal()] = 19;
            } catch (NoSuchFieldError e19) {
            }
            try {
                $SwitchMap$de$greenrobot$dao$async$AsyncOperation$OperationType[AsyncOperation.OperationType.LoadAll.ordinal()] = 20;
            } catch (NoSuchFieldError e20) {
            }
            try {
                $SwitchMap$de$greenrobot$dao$async$AsyncOperation$OperationType[AsyncOperation.OperationType.Count.ordinal()] = 21;
            } catch (NoSuchFieldError e21) {
            }
            try {
                $SwitchMap$de$greenrobot$dao$async$AsyncOperation$OperationType[AsyncOperation.OperationType.Refresh.ordinal()] = 22;
            } catch (NoSuchFieldError e22) {
            }
        }
    }

    private void executeTransactionRunnable(AsyncOperation operation) {
        SQLiteDatabase db = operation.getDatabase();
        db.beginTransaction();
        try {
            ((Runnable) operation.parameter).run();
            db.setTransactionSuccessful();
            db.endTransaction();
        } catch (Throwable th) {
            db.endTransaction();
            throw th;
        }
    }

    private void executeTransactionCallable(AsyncOperation operation) throws Exception {
        SQLiteDatabase db = operation.getDatabase();
        db.beginTransaction();
        try {
            operation.result = ((Callable) operation.parameter).call();
            db.setTransactionSuccessful();
            db.endTransaction();
        } catch (Throwable th) {
            db.endTransaction();
            throw th;
        }
    }

    @Override // android.os.Handler.Callback
    public boolean handleMessage(Message msg) {
        AsyncOperationListener listenerToCall = this.listenerMainThread;
        if (listenerToCall != null) {
            listenerToCall.onAsyncOperationCompleted((AsyncOperation) msg.obj);
            return false;
        }
        return false;
    }
}
