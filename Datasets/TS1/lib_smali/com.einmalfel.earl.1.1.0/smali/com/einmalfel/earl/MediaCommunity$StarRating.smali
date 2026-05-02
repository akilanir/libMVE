.class public Lcom/einmalfel/earl/MediaCommunity$StarRating;
.super Ljava/lang/Object;
.source "MediaCommunity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/einmalfel/earl/MediaCommunity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "StarRating"
.end annotation


# static fields
.field static final XML_TAG:Ljava/lang/String; = "starRating"


# instance fields
.field public final average:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final count:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final max:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final min:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)V
    .registers 5
    .param p1, "average"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "count"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "min"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p4, "max"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/einmalfel/earl/MediaCommunity$StarRating;->average:Ljava/lang/String;

    .line 34
    iput-object p2, p0, Lcom/einmalfel/earl/MediaCommunity$StarRating;->count:Ljava/lang/Integer;

    .line 35
    iput-object p3, p0, Lcom/einmalfel/earl/MediaCommunity$StarRating;->min:Ljava/lang/Integer;

    .line 36
    iput-object p4, p0, Lcom/einmalfel/earl/MediaCommunity$StarRating;->max:Ljava/lang/Integer;

    .line 37
    return-void
.end method
