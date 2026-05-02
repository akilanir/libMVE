.class Lcom/rey/material/widget/Spinner$SpinnerDataSetObserver;
.super Landroid/database/DataSetObserver;
.source "Spinner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/widget/Spinner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SpinnerDataSetObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/widget/Spinner;


# direct methods
.method private constructor <init>(Lcom/rey/material/widget/Spinner;)V
    .registers 2

    .prologue
    .line 1032
    iput-object p1, p0, Lcom/rey/material/widget/Spinner$SpinnerDataSetObserver;->this$0:Lcom/rey/material/widget/Spinner;

    invoke-direct {p0}, Landroid/database/DataSetObserver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/rey/material/widget/Spinner;Lcom/rey/material/widget/Spinner$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/rey/material/widget/Spinner;
    .param p2, "x1"    # Lcom/rey/material/widget/Spinner$1;

    .prologue
    .line 1032
    invoke-direct {p0, p1}, Lcom/rey/material/widget/Spinner$SpinnerDataSetObserver;-><init>(Lcom/rey/material/widget/Spinner;)V

    return-void
.end method


# virtual methods
.method public onChanged()V
    .registers 2

    .prologue
    .line 1036
    iget-object v0, p0, Lcom/rey/material/widget/Spinner$SpinnerDataSetObserver;->this$0:Lcom/rey/material/widget/Spinner;

    # invokes: Lcom/rey/material/widget/Spinner;->onDataChanged()V
    invoke-static {v0}, Lcom/rey/material/widget/Spinner;->access$400(Lcom/rey/material/widget/Spinner;)V

    .line 1037
    return-void
.end method

.method public onInvalidated()V
    .registers 2

    .prologue
    .line 1041
    iget-object v0, p0, Lcom/rey/material/widget/Spinner$SpinnerDataSetObserver;->this$0:Lcom/rey/material/widget/Spinner;

    # invokes: Lcom/rey/material/widget/Spinner;->onDataInvalidated()V
    invoke-static {v0}, Lcom/rey/material/widget/Spinner;->access$500(Lcom/rey/material/widget/Spinner;)V

    .line 1042
    return-void
.end method
