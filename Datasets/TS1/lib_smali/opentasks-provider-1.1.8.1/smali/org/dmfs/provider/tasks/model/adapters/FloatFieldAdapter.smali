.class public final Lorg/dmfs/provider/tasks/model/adapters/FloatFieldAdapter;
.super Lorg/dmfs/provider/tasks/model/adapters/SimpleFieldAdapter;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<EntityType:",
        "Ljava/lang/Object;",
        ">",
        "Lorg/dmfs/provider/tasks/model/adapters/SimpleFieldAdapter",
        "<",
        "Ljava/lang/Float;",
        "TEntityType;>;"
    }
.end annotation


# instance fields
.field private final mFieldName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 4

    invoke-direct {p0}, Lorg/dmfs/provider/tasks/model/adapters/SimpleFieldAdapter;-><init>()V

    if-nez p1, :cond_d

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "fieldName must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_d
    iput-object p1, p0, Lorg/dmfs/provider/tasks/model/adapters/FloatFieldAdapter;->mFieldName:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method fieldName()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/adapters/FloatFieldAdapter;->mFieldName:Ljava/lang/String;

    return-object v0
.end method

.method public getFrom(Landroid/content/ContentValues;)Ljava/lang/Float;
    .registers 3

    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/adapters/FloatFieldAdapter;->mFieldName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/content/ContentValues;->getAsFloat(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v0

    return-object v0
.end method

.method public getFrom(Landroid/database/Cursor;)Ljava/lang/Float;
    .registers 5

    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/adapters/FloatFieldAdapter;->mFieldName:Ljava/lang/String;

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    if-gez v0, :cond_29

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "The column \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/dmfs/provider/tasks/model/adapters/FloatFieldAdapter;->mFieldName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\' is missing in cursor."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_29
    invoke-interface {p1, v0}, Landroid/database/Cursor;->isNull(I)Z

    move-result v1

    if-eqz v1, :cond_31

    const/4 v0, 0x0

    :goto_30
    return-object v0

    :cond_31
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getFloat(I)F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    goto :goto_30
.end method

.method public bridge synthetic getFrom(Landroid/content/ContentValues;)Ljava/lang/Object;
    .registers 3

    invoke-virtual {p0, p1}, Lorg/dmfs/provider/tasks/model/adapters/FloatFieldAdapter;->getFrom(Landroid/content/ContentValues;)Ljava/lang/Float;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getFrom(Landroid/database/Cursor;)Ljava/lang/Object;
    .registers 3

    invoke-virtual {p0, p1}, Lorg/dmfs/provider/tasks/model/adapters/FloatFieldAdapter;->getFrom(Landroid/database/Cursor;)Ljava/lang/Float;

    move-result-object v0

    return-object v0
.end method

.method public setIn(Landroid/content/ContentValues;Ljava/lang/Float;)V
    .registers 4

    if-eqz p2, :cond_8

    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/adapters/FloatFieldAdapter;->mFieldName:Ljava/lang/String;

    invoke-virtual {p1, v0, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Float;)V

    :goto_7
    return-void

    :cond_8
    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/adapters/FloatFieldAdapter;->mFieldName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    goto :goto_7
.end method

.method public bridge synthetic setIn(Landroid/content/ContentValues;Ljava/lang/Object;)V
    .registers 3

    check-cast p2, Ljava/lang/Float;

    invoke-virtual {p0, p1, p2}, Lorg/dmfs/provider/tasks/model/adapters/FloatFieldAdapter;->setIn(Landroid/content/ContentValues;Ljava/lang/Float;)V

    return-void
.end method
