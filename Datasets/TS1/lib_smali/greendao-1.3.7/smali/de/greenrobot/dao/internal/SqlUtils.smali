.class public Lde/greenrobot/dao/internal/SqlUtils;
.super Ljava/lang/Object;
.source "SqlUtils.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static appendColumn(Ljava/lang/StringBuilder;Ljava/lang/String;)Ljava/lang/StringBuilder;
    .registers 4
    .param p0, "builder"    # Ljava/lang/StringBuilder;
    .param p1, "column"    # Ljava/lang/String;

    .prologue
    const/16 v1, 0x27

    .line 24
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 25
    return-object p0
.end method

.method public static appendColumn(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;
    .registers 5
    .param p0, "builder"    # Ljava/lang/StringBuilder;
    .param p1, "tableAlias"    # Ljava/lang/String;
    .param p2, "column"    # Ljava/lang/String;

    .prologue
    .line 29
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 30
    return-object p0
.end method

.method public static appendColumns(Ljava/lang/StringBuilder;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/StringBuilder;
    .registers 6
    .param p0, "builder"    # Ljava/lang/StringBuilder;
    .param p1, "tableAlias"    # Ljava/lang/String;
    .param p2, "columns"    # [Ljava/lang/String;

    .prologue
    .line 34
    array-length v1, p2

    .line 35
    .local v1, "length":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    if-ge v0, v1, :cond_15

    .line 36
    aget-object v2, p2, v0

    invoke-static {p0, p1, v2}, Lde/greenrobot/dao/internal/SqlUtils;->appendColumn(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    add-int/lit8 v2, v1, -0x1

    if-ge v0, v2, :cond_12

    .line 38
    const/16 v2, 0x2c

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 35
    :cond_12
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 41
    :cond_15
    return-object p0
.end method

.method public static appendColumns(Ljava/lang/StringBuilder;[Ljava/lang/String;)Ljava/lang/StringBuilder;
    .registers 7
    .param p0, "builder"    # Ljava/lang/StringBuilder;
    .param p1, "columns"    # [Ljava/lang/String;

    .prologue
    const/16 v4, 0x27

    .line 45
    array-length v1, p1

    .line 46
    .local v1, "length":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    if-ge v0, v1, :cond_1f

    .line 47
    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    aget-object v3, p1, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 48
    add-int/lit8 v2, v1, -0x1

    if-ge v0, v2, :cond_1c

    .line 49
    const/16 v2, 0x2c

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 46
    :cond_1c
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 52
    :cond_1f
    return-object p0
.end method

.method public static appendColumnsEqValue(Ljava/lang/StringBuilder;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/StringBuilder;
    .registers 6
    .param p0, "builder"    # Ljava/lang/StringBuilder;
    .param p1, "tableAlias"    # Ljava/lang/String;
    .param p2, "columns"    # [Ljava/lang/String;

    .prologue
    .line 77
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p2

    if-ge v0, v1, :cond_1c

    .line 78
    aget-object v1, p2, v0

    invoke-static {p0, p1, v1}, Lde/greenrobot/dao/internal/SqlUtils;->appendColumn(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "=?"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    array-length v1, p2

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_19

    .line 80
    const/16 v1, 0x2c

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 77
    :cond_19
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 83
    :cond_1c
    return-object p0
.end method

.method public static appendColumnsEqualPlaceholders(Ljava/lang/StringBuilder;[Ljava/lang/String;)Ljava/lang/StringBuilder;
    .registers 5
    .param p0, "builder"    # Ljava/lang/StringBuilder;
    .param p1, "columns"    # [Ljava/lang/String;

    .prologue
    .line 67
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_1c

    .line 68
    aget-object v1, p1, v0

    invoke-static {p0, v1}, Lde/greenrobot/dao/internal/SqlUtils;->appendColumn(Ljava/lang/StringBuilder;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "=?"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    array-length v1, p1

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_19

    .line 70
    const/16 v1, 0x2c

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 67
    :cond_19
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 73
    :cond_1c
    return-object p0
.end method

.method public static appendPlaceholders(Ljava/lang/StringBuilder;I)Ljava/lang/StringBuilder;
    .registers 4
    .param p0, "builder"    # Ljava/lang/StringBuilder;
    .param p1, "count"    # I

    .prologue
    .line 56
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, p1, :cond_15

    .line 57
    add-int/lit8 v1, p1, -0x1

    if-ge v0, v1, :cond_f

    .line 58
    const-string v1, "?,"

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    :goto_c
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 60
    :cond_f
    const/16 v1, 0x3f

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_c

    .line 63
    :cond_15
    return-object p0
.end method

.method public static createSqlDelete(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "tablename"    # Ljava/lang/String;
    .param p1, "columns"    # [Ljava/lang/String;

    .prologue
    .line 120
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "DELETE FROM "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 121
    .local v0, "builder":Ljava/lang/StringBuilder;
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    if-eqz p1, :cond_17

    array-length v1, p1

    if-lez v1, :cond_17

    .line 123
    const-string v1, " WHERE "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    invoke-static {v0, p0, p1}, Lde/greenrobot/dao/internal/SqlUtils;->appendColumnsEqValue(Ljava/lang/StringBuilder;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    :cond_17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static createSqlInsert(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "insertInto"    # Ljava/lang/String;
    .param p1, "tablename"    # Ljava/lang/String;
    .param p2, "columns"    # [Ljava/lang/String;

    .prologue
    .line 87
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 88
    .local v0, "builder":Ljava/lang/StringBuilder;
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    invoke-static {v0, p2}, Lde/greenrobot/dao/internal/SqlUtils;->appendColumns(Ljava/lang/StringBuilder;[Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    const-string v1, ") VALUES ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    array-length v1, p2

    invoke-static {v0, v1}, Lde/greenrobot/dao/internal/SqlUtils;->appendPlaceholders(Ljava/lang/StringBuilder;I)Ljava/lang/StringBuilder;

    .line 92
    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 93
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static createSqlSelect(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p0, "tablename"    # Ljava/lang/String;
    .param p1, "tableAlias"    # Ljava/lang/String;
    .param p2, "columns"    # [Ljava/lang/String;

    .prologue
    const/16 v3, 0x20

    .line 98
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "SELECT "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 99
    .local v0, "builder":Ljava/lang/StringBuilder;
    if-eqz p1, :cond_11

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-gez v1, :cond_19

    .line 100
    :cond_11
    new-instance v1, Lde/greenrobot/dao/DaoException;

    const-string v2, "Table alias required"

    invoke-direct {v1, v2}, Lde/greenrobot/dao/DaoException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 103
    :cond_19
    invoke-static {v0, p1, p2}, Lde/greenrobot/dao/internal/SqlUtils;->appendColumns(Ljava/lang/StringBuilder;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " FROM "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 105
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static createSqlSelectCountStar(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "tablename"    # Ljava/lang/String;
    .param p1, "tableAliasOrNull"    # Ljava/lang/String;

    .prologue
    const/16 v2, 0x20

    .line 110
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "SELECT COUNT(*) FROM "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 111
    .local v0, "builder":Ljava/lang/StringBuilder;
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 112
    if-eqz p1, :cond_19

    .line 113
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 115
    :cond_19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static createSqlUpdate(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "tablename"    # Ljava/lang/String;
    .param p1, "updateColumns"    # [Ljava/lang/String;
    .param p2, "whereColumns"    # [Ljava/lang/String;

    .prologue
    .line 130
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "UPDATE "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 131
    .local v0, "builder":Ljava/lang/StringBuilder;
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " SET "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    invoke-static {v0, p1}, Lde/greenrobot/dao/internal/SqlUtils;->appendColumnsEqualPlaceholders(Ljava/lang/StringBuilder;[Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    const-string v1, " WHERE "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    invoke-static {v0, p0, p2}, Lde/greenrobot/dao/internal/SqlUtils;->appendColumnsEqValue(Ljava/lang/StringBuilder;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
