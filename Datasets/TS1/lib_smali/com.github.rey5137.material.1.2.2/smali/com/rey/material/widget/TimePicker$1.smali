.class Lcom/rey/material/widget/TimePicker$1;
.super Ljava/lang/Object;
.source "TimePicker.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/widget/TimePicker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/widget/TimePicker;


# direct methods
.method constructor <init>(Lcom/rey/material/widget/TimePicker;)V
    .registers 2

    .prologue
    .line 793
    iput-object p1, p0, Lcom/rey/material/widget/TimePicker$1;->this$0:Lcom/rey/material/widget/TimePicker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 797
    iget-object v0, p0, Lcom/rey/material/widget/TimePicker$1;->this$0:Lcom/rey/material/widget/TimePicker;

    # invokes: Lcom/rey/material/widget/TimePicker;->update()V
    invoke-static {v0}, Lcom/rey/material/widget/TimePicker;->access$000(Lcom/rey/material/widget/TimePicker;)V

    .line 798
    return-void
.end method
