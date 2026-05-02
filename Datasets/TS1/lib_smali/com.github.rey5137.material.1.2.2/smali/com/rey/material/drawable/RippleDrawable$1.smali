.class Lcom/rey/material/drawable/RippleDrawable$1;
.super Ljava/lang/Object;
.source "RippleDrawable.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/drawable/RippleDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/drawable/RippleDrawable;


# direct methods
.method constructor <init>(Lcom/rey/material/drawable/RippleDrawable;)V
    .registers 2

    .prologue
    .line 378
    iput-object p1, p0, Lcom/rey/material/drawable/RippleDrawable$1;->this$0:Lcom/rey/material/drawable/RippleDrawable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 382
    iget-object v0, p0, Lcom/rey/material/drawable/RippleDrawable$1;->this$0:Lcom/rey/material/drawable/RippleDrawable;

    # getter for: Lcom/rey/material/drawable/RippleDrawable;->mRippleType:I
    invoke-static {v0}, Lcom/rey/material/drawable/RippleDrawable;->access$000(Lcom/rey/material/drawable/RippleDrawable;)I

    move-result v0

    packed-switch v0, :pswitch_data_16

    .line 391
    :goto_9
    return-void

    .line 385
    :pswitch_a
    iget-object v0, p0, Lcom/rey/material/drawable/RippleDrawable$1;->this$0:Lcom/rey/material/drawable/RippleDrawable;

    # invokes: Lcom/rey/material/drawable/RippleDrawable;->updateTouch()V
    invoke-static {v0}, Lcom/rey/material/drawable/RippleDrawable;->access$100(Lcom/rey/material/drawable/RippleDrawable;)V

    goto :goto_9

    .line 388
    :pswitch_10
    iget-object v0, p0, Lcom/rey/material/drawable/RippleDrawable$1;->this$0:Lcom/rey/material/drawable/RippleDrawable;

    # invokes: Lcom/rey/material/drawable/RippleDrawable;->updateWave()V
    invoke-static {v0}, Lcom/rey/material/drawable/RippleDrawable;->access$200(Lcom/rey/material/drawable/RippleDrawable;)V

    goto :goto_9

    .line 382
    :pswitch_data_16
    .packed-switch -0x1
        :pswitch_a
        :pswitch_a
        :pswitch_10
    .end packed-switch
.end method
