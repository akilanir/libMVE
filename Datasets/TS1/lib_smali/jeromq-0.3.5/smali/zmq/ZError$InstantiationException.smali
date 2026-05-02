.class public Lzmq/ZError$InstantiationException;
.super Ljava/lang/RuntimeException;
.source "ZError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lzmq/ZError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "InstantiationException"
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x3d216d12ed97f2dbL


# direct methods
.method public constructor <init>(Ljava/lang/Throwable;)V
    .registers 2
    .param p1, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 47
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 48
    return-void
.end method
