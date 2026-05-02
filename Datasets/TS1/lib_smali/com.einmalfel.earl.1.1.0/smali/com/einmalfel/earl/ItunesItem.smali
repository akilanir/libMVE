.class public Lcom/einmalfel/earl/ItunesItem;
.super Ljava/lang/Object;
.source "ItunesItem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/einmalfel/earl/ItunesItem$ItunesItemBuilder;,
        Lcom/einmalfel/earl/ItunesItem$ST;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "Earl.ItunesItem"


# instance fields
.field public final author:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final block:Ljava/lang/Boolean;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final duration:Ljava/lang/Integer;
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

.field public final isClosedCaptioned:Ljava/lang/Boolean;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final keywords:Ljava/util/List;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final order:Ljava/lang/Integer;
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
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Boolean;Ljava/net/URL;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    .registers 12
    .param p1, "author"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "block"    # Ljava/lang/Boolean;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "image"    # Ljava/net/URL;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p4, "duration"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p5, "explicit"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p6, "isClosedCaptioned"    # Ljava/lang/Boolean;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p7, "order"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p8, "subtitle"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p9, "summary"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p10    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            "Ljava/net/URL;",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 97
    .local p10, "keywords":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 98
    iput-object p1, p0, Lcom/einmalfel/earl/ItunesItem;->author:Ljava/lang/String;

    .line 99
    iput-object p2, p0, Lcom/einmalfel/earl/ItunesItem;->block:Ljava/lang/Boolean;

    .line 100
    iput-object p3, p0, Lcom/einmalfel/earl/ItunesItem;->image:Ljava/net/URL;

    .line 101
    iput-object p4, p0, Lcom/einmalfel/earl/ItunesItem;->duration:Ljava/lang/Integer;

    .line 102
    iput-object p5, p0, Lcom/einmalfel/earl/ItunesItem;->explicit:Ljava/lang/String;

    .line 103
    iput-object p6, p0, Lcom/einmalfel/earl/ItunesItem;->isClosedCaptioned:Ljava/lang/Boolean;

    .line 104
    iput-object p7, p0, Lcom/einmalfel/earl/ItunesItem;->order:Ljava/lang/Integer;

    .line 105
    iput-object p8, p0, Lcom/einmalfel/earl/ItunesItem;->subtitle:Ljava/lang/String;

    .line 106
    iput-object p9, p0, Lcom/einmalfel/earl/ItunesItem;->summary:Ljava/lang/String;

    .line 107
    invoke-static {p10}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/einmalfel/earl/ItunesItem;->keywords:Ljava/util/List;

    .line 108
    return-void
.end method
