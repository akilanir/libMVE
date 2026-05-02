package de.greenrobot.dao;

import android.database.CrossProcessCursor;
import android.database.Cursor;
import android.database.CursorWindow;
import android.database.DatabaseUtils;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteStatement;
import de.greenrobot.dao.identityscope.IdentityScope;
import de.greenrobot.dao.identityscope.IdentityScopeLong;
import de.greenrobot.dao.internal.DaoConfig;
import de.greenrobot.dao.internal.FastCursor;
import de.greenrobot.dao.internal.TableStatements;
import de.greenrobot.dao.query.Query;
import de.greenrobot.dao.query.QueryBuilder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;

/* loaded from: greendao-2.0.0.jar:de/greenrobot/dao/AbstractDao.class */
public abstract class AbstractDao<T, K> {
    protected final SQLiteDatabase db;
    protected final DaoConfig config;
    protected IdentityScope<K, T> identityScope;
    protected IdentityScopeLong<T> identityScopeLong;
    protected TableStatements statements;
    protected final AbstractDaoSession session;
    protected final int pkOrdinal;

    protected abstract T readEntity(Cursor cursor, int i);

    protected abstract K readKey(Cursor cursor, int i);

    protected abstract void readEntity(Cursor cursor, T t, int i);

    protected abstract void bindValues(SQLiteStatement sQLiteStatement, T t);

    protected abstract K updateKeyAfterInsert(T t, long j);

    protected abstract K getKey(T t);

    protected abstract boolean isEntityUpdateable();

    public AbstractDao(DaoConfig config) {
        this(config, null);
    }

    public AbstractDao(DaoConfig daoConfig, AbstractDaoSession abstractDaoSession) {
        this.config = daoConfig;
        this.session = abstractDaoSession;
        this.db = daoConfig.db;
        this.identityScope = (IdentityScope<K, T>) daoConfig.getIdentityScope();
        if (this.identityScope instanceof IdentityScopeLong) {
            this.identityScopeLong = (IdentityScopeLong) this.identityScope;
        }
        this.statements = daoConfig.statements;
        this.pkOrdinal = daoConfig.pkProperty != null ? daoConfig.pkProperty.ordinal : -1;
    }

    public AbstractDaoSession getSession() {
        return this.session;
    }

    TableStatements getStatements() {
        return this.config.statements;
    }

    public String getTablename() {
        return this.config.tablename;
    }

    public Property[] getProperties() {
        return this.config.properties;
    }

    public Property getPkProperty() {
        return this.config.pkProperty;
    }

    public String[] getAllColumns() {
        return this.config.allColumns;
    }

    public String[] getPkColumns() {
        return this.config.pkColumns;
    }

    public String[] getNonPkColumns() {
        return this.config.nonPkColumns;
    }

    public T load(K key) {
        T entity;
        assertSinglePk();
        if (key == null) {
            return null;
        }
        if (this.identityScope != null && (entity = this.identityScope.get(key)) != null) {
            return entity;
        }
        String sql = this.statements.getSelectByKey();
        String[] keyArray = {key.toString()};
        Cursor cursor = this.db.rawQuery(sql, keyArray);
        return loadUniqueAndCloseCursor(cursor);
    }

    public T loadByRowId(long rowId) {
        String[] idArray = {Long.toString(rowId)};
        Cursor cursor = this.db.rawQuery(this.statements.getSelectByRowId(), idArray);
        return loadUniqueAndCloseCursor(cursor);
    }

    protected T loadUniqueAndCloseCursor(Cursor cursor) {
        try {
            T loadUnique = loadUnique(cursor);
            cursor.close();
            return loadUnique;
        } catch (Throwable th) {
            cursor.close();
            throw th;
        }
    }

    protected T loadUnique(Cursor cursor) {
        boolean available = cursor.moveToFirst();
        if (!available) {
            return null;
        }
        if (!cursor.isLast()) {
            throw new DaoException("Expected unique result, but count was " + cursor.getCount());
        }
        return loadCurrent(cursor, 0, true);
    }

    public List<T> loadAll() {
        Cursor cursor = this.db.rawQuery(this.statements.getSelectAll(), null);
        return loadAllAndCloseCursor(cursor);
    }

    public boolean detach(T entity) {
        if (this.identityScope != null) {
            K key = getKeyVerified(entity);
            return this.identityScope.detach(key, entity);
        }
        return false;
    }

    protected List<T> loadAllAndCloseCursor(Cursor cursor) {
        try {
            List<T> loadAllFromCursor = loadAllFromCursor(cursor);
            cursor.close();
            return loadAllFromCursor;
        } catch (Throwable th) {
            cursor.close();
            throw th;
        }
    }

    public void insertInTx(Iterable<T> entities) {
        insertInTx(entities, isEntityUpdateable());
    }

    public void insertInTx(T... entities) {
        insertInTx(Arrays.asList(entities), isEntityUpdateable());
    }

    public void insertInTx(Iterable<T> entities, boolean setPrimaryKey) {
        SQLiteStatement stmt = this.statements.getInsertStatement();
        executeInsertInTx(stmt, entities, setPrimaryKey);
    }

    public void insertOrReplaceInTx(Iterable<T> entities, boolean setPrimaryKey) {
        SQLiteStatement stmt = this.statements.getInsertOrReplaceStatement();
        executeInsertInTx(stmt, entities, setPrimaryKey);
    }

    public void insertOrReplaceInTx(Iterable<T> entities) {
        insertOrReplaceInTx(entities, isEntityUpdateable());
    }

    public void insertOrReplaceInTx(T... entities) {
        insertOrReplaceInTx(Arrays.asList(entities), isEntityUpdateable());
    }

    /* JADX WARN: Finally extract failed */
    private void executeInsertInTx(SQLiteStatement stmt, Iterable<T> entities, boolean setPrimaryKey) {
        this.db.beginTransaction();
        try {
            synchronized (stmt) {
                if (this.identityScope != null) {
                    this.identityScope.lock();
                }
                try {
                    for (T entity : entities) {
                        bindValues(stmt, entity);
                        if (setPrimaryKey) {
                            long rowId = stmt.executeInsert();
                            updateKeyAfterInsertAndAttach(entity, rowId, false);
                        } else {
                            stmt.execute();
                        }
                    }
                    if (this.identityScope != null) {
                        this.identityScope.unlock();
                    }
                } catch (Throwable th) {
                    if (this.identityScope != null) {
                        this.identityScope.unlock();
                    }
                    throw th;
                }
            }
            this.db.setTransactionSuccessful();
            this.db.endTransaction();
        } catch (Throwable th2) {
            this.db.endTransaction();
            throw th2;
        }
    }

    public long insert(T entity) {
        return executeInsert(entity, this.statements.getInsertStatement());
    }

    public long insertWithoutSettingPk(T entity) {
        long rowId;
        SQLiteStatement stmt = this.statements.getInsertStatement();
        if (this.db.isDbLockedByCurrentThread()) {
            synchronized (stmt) {
                bindValues(stmt, entity);
                rowId = stmt.executeInsert();
            }
        } else {
            this.db.beginTransaction();
            try {
                synchronized (stmt) {
                    bindValues(stmt, entity);
                    rowId = stmt.executeInsert();
                }
                this.db.setTransactionSuccessful();
                this.db.endTransaction();
            } catch (Throwable th) {
                this.db.endTransaction();
                throw th;
            }
        }
        return rowId;
    }

    public long insertOrReplace(T entity) {
        return executeInsert(entity, this.statements.getInsertOrReplaceStatement());
    }

    private long executeInsert(T entity, SQLiteStatement stmt) {
        long rowId;
        if (this.db.isDbLockedByCurrentThread()) {
            synchronized (stmt) {
                bindValues(stmt, entity);
                rowId = stmt.executeInsert();
            }
        } else {
            this.db.beginTransaction();
            try {
                synchronized (stmt) {
                    bindValues(stmt, entity);
                    rowId = stmt.executeInsert();
                }
                this.db.setTransactionSuccessful();
                this.db.endTransaction();
            } catch (Throwable th) {
                this.db.endTransaction();
                throw th;
            }
        }
        updateKeyAfterInsertAndAttach(entity, rowId, true);
        return rowId;
    }

    protected void updateKeyAfterInsertAndAttach(T entity, long rowId, boolean lock) {
        if (rowId != -1) {
            K key = updateKeyAfterInsert(entity, rowId);
            attachEntity(key, entity, lock);
        } else {
            DaoLog.w("Could not insert row (executeInsert returned -1)");
        }
    }

    protected List<T> loadAllFromCursor(Cursor cursor) {
        CursorWindow window;
        int count = cursor.getCount();
        List<T> list = new ArrayList<>(count);
        if ((cursor instanceof CrossProcessCursor) && (window = ((CrossProcessCursor) cursor).getWindow()) != null) {
            if (window.getNumRows() == count) {
                cursor = new FastCursor(window);
            } else {
                DaoLog.d("Window vs. result size: " + window.getNumRows() + "/" + count);
            }
        }
        if (cursor.moveToFirst()) {
            if (this.identityScope != null) {
                this.identityScope.lock();
                this.identityScope.reserveRoom(count);
            }
            do {
                try {
                    list.add(loadCurrent(cursor, 0, false));
                } finally {
                    if (this.identityScope != null) {
                        this.identityScope.unlock();
                    }
                }
            } while (cursor.moveToNext());
        }
        return list;
    }

    protected final T loadCurrent(Cursor cursor, int offset, boolean lock) {
        if (this.identityScopeLong != null) {
            if (offset != 0 && cursor.isNull(this.pkOrdinal + offset)) {
                return null;
            }
            long key = cursor.getLong(this.pkOrdinal + offset);
            T entity = lock ? this.identityScopeLong.get2(key) : this.identityScopeLong.get2NoLock(key);
            if (entity != null) {
                return entity;
            }
            T entity2 = readEntity(cursor, offset);
            attachEntity(entity2);
            if (lock) {
                this.identityScopeLong.put2(key, entity2);
            } else {
                this.identityScopeLong.put2NoLock(key, entity2);
            }
            return entity2;
        }
        if (this.identityScope != null) {
            K key2 = readKey(cursor, offset);
            if (offset != 0 && key2 == null) {
                return null;
            }
            T entity3 = lock ? this.identityScope.get(key2) : this.identityScope.getNoLock(key2);
            if (entity3 != null) {
                return entity3;
            }
            T entity4 = readEntity(cursor, offset);
            attachEntity(key2, entity4, lock);
            return entity4;
        }
        if (offset != 0 && readKey(cursor, offset) == null) {
            return null;
        }
        T entity5 = readEntity(cursor, offset);
        attachEntity(entity5);
        return entity5;
    }

    protected final <O> O loadCurrentOther(AbstractDao<O, ?> dao, Cursor cursor, int offset) {
        return dao.loadCurrent(cursor, offset, true);
    }

    public List<T> queryRaw(String where, String... selectionArg) {
        Cursor cursor = this.db.rawQuery(this.statements.getSelectAll() + where, selectionArg);
        return loadAllAndCloseCursor(cursor);
    }

    public Query<T> queryRawCreate(String where, Object... selectionArg) {
        List<Object> argList = Arrays.asList(selectionArg);
        return queryRawCreateListArgs(where, argList);
    }

    public Query<T> queryRawCreateListArgs(String where, Collection<Object> selectionArg) {
        return Query.internalCreate(this, this.statements.getSelectAll() + where, selectionArg.toArray());
    }

    public void deleteAll() {
        this.db.execSQL("DELETE FROM '" + this.config.tablename + "'");
        if (this.identityScope != null) {
            this.identityScope.clear();
        }
    }

    public void delete(T entity) {
        assertSinglePk();
        K key = getKeyVerified(entity);
        deleteByKey(key);
    }

    public void deleteByKey(K key) {
        assertSinglePk();
        SQLiteStatement stmt = this.statements.getDeleteStatement();
        if (this.db.isDbLockedByCurrentThread()) {
            synchronized (stmt) {
                deleteByKeyInsideSynchronized(key, stmt);
            }
        } else {
            this.db.beginTransaction();
            try {
                synchronized (stmt) {
                    deleteByKeyInsideSynchronized(key, stmt);
                }
                this.db.setTransactionSuccessful();
                this.db.endTransaction();
            } catch (Throwable th) {
                this.db.endTransaction();
                throw th;
            }
        }
        if (this.identityScope != null) {
            this.identityScope.remove((IdentityScope<K, T>) key);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    private void deleteByKeyInsideSynchronized(K k, SQLiteStatement stmt) {
        if (k instanceof Long) {
            stmt.bindLong(1, ((Long) k).longValue());
        } else {
            if (k == 0) {
                throw new DaoException("Cannot delete entity, key is null");
            }
            stmt.bindString(1, k.toString());
        }
        stmt.execute();
    }

    /* JADX WARN: Finally extract failed */
    private void deleteInTxInternal(Iterable<T> entities, Iterable<K> keys) {
        assertSinglePk();
        SQLiteStatement stmt = this.statements.getDeleteStatement();
        List<K> keysToRemoveFromIdentityScope = null;
        this.db.beginTransaction();
        try {
            synchronized (stmt) {
                if (this.identityScope != null) {
                    this.identityScope.lock();
                    keysToRemoveFromIdentityScope = new ArrayList<>();
                }
                if (entities != null) {
                    try {
                        for (T entity : entities) {
                            K key = getKeyVerified(entity);
                            deleteByKeyInsideSynchronized(key, stmt);
                            if (keysToRemoveFromIdentityScope != null) {
                                keysToRemoveFromIdentityScope.add(key);
                            }
                        }
                    } catch (Throwable th) {
                        if (this.identityScope != null) {
                            this.identityScope.unlock();
                        }
                        throw th;
                    }
                }
                if (keys != null) {
                    for (K key2 : keys) {
                        deleteByKeyInsideSynchronized(key2, stmt);
                        if (keysToRemoveFromIdentityScope != null) {
                            keysToRemoveFromIdentityScope.add(key2);
                        }
                    }
                }
                if (this.identityScope != null) {
                    this.identityScope.unlock();
                }
            }
            this.db.setTransactionSuccessful();
            if (keysToRemoveFromIdentityScope != null && this.identityScope != null) {
                this.identityScope.remove((Iterable) keysToRemoveFromIdentityScope);
            }
        } finally {
            this.db.endTransaction();
        }
    }

    public void deleteInTx(Iterable<T> entities) {
        deleteInTxInternal(entities, null);
    }

    public void deleteInTx(T... entities) {
        deleteInTxInternal(Arrays.asList(entities), null);
    }

    public void deleteByKeyInTx(Iterable<K> keys) {
        deleteInTxInternal(null, keys);
    }

    public void deleteByKeyInTx(K... keys) {
        deleteInTxInternal(null, Arrays.asList(keys));
    }

    public void refresh(T entity) {
        assertSinglePk();
        K key = getKeyVerified(entity);
        String sql = this.statements.getSelectByKey();
        String[] keyArray = {key.toString()};
        Cursor cursor = this.db.rawQuery(sql, keyArray);
        try {
            boolean available = cursor.moveToFirst();
            if (!available) {
                throw new DaoException("Entity does not exist in the database anymore: " + entity.getClass() + " with key " + key);
            }
            if (!cursor.isLast()) {
                throw new DaoException("Expected unique result, but count was " + cursor.getCount());
            }
            readEntity(cursor, entity, 0);
            attachEntity(key, entity, true);
            cursor.close();
        } catch (Throwable th) {
            cursor.close();
            throw th;
        }
    }

    public void update(T entity) {
        assertSinglePk();
        SQLiteStatement stmt = this.statements.getUpdateStatement();
        if (this.db.isDbLockedByCurrentThread()) {
            synchronized (stmt) {
                updateInsideSynchronized(entity, stmt, true);
            }
            return;
        }
        this.db.beginTransaction();
        try {
            synchronized (stmt) {
                updateInsideSynchronized(entity, stmt, true);
            }
            this.db.setTransactionSuccessful();
            this.db.endTransaction();
        } catch (Throwable th) {
            this.db.endTransaction();
            throw th;
        }
    }

    public QueryBuilder<T> queryBuilder() {
        return QueryBuilder.internalCreate(this);
    }

    /* JADX WARN: Multi-variable type inference failed */
    protected void updateInsideSynchronized(T entity, SQLiteStatement stmt, boolean lock) {
        bindValues(stmt, entity);
        int index = this.config.allColumns.length + 1;
        Object key = getKey(entity);
        if (key instanceof Long) {
            stmt.bindLong(index, ((Long) key).longValue());
        } else {
            if (key == null) {
                throw new DaoException("Cannot update entity without key - was it inserted before?");
            }
            stmt.bindString(index, key.toString());
        }
        stmt.execute();
        attachEntity(key, entity, lock);
    }

    protected final void attachEntity(K key, T entity, boolean lock) {
        attachEntity(entity);
        if (this.identityScope != null && key != null) {
            if (lock) {
                this.identityScope.put(key, entity);
            } else {
                this.identityScope.putNoLock(key, entity);
            }
        }
    }

    protected void attachEntity(T entity) {
    }

    /* JADX WARN: Finally extract failed */
    public void updateInTx(Iterable<T> entities) {
        SQLiteStatement stmt = this.statements.getUpdateStatement();
        this.db.beginTransaction();
        try {
            synchronized (stmt) {
                if (this.identityScope != null) {
                    this.identityScope.lock();
                }
                try {
                    for (T entity : entities) {
                        updateInsideSynchronized(entity, stmt, false);
                    }
                    if (this.identityScope != null) {
                        this.identityScope.unlock();
                    }
                } catch (Throwable th) {
                    if (this.identityScope != null) {
                        this.identityScope.unlock();
                    }
                    throw th;
                }
            }
            this.db.setTransactionSuccessful();
            try {
                this.db.endTransaction();
            } catch (RuntimeException e) {
                if (0 != 0) {
                    DaoLog.w("Could not end transaction (rethrowing initial exception)", e);
                    throw null;
                }
                throw e;
            }
        } catch (RuntimeException e2) {
            try {
                this.db.endTransaction();
            } catch (RuntimeException e3) {
                if (e2 != null) {
                    DaoLog.w("Could not end transaction (rethrowing initial exception)", e3);
                    throw e2;
                }
                throw e3;
            }
        } catch (Throwable th2) {
            try {
                this.db.endTransaction();
                throw th2;
            } catch (RuntimeException e4) {
                if (0 != 0) {
                    DaoLog.w("Could not end transaction (rethrowing initial exception)", e4);
                    throw null;
                }
                throw e4;
            }
        }
    }

    public void updateInTx(T... entities) {
        updateInTx(Arrays.asList(entities));
    }

    protected void assertSinglePk() {
        if (this.config.pkColumns.length != 1) {
            throw new DaoException(this + " (" + this.config.tablename + ") does not have a single-column primary key");
        }
    }

    public long count() {
        return DatabaseUtils.queryNumEntries(this.db, '\'' + this.config.tablename + '\'');
    }

    protected K getKeyVerified(T entity) {
        K key = getKey(entity);
        if (key == null) {
            if (entity == null) {
                throw new NullPointerException("Entity may not be null");
            }
            throw new DaoException("Entity has no key");
        }
        return key;
    }

    public SQLiteDatabase getDatabase() {
        return this.db;
    }
}
