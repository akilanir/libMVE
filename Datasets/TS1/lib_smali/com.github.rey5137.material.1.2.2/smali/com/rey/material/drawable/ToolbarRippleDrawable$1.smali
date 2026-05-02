.class Lcom/rey/material/drawable/ToolbarRippleDrawable$1;
.super Ljava/lang/Object;
.source "ToolbarRippleDrawable.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/drawable/ToolbarRippleDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/drawable/ToolbarRippleDrawable;


# direct methods
.method constructor <init>(Lcom/rey/material/drawable/ToolbarRippleDrawable;)V
    .registers 2

    .prologue
    .line 339
    iput-object p1, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable$1;->this$0:Lcom/rey/material/drawable/ToolbarRippleDrawable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 343
    iget-object v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable$1;->this$0:Lcom/rey/material/drawable/ToolbarRippleDrawable;

    # getter for: Lcom/rey/material/drawable/ToolbarRippleDrawable;->mRippleType:I
    invoke-static {v0}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->access$000(Lcom/rey/material/drawable/ToolbarRippleDrawable;)I

    move-result v0

    packed-switch v0, :pswitch_data_16

    .line 353
    :goto_9
    return-void

    .line 346
    :pswitch_a
    iget-object v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable$1;->this$0:Lcom/rey/material/drawable/ToolbarRippleDrawable;

    # invokes: Lcom/rey/material/drawable/ToolbarRippleDrawable;->updateTouch()V
    invoke-static {v0}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->access$100(Lcom/rey/material/drawable/ToolbarRippleDrawable;)V

    goto :goto_9

    .line 349
    :pswitch_10
    iget-object v0, p0, Lcom/rey/material/drawable/ToolbarRippleDrawable$1;->this$0:Lcom/rey/material/drawable/ToolbarRippleDrawable;

    # invokes: Lcom/rey/material/drawable/ToolbarRippleDrawable;->updateWave()V
    invoke-static {v0}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->access$200(Lcom/rey/material/drawable/ToolbarRippleDrawable;)V

    goto :goto_9

    .line 343
    :pswitch_data_16
    .packed-switch -0x1
        :pswitch_a
        :pswitch_a
        :pswitch_10
    .end packed-switch
.end method
