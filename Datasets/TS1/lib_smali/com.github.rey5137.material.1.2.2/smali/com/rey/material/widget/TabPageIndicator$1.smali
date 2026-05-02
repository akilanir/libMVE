.class Lcom/rey/material/widget/TabPageIndicator$1;
.super Landroid/database/DataSetObserver;
.source "TabPageIndicator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/widget/TabPageIndicator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/widget/TabPageIndicator;


# direct methods
.method constructor <init>(Lcom/rey/material/widget/TabPageIndicator;)V
    .registers 2

    .prologue
    .line 63
    iput-object p1, p0, Lcom/rey/material/widget/TabPageIndicator$1;->this$0:Lcom/rey/material/widget/TabPageIndicator;

    invoke-direct {p0}, Landroid/database/DataSetObserver;-><init>()V

    return-void
.end method


# virtual methods
.method public onChanged()V
    .registers 2

    .prologue
    .line 67
    iget-object v0, p0, Lcom/rey/material/widget/TabPageIndicator$1;->this$0:Lcom/rey/material/widget/TabPageIndicator;

    # invokes: Lcom/rey/material/widget/TabPageIndicator;->notifyDataSetChanged()V
    invoke-static {v0}, Lcom/rey/material/widget/TabPageIndicator;->access$000(Lcom/rey/material/widget/TabPageIndicator;)V

    .line 68
    return-void
.end method

.method public onInvalidated()V
    .registers 2

    .prologue
    .line 72
    iget-object v0, p0, Lcom/rey/material/widget/TabPageIndicator$1;->this$0:Lcom/rey/material/widget/TabPageIndicator;

    # invokes: Lcom/rey/material/widget/TabPageIndicator;->notifyDataSetInvalidated()V
    invoke-static {v0}, Lcom/rey/material/widget/TabPageIndicator;->access$100(Lcom/rey/material/widget/TabPageIndicator;)V

    .line 73
    return-void
.end method
