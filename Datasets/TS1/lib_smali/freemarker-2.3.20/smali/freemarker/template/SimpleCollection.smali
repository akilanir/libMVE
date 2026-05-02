.class public Lfreemarker/template/SimpleCollection;
.super Lfreemarker/template/WrappingTemplateModel;
.source "SimpleCollection.java"

# interfaces
.implements Lfreemarker/template/TemplateCollectionModel;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/template/SimpleCollection$SimpleTemplateModelIterator;
    }
.end annotation


# instance fields
.field private collection:Ljava/util/Collection;

.field private iterator:Ljava/util/Iterator;

.field private iteratorDirty:Z


# direct methods
.method public constructor <init>(Ljava/util/Collection;)V
    .registers 2
    .param p1, "collection"    # Ljava/util/Collection;

    .prologue
    .line 85
    invoke-direct {p0}, Lfreemarker/template/WrappingTemplateModel;-><init>()V

    .line 86
    iput-object p1, p0, Lfreemarker/template/SimpleCollection;->collection:Ljava/util/Collection;

    .line 87
    return-void
.end method

.method public constructor <init>(Ljava/util/Collection;Lfreemarker/template/ObjectWrapper;)V
    .registers 3
    .param p1, "collection"    # Ljava/util/Collection;
    .param p2, "wrapper"    # Lfreemarker/template/ObjectWrapper;

    .prologue
    .line 95
    invoke-direct {p0, p2}, Lfreemarker/template/WrappingTemplateModel;-><init>(Lfreemarker/template/ObjectWrapper;)V

    .line 96
    iput-object p1, p0, Lfreemarker/template/SimpleCollection;->collection:Ljava/util/Collection;

    .line 97
    return-void
.end method

.method public constructor <init>(Ljava/util/Iterator;)V
    .registers 2
    .param p1, "iterator"    # Ljava/util/Iterator;

    .prologue
    .line 81
    invoke-direct {p0}, Lfreemarker/template/WrappingTemplateModel;-><init>()V

    .line 82
    iput-object p1, p0, Lfreemarker/template/SimpleCollection;->iterator:Ljava/util/Iterator;

    .line 83
    return-void
.end method

.method public constructor <init>(Ljava/util/Iterator;Lfreemarker/template/ObjectWrapper;)V
    .registers 3
    .param p1, "iterator"    # Ljava/util/Iterator;
    .param p2, "wrapper"    # Lfreemarker/template/ObjectWrapper;

    .prologue
    .line 90
    invoke-direct {p0, p2}, Lfreemarker/template/WrappingTemplateModel;-><init>(Lfreemarker/template/ObjectWrapper;)V

    .line 91
    iput-object p1, p0, Lfreemarker/template/SimpleCollection;->iterator:Ljava/util/Iterator;

    .line 92
    return-void
.end method

.method static access$000(Lfreemarker/template/SimpleCollection;)Z
    .registers 2
    .param p0, "x0"    # Lfreemarker/template/SimpleCollection;

    .prologue
    .line 74
    iget-boolean v0, p0, Lfreemarker/template/SimpleCollection;->iteratorDirty:Z

    return v0
.end method

.method static access$002(Lfreemarker/template/SimpleCollection;Z)Z
    .registers 2
    .param p0, "x0"    # Lfreemarker/template/SimpleCollection;
    .param p1, "x1"    # Z

    .prologue
    .line 74
    iput-boolean p1, p0, Lfreemarker/template/SimpleCollection;->iteratorDirty:Z

    return p1
.end method


# virtual methods
.method public iterator()Lfreemarker/template/TemplateModelIterator;
    .registers 5

    .prologue
    .line 109
    iget-object v0, p0, Lfreemarker/template/SimpleCollection;->iterator:Ljava/util/Iterator;

    if-eqz v0, :cond_d

    .line 110
    new-instance v0, Lfreemarker/template/SimpleCollection$SimpleTemplateModelIterator;

    iget-object v1, p0, Lfreemarker/template/SimpleCollection;->iterator:Ljava/util/Iterator;

    const/4 v2, 0x1

    invoke-direct {v0, p0, v1, v2}, Lfreemarker/template/SimpleCollection$SimpleTemplateModelIterator;-><init>(Lfreemarker/template/SimpleCollection;Ljava/util/Iterator;Z)V

    .line 113
    :goto_c
    return-object v0

    .line 112
    :cond_d
    iget-object v1, p0, Lfreemarker/template/SimpleCollection;->collection:Ljava/util/Collection;

    monitor-enter v1

    .line 113
    :try_start_10
    new-instance v0, Lfreemarker/template/SimpleCollection$SimpleTemplateModelIterator;

    iget-object v2, p0, Lfreemarker/template/SimpleCollection;->collection:Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v0, p0, v2, v3}, Lfreemarker/template/SimpleCollection$SimpleTemplateModelIterator;-><init>(Lfreemarker/template/SimpleCollection;Ljava/util/Iterator;Z)V

    monitor-exit v1

    goto :goto_c

    .line 114
    :catchall_1e
    move-exception v0

    monitor-exit v1
    :try_end_20
    .catchall {:try_start_10 .. :try_end_20} :catchall_1e

    throw v0
.end method
