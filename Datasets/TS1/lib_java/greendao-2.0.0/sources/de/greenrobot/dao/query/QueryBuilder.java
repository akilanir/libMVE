package de.greenrobot.dao.query;

import de.greenrobot.dao.AbstractDao;
import de.greenrobot.dao.DaoException;
import de.greenrobot.dao.DaoLog;
import de.greenrobot.dao.Property;
import de.greenrobot.dao.internal.SqlUtils;
import java.util.ArrayList;
import java.util.List;

/* loaded from: greendao-2.0.0.jar:de/greenrobot/dao/query/QueryBuilder.class */
public class QueryBuilder<T> {
    public static boolean LOG_SQL;
    public static boolean LOG_VALUES;
    private final WhereCollector<T> whereCollector;
    private StringBuilder orderBuilder;
    private final List<Object> values;
    private final List<Join<T, ?>> joins;
    private final AbstractDao<T, ?> dao;
    private final String tablePrefix;
    private Integer limit;
    private Integer offset;

    public static <T2> QueryBuilder<T2> internalCreate(AbstractDao<T2, ?> dao) {
        return new QueryBuilder<>(dao);
    }

    protected QueryBuilder(AbstractDao<T, ?> dao) {
        this(dao, "T");
    }

    protected QueryBuilder(AbstractDao<T, ?> dao, String tablePrefix) {
        this.dao = dao;
        this.tablePrefix = tablePrefix;
        this.values = new ArrayList();
        this.joins = new ArrayList();
        this.whereCollector = new WhereCollector<>(dao, tablePrefix);
    }

    private void checkOrderBuilder() {
        if (this.orderBuilder == null) {
            this.orderBuilder = new StringBuilder();
        } else if (this.orderBuilder.length() > 0) {
            this.orderBuilder.append(",");
        }
    }

    public QueryBuilder<T> where(WhereCondition cond, WhereCondition... condMore) {
        this.whereCollector.add(cond, condMore);
        return this;
    }

    public QueryBuilder<T> whereOr(WhereCondition cond1, WhereCondition cond2, WhereCondition... condMore) {
        this.whereCollector.add(or(cond1, cond2, condMore), new WhereCondition[0]);
        return this;
    }

    public WhereCondition or(WhereCondition cond1, WhereCondition cond2, WhereCondition... condMore) {
        return this.whereCollector.combineWhereConditions(" OR ", cond1, cond2, condMore);
    }

    public WhereCondition and(WhereCondition cond1, WhereCondition cond2, WhereCondition... condMore) {
        return this.whereCollector.combineWhereConditions(" AND ", cond1, cond2, condMore);
    }

    public <J> Join<T, J> join(Class<J> destinationEntityClass, Property destinationProperty) {
        return join(this.dao.getPkProperty(), destinationEntityClass, destinationProperty);
    }

    public <J> Join<T, J> join(Property sourceProperty, Class<J> destinationEntityClass) {
        AbstractDao<?, ?> dao = this.dao.getSession().getDao(destinationEntityClass);
        Property destinationProperty = dao.getPkProperty();
        return addJoin(this.tablePrefix, sourceProperty, dao, destinationProperty);
    }

    public <J> Join<T, J> join(Property sourceProperty, Class<J> destinationEntityClass, Property destinationProperty) {
        return addJoin(this.tablePrefix, sourceProperty, this.dao.getSession().getDao(destinationEntityClass), destinationProperty);
    }

    public <J> Join<T, J> join(Join<?, T> sourceJoin, Property sourceProperty, Class<J> destinationEntityClass, Property destinationProperty) {
        return addJoin(sourceJoin.tablePrefix, sourceProperty, this.dao.getSession().getDao(destinationEntityClass), destinationProperty);
    }

    private <J> Join<T, J> addJoin(String sourceTablePrefix, Property sourceProperty, AbstractDao<J, ?> destinationDao, Property destinationProperty) {
        String joinTablePrefix = "J" + (this.joins.size() + 1);
        Join<T, J> join = new Join<>(sourceTablePrefix, sourceProperty, destinationDao, destinationProperty, joinTablePrefix);
        this.joins.add(join);
        return join;
    }

    public QueryBuilder<T> orderAsc(Property... properties) {
        orderAscOrDesc(" ASC", properties);
        return this;
    }

    public QueryBuilder<T> orderDesc(Property... properties) {
        orderAscOrDesc(" DESC", properties);
        return this;
    }

    private void orderAscOrDesc(String ascOrDescWithLeadingSpace, Property... properties) {
        for (Property property : properties) {
            checkOrderBuilder();
            append(this.orderBuilder, property);
            if (String.class.equals(property.type)) {
                this.orderBuilder.append(" COLLATE LOCALIZED");
            }
            this.orderBuilder.append(ascOrDescWithLeadingSpace);
        }
    }

    public QueryBuilder<T> orderCustom(Property property, String customOrderForProperty) {
        checkOrderBuilder();
        append(this.orderBuilder, property).append(' ');
        this.orderBuilder.append(customOrderForProperty);
        return this;
    }

    public QueryBuilder<T> orderRaw(String rawOrder) {
        checkOrderBuilder();
        this.orderBuilder.append(rawOrder);
        return this;
    }

    protected StringBuilder append(StringBuilder builder, Property property) {
        this.whereCollector.checkProperty(property);
        builder.append(this.tablePrefix).append('.').append('\'').append(property.columnName).append('\'');
        return builder;
    }

    public QueryBuilder<T> limit(int limit) {
        this.limit = Integer.valueOf(limit);
        return this;
    }

    public QueryBuilder<T> offset(int offset) {
        this.offset = Integer.valueOf(offset);
        return this;
    }

    public Query<T> build() {
        String select = SqlUtils.createSqlSelect(this.dao.getTablename(), this.tablePrefix, this.dao.getAllColumns());
        StringBuilder builder = new StringBuilder(select);
        appendJoinsAndWheres(builder, this.tablePrefix);
        if (this.orderBuilder != null && this.orderBuilder.length() > 0) {
            builder.append(" ORDER BY ").append((CharSequence) this.orderBuilder);
        }
        int limitPosition = -1;
        if (this.limit != null) {
            builder.append(" LIMIT ?");
            this.values.add(this.limit);
            limitPosition = this.values.size() - 1;
        }
        int offsetPosition = -1;
        if (this.offset != null) {
            if (this.limit == null) {
                throw new IllegalStateException("Offset cannot be set without limit");
            }
            builder.append(" OFFSET ?");
            this.values.add(this.offset);
            offsetPosition = this.values.size() - 1;
        }
        String sql = builder.toString();
        checkLog(sql);
        return Query.create(this.dao, sql, this.values.toArray(), limitPosition, offsetPosition);
    }

    public DeleteQuery<T> buildDelete() {
        if (!this.joins.isEmpty()) {
            throw new DaoException("JOINs are not supported for DELETE queries");
        }
        String tablename = this.dao.getTablename();
        String baseSql = SqlUtils.createSqlDelete(tablename, null);
        StringBuilder builder = new StringBuilder(baseSql);
        appendJoinsAndWheres(builder, this.tablePrefix);
        String sql = builder.toString().replace(this.tablePrefix + ".\"", '\"' + tablename + "\".\"");
        checkLog(sql);
        return DeleteQuery.create(this.dao, sql, this.values.toArray());
    }

    public CountQuery<T> buildCount() {
        String tablename = this.dao.getTablename();
        String baseSql = SqlUtils.createSqlSelectCountStar(tablename, this.tablePrefix);
        StringBuilder builder = new StringBuilder(baseSql);
        appendJoinsAndWheres(builder, this.tablePrefix);
        String sql = builder.toString();
        checkLog(sql);
        return CountQuery.create(this.dao, sql, this.values.toArray());
    }

    private void checkLog(String sql) {
        if (LOG_SQL) {
            DaoLog.d("Built SQL for query: " + sql);
        }
        if (LOG_VALUES) {
            DaoLog.d("Values for query: " + this.values);
        }
    }

    private void appendJoinsAndWheres(StringBuilder builder, String tablePrefixOrNull) {
        this.values.clear();
        for (Join<T, ?> join : this.joins) {
            builder.append(" JOIN ").append(join.daoDestination.getTablename()).append(' ');
            builder.append(join.tablePrefix).append(" ON ");
            SqlUtils.appendProperty(builder, join.sourceTablePrefix, join.joinPropertySource).append('=');
            SqlUtils.appendProperty(builder, join.tablePrefix, join.joinPropertyDestination);
        }
        boolean whereAppended = !this.whereCollector.isEmpty();
        if (whereAppended) {
            builder.append(" WHERE ");
            this.whereCollector.appendWhereClause(builder, tablePrefixOrNull, this.values);
        }
        for (Join<T, ?> join2 : this.joins) {
            if (!join2.whereCollector.isEmpty()) {
                if (!whereAppended) {
                    builder.append(" WHERE ");
                    whereAppended = true;
                } else {
                    builder.append(" AND ");
                }
                join2.whereCollector.appendWhereClause(builder, join2.tablePrefix, this.values);
            }
        }
    }

    public List<T> list() {
        return build().list();
    }

    public LazyList<T> listLazy() {
        return build().listLazy();
    }

    public LazyList<T> listLazyUncached() {
        return build().listLazyUncached();
    }

    public CloseableListIterator<T> listIterator() {
        return build().listIterator();
    }

    public T unique() {
        return build().unique();
    }

    public T uniqueOrThrow() {
        return build().uniqueOrThrow();
    }

    public long count() {
        return buildCount().count();
    }
}
