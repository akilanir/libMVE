package de.greenrobot.dao.test;

import android.database.sqlite.SQLiteDatabase;
import de.greenrobot.dao.AbstractDao;
import de.greenrobot.dao.DaoLog;
import de.greenrobot.dao.InternalUnitTestDaoAccess;
import de.greenrobot.dao.Property;
import de.greenrobot.dao.identityscope.IdentityScope;
import java.lang.reflect.Method;

/* loaded from: greendao-2.0.0.jar:de/greenrobot/dao/test/AbstractDaoTest.class */
public abstract class AbstractDaoTest<D extends AbstractDao<T, K>, T, K> extends DbTest {
    protected final Class<D> daoClass;
    protected D dao;
    protected InternalUnitTestDaoAccess<T, K> daoAccess;
    protected Property pkColumn;
    protected IdentityScope<K, T> identityScopeForDao;

    public AbstractDaoTest(Class<D> daoClass) {
        this(daoClass, true);
    }

    public AbstractDaoTest(Class<D> daoClass, boolean inMemory) {
        super(inMemory);
        this.daoClass = daoClass;
    }

    public void setIdentityScopeBeforeSetUp(IdentityScope<K, T> identityScope) {
        this.identityScopeForDao = identityScope;
    }

    @Override // de.greenrobot.dao.test.DbTest
    protected void setUp() throws Exception {
        super.setUp();
        try {
            setUpTableForDao();
            this.daoAccess = new InternalUnitTestDaoAccess<>(this.db, this.daoClass, this.identityScopeForDao);
            this.dao = this.daoAccess.getDao();
        } catch (Exception e) {
            throw new RuntimeException("Could not prepare DAO Test", e);
        }
    }

    protected void setUpTableForDao() throws Exception {
        try {
            Method createTableMethod = this.daoClass.getMethod("createTable", SQLiteDatabase.class, Boolean.TYPE);
            createTableMethod.invoke(null, this.db, false);
        } catch (NoSuchMethodException e) {
            DaoLog.i("No createTable method");
        }
    }

    protected void clearIdentityScopeIfAny() {
        if (this.identityScopeForDao != null) {
            this.identityScopeForDao.clear();
            DaoLog.d("Identity scope cleared");
        } else {
            DaoLog.d("No identity scope to clear");
        }
    }

    protected void logTableDump() {
        logTableDump(this.dao.getTablename());
    }
}
