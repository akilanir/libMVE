package ch.qos.logback.classic.android;

import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteStatement;
import ch.qos.logback.classic.db.SQLBuilder;
import ch.qos.logback.classic.db.names.DBNameResolver;
import ch.qos.logback.classic.db.names.DefaultDBNameResolver;
import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.classic.spi.IThrowableProxy;
import ch.qos.logback.classic.spi.StackTraceElementProxy;
import ch.qos.logback.classic.spi.ThrowableProxyUtil;
import ch.qos.logback.core.UnsynchronizedAppenderBase;
import ch.qos.logback.core.android.CommonPathUtil;
import java.io.File;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/android/SQLiteAppender.class */
public class SQLiteAppender extends UnsynchronizedAppenderBase<ILoggingEvent> {
    private SQLiteDatabase db;
    private String insertPropertiesSQL;
    private String insertExceptionSQL;
    private String insertSQL;
    private DBNameResolver dbNameResolver;
    private static final int TIMESTMP_INDEX = 1;
    private static final int FORMATTED_MESSAGE_INDEX = 2;
    private static final int LOGGER_NAME_INDEX = 3;
    private static final int LEVEL_STRING_INDEX = 4;
    private static final int THREAD_NAME_INDEX = 5;
    private static final int REFERENCE_FLAG_INDEX = 6;
    private static final int ARG0_INDEX = 7;
    private static final int CALLER_FILENAME_INDEX = 11;
    private static final int CALLER_CLASS_INDEX = 12;
    private static final int CALLER_METHOD_INDEX = 13;
    private static final int CALLER_LINE_INDEX = 14;
    private static final short PROPERTIES_EXIST = 1;
    private static final short EXCEPTION_EXISTS = 2;

    public void setDbNameResolver(DBNameResolver dBNameResolver) {
        this.dbNameResolver = dBNameResolver;
    }

    public void start() {
        this.started = false;
        String str = null;
        if (getContext() != null) {
            str = getContext().getProperty("PACKAGE_NAME");
        }
        if (str == null || str.length() == 0) {
            addError("Cannot create database without package name");
            return;
        }
        boolean z = false;
        try {
            File file = new File(CommonPathUtil.getDatabaseDirectoryPath(str), "logback.db");
            file.getParentFile().mkdirs();
            this.db = SQLiteDatabase.openOrCreateDatabase(file.getPath(), (SQLiteDatabase.CursorFactory) null);
            z = true;
        } catch (SQLiteException e) {
            addError("Cannot open database", e);
        }
        if (z) {
            if (this.dbNameResolver == null) {
                this.dbNameResolver = new DefaultDBNameResolver();
            }
            this.insertExceptionSQL = SQLBuilder.buildInsertExceptionSQL(this.dbNameResolver);
            this.insertPropertiesSQL = SQLBuilder.buildInsertPropertiesSQL(this.dbNameResolver);
            this.insertSQL = SQLBuilder.buildInsertSQL(this.dbNameResolver);
            try {
                this.db.execSQL(SQLBuilder.buildCreateLoggingEventTableSQL(this.dbNameResolver));
                this.db.execSQL(SQLBuilder.buildCreatePropertyTableSQL(this.dbNameResolver));
                this.db.execSQL(SQLBuilder.buildCreateExceptionTableSQL(this.dbNameResolver));
                super.start();
                this.started = true;
            } catch (SQLiteException e2) {
                addError("Cannot create database tables", e2);
            }
        }
    }

    protected void finalize() throws Throwable {
        this.db.close();
    }

    public void stop() {
        this.db.close();
    }

    /* JADX WARN: Finally extract failed */
    public void append(ILoggingEvent iLoggingEvent) {
        if (isStarted()) {
            try {
                SQLiteStatement compileStatement = this.db.compileStatement(this.insertSQL);
                try {
                    this.db.beginTransaction();
                    long subAppend = subAppend(iLoggingEvent, compileStatement);
                    if (subAppend != -1) {
                        secondarySubAppend(iLoggingEvent, subAppend);
                        this.db.setTransactionSuccessful();
                    }
                    if (this.db.inTransaction()) {
                        this.db.endTransaction();
                    }
                    compileStatement.close();
                } catch (Throwable th) {
                    if (this.db.inTransaction()) {
                        this.db.endTransaction();
                    }
                    compileStatement.close();
                    throw th;
                }
            } catch (Throwable th2) {
                addError("Cannot append event", th2);
            }
        }
    }

    private long subAppend(ILoggingEvent iLoggingEvent, SQLiteStatement sQLiteStatement) throws SQLException {
        bindLoggingEvent(sQLiteStatement, iLoggingEvent);
        bindLoggingEventArguments(sQLiteStatement, iLoggingEvent.getArgumentArray());
        bindCallerData(sQLiteStatement, iLoggingEvent.getCallerData());
        long j = -1;
        try {
            j = sQLiteStatement.executeInsert();
        } catch (SQLiteException e) {
            addWarn("Failed to insert loggingEvent", e);
        }
        return j;
    }

    private void secondarySubAppend(ILoggingEvent iLoggingEvent, long j) throws SQLException {
        insertProperties(mergePropertyMaps(iLoggingEvent), j);
        if (iLoggingEvent.getThrowableProxy() != null) {
            insertThrowable(iLoggingEvent.getThrowableProxy(), j);
        }
    }

    private void bindLoggingEvent(SQLiteStatement sQLiteStatement, ILoggingEvent iLoggingEvent) throws SQLException {
        sQLiteStatement.bindLong(1, iLoggingEvent.getTimeStamp());
        sQLiteStatement.bindString(2, iLoggingEvent.getFormattedMessage());
        sQLiteStatement.bindString(LOGGER_NAME_INDEX, iLoggingEvent.getLoggerName());
        sQLiteStatement.bindString(LEVEL_STRING_INDEX, iLoggingEvent.getLevel().toString());
        sQLiteStatement.bindString(5, iLoggingEvent.getThreadName());
        sQLiteStatement.bindLong(REFERENCE_FLAG_INDEX, computeReferenceMask(iLoggingEvent));
    }

    private void bindLoggingEventArguments(SQLiteStatement sQLiteStatement, Object[] objArr) throws SQLException {
        int length = objArr != null ? objArr.length : 0;
        for (int i = 0; i < length && i < LEVEL_STRING_INDEX; i++) {
            sQLiteStatement.bindString(ARG0_INDEX + i, asStringTruncatedTo254(objArr[i]));
        }
    }

    private String asStringTruncatedTo254(Object obj) {
        String str = null;
        if (obj != null) {
            str = obj.toString();
        }
        if (str != null && str.length() > 254) {
            str = str.substring(0, 254);
        }
        return str == null ? "" : str;
    }

    private static short computeReferenceMask(ILoggingEvent iLoggingEvent) {
        short s = 0;
        int i = 0;
        if (iLoggingEvent.getMDCPropertyMap() != null) {
            i = iLoggingEvent.getMDCPropertyMap().keySet().size();
        }
        int i2 = 0;
        if (iLoggingEvent.getLoggerContextVO().getPropertyMap() != null) {
            i2 = iLoggingEvent.getLoggerContextVO().getPropertyMap().size();
        }
        if (i > 0 || i2 > 0) {
            s = 1;
        }
        if (iLoggingEvent.getThrowableProxy() != null) {
            s = (short) (s | 2);
        }
        return s;
    }

    private Map<String, String> mergePropertyMaps(ILoggingEvent iLoggingEvent) {
        HashMap hashMap = new HashMap();
        Map<String, String> propertyMap = iLoggingEvent.getLoggerContextVO().getPropertyMap();
        if (propertyMap != null) {
            hashMap.putAll(propertyMap);
        }
        Map<String, String> mDCPropertyMap = iLoggingEvent.getMDCPropertyMap();
        if (mDCPropertyMap != null) {
            hashMap.putAll(mDCPropertyMap);
        }
        return hashMap;
    }

    private void insertProperties(Map<String, String> map, long j) throws SQLException {
        if (map.size() > 0) {
            SQLiteStatement compileStatement = this.db.compileStatement(this.insertPropertiesSQL);
            try {
                for (Map.Entry<String, String> entry : map.entrySet()) {
                    compileStatement.bindLong(1, j);
                    compileStatement.bindString(2, entry.getKey());
                    compileStatement.bindString(LOGGER_NAME_INDEX, entry.getValue());
                    compileStatement.executeInsert();
                }
            } finally {
                compileStatement.close();
            }
        }
    }

    private void bindCallerData(SQLiteStatement sQLiteStatement, StackTraceElement[] stackTraceElementArr) throws SQLException {
        StackTraceElement stackTraceElement;
        if (stackTraceElementArr == null || stackTraceElementArr.length <= 0 || (stackTraceElement = stackTraceElementArr[0]) == null) {
            return;
        }
        sQLiteStatement.bindString(CALLER_FILENAME_INDEX, stackTraceElement.getFileName());
        sQLiteStatement.bindString(CALLER_CLASS_INDEX, stackTraceElement.getClassName());
        sQLiteStatement.bindString(CALLER_METHOD_INDEX, stackTraceElement.getMethodName());
        sQLiteStatement.bindString(CALLER_LINE_INDEX, Integer.toString(stackTraceElement.getLineNumber()));
    }

    private void insertException(SQLiteStatement sQLiteStatement, String str, short s, long j) throws SQLException {
        sQLiteStatement.bindLong(1, j);
        sQLiteStatement.bindLong(2, s);
        sQLiteStatement.bindString(LOGGER_NAME_INDEX, str);
        sQLiteStatement.executeInsert();
    }

    private void insertThrowable(IThrowableProxy iThrowableProxy, long j) throws SQLException {
        SQLiteStatement compileStatement = this.db.compileStatement(this.insertExceptionSQL);
        short s = 0;
        while (iThrowableProxy != null) {
            try {
                StringBuilder sb = new StringBuilder();
                ThrowableProxyUtil.subjoinFirstLine(sb, iThrowableProxy);
                short s2 = s;
                s = (short) (s + 1);
                insertException(compileStatement, sb.toString(), s2, j);
                int commonFrames = iThrowableProxy.getCommonFrames();
                StackTraceElementProxy[] stackTraceElementProxyArray = iThrowableProxy.getStackTraceElementProxyArray();
                for (int i = 0; i < stackTraceElementProxyArray.length - commonFrames; i++) {
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append('\t');
                    ThrowableProxyUtil.subjoinSTEP(sb2, stackTraceElementProxyArray[i]);
                    short s3 = s;
                    s = (short) (s + 1);
                    insertException(compileStatement, sb2.toString(), s3, j);
                }
                if (commonFrames > 0) {
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append('\t').append("... ").append(commonFrames).append(" common frames omitted");
                    short s4 = s;
                    s = (short) (s + 1);
                    insertException(compileStatement, sb3.toString(), s4, j);
                }
                iThrowableProxy = iThrowableProxy.getCause();
            } finally {
                compileStatement.close();
            }
        }
    }
}
