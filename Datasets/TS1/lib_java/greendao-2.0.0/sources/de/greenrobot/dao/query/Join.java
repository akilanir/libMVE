package de.greenrobot.dao.query;

import de.greenrobot.dao.AbstractDao;
import de.greenrobot.dao.Property;

/* loaded from: greendao-2.0.0.jar:de/greenrobot/dao/query/Join.class */
public class Join<SRC, DST> {
    final String sourceTablePrefix;
    final AbstractDao<DST, ?> daoDestination;
    final Property joinPropertySource;
    final Property joinPropertyDestination;
    final String tablePrefix;
    final WhereCollector<DST> whereCollector;

    public Join(String sourceTablePrefix, Property sourceJoinProperty, AbstractDao<DST, ?> daoDestination, Property destinationJoinProperty, String joinTablePrefix) {
        this.sourceTablePrefix = sourceTablePrefix;
        this.joinPropertySource = sourceJoinProperty;
        this.daoDestination = daoDestination;
        this.joinPropertyDestination = destinationJoinProperty;
        this.tablePrefix = joinTablePrefix;
        this.whereCollector = new WhereCollector<>(daoDestination, joinTablePrefix);
    }

    public Join<SRC, DST> where(WhereCondition cond, WhereCondition... condMore) {
        this.whereCollector.add(cond, condMore);
        return this;
    }

    public Join<SRC, DST> whereOr(WhereCondition cond1, WhereCondition cond2, WhereCondition... condMore) {
        this.whereCollector.add(or(cond1, cond2, condMore), new WhereCondition[0]);
        return this;
    }

    public WhereCondition or(WhereCondition cond1, WhereCondition cond2, WhereCondition... condMore) {
        return this.whereCollector.combineWhereConditions(" OR ", cond1, cond2, condMore);
    }

    public WhereCondition and(WhereCondition cond1, WhereCondition cond2, WhereCondition... condMore) {
        return this.whereCollector.combineWhereConditions(" AND ", cond1, cond2, condMore);
    }
}
