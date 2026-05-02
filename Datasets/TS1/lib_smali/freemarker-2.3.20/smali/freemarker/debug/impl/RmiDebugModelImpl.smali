.class Lfreemarker/debug/impl/RmiDebugModelImpl;
.super Ljava/rmi/server/UnicastRemoteObject;
.source "RmiDebugModelImpl.java"

# interfaces
.implements Lfreemarker/debug/DebugModel;


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final model:Lfreemarker/template/TemplateModel;

.field private final type:I


# direct methods
.method constructor <init>(Lfreemarker/template/TemplateModel;I)V
    .registers 4
    .param p1, "model"    # Lfreemarker/template/TemplateModel;
    .param p2, "extraTypes"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/rmi/RemoteException;
        }
    .end annotation

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/rmi/server/UnicastRemoteObject;-><init>()V

    .line 38
    iput-object p1, p0, Lfreemarker/debug/impl/RmiDebugModelImpl;->model:Lfreemarker/template/TemplateModel;

    .line 39
    invoke-static {p1}, Lfreemarker/debug/impl/RmiDebugModelImpl;->calculateType(Lfreemarker/template/TemplateModel;)I

    move-result v0

    add-int/2addr v0, p2

    iput v0, p0, Lfreemarker/debug/impl/RmiDebugModelImpl;->type:I

    .line 40
    return-void
.end method

.method private static calculateType(Lfreemarker/template/TemplateModel;)I
    .registers 3
    .param p0, "model"    # Lfreemarker/template/TemplateModel;

    .prologue
    .line 142
    const/4 v0, 0x0

    .line 143
    .local v0, "type":I
    instance-of v1, p0, Lfreemarker/template/TemplateScalarModel;

    if-eqz v1, :cond_7

    add-int/lit8 v0, v0, 0x1

    .line 144
    :cond_7
    instance-of v1, p0, Lfreemarker/template/TemplateNumberModel;

    if-eqz v1, :cond_d

    add-int/lit8 v0, v0, 0x2

    .line 145
    :cond_d
    instance-of v1, p0, Lfreemarker/template/TemplateDateModel;

    if-eqz v1, :cond_13

    add-int/lit8 v0, v0, 0x4

    .line 146
    :cond_13
    instance-of v1, p0, Lfreemarker/template/TemplateBooleanModel;

    if-eqz v1, :cond_19

    add-int/lit8 v0, v0, 0x8

    .line 147
    :cond_19
    instance-of v1, p0, Lfreemarker/template/TemplateSequenceModel;

    if-eqz v1, :cond_1f

    add-int/lit8 v0, v0, 0x10

    .line 148
    :cond_1f
    instance-of v1, p0, Lfreemarker/template/TemplateCollectionModel;

    if-eqz v1, :cond_25

    add-int/lit8 v0, v0, 0x20

    .line 149
    :cond_25
    instance-of v1, p0, Lfreemarker/template/TemplateHashModelEx;

    if-eqz v1, :cond_38

    add-int/lit16 v0, v0, 0x80

    .line 151
    :cond_2b
    :goto_2b
    instance-of v1, p0, Lfreemarker/template/TemplateMethodModelEx;

    if-eqz v1, :cond_3f

    add-int/lit16 v0, v0, 0x200

    .line 153
    :cond_31
    :goto_31
    instance-of v1, p0, Lfreemarker/template/TemplateTransformModel;

    if-eqz v1, :cond_37

    add-int/lit16 v0, v0, 0x400

    .line 154
    :cond_37
    return v0

    .line 150
    :cond_38
    instance-of v1, p0, Lfreemarker/template/TemplateHashModel;

    if-eqz v1, :cond_2b

    add-int/lit8 v0, v0, 0x40

    goto :goto_2b

    .line 152
    :cond_3f
    instance-of v1, p0, Lfreemarker/template/TemplateMethodModel;

    if-eqz v1, :cond_31

    add-int/lit16 v0, v0, 0x100

    goto :goto_31
.end method

.method private static getDebugModel(Lfreemarker/template/TemplateModel;)Lfreemarker/debug/DebugModel;
    .registers 2
    .param p0, "tm"    # Lfreemarker/template/TemplateModel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/rmi/RemoteException;
        }
    .end annotation

    .prologue
    .line 44
    invoke-static {p0}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl;->getCachedWrapperFor(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/debug/DebugModel;

    return-object v0
.end method


# virtual methods
.method public get(I)Lfreemarker/debug/DebugModel;
    .registers 3
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;,
            Ljava/rmi/RemoteException;
        }
    .end annotation

    .prologue
    .line 82
    iget-object v0, p0, Lfreemarker/debug/impl/RmiDebugModelImpl;->model:Lfreemarker/template/TemplateModel;

    check-cast v0, Lfreemarker/template/TemplateSequenceModel;

    invoke-interface {v0, p1}, Lfreemarker/template/TemplateSequenceModel;->get(I)Lfreemarker/template/TemplateModel;

    move-result-object v0

    invoke-static {v0}, Lfreemarker/debug/impl/RmiDebugModelImpl;->getDebugModel(Lfreemarker/template/TemplateModel;)Lfreemarker/debug/DebugModel;

    move-result-object v0

    return-object v0
.end method

.method public get(Ljava/lang/String;)Lfreemarker/debug/DebugModel;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;,
            Ljava/rmi/RemoteException;
        }
    .end annotation

    .prologue
    .line 109
    iget-object v0, p0, Lfreemarker/debug/impl/RmiDebugModelImpl;->model:Lfreemarker/template/TemplateModel;

    check-cast v0, Lfreemarker/template/TemplateHashModel;

    invoke-interface {v0, p1}, Lfreemarker/template/TemplateHashModel;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    invoke-static {v0}, Lfreemarker/debug/impl/RmiDebugModelImpl;->getDebugModel(Lfreemarker/template/TemplateModel;)Lfreemarker/debug/DebugModel;

    move-result-object v0

    return-object v0
.end method

.method public get(II)[Lfreemarker/debug/DebugModel;
    .registers 8
    .param p1, "fromIndex"    # I
    .param p2, "toIndex"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;,
            Ljava/rmi/RemoteException;
        }
    .end annotation

    .prologue
    .line 87
    sub-int v3, p2, p1

    new-array v0, v3, [Lfreemarker/debug/DebugModel;

    .line 88
    .local v0, "dm":[Lfreemarker/debug/DebugModel;
    iget-object v2, p0, Lfreemarker/debug/impl/RmiDebugModelImpl;->model:Lfreemarker/template/TemplateModel;

    check-cast v2, Lfreemarker/template/TemplateSequenceModel;

    .line 89
    .local v2, "s":Lfreemarker/template/TemplateSequenceModel;
    move v1, p1

    .local v1, "i":I
    :goto_9
    if-ge v1, p2, :cond_1a

    .line 91
    sub-int v3, v1, p1

    invoke-interface {v2, v1}, Lfreemarker/template/TemplateSequenceModel;->get(I)Lfreemarker/template/TemplateModel;

    move-result-object v4

    invoke-static {v4}, Lfreemarker/debug/impl/RmiDebugModelImpl;->getDebugModel(Lfreemarker/template/TemplateModel;)Lfreemarker/debug/DebugModel;

    move-result-object v4

    aput-object v4, v0, v3

    .line 89
    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    .line 93
    :cond_1a
    return-object v0
.end method

.method public get([Ljava/lang/String;)[Lfreemarker/debug/DebugModel;
    .registers 6
    .param p1, "keys"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;,
            Ljava/rmi/RemoteException;
        }
    .end annotation

    .prologue
    .line 114
    array-length v3, p1

    new-array v0, v3, [Lfreemarker/debug/DebugModel;

    .line 115
    .local v0, "dm":[Lfreemarker/debug/DebugModel;
    iget-object v1, p0, Lfreemarker/debug/impl/RmiDebugModelImpl;->model:Lfreemarker/template/TemplateModel;

    check-cast v1, Lfreemarker/template/TemplateHashModel;

    .line 116
    .local v1, "h":Lfreemarker/template/TemplateHashModel;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_8
    array-length v3, p1

    if-ge v2, v3, :cond_1a

    .line 118
    aget-object v3, p1, v2

    invoke-interface {v1, v3}, Lfreemarker/template/TemplateHashModel;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v3

    invoke-static {v3}, Lfreemarker/debug/impl/RmiDebugModelImpl;->getDebugModel(Lfreemarker/template/TemplateModel;)Lfreemarker/debug/DebugModel;

    move-result-object v3

    aput-object v3, v0, v2

    .line 116
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 120
    :cond_1a
    return-object v0
.end method

.method public getAsBoolean()Z
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 68
    iget-object v0, p0, Lfreemarker/debug/impl/RmiDebugModelImpl;->model:Lfreemarker/template/TemplateModel;

    check-cast v0, Lfreemarker/template/TemplateBooleanModel;

    invoke-interface {v0}, Lfreemarker/template/TemplateBooleanModel;->getAsBoolean()Z

    move-result v0

    return v0
.end method

.method public getAsDate()Ljava/util/Date;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 58
    iget-object v0, p0, Lfreemarker/debug/impl/RmiDebugModelImpl;->model:Lfreemarker/template/TemplateModel;

    check-cast v0, Lfreemarker/template/TemplateDateModel;

    invoke-interface {v0}, Lfreemarker/template/TemplateDateModel;->getAsDate()Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public getAsNumber()Ljava/lang/Number;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 53
    iget-object v0, p0, Lfreemarker/debug/impl/RmiDebugModelImpl;->model:Lfreemarker/template/TemplateModel;

    check-cast v0, Lfreemarker/template/TemplateNumberModel;

    invoke-interface {v0}, Lfreemarker/template/TemplateNumberModel;->getAsNumber()Ljava/lang/Number;

    move-result-object v0

    return-object v0
.end method

.method public getAsString()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 48
    iget-object v0, p0, Lfreemarker/debug/impl/RmiDebugModelImpl;->model:Lfreemarker/template/TemplateModel;

    check-cast v0, Lfreemarker/template/TemplateScalarModel;

    invoke-interface {v0}, Lfreemarker/template/TemplateScalarModel;->getAsString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCollection()[Lfreemarker/debug/DebugModel;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;,
            Ljava/rmi/RemoteException;
        }
    .end annotation

    .prologue
    .line 98
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 99
    .local v1, "list":Ljava/util/List;
    iget-object v2, p0, Lfreemarker/debug/impl/RmiDebugModelImpl;->model:Lfreemarker/template/TemplateModel;

    check-cast v2, Lfreemarker/template/TemplateCollectionModel;

    invoke-interface {v2}, Lfreemarker/template/TemplateCollectionModel;->iterator()Lfreemarker/template/TemplateModelIterator;

    move-result-object v0

    .line 100
    .local v0, "i":Lfreemarker/template/TemplateModelIterator;
    :goto_d
    invoke-interface {v0}, Lfreemarker/template/TemplateModelIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1f

    .line 102
    invoke-interface {v0}, Lfreemarker/template/TemplateModelIterator;->next()Lfreemarker/template/TemplateModel;

    move-result-object v2

    invoke-static {v2}, Lfreemarker/debug/impl/RmiDebugModelImpl;->getDebugModel(Lfreemarker/template/TemplateModel;)Lfreemarker/debug/DebugModel;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_d

    .line 104
    :cond_1f
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [Lfreemarker/debug/DebugModel;

    invoke-interface {v1, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lfreemarker/debug/DebugModel;

    check-cast v2, [Lfreemarker/debug/DebugModel;

    return-object v2
.end method

.method public getDateType()I
    .registers 2

    .prologue
    .line 63
    iget-object v0, p0, Lfreemarker/debug/impl/RmiDebugModelImpl;->model:Lfreemarker/template/TemplateModel;

    check-cast v0, Lfreemarker/template/TemplateDateModel;

    invoke-interface {v0}, Lfreemarker/template/TemplateDateModel;->getDateType()I

    move-result v0

    return v0
.end method

.method public getModelTypes()I
    .registers 2

    .prologue
    .line 137
    iget v0, p0, Lfreemarker/debug/impl/RmiDebugModelImpl;->type:I

    return v0
.end method

.method public keys()[Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 125
    iget-object v0, p0, Lfreemarker/debug/impl/RmiDebugModelImpl;->model:Lfreemarker/template/TemplateModel;

    check-cast v0, Lfreemarker/template/TemplateHashModelEx;

    .line 126
    .local v0, "h":Lfreemarker/template/TemplateHashModelEx;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 127
    .local v2, "list":Ljava/util/List;
    invoke-interface {v0}, Lfreemarker/template/TemplateHashModelEx;->keys()Lfreemarker/template/TemplateCollectionModel;

    move-result-object v3

    invoke-interface {v3}, Lfreemarker/template/TemplateCollectionModel;->iterator()Lfreemarker/template/TemplateModelIterator;

    move-result-object v1

    .line 128
    .local v1, "i":Lfreemarker/template/TemplateModelIterator;
    :goto_11
    invoke-interface {v1}, Lfreemarker/template/TemplateModelIterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_25

    .line 130
    invoke-interface {v1}, Lfreemarker/template/TemplateModelIterator;->next()Lfreemarker/template/TemplateModel;

    move-result-object v3

    check-cast v3, Lfreemarker/template/TemplateScalarModel;

    invoke-interface {v3}, Lfreemarker/template/TemplateScalarModel;->getAsString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_11

    .line 132
    :cond_25
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    new-array v3, v3, [Ljava/lang/String;

    invoke-interface {v2, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    check-cast v3, [Ljava/lang/String;

    return-object v3
.end method

.method public size()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 73
    iget-object v0, p0, Lfreemarker/debug/impl/RmiDebugModelImpl;->model:Lfreemarker/template/TemplateModel;

    instance-of v0, v0, Lfreemarker/template/TemplateSequenceModel;

    if-eqz v0, :cond_f

    .line 75
    iget-object v0, p0, Lfreemarker/debug/impl/RmiDebugModelImpl;->model:Lfreemarker/template/TemplateModel;

    check-cast v0, Lfreemarker/template/TemplateSequenceModel;

    invoke-interface {v0}, Lfreemarker/template/TemplateSequenceModel;->size()I

    move-result v0

    .line 77
    :goto_e
    return v0

    :cond_f
    iget-object v0, p0, Lfreemarker/debug/impl/RmiDebugModelImpl;->model:Lfreemarker/template/TemplateModel;

    check-cast v0, Lfreemarker/template/TemplateHashModelEx;

    invoke-interface {v0}, Lfreemarker/template/TemplateHashModelEx;->size()I

    move-result v0

    goto :goto_e
.end method
