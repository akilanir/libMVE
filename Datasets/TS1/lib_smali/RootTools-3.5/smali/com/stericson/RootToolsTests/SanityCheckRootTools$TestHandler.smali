.class Lcom/stericson/RootToolsTests/SanityCheckRootTools$TestHandler;
.super Landroid/os/Handler;
.source "SanityCheckRootTools.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/stericson/RootToolsTests/SanityCheckRootTools;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TestHandler"
.end annotation


# static fields
.field public static final ACTION:Ljava/lang/String; = "action"

.field public static final ACTION_DISPLAY:I = 0x3

.field public static final ACTION_HIDE:I = 0x2

.field public static final ACTION_PDISPLAY:I = 0x4

.field public static final ACTION_SHOW:I = 0x1

.field public static final TEXT:Ljava/lang/String; = "text"


# instance fields
.field final synthetic this$0:Lcom/stericson/RootToolsTests/SanityCheckRootTools;


# direct methods
.method private constructor <init>(Lcom/stericson/RootToolsTests/SanityCheckRootTools;)V
    .registers 2

    .prologue
    .line 362
    iput-object p1, p0, Lcom/stericson/RootToolsTests/SanityCheckRootTools$TestHandler;->this$0:Lcom/stericson/RootToolsTests/SanityCheckRootTools;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/stericson/RootToolsTests/SanityCheckRootTools;Lcom/stericson/RootToolsTests/SanityCheckRootTools$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/stericson/RootToolsTests/SanityCheckRootTools;
    .param p2, "x1"    # Lcom/stericson/RootToolsTests/SanityCheckRootTools$1;

    .prologue
    .line 362
    invoke-direct {p0, p1}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$TestHandler;-><init>(Lcom/stericson/RootToolsTests/SanityCheckRootTools;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 6
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 371
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v2

    const-string v3, "action"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 372
    .local v0, "action":I
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v2

    const-string v3, "text"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 374
    .local v1, "text":Ljava/lang/String;
    packed-switch v0, :pswitch_data_4e

    .line 391
    :goto_17
    return-void

    .line 376
    :pswitch_18
    iget-object v2, p0, Lcom/stericson/RootToolsTests/SanityCheckRootTools$TestHandler;->this$0:Lcom/stericson/RootToolsTests/SanityCheckRootTools;

    # getter for: Lcom/stericson/RootToolsTests/SanityCheckRootTools;->mPDialog:Landroid/app/ProgressDialog;
    invoke-static {v2}, Lcom/stericson/RootToolsTests/SanityCheckRootTools;->access$300(Lcom/stericson/RootToolsTests/SanityCheckRootTools;)Landroid/app/ProgressDialog;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/ProgressDialog;->show()V

    .line 377
    iget-object v2, p0, Lcom/stericson/RootToolsTests/SanityCheckRootTools$TestHandler;->this$0:Lcom/stericson/RootToolsTests/SanityCheckRootTools;

    # getter for: Lcom/stericson/RootToolsTests/SanityCheckRootTools;->mPDialog:Landroid/app/ProgressDialog;
    invoke-static {v2}, Lcom/stericson/RootToolsTests/SanityCheckRootTools;->access$300(Lcom/stericson/RootToolsTests/SanityCheckRootTools;)Landroid/app/ProgressDialog;

    move-result-object v2

    const-string v3, "Running Root Library Tests..."

    invoke-virtual {v2, v3}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    goto :goto_17

    .line 380
    :pswitch_2d
    if-eqz v1, :cond_34

    .line 381
    iget-object v2, p0, Lcom/stericson/RootToolsTests/SanityCheckRootTools$TestHandler;->this$0:Lcom/stericson/RootToolsTests/SanityCheckRootTools;

    invoke-virtual {v2, v1}, Lcom/stericson/RootToolsTests/SanityCheckRootTools;->print(Ljava/lang/CharSequence;)V

    .line 382
    :cond_34
    iget-object v2, p0, Lcom/stericson/RootToolsTests/SanityCheckRootTools$TestHandler;->this$0:Lcom/stericson/RootToolsTests/SanityCheckRootTools;

    # getter for: Lcom/stericson/RootToolsTests/SanityCheckRootTools;->mPDialog:Landroid/app/ProgressDialog;
    invoke-static {v2}, Lcom/stericson/RootToolsTests/SanityCheckRootTools;->access$300(Lcom/stericson/RootToolsTests/SanityCheckRootTools;)Landroid/app/ProgressDialog;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/ProgressDialog;->hide()V

    goto :goto_17

    .line 385
    :pswitch_3e
    iget-object v2, p0, Lcom/stericson/RootToolsTests/SanityCheckRootTools$TestHandler;->this$0:Lcom/stericson/RootToolsTests/SanityCheckRootTools;

    invoke-virtual {v2, v1}, Lcom/stericson/RootToolsTests/SanityCheckRootTools;->print(Ljava/lang/CharSequence;)V

    goto :goto_17

    .line 388
    :pswitch_44
    iget-object v2, p0, Lcom/stericson/RootToolsTests/SanityCheckRootTools$TestHandler;->this$0:Lcom/stericson/RootToolsTests/SanityCheckRootTools;

    # getter for: Lcom/stericson/RootToolsTests/SanityCheckRootTools;->mPDialog:Landroid/app/ProgressDialog;
    invoke-static {v2}, Lcom/stericson/RootToolsTests/SanityCheckRootTools;->access$300(Lcom/stericson/RootToolsTests/SanityCheckRootTools;)Landroid/app/ProgressDialog;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    goto :goto_17

    .line 374
    :pswitch_data_4e
    .packed-switch 0x1
        :pswitch_18
        :pswitch_2d
        :pswitch_3e
        :pswitch_44
    .end packed-switch
.end method
