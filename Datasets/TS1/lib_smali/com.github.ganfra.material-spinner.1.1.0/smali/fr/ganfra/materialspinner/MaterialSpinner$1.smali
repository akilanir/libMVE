.class Lfr/ganfra/materialspinner/MaterialSpinner$1;
.super Ljava/lang/Object;
.source "MaterialSpinner.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lfr/ganfra/materialspinner/MaterialSpinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lfr/ganfra/materialspinner/MaterialSpinner;

.field final synthetic val$listener:Landroid/widget/AdapterView$OnItemSelectedListener;


# direct methods
.method constructor <init>(Lfr/ganfra/materialspinner/MaterialSpinner;Landroid/widget/AdapterView$OnItemSelectedListener;)V
    .registers 3
    .param p1, "this$0"    # Lfr/ganfra/materialspinner/MaterialSpinner;

    .prologue
    .line 477
    iput-object p1, p0, Lfr/ganfra/materialspinner/MaterialSpinner$1;->this$0:Lfr/ganfra/materialspinner/MaterialSpinner;

    iput-object p2, p0, Lfr/ganfra/materialspinner/MaterialSpinner$1;->val$listener:Landroid/widget/AdapterView$OnItemSelectedListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 12
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 481
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner$1;->this$0:Lfr/ganfra/materialspinner/MaterialSpinner;

    # getter for: Lfr/ganfra/materialspinner/MaterialSpinner;->hint:Ljava/lang/CharSequence;
    invoke-static {v0}, Lfr/ganfra/materialspinner/MaterialSpinner;->access$000(Lfr/ganfra/materialspinner/MaterialSpinner;)Ljava/lang/CharSequence;

    move-result-object v0

    if-nez v0, :cond_10

    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner$1;->this$0:Lfr/ganfra/materialspinner/MaterialSpinner;

    # getter for: Lfr/ganfra/materialspinner/MaterialSpinner;->floatingLabelText:Ljava/lang/CharSequence;
    invoke-static {v0}, Lfr/ganfra/materialspinner/MaterialSpinner;->access$100(Lfr/ganfra/materialspinner/MaterialSpinner;)Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_1f

    .line 482
    :cond_10
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner$1;->this$0:Lfr/ganfra/materialspinner/MaterialSpinner;

    # getter for: Lfr/ganfra/materialspinner/MaterialSpinner;->floatingLabelVisible:Z
    invoke-static {v0}, Lfr/ganfra/materialspinner/MaterialSpinner;->access$200(Lfr/ganfra/materialspinner/MaterialSpinner;)Z

    move-result v0

    if-nez v0, :cond_52

    if-eqz p3, :cond_52

    .line 483
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner$1;->this$0:Lfr/ganfra/materialspinner/MaterialSpinner;

    # invokes: Lfr/ganfra/materialspinner/MaterialSpinner;->showFloatingLabel()V
    invoke-static {v0}, Lfr/ganfra/materialspinner/MaterialSpinner;->access$300(Lfr/ganfra/materialspinner/MaterialSpinner;)V

    .line 489
    :cond_1f
    :goto_1f
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner$1;->this$0:Lfr/ganfra/materialspinner/MaterialSpinner;

    # getter for: Lfr/ganfra/materialspinner/MaterialSpinner;->lastPosition:I
    invoke-static {v0}, Lfr/ganfra/materialspinner/MaterialSpinner;->access$500(Lfr/ganfra/materialspinner/MaterialSpinner;)I

    move-result v0

    if-eq p3, v0, :cond_35

    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner$1;->this$0:Lfr/ganfra/materialspinner/MaterialSpinner;

    # getter for: Lfr/ganfra/materialspinner/MaterialSpinner;->error:Ljava/lang/CharSequence;
    invoke-static {v0}, Lfr/ganfra/materialspinner/MaterialSpinner;->access$600(Lfr/ganfra/materialspinner/MaterialSpinner;)Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_35

    .line 490
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner$1;->this$0:Lfr/ganfra/materialspinner/MaterialSpinner;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lfr/ganfra/materialspinner/MaterialSpinner;->setError(Ljava/lang/CharSequence;)V

    .line 492
    :cond_35
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner$1;->this$0:Lfr/ganfra/materialspinner/MaterialSpinner;

    # setter for: Lfr/ganfra/materialspinner/MaterialSpinner;->lastPosition:I
    invoke-static {v0, p3}, Lfr/ganfra/materialspinner/MaterialSpinner;->access$502(Lfr/ganfra/materialspinner/MaterialSpinner;I)I

    .line 494
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner$1;->val$listener:Landroid/widget/AdapterView$OnItemSelectedListener;

    if-eqz v0, :cond_51

    .line 495
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner$1;->this$0:Lfr/ganfra/materialspinner/MaterialSpinner;

    # getter for: Lfr/ganfra/materialspinner/MaterialSpinner;->hint:Ljava/lang/CharSequence;
    invoke-static {v0}, Lfr/ganfra/materialspinner/MaterialSpinner;->access$000(Lfr/ganfra/materialspinner/MaterialSpinner;)Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_48

    add-int/lit8 p3, p3, -0x1

    .line 496
    :cond_48
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner$1;->val$listener:Landroid/widget/AdapterView$OnItemSelectedListener;

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-wide v4, p4

    invoke-interface/range {v0 .. v5}, Landroid/widget/AdapterView$OnItemSelectedListener;->onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    .line 498
    :cond_51
    return-void

    .line 484
    :cond_52
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner$1;->this$0:Lfr/ganfra/materialspinner/MaterialSpinner;

    # getter for: Lfr/ganfra/materialspinner/MaterialSpinner;->floatingLabelVisible:Z
    invoke-static {v0}, Lfr/ganfra/materialspinner/MaterialSpinner;->access$200(Lfr/ganfra/materialspinner/MaterialSpinner;)Z

    move-result v0

    if-eqz v0, :cond_1f

    if-nez p3, :cond_1f

    .line 485
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner$1;->this$0:Lfr/ganfra/materialspinner/MaterialSpinner;

    # invokes: Lfr/ganfra/materialspinner/MaterialSpinner;->hideFloatingLabel()V
    invoke-static {v0}, Lfr/ganfra/materialspinner/MaterialSpinner;->access$400(Lfr/ganfra/materialspinner/MaterialSpinner;)V

    goto :goto_1f
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 502
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner$1;->val$listener:Landroid/widget/AdapterView$OnItemSelectedListener;

    if-eqz v0, :cond_9

    .line 503
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner$1;->val$listener:Landroid/widget/AdapterView$OnItemSelectedListener;

    invoke-interface {v0, p1}, Landroid/widget/AdapterView$OnItemSelectedListener;->onNothingSelected(Landroid/widget/AdapterView;)V

    .line 505
    :cond_9
    return-void
.end method
