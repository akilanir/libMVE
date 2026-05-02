.class public Lorg/alexd/jsonrpc/JSONRPCException;
.super Ljava/lang/Exception;
.source "JSONRPCException.java"


# static fields
.field private static final serialVersionUID:J = 0x40a37756752e5f2aL


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .registers 3
    .param p1, "error"    # Ljava/lang/Object;

    .prologue
    .line 17
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 18
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "innerException"    # Ljava/lang/Throwable;

    .prologue
    .line 22
    invoke-direct {p0, p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 23
    return-void
.end method
