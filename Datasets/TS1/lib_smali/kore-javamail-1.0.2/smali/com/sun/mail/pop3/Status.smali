.class Lcom/sun/mail/pop3/Status;
.super Ljava/lang/Object;
.source "Status.java"


# instance fields
.field size:I

.field total:I


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput v0, p0, Lcom/sun/mail/pop3/Status;->total:I

    .line 48
    iput v0, p0, Lcom/sun/mail/pop3/Status;->size:I

    return-void
.end method
