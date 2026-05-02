.class public final Lorg/dmfs/provider/tasks/model/adapters/BooleanFieldAdapter;
.super Lorg/dmfs/provider/tasks/model/adapters/SimpleFieldAdapter;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<EntityType:",
        "Ljava/lang/Object;",
        ">",
        "Lorg/dmfs/provider/tasks/model/adapters/SimpleFieldAdapter",
        "<",
        "Ljava/lang/Boolean;",
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
    iput-object p1, p0, Lorg/dmfs/provider/tasks/model/adapters/BooleanFieldAdapter;->mFieldName:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method fieldName()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/adapters/BooleanFieldAdapter;->mFieldName:Ljava/lang/String;

    return-object v0
.end method

.method public getFrom(Landroid/content/ContentValues;)Ljava/lang/Boolean;
    .registers 3

    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/adapters/BooleanFieldAdapter;->mFieldName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_14

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-lez v0, :cond_14

    const/4 v0, 0x1

    :goto_f
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public getFrom(Landroid/database/Cursor;)Ljava/lang/Boolean;
    .registers 5

    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/adapters/BooleanFieldAdapter;->mFieldName:Ljava/lang/String;

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    if-gez v0, :cond_29

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "The column \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/dmfs/provider/tasks/model/adapters/BooleanFieldAdapter;->mFieldName:Ljava/lang/String;

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

    if-nez v1, :cond_3b

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    if-lez v0, :cond_3b

    const/4 v0, 0x1

    :goto_36
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :cond_3b
    const/4 v0, 0x0

    goto :goto_36
.end method

.method public bridge synthetic getFrom(Landroid/content/ContentValues;)Ljava/lang/Object;
    .registers 3

    invoke-virtual {p0, p1}, Lorg/dmfs/provider/tasks/model/adapters/BooleanFieldAdapter;->getFrom(Landroid/content/ContentValues;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getFrom(Landroid/database/Cursor;)Ljava/lang/Object;
    .registers 3

    invoke-virtual {p0, p1}, Lorg/dmfs/provider/tasks/model/adapters/BooleanFieldAdapter;->getFrom(Landroid/database/Cursor;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public setIn(Landroid/content/ContentValues;Ljava/lang/Boolean;)V
    .registers 5

    iget-object v1, p0, Lorg/dmfs/provider/tasks/model/adapters/BooleanFieldAdapter;->mFieldName:Ljava/lang/String;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_11

    const/4 v0, 0x1

    :goto_9
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    return-void

    :cond_11
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public bridge synthetic setIn(Landroid/content/ContentValues;Ljava/lang/Object;)V
    .registers 3

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p0, p1, p2}, Lorg/dmfs/provider/tasks/model/adapters/BooleanFieldAdapter;->setIn(Landroid/content/ContentValues;Ljava/lang/Boolean;)V

    return-void
.end method
