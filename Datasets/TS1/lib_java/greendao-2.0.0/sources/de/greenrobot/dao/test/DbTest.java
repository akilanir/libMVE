package de.greenrobot.dao.test;

import android.app.Application;
import android.app.Instrumentation;
import android.database.sqlite.SQLiteDatabase;
import android.test.AndroidTestCase;
import de.greenrobot.dao.DbUtils;
import java.util.Random;

/* loaded from: greendao-2.0.0.jar:de/greenrobot/dao/test/DbTest.class */
public abstract class DbTest extends AndroidTestCase {
    public static final String DB_NAME = "greendao-unittest-db.temp";
    protected final Random random;
    protected final boolean inMemory;
    protected SQLiteDatabase db;
    private Application application;

    public DbTest() {
        this(true);
    }

    public DbTest(boolean inMemory) {
        this.inMemory = inMemory;
        this.random = new Random();
    }

    protected void setUp() throws Exception {
        super.setUp();
        this.db = createDatabase();
    }

    public <T extends Application> T createApplication(Class<T> cls) {
        assertNull("Application already created", this.application);
        try {
            T t = (T) Instrumentation.newApplication(cls, getContext());
            t.onCreate();
            this.application = t;
            return t;
        } catch (Exception e) {
            throw new RuntimeException("Could not create application " + cls, e);
        }
    }

    public void terminateApplication() {
        assertNotNull("Application not yet created", this.application);
        this.application.onTerminate();
        this.application = null;
    }

    public <T extends Application> T getApplication() {
        assertNotNull("Application not yet created", this.application);
        return (T) this.application;
    }

    protected SQLiteDatabase createDatabase() {
        if (this.inMemory) {
            return SQLiteDatabase.create(null);
        }
        getContext().deleteDatabase(DB_NAME);
        return getContext().openOrCreateDatabase(DB_NAME, 0, null);
    }

    protected void tearDown() throws Exception {
        if (this.application != null) {
            terminateApplication();
        }
        this.db.close();
        if (!this.inMemory) {
            getContext().deleteDatabase(DB_NAME);
        }
        super.tearDown();
    }

    protected void logTableDump(String tablename) {
        DbUtils.logTableDump(this.db, tablename);
    }
}
