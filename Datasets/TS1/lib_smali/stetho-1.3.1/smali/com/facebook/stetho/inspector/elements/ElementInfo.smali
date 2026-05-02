.class public final Lcom/facebook/stetho/inspector/elements/ElementInfo;
.super Ljava/lang/Object;
.source "ElementInfo.java"


# annotations
.annotation build Ljavax/annotation/concurrent/Immutable;
.end annotation


# instance fields
.field public final children:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public final element:Ljava/lang/Object;

.field public final parentElement:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/List;)V
    .registers 5
    .param p1, "element"    # Ljava/lang/Object;
    .param p2, "parentElement"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 28
    .local p3, "children":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    invoke-static {p1}, Lcom/facebook/stetho/common/Util;->throwIfNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/ElementInfo;->element:Ljava/lang/Object;

    .line 30
    iput-object p2, p0, Lcom/facebook/stetho/inspector/elements/ElementInfo;->parentElement:Ljava/lang/Object;

    .line 31
    invoke-static {p3}, Lcom/facebook/stetho/common/ListUtil;->copyToImmutableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    .line 32
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 36
    if-ne p1, p0, :cond_5

    .line 47
    :cond_4
    :goto_4
    return v1

    .line 40
    :cond_5
    instance-of v3, p1, Lcom/facebook/stetho/inspector/elements/ElementInfo;

    if-eqz v3, :cond_24

    move-object v0, p1

    .line 41
    check-cast v0, Lcom/facebook/stetho/inspector/elements/ElementInfo;

    .line 42
    .local v0, "other":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    iget-object v3, p0, Lcom/facebook/stetho/inspector/elements/ElementInfo;->element:Ljava/lang/Object;

    iget-object v4, v0, Lcom/facebook/stetho/inspector/elements/ElementInfo;->element:Ljava/lang/Object;

    if-ne v3, v4, :cond_22

    iget-object v3, p0, Lcom/facebook/stetho/inspector/elements/ElementInfo;->parentElement:Ljava/lang/Object;

    iget-object v4, v0, Lcom/facebook/stetho/inspector/elements/ElementInfo;->parentElement:Ljava/lang/Object;

    if-ne v3, v4, :cond_22

    iget-object v3, p0, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    iget-object v4, v0, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    .line 44
    invoke-static {v3, v4}, Lcom/facebook/stetho/common/ListUtil;->identityEquals(Ljava/util/List;Ljava/util/List;)Z

    move-result v3

    if-nez v3, :cond_4

    :cond_22
    move v1, v2

    goto :goto_4

    .end local v0    # "other":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    :cond_24
    move v1, v2

    .line 47
    goto :goto_4
.end method
