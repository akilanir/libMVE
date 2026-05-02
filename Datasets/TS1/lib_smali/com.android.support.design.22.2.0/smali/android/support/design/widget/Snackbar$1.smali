.class final Landroid/support/design/widget/Snackbar$1;
.super Ljava/lang/Object;
.source "Snackbar.java"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/design/widget/Snackbar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)Z
    .registers 4
    .param p1, "message"    # Landroid/os/Message;

    .prologue
    const/4 v1, 0x1

    .line 96
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_1a

    .line 104
    const/4 v0, 0x0

    :goto_7
    return v0

    .line 98
    :pswitch_8
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/support/design/widget/Snackbar;

    invoke-virtual {v0}, Landroid/support/design/widget/Snackbar;->showView()V

    move v0, v1

    .line 99
    goto :goto_7

    .line 101
    :pswitch_11
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/support/design/widget/Snackbar;

    invoke-virtual {v0}, Landroid/support/design/widget/Snackbar;->hideView()V

    move v0, v1

    .line 102
    goto :goto_7

    .line 96
    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_8
        :pswitch_11
    .end packed-switch
.end method
