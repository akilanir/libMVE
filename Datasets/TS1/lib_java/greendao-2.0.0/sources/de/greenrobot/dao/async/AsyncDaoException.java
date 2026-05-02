package de.greenrobot.dao.async;

import de.greenrobot.dao.DaoException;

/* loaded from: greendao-2.0.0.jar:de/greenrobot/dao/async/AsyncDaoException.class */
public class AsyncDaoException extends DaoException {
    private static final long serialVersionUID = 5872157552005102382L;
    private final AsyncOperation failedOperation;

    public AsyncDaoException(AsyncOperation failedOperation, Throwable cause) {
        super(cause);
        this.failedOperation = failedOperation;
    }

    public AsyncOperation getFailedOperation() {
        return this.failedOperation;
    }
}
