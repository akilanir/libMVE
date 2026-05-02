.class public Lorg/osmdroid/tileprovider/util/SimpleInvalidationHandler;
.super Landroid/os/Handler;
.source "SimpleInvalidationHandler.java"


# instance fields
.field private final mView:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 2
    .param p1, "pView"    # Landroid/view/View;

    .prologue
    .line 13
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 14
    iput-object p1, p0, Lorg/osmdroid/tileprovider/util/SimpleInvalidationHandler;->mView:Landroid/view/View;

    .line 15
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 3
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 19
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_c

    .line 24
    :goto_5
    return-void

    .line 21
    :pswitch_6
    iget-object v0, p0, Lorg/osmdroid/tileprovider/util/SimpleInvalidationHandler;->mView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    goto :goto_5

    .line 19
    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method
