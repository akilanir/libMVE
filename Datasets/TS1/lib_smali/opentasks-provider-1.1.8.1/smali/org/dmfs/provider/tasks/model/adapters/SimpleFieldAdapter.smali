.class public abstract Lorg/dmfs/provider/tasks/model/adapters/SimpleFieldAdapter;
.super Ljava/lang/Object;

# interfaces
.implements Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<FieldType:",
        "Ljava/lang/Object;",
        "EntityType:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter",
        "<TFieldType;TEntityType;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public copyValue(Landroid/content/ContentValues;Landroid/content/ContentValues;)V
    .registers 4

    invoke-virtual {p0, p1}, Lorg/dmfs/provider/tasks/model/adapters/SimpleFieldAdapter;->getFrom(Landroid/content/ContentValues;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, p2, v0}, Lorg/dmfs/provider/tasks/model/adapters/SimpleFieldAdapter;->setIn(Landroid/content/ContentValues;Ljava/lang/Object;)V

    return-void
.end method

.method public copyValue(Landroid/database/Cursor;Landroid/content/ContentValues;)V
    .registers 4

    invoke-virtual {p0, p1}, Lorg/dmfs/provider/tasks/model/adapters/SimpleFieldAdapter;->getFrom(Landroid/database/Cursor;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, p2, v0}, Lorg/dmfs/provider/tasks/model/adapters/SimpleFieldAdapter;->setIn(Landroid/content/ContentValues;Ljava/lang/Object;)V

    return-void
.end method

.method public existsIn(Landroid/content/ContentValues;)Z
    .registers 3

    invoke-virtual {p0}, Lorg/dmfs/provider/tasks/model/adapters/SimpleFieldAdapter;->fieldName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public existsIn(Landroid/database/Cursor;)Z
    .registers 5

    invoke-virtual {p0}, Lorg/dmfs/provider/tasks/model/adapters/SimpleFieldAdapter;->fieldName()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    if-gez v0, :cond_2d

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "The column \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/dmfs/provider/tasks/model/adapters/SimpleFieldAdapter;->fieldName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\' is missing in cursor."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2d
    invoke-interface {p1, v0}, Landroid/database/Cursor;->isNull(I)Z

    move-result v0

    if-nez v0, :cond_35

    const/4 v0, 0x1

    :goto_34
    return v0

    :cond_35
    const/4 v0, 0x0

    goto :goto_34
.end method

.method public existsIn(Landroid/database/Cursor;Landroid/content/ContentValues;)Z
    .registers 4

    invoke-virtual {p0, p2}, Lorg/dmfs/provider/tasks/model/adapters/SimpleFieldAdapter;->existsIn(Landroid/content/ContentValues;)Z

    move-result v0

    if-nez v0, :cond_c

    invoke-virtual {p0, p1}, Lorg/dmfs/provider/tasks/model/adapters/SimpleFieldAdapter;->existsIn(Landroid/database/Cursor;)Z

    move-result v0

    if-eqz v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method abstract fieldName()Ljava/lang/String;
.end method

.method public getFrom(Landroid/database/Cursor;Landroid/content/ContentValues;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            "Landroid/content/ContentValues;",
            ")TFieldType;"
        }
    .end annotation

    invoke-virtual {p0}, Lorg/dmfs/provider/tasks/model/adapters/SimpleFieldAdapter;->fieldName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_f

    invoke-virtual {p0, p2}, Lorg/dmfs/provider/tasks/model/adapters/SimpleFieldAdapter;->getFrom(Landroid/content/ContentValues;)Ljava/lang/Object;

    move-result-object v0

    :goto_e
    return-object v0

    :cond_f
    invoke-virtual {p0, p1}, Lorg/dmfs/provider/tasks/model/adapters/SimpleFieldAdapter;->getFrom(Landroid/database/Cursor;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_e
.end method

.method public isSetIn(Landroid/content/ContentValues;)Z
    .registers 3

    invoke-virtual {p0}, Lorg/dmfs/provider/tasks/model/adapters/SimpleFieldAdapter;->fieldName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public removeFrom(Landroid/content/ContentValues;)V
    .registers 3

    invoke-virtual {p0}, Lorg/dmfs/provider/tasks/model/adapters/SimpleFieldAdapter;->fieldName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/ContentValues;->remove(Ljava/lang/String;)V

    return-void
.end method
