.class public interface abstract Lnl/qbusict/cupboard/convert/FieldConverter;
.super Ljava/lang/Object;
.source "FieldConverter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract fromCursorValue(Landroid/database/Cursor;I)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            "I)TT;"
        }
    .end annotation
.end method

.method public abstract getColumnType()Lnl/qbusict/cupboard/convert/EntityConverter$ColumnType;
.end method

.method public abstract toContentValue(Ljava/lang/Object;Ljava/lang/String;Landroid/content/ContentValues;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/lang/String;",
            "Landroid/content/ContentValues;",
            ")V"
        }
    .end annotation
.end method
