.class public Lde/greenrobot/dao/internal/SqlUtils;
.super Ljava/lang/Object;
.source "SqlUtils.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static appendColumn(Ljava/lang/StringBuilder;Ljava/lang/String;)Ljava/lang/StringBuilder;
    .registers 4
    .param p0, "builder"    # Ljava/lang/StringBuilder;
    .param p1, "column"    # Ljava/lang/String;

    .prologue
    const/16 v1, 0x22

    .line 33
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 34
    return-object p0
.end method

.method public static appendColumn(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;
    .registers 5
    .param p0, "builder"    # Ljava/lang/StringBuilder;
    .param p1, "tableAlias"    # Ljava/lang/String;
    .param p2, "column"    # Ljava/lang/String;

    .prologue
    .line 38
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 39
    return-object p0
.end method

.method public static appendColumns(Ljava/lang/StringBuilder;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/StringBuilder;
    .registers 6
    .param p0, "builder"    # Ljava/lang/StringBuilder;
    .param p1, "tableAlias"    # Ljava/lang/String;
    .param p2, "columns"    # [Ljava/lang/String;

    .prologue
    .line 43
    array-length v1, p2

    .line 44
    .local v1, "length":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    if-ge v0, v1, :cond_15

    .line 45
    aget-object v2, p2, v0

    invoke-static {p0, p1, v2}, Lde/greenrobot/dao/internal/SqlUtils;->appendColumn(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    add-int/lit8 v2, v1, -0x1

    if-ge v0, v2, :cond_12

    .line 47
    const/16 v2, 0x2c

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 44
    :cond_12
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 50
    :cond_15
    return-object p0
.end method

.method public static appendColumns(Ljava/lang/StringBuilder;[Ljava/lang/String;)Ljava/lang/StringBuilder;
    .registers 7
    .param p0, "builder"    # Ljava/lang/StringBuilder;
    .param p1, "columns"    # [Ljava/lang/String;

    .prologue
    const/16 v4, 0x22

    .line 54
    array-length v1, p1

    .line 55
    .local v1, "length":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    if-ge v0, v1, :cond_1f

    .line 56
    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    aget-object v3, p1, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 57
    add-int/lit8 v2, v1, -0x1

    if-ge v0, v2, :cond_1c

    .line 58
    const/16 v2, 0x2c

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 55
    :cond_1c
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 61
    :cond_1f
    return-object p0
.end method

.method public static appendColumnsEqValue(Ljava/lang/StringBuilder;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/StringBuilder;
    .registers 6
    .param p0, "builder"    # Ljava/lang/StringBuilder;
    .param p1, "tableAlias"    # Ljava/lang/String;
    .param p2, "columns"    # [Ljava/lang/String;

    .prologue
    .line 86
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p2

    if-ge v0, v1, :cond_1c

    .line 87
    aget-object v1, p2, v0

    invoke-static {p0, p1, v1}, Lde/greenrobot/dao/internal/SqlUtils;->appendColumn(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "=?"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    array-length v1, p2

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_19

    .line 89
    const/16 v1, 0x2c

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 86
    :cond_19
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 92
    :cond_1c
    return-object p0
.end method

.method public static appendColumnsEqualPlaceholders(Ljava/lang/StringBuilder;[Ljava/lang/String;)Ljava/lang/StringBuilder;
    .registers 5
    .param p0, "builder"    # Ljava/lang/StringBuilder;
    .param p1, "columns"    # [Ljava/lang/String;

    .prologue
    .line 76
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_1c

    .line 77
    aget-object v1, p1, v0

    invoke-static {p0, v1}, Lde/greenrobot/dao/internal/SqlUtils;->appendColumn(Ljava/lang/StringBuilder;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "=?"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    array-length v1, p1

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_19

    .line 79
    const/16 v1, 0x2c

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 76
    :cond_19
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 82
    :cond_1c
    return-object p0
.end method

.method public static appendPlaceholders(Ljava/lang/StringBuilder;I)Ljava/lang/StringBuilder;
    .registers 4
    .param p0, "builder"    # Ljava/lang/StringBuilder;
    .param p1, "count"    # I

    .prologue
    .line 65
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, p1, :cond_15

    .line 66
    add-int/lit8 v1, p1, -0x1

    if-ge v0, v1, :cond_f

    .line 67
    const-string v1, "?,"

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    :goto_c
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 69
    :cond_f
    const/16 v1, 0x3f

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_c

    .line 72
    :cond_15
    return-object p0
.end method

.method public static appendProperty(Ljava/lang/StringBuilder;Ljava/lang/String;Lde/greenrobot/dao/Property;)Ljava/lang/StringBuilder;
    .registers 6
    .param p0, "builder"    # Ljava/lang/StringBuilder;
    .param p1, "tablePrefix"    # Ljava/lang/String;
    .param p2, "property"    # Lde/greenrobot/dao/Property;

    .prologue
    const/16 v2, 0x22

    .line 25
    if-eqz p1, :cond_d

    .line 26
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x2e

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 28
    :cond_d
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p2, Lde/greenrobot/dao/Property;->columnName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 29
    return-object p0
.end method

.method public static createSqlDelete(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "tablename"    # Ljava/lang/String;
    .param p1, "columns"    # [Ljava/lang/String;

    .prologue
    const/16 v3, 0x22

    .line 129
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 130
    .local v1, "quotedTablename":Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "DELETE FROM "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 131
    .local v0, "builder":Ljava/lang/StringBuilder;
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    if-eqz p1, :cond_2e

    array-length v2, p1

    if-lez v2, :cond_2e

    .line 133
    const-string v2, " WHERE "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    invoke-static {v0, v1, p1}, Lde/greenrobot/dao/internal/SqlUtils;->appendColumnsEqValue(Ljava/lang/StringBuilder;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    :cond_2e
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static createSqlInsert(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "insertInto"    # Ljava/lang/String;
    .param p1, "tablename"    # Ljava/lang/String;
    .param p2, "columns"    # [Ljava/lang/String;

    .prologue
    const/16 v2, 0x22

    .line 96
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 97
    .local v0, "builder":Ljava/lang/StringBuilder;
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    invoke-static {v0, p2}, Lde/greenrobot/dao/internal/SqlUtils;->appendColumns(Ljava/lang/StringBuilder;[Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    const-string v1, ") VALUES ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    array-length v1, p2

    invoke-static {v0, v1}, Lde/greenrobot/dao/internal/SqlUtils;->appendPlaceholders(Ljava/lang/StringBuilder;I)Ljava/lang/StringBuilder;

    .line 101
    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 102
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static createSqlSelect(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p0, "tablename"    # Ljava/lang/String;
    .param p1, "tableAlias"    # Ljava/lang/String;
    .param p2, "columns"    # [Ljava/lang/String;

    .prologue
    const/16 v4, 0x22

    const/16 v3, 0x20

    .line 107
    if-eqz p1, :cond_c

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-gez v1, :cond_14

    .line 108
    :cond_c
    new-instance v1, Lde/greenrobot/dao/DaoException;

    const-string v2, "Table alias required"

    invoke-direct {v1, v2}, Lde/greenrobot/dao/DaoException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 111
    :cond_14
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "SELECT "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 112
    .local v0, "builder":Ljava/lang/StringBuilder;
    invoke-static {v0, p1, p2}, Lde/greenrobot/dao/internal/SqlUtils;->appendColumns(Ljava/lang/StringBuilder;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " FROM "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 114
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static createSqlSelectCountStar(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "tablename"    # Ljava/lang/String;
    .param p1, "tableAliasOrNull"    # Ljava/lang/String;

    .prologue
    const/16 v3, 0x22

    const/16 v2, 0x20

    .line 119
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "SELECT COUNT(*) FROM "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 120
    .local v0, "builder":Ljava/lang/StringBuilder;
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 121
    if-eqz p1, :cond_23

    .line 122
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 124
    :cond_23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static createSqlUpdate(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p0, "tablename"    # Ljava/lang/String;
    .param p1, "updateColumns"    # [Ljava/lang/String;
    .param p2, "whereColumns"    # [Ljava/lang/String;

    .prologue
    const/16 v3, 0x22

    .line 140
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 141
    .local v1, "quotedTablename":Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "UPDATE "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 142
    .local v0, "builder":Ljava/lang/StringBuilder;
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " SET "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    invoke-static {v0, p1}, Lde/greenrobot/dao/internal/SqlUtils;->appendColumnsEqualPlaceholders(Ljava/lang/StringBuilder;[Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    const-string v2, " WHERE "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    invoke-static {v0, v1, p2}, Lde/greenrobot/dao/internal/SqlUtils;->appendColumnsEqValue(Ljava/lang/StringBuilder;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
