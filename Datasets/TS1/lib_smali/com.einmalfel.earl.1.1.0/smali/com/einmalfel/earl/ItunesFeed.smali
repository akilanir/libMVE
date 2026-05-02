.class public Lcom/einmalfel/earl/ItunesFeed;
.super Ljava/lang/Object;
.source "ItunesFeed.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/einmalfel/earl/ItunesFeed$ItunesFeedBuilder;,
        Lcom/einmalfel/earl/ItunesFeed$ST;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "Earl.ItunesFeed"


# instance fields
.field public final author:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final block:Ljava/lang/Boolean;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final categories:Ljava/util/List;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/ItunesCategory;",
            ">;"
        }
    .end annotation
.end field

.field public final complete:Ljava/lang/Boolean;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final explicit:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final image:Ljava/net/URL;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final newFeedURL:Ljava/net/URL;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final owner:Lcom/einmalfel/earl/ItunesOwner;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final subtitle:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final summary:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Boolean;Ljava/util/List;Ljava/net/URL;Ljava/lang/String;Ljava/lang/Boolean;Ljava/net/URL;Lcom/einmalfel/earl/ItunesOwner;Ljava/lang/String;Ljava/lang/String;)V
    .registers 12
    .param p1, "author"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "block"    # Ljava/lang/Boolean;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4, "image"    # Ljava/net/URL;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p5, "explicit"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p6, "complete"    # Ljava/lang/Boolean;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p7, "newFeedURL"    # Ljava/net/URL;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p8, "owner"    # Lcom/einmalfel/earl/ItunesOwner;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p9, "subtitle"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p10, "summary"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/ItunesCategory;",
            ">;",
            "Ljava/net/URL;",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            "Ljava/net/URL;",
            "Lcom/einmalfel/earl/ItunesOwner;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 97
    .local p3, "categories":Ljava/util/List;, "Ljava/util/List<Lcom/einmalfel/earl/ItunesCategory;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 98
    iput-object p1, p0, Lcom/einmalfel/earl/ItunesFeed;->author:Ljava/lang/String;

    .line 99
    iput-object p2, p0, Lcom/einmalfel/earl/ItunesFeed;->block:Ljava/lang/Boolean;

    .line 100
    invoke-static {p3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/einmalfel/earl/ItunesFeed;->categories:Ljava/util/List;

    .line 101
    iput-object p4, p0, Lcom/einmalfel/earl/ItunesFeed;->image:Ljava/net/URL;

    .line 102
    iput-object p5, p0, Lcom/einmalfel/earl/ItunesFeed;->explicit:Ljava/lang/String;

    .line 103
    iput-object p6, p0, Lcom/einmalfel/earl/ItunesFeed;->complete:Ljava/lang/Boolean;

    .line 104
    iput-object p7, p0, Lcom/einmalfel/earl/ItunesFeed;->newFeedURL:Ljava/net/URL;

    .line 105
    iput-object p8, p0, Lcom/einmalfel/earl/ItunesFeed;->owner:Lcom/einmalfel/earl/ItunesOwner;

    .line 106
    iput-object p9, p0, Lcom/einmalfel/earl/ItunesFeed;->subtitle:Ljava/lang/String;

    .line 107
    iput-object p10, p0, Lcom/einmalfel/earl/ItunesFeed;->summary:Ljava/lang/String;

    .line 108
    return-void
.end method
