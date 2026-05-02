.class Lcom/rey/material/widget/EditText$InputTextWatcher;
.super Ljava/lang/Object;
.source "EditText.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/widget/EditText;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "InputTextWatcher"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/widget/EditText;


# direct methods
.method private constructor <init>(Lcom/rey/material/widget/EditText;)V
    .registers 2

    .prologue
    .line 3653
    iput-object p1, p0, Lcom/rey/material/widget/EditText$InputTextWatcher;->this$0:Lcom/rey/material/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/rey/material/widget/EditText;Lcom/rey/material/widget/EditText$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/rey/material/widget/EditText;
    .param p2, "x1"    # Lcom/rey/material/widget/EditText$1;

    .prologue
    .line 3653
    invoke-direct {p0, p1}, Lcom/rey/material/widget/EditText$InputTextWatcher;-><init>(Lcom/rey/material/widget/EditText;)V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .registers 6
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    const/4 v2, 0x1

    .line 3656
    invoke-interface {p1}, Landroid/text/Editable;->length()I

    move-result v0

    .line 3657
    .local v0, "count":I
    iget-object v3, p0, Lcom/rey/material/widget/EditText$InputTextWatcher;->this$0:Lcom/rey/material/widget/EditText;

    if-eqz v0, :cond_1a

    move v1, v2

    :goto_a
    # invokes: Lcom/rey/material/widget/EditText;->setLabelVisible(ZZ)V
    invoke-static {v3, v1, v2}, Lcom/rey/material/widget/EditText;->access$100(Lcom/rey/material/widget/EditText;ZZ)V

    .line 3658
    iget-object v1, p0, Lcom/rey/material/widget/EditText$InputTextWatcher;->this$0:Lcom/rey/material/widget/EditText;

    iget v1, v1, Lcom/rey/material/widget/EditText;->mSupportMode:I

    const/4 v2, 0x3

    if-ne v1, v2, :cond_19

    .line 3659
    iget-object v1, p0, Lcom/rey/material/widget/EditText$InputTextWatcher;->this$0:Lcom/rey/material/widget/EditText;

    # invokes: Lcom/rey/material/widget/EditText;->updateCharCounter(I)V
    invoke-static {v1, v0}, Lcom/rey/material/widget/EditText;->access$200(Lcom/rey/material/widget/EditText;I)V

    .line 3660
    :cond_19
    return-void

    .line 3657
    :cond_1a
    const/4 v1, 0x0

    goto :goto_a
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 3663
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 3666
    return-void
.end method
