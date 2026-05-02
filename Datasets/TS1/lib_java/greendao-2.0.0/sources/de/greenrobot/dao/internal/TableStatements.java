package de.greenrobot.dao.internal;

import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteStatement;

/* loaded from: greendao-2.0.0.jar:de/greenrobot/dao/internal/TableStatements.class */
public class TableStatements {
    private final SQLiteDatabase db;
    private final String tablename;
    private final String[] allColumns;
    private final String[] pkColumns;
    private SQLiteStatement insertStatement;
    private SQLiteStatement insertOrReplaceStatement;
    private SQLiteStatement updateStatement;
    private SQLiteStatement deleteStatement;
    private volatile String selectAll;
    private volatile String selectByKey;
    private volatile String selectByRowId;
    private volatile String selectKeys;

    public TableStatements(SQLiteDatabase db, String tablename, String[] allColumns, String[] pkColumns) {
        this.db = db;
        this.tablename = tablename;
        this.allColumns = allColumns;
        this.pkColumns = pkColumns;
    }

    public SQLiteStatement getInsertStatement() {
        if (this.insertStatement == null) {
            String sql = SqlUtils.createSqlInsert("INSERT INTO ", this.tablename, this.allColumns);
            this.insertStatement = this.db.compileStatement(sql);
        }
        return this.insertStatement;
    }

    public SQLiteStatement getInsertOrReplaceStatement() {
        if (this.insertOrReplaceStatement == null) {
            String sql = SqlUtils.createSqlInsert("INSERT OR REPLACE INTO ", this.tablename, this.allColumns);
            this.insertOrReplaceStatement = this.db.compileStatement(sql);
        }
        return this.insertOrReplaceStatement;
    }

    public SQLiteStatement getDeleteStatement() {
        if (this.deleteStatement == null) {
            String sql = SqlUtils.createSqlDelete(this.tablename, this.pkColumns);
            this.deleteStatement = this.db.compileStatement(sql);
        }
        return this.deleteStatement;
    }

    public SQLiteStatement getUpdateStatement() {
        if (this.updateStatement == null) {
            String sql = SqlUtils.createSqlUpdate(this.tablename, this.allColumns, this.pkColumns);
            this.updateStatement = this.db.compileStatement(sql);
        }
        return this.updateStatement;
    }

    public String getSelectAll() {
        if (this.selectAll == null) {
            this.selectAll = SqlUtils.createSqlSelect(this.tablename, "T", this.allColumns);
        }
        return this.selectAll;
    }

    public String getSelectKeys() {
        if (this.selectKeys == null) {
            this.selectKeys = SqlUtils.createSqlSelect(this.tablename, "T", this.pkColumns);
        }
        return this.selectKeys;
    }

    public String getSelectByKey() {
        if (this.selectByKey == null) {
            StringBuilder builder = new StringBuilder(getSelectAll());
            builder.append("WHERE ");
            SqlUtils.appendColumnsEqValue(builder, "T", this.pkColumns);
            this.selectByKey = builder.toString();
        }
        return this.selectByKey;
    }

    public String getSelectByRowId() {
        if (this.selectByRowId == null) {
            this.selectByRowId = getSelectAll() + "WHERE ROWID=?";
        }
        return this.selectByRowId;
    }
}
