.class public Lezvcard/io/SkipMeException;
.super Ljava/lang/RuntimeException;
.source "SkipMeException.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    .line 47
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "reason"    # Ljava/lang/String;

    .prologue
    .line 54
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 55
    return-void
.end method
