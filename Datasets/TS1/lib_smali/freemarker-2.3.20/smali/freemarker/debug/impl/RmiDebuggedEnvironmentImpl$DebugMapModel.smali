.class abstract Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugMapModel;
.super Ljava/lang/Object;
.source "RmiDebuggedEnvironmentImpl.java"

# interfaces
.implements Lfreemarker/template/TemplateHashModelEx;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "DebugMapModel"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 133
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method constructor <init>(Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$1;)V
    .registers 2
    .param p1, "x0"    # Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$1;

    .prologue
    .line 133
    invoke-direct {p0}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugMapModel;-><init>()V

    return-void
.end method

.method static composeList(Ljava/util/Collection;Ljava/util/Collection;)Ljava/util/List;
    .registers 3
    .param p0, "c1"    # Ljava/util/Collection;
    .param p1, "c2"    # Ljava/util/Collection;

    .prologue
    .line 166
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 167
    .local v0, "list":Ljava/util/List;
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 168
    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 169
    return-object v0
.end method


# virtual methods
.method public isEmpty()Z
    .registers 2

    .prologue
    .line 159
    invoke-virtual {p0}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugMapModel;->size()I

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method abstract keySet()Ljava/util/Collection;
.end method

.method public keys()Lfreemarker/template/TemplateCollectionModel;
    .registers 3

    .prologue
    .line 142
    new-instance v0, Lfreemarker/template/SimpleCollection;

    invoke-virtual {p0}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugMapModel;->keySet()Ljava/util/Collection;

    move-result-object v1

    invoke-direct {v0, v1}, Lfreemarker/template/SimpleCollection;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 137
    invoke-virtual {p0}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugMapModel;->keySet()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v0

    return v0
.end method

.method public values()Lfreemarker/template/TemplateCollectionModel;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 147
    invoke-virtual {p0}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugMapModel;->keySet()Ljava/util/Collection;

    move-result-object v1

    .line 148
    .local v1, "keys":Ljava/util/Collection;
    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/util/Collection;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 150
    .local v2, "list":Ljava/util/List;
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;
    :goto_11
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_25

    .line 152
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {p0, v3}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugMapModel;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_11

    .line 154
    :cond_25
    new-instance v3, Lfreemarker/template/SimpleCollection;

    invoke-direct {v3, v2}, Lfreemarker/template/SimpleCollection;-><init>(Ljava/util/Collection;)V

    return-object v3
.end method
