package ch.qos.logback.classic.db.names;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/db/names/SimpleDBNameResolver.class */
public class SimpleDBNameResolver implements DBNameResolver {
    private String tableNamePrefix = "";
    private String tableNameSuffix = "";
    private String columnNamePrefix = "";
    private String columnNameSuffix = "";

    @Override // ch.qos.logback.classic.db.names.DBNameResolver
    public <N extends Enum<?>> String getTableName(N n) {
        return this.tableNamePrefix + n.name().toLowerCase() + this.tableNameSuffix;
    }

    @Override // ch.qos.logback.classic.db.names.DBNameResolver
    public <N extends Enum<?>> String getColumnName(N n) {
        return this.columnNamePrefix + n.name().toLowerCase() + this.columnNameSuffix;
    }

    public void setTableNamePrefix(String str) {
        this.tableNamePrefix = str != null ? str : "";
    }

    public void setTableNameSuffix(String str) {
        this.tableNameSuffix = str != null ? str : "";
    }

    public void setColumnNamePrefix(String str) {
        this.columnNamePrefix = str != null ? str : "";
    }

    public void setColumnNameSuffix(String str) {
        this.columnNameSuffix = str != null ? str : "";
    }
}
