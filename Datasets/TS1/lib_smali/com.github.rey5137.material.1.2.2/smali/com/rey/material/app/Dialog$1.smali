.class Lcom/rey/material/app/Dialog$1;
.super Ljava/lang/Object;
.source "Dialog.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/app/Dialog;


# direct methods
.method constructor <init>(Lcom/rey/material/app/Dialog;)V
    .registers 2

    .prologue
    .line 69
    iput-object p1, p0, Lcom/rey/material/app/Dialog$1;->this$0:Lcom/rey/material/app/Dialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 73
    :try_start_0
    iget-object v0, p0, Lcom/rey/material/app/Dialog$1;->this$0:Lcom/rey/material/app/Dialog;

    # invokes: Landroid/app/Dialog;->dismiss()V
    invoke-static {v0}, Lcom/rey/material/app/Dialog;->access$001(Lcom/rey/material/app/Dialog;)V
    :try_end_5
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_5} :catch_6

    .line 76
    :goto_5
    return-void

    .line 75
    :catch_6
    move-exception v0

    goto :goto_5
.end method
