.class public Lcom/koushikdutta/ion/LoadBitmapBase;
.super Lcom/koushikdutta/ion/BitmapCallback;
.source "LoadBitmapBase.java"


# direct methods
.method public constructor <init>(Lcom/koushikdutta/ion/Ion;Ljava/lang/String;Z)V
    .registers 4
    .param p1, "ion"    # Lcom/koushikdutta/ion/Ion;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "put"    # Z

    .prologue
    .line 8
    invoke-direct {p0, p1, p2, p3}, Lcom/koushikdutta/ion/BitmapCallback;-><init>(Lcom/koushikdutta/ion/Ion;Ljava/lang/String;Z)V

    .line 9
    return-void
.end method
