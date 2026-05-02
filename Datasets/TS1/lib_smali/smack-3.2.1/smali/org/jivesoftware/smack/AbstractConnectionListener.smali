.class public Lorg/jivesoftware/smack/AbstractConnectionListener;
.super Ljava/lang/Object;
.source "AbstractConnectionListener.java"

# interfaces
.implements Lorg/jivesoftware/smack/ConnectionListener;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public connectionClosed()V
    .registers 1

    .prologue
    .line 28
    return-void
.end method

.method public connectionClosedOnError(Ljava/lang/Exception;)V
    .registers 2
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 32
    return-void
.end method

.method public reconnectingIn(I)V
    .registers 2
    .param p1, "seconds"    # I

    .prologue
    .line 36
    return-void
.end method

.method public reconnectionFailed(Ljava/lang/Exception;)V
    .registers 2
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 40
    return-void
.end method

.method public reconnectionSuccessful()V
    .registers 1

    .prologue
    .line 44
    return-void
.end method
