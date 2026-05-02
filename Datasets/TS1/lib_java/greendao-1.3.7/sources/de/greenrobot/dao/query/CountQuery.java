package de.greenrobot.dao.query;

import android.database.Cursor;
import de.greenrobot.dao.AbstractDao;
import de.greenrobot.dao.DaoException;

/* loaded from: greendao-1.3.7.jar:de/greenrobot/dao/query/CountQuery.class */
public class CountQuery<T> extends AbstractQuery<T> {
    private final QueryData<T> queryData;

    @Override // de.greenrobot.dao.query.AbstractQuery
    public /* bridge */ /* synthetic */ void setParameter(int x0, Object x1) {
        super.setParameter(x0, x1);
    }

    /* loaded from: greendao-1.3.7.jar:de/greenrobot/dao/query/CountQuery$QueryData.class */
    private static final class QueryData<T2> extends AbstractQueryData<T2, CountQuery<T2>> {
        private QueryData(AbstractDao<T2, ?> dao, String sql, String[] initialValues) {
            super(dao, sql, initialValues);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // de.greenrobot.dao.query.AbstractQueryData
        public CountQuery<T2> createQuery() {
            return new CountQuery<>(this, this.dao, this.sql, (String[]) this.initialValues.clone());
        }
    }

    static <T2> CountQuery<T2> create(AbstractDao<T2, ?> dao, String sql, Object[] initialValues) {
        QueryData<T2> queryData = new QueryData<>(dao, sql, toStringArray(initialValues));
        return queryData.forCurrentThread();
    }

    private CountQuery(QueryData<T> queryData, AbstractDao<T, ?> dao, String sql, String[] initialValues) {
        super(dao, sql, initialValues);
        this.queryData = queryData;
    }

    public CountQuery<T> forCurrentThread() {
        return (CountQuery) this.queryData.forCurrentThread(this);
    }

    public long count() {
        checkThread();
        Cursor cursor = this.dao.getDatabase().rawQuery(this.sql, this.parameters);
        try {
            if (!cursor.moveToNext()) {
                throw new DaoException("No result for count");
            }
            if (!cursor.isLast()) {
                throw new DaoException("Unexpected row count: " + cursor.getCount());
            }
            if (cursor.getColumnCount() != 1) {
                throw new DaoException("Unexpected column count: " + cursor.getColumnCount());
            }
            long j = cursor.getLong(0);
            cursor.close();
            return j;
        } catch (Throwable th) {
            cursor.close();
            throw th;
        }
    }
}
