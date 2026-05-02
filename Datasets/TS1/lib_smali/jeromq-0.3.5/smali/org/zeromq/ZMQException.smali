.class public Lorg/zeromq/ZMQException;
.super Ljava/lang/RuntimeException;
.source "ZMQException.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/zeromq/ZMQException$IOException;
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x52ac57ee643a8155L


# instance fields
.field private final code:I


# direct methods
.method public constructor <init>(I)V
    .registers 4
    .param p1, "errno"    # I

    .prologue
    .line 42
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Errno "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 43
    iput p1, p0, Lorg/zeromq/ZMQException;->code:I

    .line 44
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "errno"    # I

    .prologue
    .line 48
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 49
    iput p2, p0, Lorg/zeromq/ZMQException;->code:I

    .line 50
    return-void
.end method

.method public constructor <init>(Lorg/zeromq/ZMQException;)V
    .registers 3
    .param p1, "cause"    # Lorg/zeromq/ZMQException;

    .prologue
    .line 54
    invoke-virtual {p1}, Lorg/zeromq/ZMQException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 55
    iget v0, p1, Lorg/zeromq/ZMQException;->code:I

    iput v0, p0, Lorg/zeromq/ZMQException;->code:I

    .line 56
    return-void
.end method


# virtual methods
.method public getErrorCode()I
    .registers 2

    .prologue
    .line 60
    iget v0, p0, Lorg/zeromq/ZMQException;->code:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 66
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Ljava/lang/RuntimeException;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lorg/zeromq/ZMQException;->code:I

    invoke-static {v1}, Lzmq/ZError;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
