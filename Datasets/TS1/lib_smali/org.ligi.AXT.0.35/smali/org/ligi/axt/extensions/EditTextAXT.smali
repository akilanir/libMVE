.class public Lorg/ligi/axt/extensions/EditTextAXT;
.super Lorg/ligi/axt/extensions/ViewAXT;
.source "EditTextAXT.java"


# instance fields
.field private final mEditText:Landroid/widget/EditText;


# direct methods
.method public constructor <init>(Landroid/widget/EditText;)V
    .registers 2
    .param p1, "editText"    # Landroid/widget/EditText;

    .prologue
    .line 10
    invoke-direct {p0, p1}, Lorg/ligi/axt/extensions/ViewAXT;-><init>(Landroid/view/View;)V

    .line 11
    iput-object p1, p0, Lorg/ligi/axt/extensions/EditTextAXT;->mEditText:Landroid/widget/EditText;

    .line 12
    return-void
.end method


# virtual methods
.method public changeTextIfNeeded(Ljava/lang/String;)V
    .registers 3
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 15
    iget-object v0, p0, Lorg/ligi/axt/extensions/EditTextAXT;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 20
    :goto_10
    return-void

    .line 19
    :cond_11
    iget-object v0, p0, Lorg/ligi/axt/extensions/EditTextAXT;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto :goto_10
.end method
