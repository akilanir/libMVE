.class public Lorg/zeromq/ZAgent$VerySimpleSelectorCreator;
.super Ljava/lang/Object;
.source "ZAgent.java"

# interfaces
.implements Lorg/zeromq/ZAgent$SelectorCreator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/zeromq/ZAgent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "VerySimpleSelectorCreator"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 256
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public create()Ljava/nio/channels/Selector;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 261
    invoke-static {}, Ljava/nio/channels/Selector;->open()Ljava/nio/channels/Selector;

    move-result-object v0

    return-object v0
.end method

.method public destroy(Ljava/nio/channels/Selector;)V
    .registers 2
    .param p1, "selector"    # Ljava/nio/channels/Selector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 267
    if-eqz p1, :cond_5

    .line 268
    invoke-virtual {p1}, Ljava/nio/channels/Selector;->close()V

    .line 270
    :cond_5
    return-void
.end method
