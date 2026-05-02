.class public Lorg/dmfs/provider/tasks/processors/lists/ListValidatorProcessor;
.super Lorg/dmfs/provider/tasks/processors/AbstractEntityProcessor;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/dmfs/provider/tasks/processors/AbstractEntityProcessor",
        "<",
        "Lorg/dmfs/provider/tasks/model/ListAdapter;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lorg/dmfs/provider/tasks/processors/AbstractEntityProcessor;-><init>()V

    return-void
.end method

.method private verifyCommon(Lorg/dmfs/provider/tasks/model/ListAdapter;Z)V
    .registers 5

    sget-object v0, Lorg/dmfs/provider/tasks/model/ListAdapter;->_ID:Lorg/dmfs/provider/tasks/model/adapters/LongFieldAdapter;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/ListAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-eqz v0, :cond_10

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "_ID can not be set manually"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_10
    if-eqz p2, :cond_13

    :cond_12
    return-void

    :cond_13
    sget-object v0, Lorg/dmfs/provider/tasks/model/ListAdapter;->LIST_COLOR:Lorg/dmfs/provider/tasks/model/adapters/IntegerFieldAdapter;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/ListAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-eqz v0, :cond_23

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Only sync adapters can change the LIST_COLOR."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_23
    sget-object v0, Lorg/dmfs/provider/tasks/model/ListAdapter;->LIST_NAME:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/ListAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-eqz v0, :cond_33

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Only sync adapters can change the LIST_NAME."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_33
    sget-object v0, Lorg/dmfs/provider/tasks/model/ListAdapter;->SYNC_ID:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/ListAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-eqz v0, :cond_43

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Only sync adapters can change the _SYNC_ID."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_43
    sget-object v0, Lorg/dmfs/provider/tasks/model/ListAdapter;->SYNC_VERSION:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/ListAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-eqz v0, :cond_53

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Only sync adapters can change SYNC_VERSION."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_53
    sget-object v0, Lorg/dmfs/provider/tasks/model/ListAdapter;->OWNER:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/ListAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-eqz v0, :cond_12

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Only sync adapters can change the list OWNER."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public bridge synthetic beforeDelete(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/EntityAdapter;Z)V
    .registers 4

    check-cast p2, Lorg/dmfs/provider/tasks/model/ListAdapter;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/provider/tasks/processors/lists/ListValidatorProcessor;->beforeDelete(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/ListAdapter;Z)V

    return-void
.end method

.method public beforeDelete(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/ListAdapter;Z)V
    .registers 6

    if-nez p3, :cond_a

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Caller must be a sync adapter to delete task lists"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_a
    return-void
.end method

.method public bridge synthetic beforeInsert(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/EntityAdapter;Z)V
    .registers 4

    check-cast p2, Lorg/dmfs/provider/tasks/model/ListAdapter;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/provider/tasks/processors/lists/ListValidatorProcessor;->beforeInsert(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/ListAdapter;Z)V

    return-void
.end method

.method public beforeInsert(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/ListAdapter;Z)V
    .registers 6

    if-nez p3, :cond_a

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Caller must be a sync adapter to create task lists"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_a
    sget-object v0, Lorg/dmfs/provider/tasks/model/ListAdapter;->ACCOUNT_NAME:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    invoke-interface {p2, v0}, Lorg/dmfs/provider/tasks/model/ListAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_20

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "ACCOUNT_NAME is required on INSERT"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_20
    sget-object v0, Lorg/dmfs/provider/tasks/model/ListAdapter;->ACCOUNT_TYPE:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    invoke-interface {p2, v0}, Lorg/dmfs/provider/tasks/model/ListAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_36

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "ACCOUNT_TYPE is required on INSERT"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_36
    invoke-direct {p0, p2, p3}, Lorg/dmfs/provider/tasks/processors/lists/ListValidatorProcessor;->verifyCommon(Lorg/dmfs/provider/tasks/model/ListAdapter;Z)V

    return-void
.end method

.method public bridge synthetic beforeUpdate(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/EntityAdapter;Z)V
    .registers 4

    check-cast p2, Lorg/dmfs/provider/tasks/model/ListAdapter;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/provider/tasks/processors/lists/ListValidatorProcessor;->beforeUpdate(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/ListAdapter;Z)V

    return-void
.end method

.method public beforeUpdate(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/ListAdapter;Z)V
    .registers 6

    sget-object v0, Lorg/dmfs/provider/tasks/model/ListAdapter;->ACCOUNT_NAME:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    invoke-interface {p2, v0}, Lorg/dmfs/provider/tasks/model/ListAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-eqz v0, :cond_10

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "ACCOUNT_NAME is write-once"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_10
    sget-object v0, Lorg/dmfs/provider/tasks/model/ListAdapter;->ACCOUNT_TYPE:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    invoke-interface {p2, v0}, Lorg/dmfs/provider/tasks/model/ListAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-eqz v0, :cond_20

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "ACCOUNT_TYPE is write-once"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_20
    invoke-direct {p0, p2, p3}, Lorg/dmfs/provider/tasks/processors/lists/ListValidatorProcessor;->verifyCommon(Lorg/dmfs/provider/tasks/model/ListAdapter;Z)V

    return-void
.end method
