package de.greenrobot.dao.query;

import android.database.Cursor;
import de.greenrobot.dao.AbstractDao;
import de.greenrobot.dao.DaoException;
import java.util.Date;
import java.util.List;

/* loaded from: greendao-2.0.0.jar:de/greenrobot/dao/query/Query.class */
public class Query<T> extends AbstractQuery<T> {
    private final int limitPosition;
    private final int offsetPosition;
    private final QueryData<T> queryData;

    /* loaded from: greendao-2.0.0.jar:de/greenrobot/dao/query/Query$QueryData.class */
    private static final class QueryData<T2> extends AbstractQueryData<T2, Query<T2>> {
        private final int limitPosition;
        private final int offsetPosition;

        QueryData(AbstractDao<T2, ?> dao, String sql, String[] initialValues, int limitPosition, int offsetPosition) {
            super(dao, sql, initialValues);
            this.limitPosition = limitPosition;
            this.offsetPosition = offsetPosition;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // de.greenrobot.dao.query.AbstractQueryData
        public Query<T2> createQuery() {
            return new Query<>(this, this.dao, this.sql, (String[]) this.initialValues.clone(), this.limitPosition, this.offsetPosition);
        }
    }

    public static <T2> Query<T2> internalCreate(AbstractDao<T2, ?> dao, String sql, Object[] initialValues) {
        return create(dao, sql, initialValues, -1, -1);
    }

    static <T2> Query<T2> create(AbstractDao<T2, ?> dao, String sql, Object[] initialValues, int limitPosition, int offsetPosition) {
        QueryData<T2> queryData = new QueryData<>(dao, sql, toStringArray(initialValues), limitPosition, offsetPosition);
        return queryData.forCurrentThread();
    }

    private Query(QueryData<T> queryData, AbstractDao<T, ?> dao, String sql, String[] initialValues, int limitPosition, int offsetPosition) {
        super(dao, sql, initialValues);
        this.queryData = queryData;
        this.limitPosition = limitPosition;
        this.offsetPosition = offsetPosition;
    }

    public Query<T> forCurrentThread() {
        return (Query) this.queryData.forCurrentThread(this);
    }

    @Override // de.greenrobot.dao.query.AbstractQuery
    public void setParameter(int index, Object parameter) {
        if (index >= 0 && (index == this.limitPosition || index == this.offsetPosition)) {
            throw new IllegalArgumentException("Illegal parameter index: " + index);
        }
        super.setParameter(index, parameter);
    }

    public void setParameter(int index, Date parameter) {
        Long converted = parameter != null ? Long.valueOf(parameter.getTime()) : null;
        setParameter(index, converted);
    }

    public void setParameter(int index, Boolean parameter) {
        Integer num;
        if (parameter != null) {
            num = Integer.valueOf(parameter.booleanValue() ? 1 : 0);
        } else {
            num = null;
        }
        Integer converted = num;
        setParameter(index, converted);
    }

    public void setLimit(int limit) {
        checkThread();
        if (this.limitPosition == -1) {
            throw new IllegalStateException("Limit must be set with QueryBuilder before it can be used here");
        }
        this.parameters[this.limitPosition] = Integer.toString(limit);
    }

    public void setOffset(int offset) {
        checkThread();
        if (this.offsetPosition == -1) {
            throw new IllegalStateException("Offset must be set with QueryBuilder before it can be used here");
        }
        this.parameters[this.offsetPosition] = Integer.toString(offset);
    }

    public List<T> list() {
        checkThread();
        Cursor cursor = this.dao.getDatabase().rawQuery(this.sql, this.parameters);
        return this.daoAccess.loadAllAndCloseCursor(cursor);
    }

    public LazyList<T> listLazy() {
        checkThread();
        Cursor cursor = this.dao.getDatabase().rawQuery(this.sql, this.parameters);
        return new LazyList<>(this.daoAccess, cursor, true);
    }

    public LazyList<T> listLazyUncached() {
        checkThread();
        Cursor cursor = this.dao.getDatabase().rawQuery(this.sql, this.parameters);
        return new LazyList<>(this.daoAccess, cursor, false);
    }

    public CloseableListIterator<T> listIterator() {
        return listLazyUncached().listIteratorAutoClose();
    }

    public T unique() {
        checkThread();
        Cursor cursor = this.dao.getDatabase().rawQuery(this.sql, this.parameters);
        return this.daoAccess.loadUniqueAndCloseCursor(cursor);
    }

    public T uniqueOrThrow() {
        T entity = unique();
        if (entity == null) {
            throw new DaoException("No entity found for query");
        }
        return entity;
    }
}
