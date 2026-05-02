.class public Lzmq/ZError$CtxTerminatedException;
.super Ljava/lang/RuntimeException;
.source "ZError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lzmq/ZError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CtxTerminatedException"
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x3d216d12ed97f2dcL


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    .line 38
    return-void
.end method
