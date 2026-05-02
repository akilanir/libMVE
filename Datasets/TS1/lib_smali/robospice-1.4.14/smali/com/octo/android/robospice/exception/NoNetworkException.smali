.class public Lcom/octo/android/robospice/exception/NoNetworkException;
.super Lcom/octo/android/robospice/persistence/exception/SpiceException;
.source "NoNetworkException.java"


# static fields
.field private static final serialVersionUID:J = 0x4a7772c98cf4271aL


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 14
    const-string v0, "Network is not available"

    invoke-direct {p0, v0}, Lcom/octo/android/robospice/persistence/exception/SpiceException;-><init>(Ljava/lang/String;)V

    .line 15
    return-void
.end method
