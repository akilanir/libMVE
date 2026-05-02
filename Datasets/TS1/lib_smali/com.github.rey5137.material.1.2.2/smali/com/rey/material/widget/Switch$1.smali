.class Lcom/rey/material/widget/Switch$1;
.super Ljava/lang/Object;
.source "Switch.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/widget/Switch;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/widget/Switch;


# direct methods
.method constructor <init>(Lcom/rey/material/widget/Switch;)V
    .registers 2

    .prologue
    .line 599
    iput-object p1, p0, Lcom/rey/material/widget/Switch$1;->this$0:Lcom/rey/material/widget/Switch;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 603
    iget-object v0, p0, Lcom/rey/material/widget/Switch$1;->this$0:Lcom/rey/material/widget/Switch;

    # invokes: Lcom/rey/material/widget/Switch;->update()V
    invoke-static {v0}, Lcom/rey/material/widget/Switch;->access$000(Lcom/rey/material/widget/Switch;)V

    .line 604
    return-void
.end method
