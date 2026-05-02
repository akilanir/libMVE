package nl.qbusict.cupboard;

import android.annotation.SuppressLint;
import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import nl.qbusict.cupboard.annotation.Index;
import nl.qbusict.cupboard.convert.EntityConverter;
import nl.qbusict.cupboard.internal.IndexStatement;

@SuppressLint({"DefaultLocale"})
/* loaded from: cupboard-2.1.1.jar:nl/qbusict/cupboard/DatabaseCompartment.class */
public class DatabaseCompartment extends BaseCompartment {
    private static final String QUERY_BY_ID = "_id = ?";
    private final SQLiteDatabase mDatabase;

    protected DatabaseCompartment(Cupboard cupboard, SQLiteDatabase database) {
        super(cupboard);
        this.mDatabase = database;
    }

    public void createTables() {
        for (Class<?> entity : this.mCupboard.getRegisteredEntities()) {
            EntityConverter<?> converter = this.mCupboard.getEntityConverter(entity);
            createNewTable(this.mDatabase, converter.getTable(), converter.getColumns());
        }
    }

    public void upgradeTables() {
        for (Class<?> entity : this.mCupboard.getRegisteredEntities()) {
            EntityConverter<?> converter = this.mCupboard.getEntityConverter(entity);
            updateTable(this.mDatabase, converter.getTable(), converter.getColumns());
        }
    }

    public void dropAllTables() {
        for (Class<?> entity : this.mCupboard.getRegisteredEntities()) {
            EntityConverter<?> converter = this.mCupboard.getEntityConverter(entity);
            this.mDatabase.execSQL("DROP TABLE IF EXISTS " + quoteTable(converter.getTable()));
        }
    }

    public <T> T get(Class<T> entityClass, long id) {
        return query(entityClass).byId(id).get();
    }

    public <T> T get(T t) throws IllegalArgumentException {
        EntityConverter converter = getConverter(t.getClass());
        if (converter.getId(t) != null) {
            return (T) get(t.getClass(), converter.getId(t).longValue());
        }
        throw new IllegalArgumentException("id of entity " + t.getClass() + " is not set");
    }

    public <T> QueryBuilder<T> query(Class<T> entityClass) {
        return new QueryBuilder<>(entityClass, this);
    }

    public void put(Object... entities) {
        boolean mNestedTransaction = this.mDatabase.inTransaction();
        this.mDatabase.beginTransaction();
        try {
            for (Object entity : entities) {
                put((DatabaseCompartment) entity);
                if (!mNestedTransaction) {
                    this.mDatabase.yieldIfContendedSafely();
                }
            }
            this.mDatabase.setTransactionSuccessful();
            this.mDatabase.endTransaction();
        } catch (Throwable th) {
            this.mDatabase.endTransaction();
            throw th;
        }
    }

    public void put(Collection<?> entities) {
        boolean mNestedTransaction = this.mDatabase.inTransaction();
        this.mDatabase.beginTransaction();
        try {
            for (Object entity : entities) {
                put((DatabaseCompartment) entity);
                if (!mNestedTransaction) {
                    this.mDatabase.yieldIfContendedSafely();
                }
            }
            this.mDatabase.setTransactionSuccessful();
            this.mDatabase.endTransaction();
        } catch (Throwable th) {
            this.mDatabase.endTransaction();
            throw th;
        }
    }

    public <T> long put(T entity) {
        EntityConverter<T> converter = getConverter(entity.getClass());
        ContentValues values = new ContentValues();
        converter.toValues(entity, values);
        Long id = values.getAsLong("_id");
        long insertedId = put(entity.getClass(), values);
        if (id == null) {
            converter.setId(Long.valueOf(insertedId), entity);
        }
        return id == null ? insertedId : id.longValue();
    }

    public long put(Class<?> entityClass, ContentValues values) {
        EntityConverter<?> converter = getConverter(entityClass);
        Long id = values.getAsLong("_id");
        if (id != null) {
            this.mDatabase.replaceOrThrow(quoteTable(converter.getTable()), "_id", values);
            return id.longValue();
        }
        return Long.valueOf(this.mDatabase.insertOrThrow(quoteTable(converter.getTable()), "_id", values)).longValue();
    }

    public int update(Class<?> entityClass, ContentValues values) {
        EntityConverter<?> converter = getConverter(entityClass);
        return values.containsKey("_id") ? this.mDatabase.update(quoteTable(converter.getTable()), values, QUERY_BY_ID, new String[]{values.getAsString("_id")}) : this.mDatabase.update(quoteTable(converter.getTable()), values, null, null);
    }

    public int update(Class<?> entityClass, ContentValues values, String selection, String... selectionArgs) {
        EntityConverter<?> converter = getConverter(entityClass);
        return this.mDatabase.update(quoteTable(converter.getTable()), values, selection, selectionArgs);
    }

    public <T> boolean delete(T entity) {
        Class<?> cls = entity.getClass();
        EntityConverter<T> converter = getConverter(cls);
        Long id = converter.getId(entity);
        return id != null && delete(cls, QUERY_BY_ID, String.valueOf(id)) > 0;
    }

    public boolean delete(Class<?> entityClass, long id) {
        EntityConverter<?> converter = getConverter(entityClass);
        return this.mDatabase.delete(quoteTable(converter.getTable()), QUERY_BY_ID, new String[]{String.valueOf(id)}) > 0;
    }

    public int delete(Class<?> entityClass, String selection, String... selectionArgs) {
        EntityConverter<?> converter = getConverter(entityClass);
        return this.mDatabase.delete(quoteTable(converter.getTable()), selection, selectionArgs);
    }

    boolean updateTable(SQLiteDatabase db, String table, List<EntityConverter.Column> cols) {
        Cursor cursor = db.rawQuery("pragma table_info('" + table + "')", null);
        try {
            if (cursor.getCount() == 0) {
                boolean createNewTable = createNewTable(db, table, cols);
                cursor.close();
                return createNewTable;
            }
            boolean updateTable = updateTable(db, table, cursor, cols);
            cursor.close();
            return updateTable;
        } catch (Throwable th) {
            cursor.close();
            throw th;
        }
    }

    boolean updateTable(SQLiteDatabase db, String table, Cursor tableInfo, List<EntityConverter.Column> cols) {
        Locale locale = Locale.US;
        Map<String, EntityConverter.Column> columns = new HashMap<>(cols.size());
        for (EntityConverter.Column col : cols) {
            if (col.type != EntityConverter.ColumnType.JOIN) {
                columns.put(col.name.toLowerCase(locale), col);
            }
        }
        int index = tableInfo.getColumnIndex("name");
        while (tableInfo.moveToNext()) {
            columns.remove(tableInfo.getString(index).toLowerCase(locale));
        }
        boolean updated = false;
        if (!columns.isEmpty()) {
            updated = true;
            for (EntityConverter.Column column : columns.values()) {
                db.execSQL("alter table '" + table + "' add column '" + column.name + "' " + column.type.toString());
            }
        }
        return updated | diffAndUpdateIndexes(db, table, cols);
    }

    private boolean diffAndUpdateIndexes(SQLiteDatabase db, String table, List<EntityConverter.Column> cols) {
        Index index;
        boolean updated = false;
        Cursor indexesInDbCursor = db.rawQuery("select name, sql from sqlite_master where type = 'index' and tbl_name = '" + table + '\'', null);
        Map<String, String> indexesInDb = new HashMap<>();
        while (indexesInDbCursor.moveToNext()) {
            indexesInDb.put(indexesInDbCursor.getString(0), indexesInDbCursor.getString(1));
        }
        indexesInDbCursor.close();
        IndexStatement.Builder builder = new IndexStatement.Builder();
        for (EntityConverter.Column col : cols) {
            if (col.type != EntityConverter.ColumnType.JOIN && (index = col.index) != null) {
                builder.addIndexedColumn(table, col.name, index);
            }
        }
        Map<String, IndexStatement> indexesOfEntity = builder.buildAsMap();
        Collection<?> oldSet = indexesInDb.keySet();
        Collection<?> newSet = indexesOfEntity.keySet();
        Set<String> toRemove = new HashSet<>((Collection<? extends String>) oldSet);
        toRemove.removeAll(newSet);
        Iterator i$ = toRemove.iterator();
        while (i$.hasNext()) {
            db.execSQL("drop index if exists " + i$.next());
            updated |= true;
        }
        Set<String> toAdd = new HashSet<>((Collection<? extends String>) newSet);
        toAdd.removeAll(oldSet);
        Iterator i$2 = toAdd.iterator();
        while (i$2.hasNext()) {
            db.execSQL(indexesOfEntity.get(i$2.next()).getCreationSql(table));
            updated |= true;
        }
        Set<String> toPossiblyKeep = new HashSet<>((Collection<? extends String>) newSet);
        toPossiblyKeep.retainAll(oldSet);
        for (String name : toPossiblyKeep) {
            String oldSql = indexesInDb.get(name);
            String newSql = indexesOfEntity.get(name).getCreationSql(table, false);
            if (!oldSql.equalsIgnoreCase(newSql)) {
                db.execSQL("drop index if exists " + name);
                db.execSQL(newSql);
                updated |= true;
            }
        }
        return updated;
    }

    boolean createNewTable(SQLiteDatabase db, String table, List<EntityConverter.Column> cols) {
        StringBuilder sql = new StringBuilder("create table '").append(table).append("' (_id integer primary key autoincrement");
        IndexStatement.Builder builder = new IndexStatement.Builder();
        for (EntityConverter.Column col : cols) {
            if (col.type != EntityConverter.ColumnType.JOIN) {
                String name = col.name;
                if (!name.equals("_id")) {
                    sql.append(", '").append(name).append("'");
                    sql.append(" ").append(col.type.toString());
                }
                Index index = col.index;
                if (index != null) {
                    builder.addIndexedColumn(table, name, index);
                }
            }
        }
        sql.append(");");
        db.execSQL(sql.toString());
        for (IndexStatement stmt : builder.build()) {
            db.execSQL(stmt.getCreationSql(table));
        }
        return true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public <T> QueryResultIterable<T> query(Class<T> entityClass, String[] projection, String selection, String[] selectionArgs, String groupBy, String having, String orderBy, String limit, boolean distinct) {
        EntityConverter<T> translator = getConverter(entityClass);
        Cursor cursor = this.mDatabase.query(distinct, quoteTable(translator.getTable()), projection, selection, selectionArgs, groupBy, having, orderBy, limit);
        return new QueryResultIterable<>(cursor, translator);
    }

    private String quoteTable(String table) {
        return "'" + table + "'";
    }

    /* loaded from: cupboard-2.1.1.jar:nl/qbusict/cupboard/DatabaseCompartment$QueryBuilder.class */
    public static class QueryBuilder<T> {
        private final Class<T> mEntityClass;
        private final DatabaseCompartment mCompartment;
        private String mSelection;
        private String[] mSelectionArgs;
        private String mOrder;
        private String mGroup;
        private String mHaving;
        private String[] mProjection;
        private String mLimit = null;
        private boolean mDistinct = false;

        QueryBuilder(Class<T> entityClass, DatabaseCompartment compartment) {
            this.mEntityClass = entityClass;
            this.mCompartment = compartment;
        }

        public QueryBuilder<T> withSelection(String selection, String... args) {
            this.mSelection = selection;
            this.mSelectionArgs = args;
            return this;
        }

        public QueryBuilder<T> orderBy(String order) {
            this.mOrder = order;
            return this;
        }

        public QueryBuilder<T> groupBy(String group) {
            this.mGroup = group;
            return this;
        }

        public QueryBuilder<T> having(String having) {
            this.mHaving = having;
            return this;
        }

        public QueryBuilder<T> withProjection(String... projection) {
            this.mProjection = projection;
            return this;
        }

        public QueryBuilder<T> byId(long id) {
            this.mSelection = DatabaseCompartment.QUERY_BY_ID;
            this.mSelectionArgs = new String[]{String.valueOf(id)};
            limit(1);
            return this;
        }

        public QueryBuilder<T> limit(int limit) {
            if (limit < 1) {
                throw new IllegalArgumentException("Limit must be greater or equal to 1");
            }
            this.mLimit = String.valueOf(limit);
            return this;
        }

        public QueryBuilder<T> distinct() {
            this.mDistinct = true;
            return this;
        }

        public QueryResultIterable<T> query() {
            return this.mCompartment.query(this.mEntityClass, this.mProjection, this.mSelection, this.mSelectionArgs, this.mGroup, this.mHaving, this.mOrder, this.mLimit, this.mDistinct);
        }

        public Cursor getCursor() {
            return query().getCursor();
        }

        public T get() {
            return query().get();
        }

        public List<T> list() {
            return query().list();
        }
    }
}
