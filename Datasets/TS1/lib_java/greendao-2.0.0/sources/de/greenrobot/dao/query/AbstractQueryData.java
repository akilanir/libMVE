package de.greenrobot.dao.query;

import android.os.Process;
import android.util.SparseArray;
import de.greenrobot.dao.AbstractDao;
import de.greenrobot.dao.query.AbstractQuery;
import java.lang.ref.WeakReference;

/* loaded from: greendao-2.0.0.jar:de/greenrobot/dao/query/AbstractQueryData.class */
abstract class AbstractQueryData<T, Q extends AbstractQuery<T>> {
    final String sql;
    final AbstractDao<T, ?> dao;
    final String[] initialValues;
    final SparseArray<WeakReference<Q>> queriesForThreads = new SparseArray<>();

    protected abstract Q createQuery();

    AbstractQueryData(AbstractDao<T, ?> dao, String sql, String[] initialValues) {
        this.dao = dao;
        this.sql = sql;
        this.initialValues = initialValues;
    }

    Q forCurrentThread(Q q) {
        if (Thread.currentThread() == q.ownerThread) {
            System.arraycopy(this.initialValues, 0, q.parameters, 0, this.initialValues.length);
            return q;
        }
        return (Q) forCurrentThread();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v18, types: [de.greenrobot.dao.query.AbstractQuery] */
    Q forCurrentThread() {
        Q q;
        int threadId = Process.myTid();
        synchronized (this.queriesForThreads) {
            WeakReference<Q> queryRef = this.queriesForThreads.get(threadId);
            Q query = queryRef != null ? queryRef.get() : null;
            if (query == null) {
                gc();
                query = createQuery();
                this.queriesForThreads.put(threadId, new WeakReference<>(query));
            } else {
                System.arraycopy(this.initialValues, 0, query.parameters, 0, this.initialValues.length);
            }
            q = query;
        }
        return q;
    }

    void gc() {
        synchronized (this.queriesForThreads) {
            for (int i = this.queriesForThreads.size() - 1; i >= 0; i--) {
                if (this.queriesForThreads.valueAt(i).get() == null) {
                    this.queriesForThreads.remove(this.queriesForThreads.keyAt(i));
                }
            }
        }
    }
}
