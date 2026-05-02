.class public Lnl/qbusict/cupboard/internal/IndexStatement;
.super Ljava/lang/Object;
.source "IndexStatement.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnl/qbusict/cupboard/internal/IndexStatement$Builder;
    }
.end annotation


# instance fields
.field public final mAscendings:[Z

.field public final mColumnNames:[Ljava/lang/String;

.field public final mIndexName:Ljava/lang/String;

.field public final mIsUnique:Z


# direct methods
.method public constructor <init>(Z[Ljava/lang/String;[ZLjava/lang/String;)V
    .registers 5
    .param p1, "isUnique"    # Z
    .param p2, "columnNames"    # [Ljava/lang/String;
    .param p3, "ascendings"    # [Z
    .param p4, "indexName"    # Ljava/lang/String;

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-boolean p1, p0, Lnl/qbusict/cupboard/internal/IndexStatement;->mIsUnique:Z

    .line 25
    iput-object p2, p0, Lnl/qbusict/cupboard/internal/IndexStatement;->mColumnNames:[Ljava/lang/String;

    .line 26
    iput-object p3, p0, Lnl/qbusict/cupboard/internal/IndexStatement;->mAscendings:[Z

    .line 27
    iput-object p4, p0, Lnl/qbusict/cupboard/internal/IndexStatement;->mIndexName:Ljava/lang/String;

    .line 28
    return-void
.end method


# virtual methods
.method public getCreationSql(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "table"    # Ljava/lang/String;

    .prologue
    .line 31
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lnl/qbusict/cupboard/internal/IndexStatement;->getCreationSql(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCreationSql(Ljava/lang/String;Z)Ljava/lang/String;
    .registers 10
    .param p1, "table"    # Ljava/lang/String;
    .param p2, "includeIfNotExists"    # Z

    .prologue
    const/4 v5, 0x0

    .line 36
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "create "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .local v1, "sb":Ljava/lang/StringBuilder;
    iget-boolean v3, p0, Lnl/qbusict/cupboard/internal/IndexStatement;->mIsUnique:Z

    if-eqz v3, :cond_11

    .line 38
    const-string v3, "unique "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    :cond_11
    const-string v3, "index "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    if-eqz p2, :cond_1d

    .line 42
    const-string v3, "if not exists "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    :cond_1d
    iget-object v3, p0, Lnl/qbusict/cupboard/internal/IndexStatement;->mIndexName:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " on %s ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    iget-object v3, p0, Lnl/qbusict/cupboard/internal/IndexStatement;->mColumnNames:[Ljava/lang/String;

    array-length v2, v3

    .line 46
    .local v2, "size":I
    const/16 v3, 0x27

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lnl/qbusict/cupboard/internal/IndexStatement;->mColumnNames:[Ljava/lang/String;

    aget-object v4, v4, v5

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\' "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v3, p0, Lnl/qbusict/cupboard/internal/IndexStatement;->mAscendings:[Z

    aget-boolean v3, v3, v5

    if-eqz v3, :cond_6f

    const-string v3, "ASC"

    :goto_47
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_4b
    if-ge v0, v2, :cond_75

    .line 48
    const-string v3, ", \'"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lnl/qbusict/cupboard/internal/IndexStatement;->mColumnNames:[Ljava/lang/String;

    aget-object v4, v4, v0

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\' "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v3, p0, Lnl/qbusict/cupboard/internal/IndexStatement;->mAscendings:[Z

    aget-boolean v3, v3, v0

    if-eqz v3, :cond_72

    const-string v3, "ASC"

    :goto_69
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    add-int/lit8 v0, v0, 0x1

    goto :goto_4b

    .line 46
    .end local v0    # "i":I
    :cond_6f
    const-string v3, "DESC"

    goto :goto_47

    .line 48
    .restart local v0    # "i":I
    :cond_72
    const-string v3, "DESC"

    goto :goto_69

    .line 50
    :cond_75
    const/16 v3, 0x29

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 51
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p1, v4, v5

    const/4 v5, 0x1

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
