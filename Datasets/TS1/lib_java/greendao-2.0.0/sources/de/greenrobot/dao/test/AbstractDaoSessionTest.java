package de.greenrobot.dao.test;

import android.database.sqlite.SQLiteDatabase;
import de.greenrobot.dao.AbstractDaoMaster;
import de.greenrobot.dao.AbstractDaoSession;

/* loaded from: greendao-2.0.0.jar:de/greenrobot/dao/test/AbstractDaoSessionTest.class */
public abstract class AbstractDaoSessionTest<T extends AbstractDaoMaster, S extends AbstractDaoSession> extends DbTest {
    private final Class<T> daoMasterClass;
    protected T daoMaster;
    protected S daoSession;

    public AbstractDaoSessionTest(Class<T> daoMasterClass) {
        this(daoMasterClass, true);
    }

    public AbstractDaoSessionTest(Class<T> daoMasterClass, boolean inMemory) {
        super(inMemory);
        this.daoMasterClass = daoMasterClass;
    }

    @Override // de.greenrobot.dao.test.DbTest
    protected void setUp() throws Exception {
        super.setUp();
        try {
            this.daoMaster = this.daoMasterClass.getConstructor(SQLiteDatabase.class).newInstance(this.db);
            this.daoMasterClass.getMethod("createAllTables", SQLiteDatabase.class, Boolean.TYPE).invoke(null, this.db, false);
            this.daoSession = (S) this.daoMaster.newSession();
        } catch (Exception e) {
            throw new RuntimeException("Could not prepare DAO session test", e);
        }
    }
}
