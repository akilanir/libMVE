.class public Lch/qos/logback/classic/db/SQLBuilder;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static buildCreateExceptionTableSQL(Lch/qos/logback/classic/db/names/DBNameResolver;)Ljava/lang/String;
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "CREATE TABLE IF NOT EXISTS "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lch/qos/logback/classic/db/names/TableName;->LOGGING_EVENT_EXCEPTION:Lch/qos/logback/classic/db/names/TableName;

    invoke-interface {p0, v1}, Lch/qos/logback/classic/db/names/DBNameResolver;->getTableName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->EVENT_ID:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " BIGINT NOT NULL, "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->I:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " SMALLINT NOT NULL, "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->TRACE_LINE:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " VARCHAR(254) NOT NULL, "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "PRIMARY KEY ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->EVENT_ID:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->I:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "), "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "FOREIGN KEY ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->EVENT_ID:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "REFERENCES "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/TableName;->LOGGING_EVENT:Lch/qos/logback/classic/db/names/TableName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getTableName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->EVENT_ID:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static buildCreateLoggingEventTableSQL(Lch/qos/logback/classic/db/names/DBNameResolver;)Ljava/lang/String;
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "CREATE TABLE IF NOT EXISTS "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lch/qos/logback/classic/db/names/TableName;->LOGGING_EVENT:Lch/qos/logback/classic/db/names/TableName;

    invoke-interface {p0, v1}, Lch/qos/logback/classic/db/names/DBNameResolver;->getTableName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->TIMESTMP:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " BIGINT NOT NULL, "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->FORMATTED_MESSAGE:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " TEXT NOT NULL, "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->LOGGER_NAME:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " VARCHAR(254) NOT NULL, "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->LEVEL_STRING:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " VARCHAR(254) NOT NULL, "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->THREAD_NAME:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " VARCHAR(254), "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->REFERENCE_FLAG:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " SMALLINT, "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->ARG0:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " VARCHAR(254), "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->ARG1:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " VARCHAR(254), "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->ARG2:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " VARCHAR(254), "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->ARG3:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " VARCHAR(254), "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->CALLER_FILENAME:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " VARCHAR(254), "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->CALLER_CLASS:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " VARCHAR(254), "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->CALLER_METHOD:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " VARCHAR(254), "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->CALLER_LINE:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " CHAR(4), "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->EVENT_ID:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static buildCreatePropertyTableSQL(Lch/qos/logback/classic/db/names/DBNameResolver;)Ljava/lang/String;
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "CREATE TABLE IF NOT EXISTS "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lch/qos/logback/classic/db/names/TableName;->LOGGING_EVENT_PROPERTY:Lch/qos/logback/classic/db/names/TableName;

    invoke-interface {p0, v1}, Lch/qos/logback/classic/db/names/DBNameResolver;->getTableName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->EVENT_ID:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " BIGINT NOT NULL, "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->MAPPED_KEY:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " VARCHAR(254) NOT NULL, "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->MAPPED_VALUE:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " VARCHAR(254) NOT NULL, "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "PRIMARY KEY ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->EVENT_ID:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->MAPPED_KEY:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "), "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "FOREIGN KEY ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->EVENT_ID:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "REFERENCES "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/TableName;->LOGGING_EVENT:Lch/qos/logback/classic/db/names/TableName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getTableName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->EVENT_ID:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static buildInsertExceptionSQL(Lch/qos/logback/classic/db/names/DBNameResolver;)Ljava/lang/String;
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "INSERT INTO "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lch/qos/logback/classic/db/names/TableName;->LOGGING_EVENT_EXCEPTION:Lch/qos/logback/classic/db/names/TableName;

    invoke-interface {p0, v1}, Lch/qos/logback/classic/db/names/DBNameResolver;->getTableName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->EVENT_ID:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->I:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->TRACE_LINE:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "VALUES (?, ?, ?)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static buildInsertPropertiesSQL(Lch/qos/logback/classic/db/names/DBNameResolver;)Ljava/lang/String;
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "INSERT INTO "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lch/qos/logback/classic/db/names/TableName;->LOGGING_EVENT_PROPERTY:Lch/qos/logback/classic/db/names/TableName;

    invoke-interface {p0, v1}, Lch/qos/logback/classic/db/names/DBNameResolver;->getTableName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lch/qos/logback/classic/db/names/ColumnName;->EVENT_ID:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v1}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lch/qos/logback/classic/db/names/ColumnName;->MAPPED_KEY:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v1}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lch/qos/logback/classic/db/names/ColumnName;->MAPPED_VALUE:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v1}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "VALUES (?, ?, ?)"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static buildInsertSQL(Lch/qos/logback/classic/db/names/DBNameResolver;)Ljava/lang/String;
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "INSERT INTO "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lch/qos/logback/classic/db/names/TableName;->LOGGING_EVENT:Lch/qos/logback/classic/db/names/TableName;

    invoke-interface {p0, v1}, Lch/qos/logback/classic/db/names/DBNameResolver;->getTableName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->TIMESTMP:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->FORMATTED_MESSAGE:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->LOGGER_NAME:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->LEVEL_STRING:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->THREAD_NAME:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->REFERENCE_FLAG:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->ARG0:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->ARG1:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->ARG2:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->ARG3:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->CALLER_FILENAME:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->CALLER_CLASS:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->CALLER_METHOD:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->CALLER_LINE:Lch/qos/logback/classic/db/names/ColumnName;

    invoke-interface {p0, v2}, Lch/qos/logback/classic/db/names/DBNameResolver;->getColumnName(Ljava/lang/Enum;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "VALUES (?, ?, ? ,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
