.class public Lde/greenrobot/dao/internal/TableStatements;
.super Ljava/lang/Object;
.source "TableStatements.java"


# instance fields
.field private final allColumns:[Ljava/lang/String;

.field private final db:Landroid/database/sqlite/SQLiteDatabase;

.field private deleteStatement:Landroid/database/sqlite/SQLiteStatement;

.field private insertOrReplaceStatement:Landroid/database/sqlite/SQLiteStatement;

.field private insertStatement:Landroid/database/sqlite/SQLiteStatement;

.field private final pkColumns:[Ljava/lang/String;

.field private volatile selectAll:Ljava/lang/String;

.field private volatile selectByKey:Ljava/lang/String;

.field private volatile selectByRowId:Ljava/lang/String;

.field private volatile selectKeys:Ljava/lang/String;

.field private final tablename:Ljava/lang/String;

.field private updateStatement:Landroid/database/sqlite/SQLiteStatement;


# direct methods
.method public constructor <init>(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V
    .registers 5
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "tablename"    # Ljava/lang/String;
    .param p3, "allColumns"    # [Ljava/lang/String;
    .param p4, "pkColumns"    # [Ljava/lang/String;

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Lde/greenrobot/dao/internal/TableStatements;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 40
    iput-object p2, p0, Lde/greenrobot/dao/internal/TableStatements;->tablename:Ljava/lang/String;

    .line 41
    iput-object p3, p0, Lde/greenrobot/dao/internal/TableStatements;->allColumns:[Ljava/lang/String;

    .line 42
    iput-object p4, p0, Lde/greenrobot/dao/internal/TableStatements;->pkColumns:[Ljava/lang/String;

    .line 43
    return-void
.end method


# virtual methods
.method public getDeleteStatement()Landroid/database/sqlite/SQLiteStatement;
    .registers 4

    .prologue
    .line 62
    iget-object v1, p0, Lde/greenrobot/dao/internal/TableStatements;->deleteStatement:Landroid/database/sqlite/SQLiteStatement;

    if-nez v1, :cond_14

    .line 63
    iget-object v1, p0, Lde/greenrobot/dao/internal/TableStatements;->tablename:Ljava/lang/String;

    iget-object v2, p0, Lde/greenrobot/dao/internal/TableStatements;->pkColumns:[Ljava/lang/String;

    invoke-static {v1, v2}, Lde/greenrobot/dao/internal/SqlUtils;->createSqlDelete(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 64
    .local v0, "sql":Ljava/lang/String;
    iget-object v1, p0, Lde/greenrobot/dao/internal/TableStatements;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    iput-object v1, p0, Lde/greenrobot/dao/internal/TableStatements;->deleteStatement:Landroid/database/sqlite/SQLiteStatement;

    .line 66
    .end local v0    # "sql":Ljava/lang/String;
    :cond_14
    iget-object v1, p0, Lde/greenrobot/dao/internal/TableStatements;->deleteStatement:Landroid/database/sqlite/SQLiteStatement;

    return-object v1
.end method

.method public getInsertOrReplaceStatement()Landroid/database/sqlite/SQLiteStatement;
    .registers 5

    .prologue
    .line 54
    iget-object v1, p0, Lde/greenrobot/dao/internal/TableStatements;->insertOrReplaceStatement:Landroid/database/sqlite/SQLiteStatement;

    if-nez v1, :cond_16

    .line 55
    const-string v1, "INSERT OR REPLACE INTO "

    iget-object v2, p0, Lde/greenrobot/dao/internal/TableStatements;->tablename:Ljava/lang/String;

    iget-object v3, p0, Lde/greenrobot/dao/internal/TableStatements;->allColumns:[Ljava/lang/String;

    invoke-static {v1, v2, v3}, Lde/greenrobot/dao/internal/SqlUtils;->createSqlInsert(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 56
    .local v0, "sql":Ljava/lang/String;
    iget-object v1, p0, Lde/greenrobot/dao/internal/TableStatements;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    iput-object v1, p0, Lde/greenrobot/dao/internal/TableStatements;->insertOrReplaceStatement:Landroid/database/sqlite/SQLiteStatement;

    .line 58
    .end local v0    # "sql":Ljava/lang/String;
    :cond_16
    iget-object v1, p0, Lde/greenrobot/dao/internal/TableStatements;->insertOrReplaceStatement:Landroid/database/sqlite/SQLiteStatement;

    return-object v1
.end method

.method public getInsertStatement()Landroid/database/sqlite/SQLiteStatement;
    .registers 5

    .prologue
    .line 46
    iget-object v1, p0, Lde/greenrobot/dao/internal/TableStatements;->insertStatement:Landroid/database/sqlite/SQLiteStatement;

    if-nez v1, :cond_16

    .line 47
    const-string v1, "INSERT INTO "

    iget-object v2, p0, Lde/greenrobot/dao/internal/TableStatements;->tablename:Ljava/lang/String;

    iget-object v3, p0, Lde/greenrobot/dao/internal/TableStatements;->allColumns:[Ljava/lang/String;

    invoke-static {v1, v2, v3}, Lde/greenrobot/dao/internal/SqlUtils;->createSqlInsert(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 48
    .local v0, "sql":Ljava/lang/String;
    iget-object v1, p0, Lde/greenrobot/dao/internal/TableStatements;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    iput-object v1, p0, Lde/greenrobot/dao/internal/TableStatements;->insertStatement:Landroid/database/sqlite/SQLiteStatement;

    .line 50
    .end local v0    # "sql":Ljava/lang/String;
    :cond_16
    iget-object v1, p0, Lde/greenrobot/dao/internal/TableStatements;->insertStatement:Landroid/database/sqlite/SQLiteStatement;

    return-object v1
.end method

.method public getSelectAll()Ljava/lang/String;
    .registers 4

    .prologue
    .line 79
    iget-object v0, p0, Lde/greenrobot/dao/internal/TableStatements;->selectAll:Ljava/lang/String;

    if-nez v0, :cond_10

    .line 80
    iget-object v0, p0, Lde/greenrobot/dao/internal/TableStatements;->tablename:Ljava/lang/String;

    const-string v1, "T"

    iget-object v2, p0, Lde/greenrobot/dao/internal/TableStatements;->allColumns:[Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lde/greenrobot/dao/internal/SqlUtils;->createSqlSelect(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lde/greenrobot/dao/internal/TableStatements;->selectAll:Ljava/lang/String;

    .line 82
    :cond_10
    iget-object v0, p0, Lde/greenrobot/dao/internal/TableStatements;->selectAll:Ljava/lang/String;

    return-object v0
.end method

.method public getSelectByKey()Ljava/lang/String;
    .registers 4

    .prologue
    .line 95
    iget-object v1, p0, Lde/greenrobot/dao/internal/TableStatements;->selectByKey:Ljava/lang/String;

    if-nez v1, :cond_1f

    .line 96
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lde/greenrobot/dao/internal/TableStatements;->getSelectAll()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 97
    .local v0, "builder":Ljava/lang/StringBuilder;
    const-string v1, "WHERE "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    const-string v1, "T"

    iget-object v2, p0, Lde/greenrobot/dao/internal/TableStatements;->pkColumns:[Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lde/greenrobot/dao/internal/SqlUtils;->appendColumnsEqValue(Ljava/lang/StringBuilder;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lde/greenrobot/dao/internal/TableStatements;->selectByKey:Ljava/lang/String;

    .line 101
    .end local v0    # "builder":Ljava/lang/StringBuilder;
    :cond_1f
    iget-object v1, p0, Lde/greenrobot/dao/internal/TableStatements;->selectByKey:Ljava/lang/String;

    return-object v1
.end method

.method public getSelectByRowId()Ljava/lang/String;
    .registers 3

    .prologue
    .line 105
    iget-object v0, p0, Lde/greenrobot/dao/internal/TableStatements;->selectByRowId:Ljava/lang/String;

    if-nez v0, :cond_1d

    .line 106
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lde/greenrobot/dao/internal/TableStatements;->getSelectAll()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "WHERE ROWID=?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lde/greenrobot/dao/internal/TableStatements;->selectByRowId:Ljava/lang/String;

    .line 108
    :cond_1d
    iget-object v0, p0, Lde/greenrobot/dao/internal/TableStatements;->selectByRowId:Ljava/lang/String;

    return-object v0
.end method

.method public getSelectKeys()Ljava/lang/String;
    .registers 4

    .prologue
    .line 87
    iget-object v0, p0, Lde/greenrobot/dao/internal/TableStatements;->selectKeys:Ljava/lang/String;

    if-nez v0, :cond_10

    .line 88
    iget-object v0, p0, Lde/greenrobot/dao/internal/TableStatements;->tablename:Ljava/lang/String;

    const-string v1, "T"

    iget-object v2, p0, Lde/greenrobot/dao/internal/TableStatements;->pkColumns:[Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lde/greenrobot/dao/internal/SqlUtils;->createSqlSelect(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lde/greenrobot/dao/internal/TableStatements;->selectKeys:Ljava/lang/String;

    .line 90
    :cond_10
    iget-object v0, p0, Lde/greenrobot/dao/internal/TableStatements;->selectKeys:Ljava/lang/String;

    return-object v0
.end method

.method public getUpdateStatement()Landroid/database/sqlite/SQLiteStatement;
    .registers 5

    .prologue
    .line 70
    iget-object v1, p0, Lde/greenrobot/dao/internal/TableStatements;->updateStatement:Landroid/database/sqlite/SQLiteStatement;

    if-nez v1, :cond_16

    .line 71
    iget-object v1, p0, Lde/greenrobot/dao/internal/TableStatements;->tablename:Ljava/lang/String;

    iget-object v2, p0, Lde/greenrobot/dao/internal/TableStatements;->allColumns:[Ljava/lang/String;

    iget-object v3, p0, Lde/greenrobot/dao/internal/TableStatements;->pkColumns:[Ljava/lang/String;

    invoke-static {v1, v2, v3}, Lde/greenrobot/dao/internal/SqlUtils;->createSqlUpdate(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 72
    .local v0, "sql":Ljava/lang/String;
    iget-object v1, p0, Lde/greenrobot/dao/internal/TableStatements;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    iput-object v1, p0, Lde/greenrobot/dao/internal/TableStatements;->updateStatement:Landroid/database/sqlite/SQLiteStatement;

    .line 74
    .end local v0    # "sql":Ljava/lang/String;
    :cond_16
    iget-object v1, p0, Lde/greenrobot/dao/internal/TableStatements;->updateStatement:Landroid/database/sqlite/SQLiteStatement;

    return-object v1
.end method
