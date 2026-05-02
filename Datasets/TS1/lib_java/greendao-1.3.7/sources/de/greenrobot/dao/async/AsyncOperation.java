package de.greenrobot.dao.async;

import android.database.sqlite.SQLiteDatabase;
import de.greenrobot.dao.AbstractDao;
import de.greenrobot.dao.DaoException;

/* loaded from: greendao-1.3.7.jar:de/greenrobot/dao/async/AsyncOperation.class */
public class AsyncOperation {
    public static final int FLAG_MERGE_TX = 1;
    public static final int FLAG_STOP_QUEUE_ON_EXCEPTION = 2;
    final OperationType type;
    final AbstractDao<Object, Object> dao;
    private final SQLiteDatabase database;
    final Object parameter;
    final int flags;
    volatile long timeStarted;
    volatile long timeCompleted;
    private volatile boolean completed;
    volatile Throwable throwable;
    volatile Object result;
    volatile int mergedOperationsCount;
    int sequenceNumber;

    /* loaded from: greendao-1.3.7.jar:de/greenrobot/dao/async/AsyncOperation$OperationType.class */
    public enum OperationType {
        Insert,
        InsertInTxIterable,
        InsertInTxArray,
        InsertOrReplace,
        InsertOrReplaceInTxIterable,
        InsertOrReplaceInTxArray,
        Update,
        UpdateInTxIterable,
        UpdateInTxArray,
        Delete,
        DeleteInTxIterable,
        DeleteInTxArray,
        DeleteByKey,
        DeleteAll,
        TransactionRunnable,
        TransactionCallable,
        QueryList,
        QueryUnique,
        Load,
        LoadAll,
        Count,
        Refresh
    }

    AsyncOperation(OperationType type, AbstractDao<?, ?> dao, Object parameter, int flags) {
        this.type = type;
        this.flags = flags;
        this.dao = dao;
        this.database = null;
        this.parameter = parameter;
    }

    AsyncOperation(OperationType type, SQLiteDatabase database, Object parameter, int flags) {
        this.type = type;
        this.database = database;
        this.flags = flags;
        this.dao = null;
        this.parameter = parameter;
    }

    public Throwable getThrowable() {
        return this.throwable;
    }

    public void setThrowable(Throwable throwable) {
        this.throwable = throwable;
    }

    public OperationType getType() {
        return this.type;
    }

    public Object getParameter() {
        return this.parameter;
    }

    public synchronized Object getResult() {
        if (!this.completed) {
            waitForCompletion();
        }
        if (this.throwable != null) {
            throw new AsyncDaoException(this, this.throwable);
        }
        return this.result;
    }

    public boolean isMergeTx() {
        return (this.flags & 1) != 0;
    }

    SQLiteDatabase getDatabase() {
        return this.database != null ? this.database : this.dao.getDatabase();
    }

    boolean isMergeableWith(AsyncOperation other) {
        return other != null && isMergeTx() && other.isMergeTx() && getDatabase() == other.getDatabase();
    }

    public long getTimeStarted() {
        return this.timeStarted;
    }

    public long getTimeCompleted() {
        return this.timeCompleted;
    }

    public long getDuration() {
        if (this.timeCompleted == 0) {
            throw new DaoException("This operation did not yet complete");
        }
        return this.timeCompleted - this.timeStarted;
    }

    public boolean isFailed() {
        return this.throwable != null;
    }

    public boolean isCompleted() {
        return this.completed;
    }

    public synchronized Object waitForCompletion() {
        while (!this.completed) {
            try {
                wait();
            } catch (InterruptedException e) {
                throw new DaoException("Interrupted while waiting for operation to complete", e);
            }
        }
        return this.result;
    }

    public synchronized boolean waitForCompletion(int maxMillis) {
        if (!this.completed) {
            try {
                wait(maxMillis);
            } catch (InterruptedException e) {
                throw new DaoException("Interrupted while waiting for operation to complete", e);
            }
        }
        return this.completed;
    }

    synchronized void setCompleted() {
        this.completed = true;
        notifyAll();
    }

    public boolean isCompletedSucessfully() {
        return this.completed && this.throwable == null;
    }

    public int getMergedOperationsCount() {
        return this.mergedOperationsCount;
    }

    public int getSequenceNumber() {
        return this.sequenceNumber;
    }

    void reset() {
        this.timeStarted = 0L;
        this.timeCompleted = 0L;
        this.completed = false;
        this.throwable = null;
        this.result = null;
        this.mergedOperationsCount = 0;
    }
}
