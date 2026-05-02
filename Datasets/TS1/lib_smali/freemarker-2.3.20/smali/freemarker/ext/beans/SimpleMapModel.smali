.class public Lfreemarker/ext/beans/SimpleMapModel;
.super Lfreemarker/template/WrappingTemplateModel;
.source "SimpleMapModel.java"

# interfaces
.implements Lfreemarker/template/TemplateHashModelEx;
.implements Lfreemarker/template/TemplateMethodModelEx;
.implements Lfreemarker/template/AdapterTemplateModel;
.implements Lfreemarker/ext/util/WrapperTemplateModel;


# static fields
.field static final FACTORY:Lfreemarker/ext/util/ModelFactory;


# instance fields
.field private final map:Ljava/util/Map;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 82
    new-instance v0, Lfreemarker/ext/beans/SimpleMapModel$1;

    invoke-direct {v0}, Lfreemarker/ext/beans/SimpleMapModel$1;-><init>()V

    sput-object v0, Lfreemarker/ext/beans/SimpleMapModel;->FACTORY:Lfreemarker/ext/util/ModelFactory;

    return-void
.end method

.method public constructor <init>(Ljava/util/Map;Lfreemarker/ext/beans/BeansWrapper;)V
    .registers 3
    .param p1, "map"    # Ljava/util/Map;
    .param p2, "wrapper"    # Lfreemarker/ext/beans/BeansWrapper;

    .prologue
    .line 95
    invoke-direct {p0, p2}, Lfreemarker/template/WrappingTemplateModel;-><init>(Lfreemarker/template/ObjectWrapper;)V

    .line 96
    iput-object p1, p0, Lfreemarker/ext/beans/SimpleMapModel;->map:Ljava/util/Map;

    .line 97
    return-void
.end method


# virtual methods
.method public exec(Ljava/util/List;)Ljava/lang/Object;
    .registers 6
    .param p1, "args"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 118
    invoke-virtual {p0}, Lfreemarker/ext/beans/SimpleMapModel;->getObjectWrapper()Lfreemarker/template/ObjectWrapper;

    move-result-object v2

    check-cast v2, Lfreemarker/ext/beans/BeansWrapper;

    const/4 v3, 0x0

    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lfreemarker/template/TemplateModel;

    invoke-virtual {v2, v3}, Lfreemarker/ext/beans/BeansWrapper;->unwrap(Lfreemarker/template/TemplateModel;)Ljava/lang/Object;

    move-result-object v0

    .line 119
    .local v0, "key":Ljava/lang/Object;
    iget-object v2, p0, Lfreemarker/ext/beans/SimpleMapModel;->map:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 120
    .local v1, "value":Ljava/lang/Object;
    if-nez v1, :cond_23

    iget-object v2, p0, Lfreemarker/ext/beans/SimpleMapModel;->map:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_23

    .line 121
    const/4 v2, 0x0

    .line 123
    :goto_22
    return-object v2

    :cond_23
    invoke-virtual {p0, v1}, Lfreemarker/ext/beans/SimpleMapModel;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v2

    goto :goto_22
.end method

.method public get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 7
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 100
    iget-object v3, p0, Lfreemarker/ext/beans/SimpleMapModel;->map:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 101
    .local v1, "val":Ljava/lang/Object;
    if-nez v1, :cond_3b

    .line 102
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_33

    .line 104
    new-instance v0, Ljava/lang/Character;

    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-direct {v0, v3}, Ljava/lang/Character;-><init>(C)V

    .line 105
    .local v0, "charKey":Ljava/lang/Character;
    iget-object v3, p0, Lfreemarker/ext/beans/SimpleMapModel;->map:Ljava/util/Map;

    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 106
    if-nez v1, :cond_3b

    iget-object v3, p0, Lfreemarker/ext/beans/SimpleMapModel;->map:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3b

    iget-object v3, p0, Lfreemarker/ext/beans/SimpleMapModel;->map:Ljava/util/Map;

    invoke-interface {v3, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3b

    .line 114
    .end local v0    # "charKey":Ljava/lang/Character;
    :cond_32
    :goto_32
    return-object v2

    .line 110
    :cond_33
    iget-object v3, p0, Lfreemarker/ext/beans/SimpleMapModel;->map:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_32

    .line 114
    :cond_3b
    invoke-virtual {p0, v1}, Lfreemarker/ext/beans/SimpleMapModel;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v2

    goto :goto_32
.end method

.method public getAdaptedObject(Ljava/lang/Class;)Ljava/lang/Object;
    .registers 3
    .param p1, "hint"    # Ljava/lang/Class;

    .prologue
    .line 143
    iget-object v0, p0, Lfreemarker/ext/beans/SimpleMapModel;->map:Ljava/util/Map;

    return-object v0
.end method

.method public getWrappedObject()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 147
    iget-object v0, p0, Lfreemarker/ext/beans/SimpleMapModel;->map:Ljava/util/Map;

    return-object v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 127
    iget-object v0, p0, Lfreemarker/ext/beans/SimpleMapModel;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public keys()Lfreemarker/template/TemplateCollectionModel;
    .registers 5

    .prologue
    .line 135
    new-instance v0, Lfreemarker/core/CollectionAndSequence;

    new-instance v1, Lfreemarker/template/SimpleSequence;

    iget-object v2, p0, Lfreemarker/ext/beans/SimpleMapModel;->map:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-virtual {p0}, Lfreemarker/ext/beans/SimpleMapModel;->getObjectWrapper()Lfreemarker/template/ObjectWrapper;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lfreemarker/template/SimpleSequence;-><init>(Ljava/util/Collection;Lfreemarker/template/ObjectWrapper;)V

    invoke-direct {v0, v1}, Lfreemarker/core/CollectionAndSequence;-><init>(Lfreemarker/template/TemplateSequenceModel;)V

    return-object v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 131
    iget-object v0, p0, Lfreemarker/ext/beans/SimpleMapModel;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method

.method public values()Lfreemarker/template/TemplateCollectionModel;
    .registers 5

    .prologue
    .line 139
    new-instance v0, Lfreemarker/core/CollectionAndSequence;

    new-instance v1, Lfreemarker/template/SimpleSequence;

    iget-object v2, p0, Lfreemarker/ext/beans/SimpleMapModel;->map:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-virtual {p0}, Lfreemarker/ext/beans/SimpleMapModel;->getObjectWrapper()Lfreemarker/template/ObjectWrapper;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lfreemarker/template/SimpleSequence;-><init>(Ljava/util/Collection;Lfreemarker/template/ObjectWrapper;)V

    invoke-direct {v0, v1}, Lfreemarker/core/CollectionAndSequence;-><init>(Lfreemarker/template/TemplateSequenceModel;)V

    return-object v0
.end method
