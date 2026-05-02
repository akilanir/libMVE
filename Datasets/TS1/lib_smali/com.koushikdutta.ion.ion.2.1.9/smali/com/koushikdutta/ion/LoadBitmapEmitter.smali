.class Lcom/koushikdutta/ion/LoadBitmapEmitter;
.super Lcom/koushikdutta/ion/LoadBitmapBase;
.source "LoadBitmapEmitter.java"


# instance fields
.field final animateGif:Z


# direct methods
.method public constructor <init>(Lcom/koushikdutta/ion/Ion;Ljava/lang/String;ZZ)V
    .registers 5
    .param p1, "ion"    # Lcom/koushikdutta/ion/Ion;
    .param p2, "urlKey"    # Ljava/lang/String;
    .param p3, "put"    # Z
    .param p4, "animateGif"    # Z

    .prologue
    .line 7
    invoke-direct {p0, p1, p2, p3}, Lcom/koushikdutta/ion/LoadBitmapBase;-><init>(Lcom/koushikdutta/ion/Ion;Ljava/lang/String;Z)V

    .line 8
    iput-boolean p4, p0, Lcom/koushikdutta/ion/LoadBitmapEmitter;->animateGif:Z

    .line 9
    return-void
.end method
