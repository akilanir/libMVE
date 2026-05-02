.class public interface abstract Lorg/zeromq/ZAgent$SelectorCreator;
.super Ljava/lang/Object;
.source "ZAgent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/zeromq/ZAgent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "SelectorCreator"
.end annotation


# virtual methods
.method public abstract create()Ljava/nio/channels/Selector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract destroy(Ljava/nio/channels/Selector;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
