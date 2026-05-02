.class public Lch/qos/logback/classic/db/names/SimpleDBNameResolver;
.super Ljava/lang/Object;

# interfaces
.implements Lch/qos/logback/classic/db/names/DBNameResolver;


# instance fields
.field private columnNamePrefix:Ljava/lang/String;

.field private columnNameSuffix:Ljava/lang/String;

.field private tableNamePrefix:Ljava/lang/String;

.field private tableNameSuffix:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lch/qos/logback/classic/db/names/SimpleDBNameResolver;->tableNamePrefix:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lch/qos/logback/classic/db/names/SimpleDBNameResolver;->tableNameSuffix:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lch/qos/logback/classic/db/names/SimpleDBNameResolver;->columnNamePrefix:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lch/qos/logback/classic/db/names/SimpleDBNameResolver;->columnNameSuffix:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getColumnName(Ljava/lang/Enum;)Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<N:",
            "Ljava/lang/Enum",
            "<*>;>(TN;)",
            "Ljava/lang/String;"
        }
    .end annotation

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lch/qos/logback/classic/db/names/SimpleDBNameResolver;->columnNamePrefix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/classic/db/names/SimpleDBNameResolver;->columnNameSuffix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTableName(Ljava/lang/Enum;)Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<N:",
            "Ljava/lang/Enum",
            "<*>;>(TN;)",
            "Ljava/lang/String;"
        }
    .end annotation

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lch/qos/logback/classic/db/names/SimpleDBNameResolver;->tableNamePrefix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/classic/db/names/SimpleDBNameResolver;->tableNameSuffix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setColumnNamePrefix(Ljava/lang/String;)V
    .registers 2

    if-eqz p1, :cond_5

    :goto_2
    iput-object p1, p0, Lch/qos/logback/classic/db/names/SimpleDBNameResolver;->columnNamePrefix:Ljava/lang/String;

    return-void

    :cond_5
    const-string p1, ""

    goto :goto_2
.end method

.method public setColumnNameSuffix(Ljava/lang/String;)V
    .registers 2

    if-eqz p1, :cond_5

    :goto_2
    iput-object p1, p0, Lch/qos/logback/classic/db/names/SimpleDBNameResolver;->columnNameSuffix:Ljava/lang/String;

    return-void

    :cond_5
    const-string p1, ""

    goto :goto_2
.end method

.method public setTableNamePrefix(Ljava/lang/String;)V
    .registers 2

    if-eqz p1, :cond_5

    :goto_2
    iput-object p1, p0, Lch/qos/logback/classic/db/names/SimpleDBNameResolver;->tableNamePrefix:Ljava/lang/String;

    return-void

    :cond_5
    const-string p1, ""

    goto :goto_2
.end method

.method public setTableNameSuffix(Ljava/lang/String;)V
    .registers 2

    if-eqz p1, :cond_5

    :goto_2
    iput-object p1, p0, Lch/qos/logback/classic/db/names/SimpleDBNameResolver;->tableNameSuffix:Ljava/lang/String;

    return-void

    :cond_5
    const-string p1, ""

    goto :goto_2
.end method
