.class public interface abstract Lnl/qbusict/cupboard/convert/EntityConverter;
.super Ljava/lang/Object;
.source "EntityConverter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnl/qbusict/cupboard/convert/EntityConverter$Column;,
        Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract fromCursor(Landroid/database/Cursor;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            ")TT;"
        }
    .end annotation
.end method

.method public abstract getColumns()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lnl/qbusict/cupboard/convert/EntityConverter$Column;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getId(Ljava/lang/Object;)Ljava/lang/Long;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Ljava/lang/Long;"
        }
    .end annotation
.end method

.method public abstract getTable()Ljava/lang/String;
.end method

.method public abstract setId(Ljava/lang/Long;Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Long;",
            "TT;)V"
        }
    .end annotation
.end method

.method public abstract toValues(Ljava/lang/Object;Landroid/content/ContentValues;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Landroid/content/ContentValues;",
            ")V"
        }
    .end annotation
.end method
