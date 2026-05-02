.class public Lcom/koushikdutta/ion/DeferredLoadBitmap;
.super Lcom/koushikdutta/ion/BitmapCallback;
.source "DeferredLoadBitmap.java"


# static fields
.field public static DEFER_COUNTER:I


# instance fields
.field fetcher:Lcom/koushikdutta/ion/BitmapFetcher;

.field priority:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 7
    const/4 v0, 0x0

    sput v0, Lcom/koushikdutta/ion/DeferredLoadBitmap;->DEFER_COUNTER:I

    return-void
.end method

.method public constructor <init>(Lcom/koushikdutta/ion/Ion;Ljava/lang/String;Lcom/koushikdutta/ion/BitmapFetcher;)V
    .registers 5
    .param p1, "ion"    # Lcom/koushikdutta/ion/Ion;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "fetcher"    # Lcom/koushikdutta/ion/BitmapFetcher;

    .prologue
    .line 12
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/koushikdutta/ion/BitmapCallback;-><init>(Lcom/koushikdutta/ion/Ion;Ljava/lang/String;Z)V

    .line 10
    sget v0, Lcom/koushikdutta/ion/DeferredLoadBitmap;->DEFER_COUNTER:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/koushikdutta/ion/DeferredLoadBitmap;->DEFER_COUNTER:I

    iput v0, p0, Lcom/koushikdutta/ion/DeferredLoadBitmap;->priority:I

    .line 13
    iput-object p3, p0, Lcom/koushikdutta/ion/DeferredLoadBitmap;->fetcher:Lcom/koushikdutta/ion/BitmapFetcher;

    .line 14
    return-void
.end method
