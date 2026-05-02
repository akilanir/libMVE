.class Lcom/squareup/picasso/Dispatcher$DispatcherHandler;
.super Landroid/os/Handler;
.source "Dispatcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/picasso/Dispatcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DispatcherHandler"
.end annotation


# instance fields
.field private final dispatcher:Lcom/squareup/picasso/Dispatcher;


# direct methods
.method public constructor <init>(Landroid/os/Looper;Lcom/squareup/picasso/Dispatcher;)V
    .registers 3
    .param p1, "looper"    # Landroid/os/Looper;
    .param p2, "dispatcher"    # Lcom/squareup/picasso/Dispatcher;

    .prologue
    .line 474
    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 475
    iput-object p2, p0, Lcom/squareup/picasso/Dispatcher$DispatcherHandler;->dispatcher:Lcom/squareup/picasso/Dispatcher;

    .line 476
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 10
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 479
    iget v6, p1, Landroid/os/Message;->what:I

    packed-switch v6, :pswitch_data_70

    .line 529
    :pswitch_7
    sget-object v4, Lcom/squareup/picasso/Picasso;->HANDLER:Landroid/os/Handler;

    new-instance v5, Lcom/squareup/picasso/Dispatcher$DispatcherHandler$1;

    invoke-direct {v5, p0, p1}, Lcom/squareup/picasso/Dispatcher$DispatcherHandler$1;-><init>(Lcom/squareup/picasso/Dispatcher$DispatcherHandler;Landroid/os/Message;)V

    invoke-virtual {v4, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 535
    :goto_11
    return-void

    .line 481
    :pswitch_12
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/squareup/picasso/Action;

    .line 482
    .local v0, "action":Lcom/squareup/picasso/Action;
    iget-object v4, p0, Lcom/squareup/picasso/Dispatcher$DispatcherHandler;->dispatcher:Lcom/squareup/picasso/Dispatcher;

    invoke-virtual {v4, v0}, Lcom/squareup/picasso/Dispatcher;->performSubmit(Lcom/squareup/picasso/Action;)V

    goto :goto_11

    .line 486
    .end local v0    # "action":Lcom/squareup/picasso/Action;
    :pswitch_1c
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/squareup/picasso/Action;

    .line 487
    .restart local v0    # "action":Lcom/squareup/picasso/Action;
    iget-object v4, p0, Lcom/squareup/picasso/Dispatcher$DispatcherHandler;->dispatcher:Lcom/squareup/picasso/Dispatcher;

    invoke-virtual {v4, v0}, Lcom/squareup/picasso/Dispatcher;->performCancel(Lcom/squareup/picasso/Action;)V

    goto :goto_11

    .line 491
    .end local v0    # "action":Lcom/squareup/picasso/Action;
    :pswitch_26
    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 492
    .local v3, "tag":Ljava/lang/Object;
    iget-object v4, p0, Lcom/squareup/picasso/Dispatcher$DispatcherHandler;->dispatcher:Lcom/squareup/picasso/Dispatcher;

    invoke-virtual {v4, v3}, Lcom/squareup/picasso/Dispatcher;->performPauseTag(Ljava/lang/Object;)V

    goto :goto_11

    .line 496
    .end local v3    # "tag":Ljava/lang/Object;
    :pswitch_2e
    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 497
    .restart local v3    # "tag":Ljava/lang/Object;
    iget-object v4, p0, Lcom/squareup/picasso/Dispatcher$DispatcherHandler;->dispatcher:Lcom/squareup/picasso/Dispatcher;

    invoke-virtual {v4, v3}, Lcom/squareup/picasso/Dispatcher;->performResumeTag(Ljava/lang/Object;)V

    goto :goto_11

    .line 501
    .end local v3    # "tag":Ljava/lang/Object;
    :pswitch_36
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Lcom/squareup/picasso/BitmapHunter;

    .line 502
    .local v1, "hunter":Lcom/squareup/picasso/BitmapHunter;
    iget-object v4, p0, Lcom/squareup/picasso/Dispatcher$DispatcherHandler;->dispatcher:Lcom/squareup/picasso/Dispatcher;

    invoke-virtual {v4, v1}, Lcom/squareup/picasso/Dispatcher;->performComplete(Lcom/squareup/picasso/BitmapHunter;)V

    goto :goto_11

    .line 506
    .end local v1    # "hunter":Lcom/squareup/picasso/BitmapHunter;
    :pswitch_40
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Lcom/squareup/picasso/BitmapHunter;

    .line 507
    .restart local v1    # "hunter":Lcom/squareup/picasso/BitmapHunter;
    iget-object v4, p0, Lcom/squareup/picasso/Dispatcher$DispatcherHandler;->dispatcher:Lcom/squareup/picasso/Dispatcher;

    invoke-virtual {v4, v1}, Lcom/squareup/picasso/Dispatcher;->performRetry(Lcom/squareup/picasso/BitmapHunter;)V

    goto :goto_11

    .line 511
    .end local v1    # "hunter":Lcom/squareup/picasso/BitmapHunter;
    :pswitch_4a
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Lcom/squareup/picasso/BitmapHunter;

    .line 512
    .restart local v1    # "hunter":Lcom/squareup/picasso/BitmapHunter;
    iget-object v4, p0, Lcom/squareup/picasso/Dispatcher$DispatcherHandler;->dispatcher:Lcom/squareup/picasso/Dispatcher;

    invoke-virtual {v4, v1, v5}, Lcom/squareup/picasso/Dispatcher;->performError(Lcom/squareup/picasso/BitmapHunter;Z)V

    goto :goto_11

    .line 516
    .end local v1    # "hunter":Lcom/squareup/picasso/BitmapHunter;
    :pswitch_54
    iget-object v4, p0, Lcom/squareup/picasso/Dispatcher$DispatcherHandler;->dispatcher:Lcom/squareup/picasso/Dispatcher;

    invoke-virtual {v4}, Lcom/squareup/picasso/Dispatcher;->performBatchComplete()V

    goto :goto_11

    .line 520
    :pswitch_5a
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Landroid/net/NetworkInfo;

    .line 521
    .local v2, "info":Landroid/net/NetworkInfo;
    iget-object v4, p0, Lcom/squareup/picasso/Dispatcher$DispatcherHandler;->dispatcher:Lcom/squareup/picasso/Dispatcher;

    invoke-virtual {v4, v2}, Lcom/squareup/picasso/Dispatcher;->performNetworkStateChange(Landroid/net/NetworkInfo;)V

    goto :goto_11

    .line 525
    .end local v2    # "info":Landroid/net/NetworkInfo;
    :pswitch_64
    iget-object v6, p0, Lcom/squareup/picasso/Dispatcher$DispatcherHandler;->dispatcher:Lcom/squareup/picasso/Dispatcher;

    iget v7, p1, Landroid/os/Message;->arg1:I

    if-ne v7, v4, :cond_6e

    :goto_6a
    invoke-virtual {v6, v4}, Lcom/squareup/picasso/Dispatcher;->performAirplaneModeChange(Z)V

    goto :goto_11

    :cond_6e
    move v4, v5

    goto :goto_6a

    .line 479
    :pswitch_data_70
    .packed-switch 0x1
        :pswitch_12
        :pswitch_1c
        :pswitch_7
        :pswitch_36
        :pswitch_40
        :pswitch_4a
        :pswitch_54
        :pswitch_7
        :pswitch_5a
        :pswitch_64
        :pswitch_26
        :pswitch_2e
    .end packed-switch
.end method
