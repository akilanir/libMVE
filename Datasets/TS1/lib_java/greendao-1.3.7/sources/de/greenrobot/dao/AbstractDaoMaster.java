package de.greenrobot.dao;

import android.database.sqlite.SQLiteDatabase;
import de.greenrobot.dao.identityscope.IdentityScopeType;
import de.greenrobot.dao.internal.DaoConfig;
import java.util.HashMap;
import java.util.Map;

/* loaded from: greendao-1.3.7.jar:de/greenrobot/dao/AbstractDaoMaster.class */
public abstract class AbstractDaoMaster {
    protected final SQLiteDatabase db;
    protected final int schemaVersion;
    protected final Map<Class<? extends AbstractDao<?, ?>>, DaoConfig> daoConfigMap = new HashMap();

    public abstract AbstractDaoSession newSession();

    public abstract AbstractDaoSession newSession(IdentityScopeType identityScopeType);

    public AbstractDaoMaster(SQLiteDatabase db, int schemaVersion) {
        this.db = db;
        this.schemaVersion = schemaVersion;
    }

    protected void registerDaoClass(Class<? extends AbstractDao<?, ?>> daoClass) {
        DaoConfig daoConfig = new DaoConfig(this.db, daoClass);
        this.daoConfigMap.put(daoClass, daoConfig);
    }

    public int getSchemaVersion() {
        return this.schemaVersion;
    }

    public SQLiteDatabase getDatabase() {
        return this.db;
    }
}
