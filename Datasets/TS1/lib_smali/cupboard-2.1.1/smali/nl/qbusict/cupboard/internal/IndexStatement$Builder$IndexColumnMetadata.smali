.class Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;
.super Ljava/lang/Object;
.source "IndexStatement.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnl/qbusict/cupboard/internal/IndexStatement$Builder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "IndexColumnMetadata"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;",
        ">;"
    }
.end annotation


# instance fields
.field mAscending:Z

.field mColumnName:Ljava/lang/String;

.field mOrder:I

.field final synthetic this$0:Lnl/qbusict/cupboard/internal/IndexStatement$Builder;


# direct methods
.method public constructor <init>(Lnl/qbusict/cupboard/internal/IndexStatement$Builder;Ljava/lang/String;ZI)V
    .registers 5
    .param p2, "columnName"    # Ljava/lang/String;
    .param p3, "ascending"    # Z
    .param p4, "order"    # I

    .prologue
    .line 140
    iput-object p1, p0, Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;->this$0:Lnl/qbusict/cupboard/internal/IndexStatement$Builder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 141
    iput-object p2, p0, Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;->mColumnName:Ljava/lang/String;

    .line 142
    iput-boolean p3, p0, Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;->mAscending:Z

    .line 143
    iput p4, p0, Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;->mOrder:I

    .line 144
    return-void
.end method


# virtual methods
.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 135
    check-cast p1, Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;->compareTo(Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;)I

    move-result v0

    return v0
.end method

.method public compareTo(Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;)I
    .registers 8
    .param p1, "another"    # Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;

    .prologue
    const/4 v0, 0x1

    .line 156
    iget v1, p0, Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;->mOrder:I

    iget v2, p1, Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;->mOrder:I

    if-ge v1, v2, :cond_9

    .line 157
    const/4 v0, -0x1

    .line 160
    :cond_8
    return v0

    .line 159
    :cond_9
    iget v1, p0, Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;->mOrder:I

    iget v2, p1, Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;->mOrder:I

    if-gt v1, v2, :cond_8

    .line 162
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Columns \'%s\' and \'%s\' cannot have the same composite index order %d"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;->mColumnName:Ljava/lang/String;

    aput-object v5, v3, v4

    iget-object v4, p1, Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;->mColumnName:Ljava/lang/String;

    aput-object v4, v3, v0

    const/4 v0, 0x2

    iget v4, p0, Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;->mOrder:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v0

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 166
    if-ne p0, p1, :cond_5

    .line 178
    :cond_4
    :goto_4
    return v1

    .line 168
    :cond_5
    if-nez p1, :cond_9

    move v1, v2

    .line 169
    goto :goto_4

    .line 170
    :cond_9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_15

    move v1, v2

    .line 171
    goto :goto_4

    :cond_15
    move-object v0, p1

    .line 172
    check-cast v0, Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;

    .line 173
    .local v0, "other":Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;
    iget-object v3, p0, Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;->mColumnName:Ljava/lang/String;

    if-nez v3, :cond_22

    .line 174
    iget-object v3, v0, Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;->mColumnName:Ljava/lang/String;

    if-eqz v3, :cond_4

    move v1, v2

    .line 175
    goto :goto_4

    .line 176
    :cond_22
    iget-object v3, p0, Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;->mColumnName:Ljava/lang/String;

    iget-object v4, v0, Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;->mColumnName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    move v1, v2

    .line 177
    goto :goto_4
.end method

.method public hashCode()I
    .registers 4

    .prologue
    .line 147
    const/16 v0, 0x1f

    .line 148
    .local v0, "prime":I
    const/4 v1, 0x1

    .line 149
    .local v1, "result":I
    iget-object v2, p0, Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;->mColumnName:Ljava/lang/String;

    if-nez v2, :cond_b

    const/4 v2, 0x0

    :goto_8
    add-int/lit8 v1, v2, 0x1f

    .line 151
    return v1

    .line 149
    :cond_b
    iget-object v2, p0, Lnl/qbusict/cupboard/internal/IndexStatement$Builder$IndexColumnMetadata;->mColumnName:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    goto :goto_8
.end method
