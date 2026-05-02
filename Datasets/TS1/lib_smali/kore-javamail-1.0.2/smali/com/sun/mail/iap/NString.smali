.class Lcom/sun/mail/iap/NString;
.super Ljava/lang/Object;
.source "Argument.java"


# instance fields
.field bytes:[B


# direct methods
.method constructor <init>([B)V
    .registers 2
    .param p1, "b"    # [B

    .prologue
    .line 388
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 389
    iput-object p1, p0, Lcom/sun/mail/iap/NString;->bytes:[B

    .line 390
    return-void
.end method
