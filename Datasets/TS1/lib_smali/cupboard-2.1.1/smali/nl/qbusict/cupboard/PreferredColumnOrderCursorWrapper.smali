.class Lnl/qbusict/cupboard/PreferredColumnOrderCursorWrapper;
.super Landroid/database/CursorWrapper;
.source "PreferredColumnOrderCursorWrapper.java"


# instance fields
.field private final mColumnMap:[I

.field private mColumns:[Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/database/Cursor;Ljava/util/List;)V
    .registers 4
    .param p1, "cursor"    # Landroid/database/Cursor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            "Ljava/util/List",
            "<",
            "Lnl/qbusict/cupboard/convert/EntityConverter$Column;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 45
    .local p2, "columns":Ljava/util/List;, "Ljava/util/List<Lnl/qbusict/cupboard/convert/EntityConverter$Column;>;"
    invoke-static {p2}, Lnl/qbusict/cupboard/PreferredColumnOrderCursorWrapper;->toColumNames(Ljava/util/List;)[Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lnl/qbusict/cupboard/PreferredColumnOrderCursorWrapper;-><init>(Landroid/database/Cursor;[Ljava/lang/String;)V

    .line 46
    return-void
.end method

.method public constructor <init>(Landroid/database/Cursor;[Ljava/lang/String;)V
    .registers 5
    .param p1, "cursor"    # Landroid/database/Cursor;
    .param p2, "columns"    # [Ljava/lang/String;

    .prologue
    .line 37
    invoke-direct {p0, p1}, Landroid/database/CursorWrapper;-><init>(Landroid/database/Cursor;)V

    .line 38
    iput-object p2, p0, Lnl/qbusict/cupboard/PreferredColumnOrderCursorWrapper;->mColumns:[Ljava/lang/String;

    .line 39
    array-length v0, p2

    new-array v0, v0, [I

    iput-object v0, p0, Lnl/qbusict/cupboard/PreferredColumnOrderCursorWrapper;->mColumnMap:[I

    .line 40
    iget-object v0, p0, Lnl/qbusict/cupboard/PreferredColumnOrderCursorWrapper;->mColumnMap:[I

    const/4 v1, -0x1

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([II)V

    .line 41
    invoke-interface {p1}, Landroid/database/Cursor;->getColumnNames()[Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lnl/qbusict/cupboard/PreferredColumnOrderCursorWrapper;->remapColumns([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lnl/qbusict/cupboard/PreferredColumnOrderCursorWrapper;->mColumns:[Ljava/lang/String;

    .line 42
    return-void
.end method

.method private remapColumns([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;
    .registers 10
    .param p1, "cursorColumns"    # [Ljava/lang/String;
    .param p2, "columns"    # [Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 57
    const/4 v2, 0x0

    .line 58
    .local v2, "last":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_3
    array-length v4, p2

    if-ge v0, v4, :cond_17

    .line 59
    aget-object v4, p2, v0

    invoke-super {p0, v4}, Landroid/database/CursorWrapper;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    .line 60
    .local v1, "index":I
    iget-object v4, p0, Lnl/qbusict/cupboard/PreferredColumnOrderCursorWrapper;->mColumnMap:[I

    aput v1, v4, v0

    .line 61
    const/4 v4, -0x1

    if-eq v1, v4, :cond_14

    .line 62
    move v2, v0

    .line 58
    :cond_14
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 65
    .end local v1    # "index":I
    :cond_17
    add-int/lit8 v4, v2, 0x1

    array-length v5, p2

    if-ge v4, v5, :cond_26

    .line 66
    add-int/lit8 v4, v2, 0x1

    new-array v3, v4, [Ljava/lang/String;

    .line 67
    .local v3, "newCols":[Ljava/lang/String;
    add-int/lit8 v4, v2, 0x1

    invoke-static {p2, v6, v3, v6, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 68
    move-object p2, v3

    .line 70
    .end local v3    # "newCols":[Ljava/lang/String;
    :cond_26
    return-object p2
.end method

.method private static toColumNames(Ljava/util/List;)[Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lnl/qbusict/cupboard/convert/EntityConverter$Column;",
            ">;)[",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 49
    .local p0, "columns":Ljava/util/List;, "Ljava/util/List<Lnl/qbusict/cupboard/convert/EntityConverter$Column;>;"
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    new-array v0, v2, [Ljava/lang/String;

    .line 50
    .local v0, "cols":[Ljava/lang/String;
    array-length v2, v0

    add-int/lit8 v1, v2, -0x1

    .local v1, "i":I
    :goto_9
    if-ltz v1, :cond_18

    .line 51
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnl/qbusict/cupboard/convert/EntityConverter$Column;

    iget-object v2, v2, Lnl/qbusict/cupboard/convert/EntityConverter$Column;->name:Ljava/lang/String;

    aput-object v2, v0, v1

    .line 50
    add-int/lit8 v1, v1, -0x1

    goto :goto_9

    .line 53
    :cond_18
    return-object v0
.end method


# virtual methods
.method public getBlob(I)[B
    .registers 4
    .param p1, "columnIndex"    # I

    .prologue
    .line 89
    iget-object v1, p0, Lnl/qbusict/cupboard/PreferredColumnOrderCursorWrapper;->mColumnMap:[I

    aget v0, v1, p1

    .line 90
    .local v0, "index":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_9

    .line 91
    const/4 v1, 0x0

    .line 93
    :goto_8
    return-object v1

    :cond_9
    invoke-super {p0, v0}, Landroid/database/CursorWrapper;->getBlob(I)[B

    move-result-object v1

    goto :goto_8
.end method

.method public getColumnCount()I
    .registers 2

    .prologue
    .line 152
    iget-object v0, p0, Lnl/qbusict/cupboard/PreferredColumnOrderCursorWrapper;->mColumns:[Ljava/lang/String;

    array-length v0, v0

    return v0
.end method

.method public getColumnIndex(Ljava/lang/String;)I
    .registers 4
    .param p1, "columnName"    # Ljava/lang/String;

    .prologue
    .line 161
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Don\'t use getColumnIndex(), but use the indices supplied in the constructor.\nFor use in an EntityConverter, the columns and indices are always in the same order as returned from EntityConverter.getColumns()"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getColumnIndexOrThrow(Ljava/lang/String;)I
    .registers 4
    .param p1, "columnName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 170
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Don\'t use getColumnIndex(), but use the indices supplied in the constructor.\nFor use in an EntityConverter, the columns and indices are always in the same order as returned from EntityConverter.getColumns()"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getColumnNames()[Ljava/lang/String;
    .registers 2

    .prologue
    .line 75
    iget-object v0, p0, Lnl/qbusict/cupboard/PreferredColumnOrderCursorWrapper;->mColumns:[Ljava/lang/String;

    return-object v0
.end method

.method public getDouble(I)D
    .registers 5
    .param p1, "columnIndex"    # I

    .prologue
    .line 98
    iget-object v1, p0, Lnl/qbusict/cupboard/PreferredColumnOrderCursorWrapper;->mColumnMap:[I

    aget v0, v1, p1

    .line 99
    .local v0, "index":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_a

    .line 100
    const-wide/16 v1, 0x0

    .line 102
    :goto_9
    return-wide v1

    :cond_a
    invoke-super {p0, v0}, Landroid/database/CursorWrapper;->getDouble(I)D

    move-result-wide v1

    goto :goto_9
.end method

.method public getFloat(I)F
    .registers 4
    .param p1, "columnIndex"    # I

    .prologue
    .line 107
    iget-object v1, p0, Lnl/qbusict/cupboard/PreferredColumnOrderCursorWrapper;->mColumnMap:[I

    aget v0, v1, p1

    .line 108
    .local v0, "index":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_9

    .line 109
    const/4 v1, 0x0

    .line 111
    :goto_8
    return v1

    :cond_9
    invoke-super {p0, v0}, Landroid/database/CursorWrapper;->getFloat(I)F

    move-result v1

    goto :goto_8
.end method

.method public getInt(I)I
    .registers 4
    .param p1, "columnIndex"    # I

    .prologue
    .line 116
    iget-object v1, p0, Lnl/qbusict/cupboard/PreferredColumnOrderCursorWrapper;->mColumnMap:[I

    aget v0, v1, p1

    .line 117
    .local v0, "index":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_9

    .line 118
    const/4 v1, 0x0

    .line 120
    :goto_8
    return v1

    :cond_9
    invoke-super {p0, v0}, Landroid/database/CursorWrapper;->getInt(I)I

    move-result v1

    goto :goto_8
.end method

.method public getLong(I)J
    .registers 5
    .param p1, "columnIndex"    # I

    .prologue
    .line 125
    iget-object v1, p0, Lnl/qbusict/cupboard/PreferredColumnOrderCursorWrapper;->mColumnMap:[I

    aget v0, v1, p1

    .line 126
    .local v0, "index":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_a

    .line 127
    const-wide/16 v1, 0x0

    .line 129
    :goto_9
    return-wide v1

    :cond_a
    invoke-super {p0, v0}, Landroid/database/CursorWrapper;->getLong(I)J

    move-result-wide v1

    goto :goto_9
.end method

.method public getShort(I)S
    .registers 4
    .param p1, "columnIndex"    # I

    .prologue
    .line 80
    iget-object v1, p0, Lnl/qbusict/cupboard/PreferredColumnOrderCursorWrapper;->mColumnMap:[I

    aget v0, v1, p1

    .line 81
    .local v0, "index":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_9

    .line 82
    const/4 v1, 0x0

    .line 84
    :goto_8
    return v1

    :cond_9
    invoke-super {p0, v0}, Landroid/database/CursorWrapper;->getShort(I)S

    move-result v1

    goto :goto_8
.end method

.method public getString(I)Ljava/lang/String;
    .registers 4
    .param p1, "columnIndex"    # I

    .prologue
    .line 134
    iget-object v1, p0, Lnl/qbusict/cupboard/PreferredColumnOrderCursorWrapper;->mColumnMap:[I

    aget v0, v1, p1

    .line 135
    .local v0, "index":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_9

    .line 136
    const/4 v1, 0x0

    .line 138
    :goto_8
    return-object v1

    :cond_9
    invoke-super {p0, v0}, Landroid/database/CursorWrapper;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_8
.end method

.method public isNull(I)Z
    .registers 4
    .param p1, "columnIndex"    # I

    .prologue
    .line 143
    iget-object v1, p0, Lnl/qbusict/cupboard/PreferredColumnOrderCursorWrapper;->mColumnMap:[I

    aget v0, v1, p1

    .line 144
    .local v0, "index":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_9

    .line 145
    const/4 v1, 0x1

    .line 147
    :goto_8
    return v1

    :cond_9
    invoke-super {p0, v0}, Landroid/database/CursorWrapper;->isNull(I)Z

    move-result v1

    goto :goto_8
.end method
