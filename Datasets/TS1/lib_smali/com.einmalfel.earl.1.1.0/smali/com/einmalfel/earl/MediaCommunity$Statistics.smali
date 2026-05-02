.class public Lcom/einmalfel/earl/MediaCommunity$Statistics;
.super Ljava/lang/Object;
.source "MediaCommunity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/einmalfel/earl/MediaCommunity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Statistics"
.end annotation


# static fields
.field static final XML_TAG:Ljava/lang/String; = "statistics"


# instance fields
.field public final favorites:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final views:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Integer;Ljava/lang/Integer;)V
    .registers 3
    .param p1, "views"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "favorites"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object p1, p0, Lcom/einmalfel/earl/MediaCommunity$Statistics;->views:Ljava/lang/Integer;

    .line 50
    iput-object p2, p0, Lcom/einmalfel/earl/MediaCommunity$Statistics;->favorites:Ljava/lang/Integer;

    .line 51
    return-void
.end method
