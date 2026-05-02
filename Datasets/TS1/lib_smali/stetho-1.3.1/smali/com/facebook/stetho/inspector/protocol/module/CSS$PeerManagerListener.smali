.class final Lcom/facebook/stetho/inspector/protocol/module/CSS$PeerManagerListener;
.super Lcom/facebook/stetho/inspector/helper/PeersRegisteredListener;
.source "CSS.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/stetho/inspector/protocol/module/CSS;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "PeerManagerListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/stetho/inspector/protocol/module/CSS;


# direct methods
.method private constructor <init>(Lcom/facebook/stetho/inspector/protocol/module/CSS;)V
    .registers 2

    .prologue
    .line 158
    iput-object p1, p0, Lcom/facebook/stetho/inspector/protocol/module/CSS$PeerManagerListener;->this$0:Lcom/facebook/stetho/inspector/protocol/module/CSS;

    invoke-direct {p0}, Lcom/facebook/stetho/inspector/helper/PeersRegisteredListener;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/facebook/stetho/inspector/protocol/module/CSS;Lcom/facebook/stetho/inspector/protocol/module/CSS$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/facebook/stetho/inspector/protocol/module/CSS;
    .param p2, "x1"    # Lcom/facebook/stetho/inspector/protocol/module/CSS$1;

    .prologue
    .line 158
    invoke-direct {p0, p1}, Lcom/facebook/stetho/inspector/protocol/module/CSS$PeerManagerListener;-><init>(Lcom/facebook/stetho/inspector/protocol/module/CSS;)V

    return-void
.end method


# virtual methods
.method protected declared-synchronized onFirstPeerRegistered()V
    .registers 2

    .prologue
    .line 161
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/CSS$PeerManagerListener;->this$0:Lcom/facebook/stetho/inspector/protocol/module/CSS;

    # getter for: Lcom/facebook/stetho/inspector/protocol/module/CSS;->mDocument:Lcom/facebook/stetho/inspector/elements/Document;
    invoke-static {v0}, Lcom/facebook/stetho/inspector/protocol/module/CSS;->access$200(Lcom/facebook/stetho/inspector/protocol/module/CSS;)Lcom/facebook/stetho/inspector/elements/Document;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/stetho/inspector/elements/Document;->addRef()V
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_c

    .line 162
    monitor-exit p0

    return-void

    .line 161
    :catchall_c
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized onLastPeerUnregistered()V
    .registers 2

    .prologue
    .line 166
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/CSS$PeerManagerListener;->this$0:Lcom/facebook/stetho/inspector/protocol/module/CSS;

    # getter for: Lcom/facebook/stetho/inspector/protocol/module/CSS;->mDocument:Lcom/facebook/stetho/inspector/elements/Document;
    invoke-static {v0}, Lcom/facebook/stetho/inspector/protocol/module/CSS;->access$200(Lcom/facebook/stetho/inspector/protocol/module/CSS;)Lcom/facebook/stetho/inspector/elements/Document;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/stetho/inspector/elements/Document;->release()V
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_c

    .line 167
    monitor-exit p0

    return-void

    .line 166
    :catchall_c
    move-exception v0

    monitor-exit p0

    throw v0
.end method
