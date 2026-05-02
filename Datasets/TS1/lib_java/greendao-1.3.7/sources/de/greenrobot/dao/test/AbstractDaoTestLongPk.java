package de.greenrobot.dao.test;

import de.greenrobot.dao.AbstractDao;
import de.greenrobot.dao.DaoLog;

/* loaded from: greendao-1.3.7.jar:de/greenrobot/dao/test/AbstractDaoTestLongPk.class */
public abstract class AbstractDaoTestLongPk<D extends AbstractDao<T, Long>, T> extends AbstractDaoTestSinglePk<D, T, Long> {
    public AbstractDaoTestLongPk(Class<D> daoClass) {
        super(daoClass);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* JADX WARN: Can't rename method to resolve collision */
    @Override // de.greenrobot.dao.test.AbstractDaoTestSinglePk
    public Long createRandomPk() {
        return Long.valueOf(this.random.nextLong());
    }

    public void testAssignPk() {
        if (this.daoAccess.isEntityUpdateable()) {
            T entity1 = createEntity(null);
            if (entity1 != null) {
                T entity2 = createEntity(null);
                this.dao.insert(entity1);
                this.dao.insert(entity2);
                Long pk1 = (Long) this.daoAccess.getKey(entity1);
                assertNotNull(pk1);
                Long pk2 = (Long) this.daoAccess.getKey(entity2);
                assertNotNull(pk2);
                assertFalse(pk1.equals(pk2));
                assertNotNull(this.dao.load(pk1));
                assertNotNull(this.dao.load(pk2));
                return;
            }
            DaoLog.d("Skipping testAssignPk for " + this.daoClass + " (createEntity returned null for null key)");
            return;
        }
        DaoLog.d("Skipping testAssignPk for not updateable " + this.daoClass);
    }
}
