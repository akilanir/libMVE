.class public Lzmq/ZError$IOException;
.super Ljava/lang/RuntimeException;
.source "ZError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lzmq/ZError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "IOException"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x7fb5be563a6a4bd6L


# direct methods
.method public constructor <init>(Ljava/io/IOException;)V
    .registers 2
    .param p1, "e"    # Ljava/io/IOException;

    .prologue
    .line 57
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 58
    return-void
.end method
