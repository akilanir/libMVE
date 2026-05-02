.class public Lfreemarker/ext/beans/CollectionModel;
.super Lfreemarker/ext/beans/StringModel;
.source "CollectionModel.java"

# interfaces
.implements Lfreemarker/template/TemplateCollectionModel;
.implements Lfreemarker/template/TemplateSequenceModel;


# static fields
.field static final FACTORY:Lfreemarker/ext/util/ModelFactory;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 79
    new-instance v0, Lfreemarker/ext/beans/CollectionModel$1;

    invoke-direct {v0}, Lfreemarker/ext/beans/CollectionModel$1;-><init>()V

    sput-object v0, Lfreemarker/ext/beans/CollectionModel;->FACTORY:Lfreemarker/ext/util/ModelFactory;

    return-void
.end method

.method public constructor <init>(Ljava/util/Collection;Lfreemarker/ext/beans/BeansWrapper;)V
    .registers 3
    .param p1, "collection"    # Ljava/util/Collection;
    .param p2, "wrapper"    # Lfreemarker/ext/beans/BeansWrapper;

    .prologue
    .line 99
    invoke-direct {p0, p1, p2}, Lfreemarker/ext/beans/StringModel;-><init>(Ljava/lang/Object;Lfreemarker/ext/beans/BeansWrapper;)V

    .line 100
    return-void
.end method


# virtual methods
.method public get(I)Lfreemarker/template/TemplateModel;
    .registers 6
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 112
    iget-object v1, p0, Lfreemarker/ext/beans/CollectionModel;->object:Ljava/lang/Object;

    instance-of v1, v1, Ljava/util/List;

    if-eqz v1, :cond_16

    .line 116
    :try_start_6
    iget-object v1, p0, Lfreemarker/ext/beans/CollectionModel;->object:Ljava/lang/Object;

    check-cast v1, Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Lfreemarker/ext/beans/CollectionModel;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;
    :try_end_11
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_6 .. :try_end_11} :catch_13

    move-result-object v1

    .line 120
    :goto_12
    return-object v1

    .line 118
    :catch_13
    move-exception v0

    .line 120
    .local v0, "e":Ljava/lang/IndexOutOfBoundsException;
    const/4 v1, 0x0

    goto :goto_12

    .line 126
    .end local v0    # "e":Ljava/lang/IndexOutOfBoundsException;
    :cond_16
    new-instance v1, Lfreemarker/template/TemplateModelException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Underlying collection is not a list, it\'s "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lfreemarker/ext/beans/CollectionModel;->object:Ljava/lang/Object;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getSupportsIndexedAccess()Z
    .registers 2

    .prologue
    .line 140
    iget-object v0, p0, Lfreemarker/ext/beans/CollectionModel;->object:Ljava/lang/Object;

    instance-of v0, v0, Ljava/util/List;

    return v0
.end method

.method public iterator()Lfreemarker/template/TemplateModelIterator;
    .registers 4

    .prologue
    .line 145
    new-instance v1, Lfreemarker/ext/beans/IteratorModel;

    iget-object v0, p0, Lfreemarker/ext/beans/CollectionModel;->object:Ljava/lang/Object;

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    iget-object v2, p0, Lfreemarker/ext/beans/CollectionModel;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    invoke-direct {v1, v0, v2}, Lfreemarker/ext/beans/IteratorModel;-><init>(Ljava/util/Iterator;Lfreemarker/ext/beans/BeansWrapper;)V

    return-object v1
.end method

.method public size()I
    .registers 2

    .prologue
    .line 150
    iget-object v0, p0, Lfreemarker/ext/beans/CollectionModel;->object:Ljava/lang/Object;

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v0

    return v0
.end method
