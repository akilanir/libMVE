.class public Lorg/zeromq/ZMQException$IOException;
.super Ljava/lang/RuntimeException;
.source "ZMQException.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/zeromq/ZMQException;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "IOException"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x75222a89e40460ecL


# direct methods
.method public constructor <init>(Ljava/io/IOException;)V
    .registers 2
    .param p1, "cause"    # Ljava/io/IOException;

    .prologue
    .line 32
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 33
    return-void
.end method
