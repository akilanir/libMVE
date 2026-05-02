package de.greenrobot.dao.test;

import de.greenrobot.dao.AbstractDao;

/* loaded from: greendao-1.3.7.jar:de/greenrobot/dao/test/AbstractDaoTestStringPk.class */
public abstract class AbstractDaoTestStringPk<D extends AbstractDao<T, String>, T> extends AbstractDaoTestSinglePk<D, T, String> {
    public AbstractDaoTestStringPk(Class<D> daoClass) {
        super(daoClass);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* JADX WARN: Can't rename method to resolve collision */
    @Override // de.greenrobot.dao.test.AbstractDaoTestSinglePk
    public String createRandomPk() {
        int len = 1 + this.random.nextInt(30);
        StringBuilder builder = new StringBuilder();
        for (int i = 0; i < len; i++) {
            char c = (char) (97 + this.random.nextInt(25));
            builder.append(c);
        }
        return builder.toString();
    }
}
