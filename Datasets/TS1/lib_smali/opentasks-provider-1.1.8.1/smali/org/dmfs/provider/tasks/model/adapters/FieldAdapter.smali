.class public interface abstract Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<FieldType:",
        "Ljava/lang/Object;",
        "EntitType:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract copyValue(Landroid/content/ContentValues;Landroid/content/ContentValues;)V
.end method

.method public abstract copyValue(Landroid/database/Cursor;Landroid/content/ContentValues;)V
.end method

.method public abstract existsIn(Landroid/content/ContentValues;)Z
.end method

.method public abstract existsIn(Landroid/database/Cursor;)Z
.end method

.method public abstract existsIn(Landroid/database/Cursor;Landroid/content/ContentValues;)Z
.end method

.method public abstract getFrom(Landroid/content/ContentValues;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/ContentValues;",
            ")TFieldType;"
        }
    .end annotation
.end method

.method public abstract getFrom(Landroid/database/Cursor;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            ")TFieldType;"
        }
    .end annotation
.end method

.method public abstract getFrom(Landroid/database/Cursor;Landroid/content/ContentValues;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            "Landroid/content/ContentValues;",
            ")TFieldType;"
        }
    .end annotation
.end method

.method public abstract isSetIn(Landroid/content/ContentValues;)Z
.end method

.method public abstract removeFrom(Landroid/content/ContentValues;)V
.end method

.method public abstract setIn(Landroid/content/ContentValues;Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/ContentValues;",
            "TFieldType;)V"
        }
    .end annotation
.end method
