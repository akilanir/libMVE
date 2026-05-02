.class public final Lfreemarker/core/CollectionAndSequence;
.super Ljava/lang/Object;
.source "CollectionAndSequence.java"

# interfaces
.implements Lfreemarker/template/TemplateCollectionModel;
.implements Lfreemarker/template/TemplateSequenceModel;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/core/CollectionAndSequence$SequenceIterator;
    }
.end annotation


# instance fields
.field private collection:Lfreemarker/template/TemplateCollectionModel;

.field private data:Ljava/util/ArrayList;

.field private sequence:Lfreemarker/template/TemplateSequenceModel;


# direct methods
.method public constructor <init>(Lfreemarker/template/TemplateCollectionModel;)V
    .registers 2
    .param p1, "collection"    # Lfreemarker/template/TemplateCollectionModel;

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    iput-object p1, p0, Lfreemarker/core/CollectionAndSequence;->collection:Lfreemarker/template/TemplateCollectionModel;

    .line 77
    return-void
.end method

.method public constructor <init>(Lfreemarker/template/TemplateSequenceModel;)V
    .registers 2
    .param p1, "sequence"    # Lfreemarker/template/TemplateSequenceModel;

    .prologue
    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    iput-object p1, p0, Lfreemarker/core/CollectionAndSequence;->sequence:Lfreemarker/template/TemplateSequenceModel;

    .line 81
    return-void
.end method

.method private initSequence()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 110
    iget-object v1, p0, Lfreemarker/core/CollectionAndSequence;->data:Ljava/util/ArrayList;

    if-nez v1, :cond_21

    .line 111
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lfreemarker/core/CollectionAndSequence;->data:Ljava/util/ArrayList;

    .line 112
    iget-object v1, p0, Lfreemarker/core/CollectionAndSequence;->collection:Lfreemarker/template/TemplateCollectionModel;

    invoke-interface {v1}, Lfreemarker/template/TemplateCollectionModel;->iterator()Lfreemarker/template/TemplateModelIterator;

    move-result-object v0

    .line 113
    .local v0, "it":Lfreemarker/template/TemplateModelIterator;
    :goto_11
    invoke-interface {v0}, Lfreemarker/template/TemplateModelIterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_21

    .line 114
    iget-object v1, p0, Lfreemarker/core/CollectionAndSequence;->data:Ljava/util/ArrayList;

    invoke-interface {v0}, Lfreemarker/template/TemplateModelIterator;->next()Lfreemarker/template/TemplateModel;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_11

    .line 117
    .end local v0    # "it":Lfreemarker/template/TemplateModelIterator;
    :cond_21
    return-void
.end method


# virtual methods
.method public get(I)Lfreemarker/template/TemplateModel;
    .registers 3
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 92
    iget-object v0, p0, Lfreemarker/core/CollectionAndSequence;->sequence:Lfreemarker/template/TemplateSequenceModel;

    if-eqz v0, :cond_b

    .line 93
    iget-object v0, p0, Lfreemarker/core/CollectionAndSequence;->sequence:Lfreemarker/template/TemplateSequenceModel;

    invoke-interface {v0, p1}, Lfreemarker/template/TemplateSequenceModel;->get(I)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 96
    :goto_a
    return-object v0

    .line 95
    :cond_b
    invoke-direct {p0}, Lfreemarker/core/CollectionAndSequence;->initSequence()V

    .line 96
    iget-object v0, p0, Lfreemarker/core/CollectionAndSequence;->data:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/template/TemplateModel;

    goto :goto_a
.end method

.method public iterator()Lfreemarker/template/TemplateModelIterator;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 84
    iget-object v0, p0, Lfreemarker/core/CollectionAndSequence;->collection:Lfreemarker/template/TemplateCollectionModel;

    if-eqz v0, :cond_b

    .line 85
    iget-object v0, p0, Lfreemarker/core/CollectionAndSequence;->collection:Lfreemarker/template/TemplateCollectionModel;

    invoke-interface {v0}, Lfreemarker/template/TemplateCollectionModel;->iterator()Lfreemarker/template/TemplateModelIterator;

    move-result-object v0

    .line 87
    :goto_a
    return-object v0

    :cond_b
    new-instance v0, Lfreemarker/core/CollectionAndSequence$SequenceIterator;

    iget-object v1, p0, Lfreemarker/core/CollectionAndSequence;->sequence:Lfreemarker/template/TemplateSequenceModel;

    invoke-direct {v0, v1}, Lfreemarker/core/CollectionAndSequence$SequenceIterator;-><init>(Lfreemarker/template/TemplateSequenceModel;)V

    goto :goto_a
.end method

.method public size()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 101
    iget-object v0, p0, Lfreemarker/core/CollectionAndSequence;->sequence:Lfreemarker/template/TemplateSequenceModel;

    if-eqz v0, :cond_b

    .line 102
    iget-object v0, p0, Lfreemarker/core/CollectionAndSequence;->sequence:Lfreemarker/template/TemplateSequenceModel;

    invoke-interface {v0}, Lfreemarker/template/TemplateSequenceModel;->size()I

    move-result v0

    .line 105
    :goto_a
    return v0

    .line 104
    :cond_b
    invoke-direct {p0}, Lfreemarker/core/CollectionAndSequence;->initSequence()V

    .line 105
    iget-object v0, p0, Lfreemarker/core/CollectionAndSequence;->data:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    goto :goto_a
.end method
