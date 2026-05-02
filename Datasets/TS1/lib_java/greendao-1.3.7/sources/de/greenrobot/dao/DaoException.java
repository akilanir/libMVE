package de.greenrobot.dao;

import android.database.SQLException;

/* loaded from: greendao-1.3.7.jar:de/greenrobot/dao/DaoException.class */
public class DaoException extends SQLException {
    private static final long serialVersionUID = -5877937327907457779L;

    public DaoException() {
    }

    public DaoException(String error) {
        super(error);
    }

    public DaoException(String error, Throwable cause) {
        super(error);
        safeInitCause(cause);
    }

    public DaoException(Throwable th) {
        safeInitCause(th);
    }

    protected void safeInitCause(Throwable cause) {
        try {
            initCause(cause);
        } catch (Throwable e) {
            DaoLog.e("Could not set initial cause", e);
            DaoLog.e("Initial cause is:", cause);
        }
    }
}
