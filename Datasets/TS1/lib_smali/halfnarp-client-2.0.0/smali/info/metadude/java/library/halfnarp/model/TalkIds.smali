.class public Linfo/metadude/java/library/halfnarp/model/TalkIds;
.super Ljava/lang/Object;
.source "TalkIds.java"


# annotations
.annotation runtime Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;
    using = Linfo/metadude/java/library/halfnarp/TalkIdsSerializer;
.end annotation


# static fields
.field public static final API_DICTIONARY_KEY:Ljava/lang/String; = "talk_ids"


# instance fields
.field protected mTalkIds:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Linfo/metadude/java/library/halfnarp/model/TalkIds;->mTalkIds:Ljava/util/Set;

    .line 21
    return-void
.end method


# virtual methods
.method public add(I)V
    .registers 4
    .param p1, "talkId"    # I

    .prologue
    .line 24
    iget-object v0, p0, Linfo/metadude/java/library/halfnarp/model/TalkIds;->mTalkIds:Ljava/util/Set;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 25
    return-void
.end method

.method public add(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 28
    .local p1, "talkIds":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/Integer;>;"
    iget-object v0, p0, Linfo/metadude/java/library/halfnarp/model/TalkIds;->mTalkIds:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 29
    return-void
.end method

.method public clear()V
    .registers 2

    .prologue
    .line 32
    iget-object v0, p0, Linfo/metadude/java/library/halfnarp/model/TalkIds;->mTalkIds:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 33
    return-void
.end method

.method public getTalkIds()Ljava/util/Collection;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 40
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Linfo/metadude/java/library/halfnarp/model/TalkIds;->mTalkIds:Ljava/util/Set;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 36
    iget-object v0, p0, Linfo/metadude/java/library/halfnarp/model/TalkIds;->mTalkIds:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    return v0
.end method
