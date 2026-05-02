.class public Lcom/einmalfel/earl/MediaItem;
.super Lcom/einmalfel/earl/MediaCommon;
.source "MediaItem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/einmalfel/earl/MediaItem$MediaItemBuilder;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "Earl.MediaItem"


# instance fields
.field public final contents:Ljava/util/List;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/MediaContent;",
            ">;"
        }
    .end annotation
.end field

.field public final groups:Ljava/util/List;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/MediaGroup;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;Ljava/util/List;Lcom/einmalfel/earl/MediaCommon;)V
    .registers 4
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "common"    # Lcom/einmalfel/earl/MediaCommon;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/MediaGroup;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/MediaContent;",
            ">;",
            "Lcom/einmalfel/earl/MediaCommon;",
            ")V"
        }
    .end annotation

    .prologue
    .line 47
    .local p1, "groups":Ljava/util/List;, "Ljava/util/List<Lcom/einmalfel/earl/MediaGroup;>;"
    .local p2, "contents":Ljava/util/List;, "Ljava/util/List<Lcom/einmalfel/earl/MediaContent;>;"
    invoke-direct {p0, p3}, Lcom/einmalfel/earl/MediaCommon;-><init>(Lcom/einmalfel/earl/MediaCommon;)V

    .line 48
    iput-object p1, p0, Lcom/einmalfel/earl/MediaItem;->groups:Ljava/util/List;

    .line 49
    iput-object p2, p0, Lcom/einmalfel/earl/MediaItem;->contents:Ljava/util/List;

    .line 50
    return-void
.end method
