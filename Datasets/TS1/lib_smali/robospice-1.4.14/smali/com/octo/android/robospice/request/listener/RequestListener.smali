.class public interface abstract Lcom/octo/android/robospice/request/listener/RequestListener;
.super Ljava/lang/Object;
.source "RequestListener.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<RESU",
        "LT:Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract onRequestFailure(Lcom/octo/android/robospice/persistence/exception/SpiceException;)V
.end method

.method public abstract onRequestSuccess(Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TRESU",
            "LT;",
            ")V"
        }
    .end annotation
.end method
