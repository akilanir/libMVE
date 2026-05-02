.class public Lcom/mikepenz/materialdrawer/holder/StringHolder;
.super Ljava/lang/Object;
.source "StringHolder.java"


# instance fields
.field private mText:Ljava/lang/String;

.field private mTextRes:I


# direct methods
.method public constructor <init>(I)V
    .registers 3
    .param p1, "textRes"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    const/4 v0, -0x1

    iput v0, p0, Lcom/mikepenz/materialdrawer/holder/StringHolder;->mTextRes:I

    .line 20
    iput p1, p0, Lcom/mikepenz/materialdrawer/holder/StringHolder;->mTextRes:I

    .line 21
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    const/4 v0, -0x1

    iput v0, p0, Lcom/mikepenz/materialdrawer/holder/StringHolder;->mTextRes:I

    .line 16
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/holder/StringHolder;->mText:Ljava/lang/String;

    .line 17
    return-void
.end method

.method public static applyTo(Lcom/mikepenz/materialdrawer/holder/StringHolder;Landroid/widget/TextView;)V
    .registers 2
    .param p0, "text"    # Lcom/mikepenz/materialdrawer/holder/StringHolder;
    .param p1, "textView"    # Landroid/widget/TextView;

    .prologue
    .line 67
    if-eqz p0, :cond_7

    if-eqz p1, :cond_7

    .line 68
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/holder/StringHolder;->applyTo(Landroid/widget/TextView;)V

    .line 70
    :cond_7
    return-void
.end method

.method public static applyToOrHide(Lcom/mikepenz/materialdrawer/holder/StringHolder;Landroid/widget/TextView;)Z
    .registers 4
    .param p0, "text"    # Lcom/mikepenz/materialdrawer/holder/StringHolder;
    .param p1, "textView"    # Landroid/widget/TextView;

    .prologue
    const/4 v0, 0x0

    .line 73
    if-eqz p0, :cond_a

    if-eqz p1, :cond_a

    .line 74
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/holder/StringHolder;->applyToOrHide(Landroid/widget/TextView;)Z

    move-result v0

    .line 79
    :cond_9
    :goto_9
    return v0

    .line 75
    :cond_a
    if-eqz p1, :cond_9

    .line 76
    const/16 v1, 0x8

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_9
.end method


# virtual methods
.method public applyTo(Landroid/widget/TextView;)V
    .registers 4
    .param p1, "textView"    # Landroid/widget/TextView;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/holder/StringHolder;->mText:Ljava/lang/String;

    if-eqz v0, :cond_a

    .line 33
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/holder/StringHolder;->mText:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 39
    :goto_9
    return-void

    .line 34
    :cond_a
    iget v0, p0, Lcom/mikepenz/materialdrawer/holder/StringHolder;->mTextRes:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_15

    .line 35
    iget v0, p0, Lcom/mikepenz/materialdrawer/holder/StringHolder;->mTextRes:I

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    goto :goto_9

    .line 37
    :cond_15
    const-string v0, ""

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_9
.end method

.method public applyToOrHide(Landroid/widget/TextView;)Z
    .registers 6
    .param p1, "textView"    # Landroid/widget/TextView;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 42
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/holder/StringHolder;->mText:Ljava/lang/String;

    if-eqz v2, :cond_f

    .line 43
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/holder/StringHolder;->mText:Ljava/lang/String;

    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 52
    :goto_e
    return v0

    .line 46
    :cond_f
    iget v2, p0, Lcom/mikepenz/materialdrawer/holder/StringHolder;->mTextRes:I

    const/4 v3, -0x1

    if-eq v2, v3, :cond_1d

    .line 47
    iget v2, p0, Lcom/mikepenz/materialdrawer/holder/StringHolder;->mTextRes:I

    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 48
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_e

    .line 51
    :cond_1d
    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    move v0, v1

    .line 52
    goto :goto_e
.end method

.method public getText()Ljava/lang/String;
    .registers 2

    .prologue
    .line 24
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/holder/StringHolder;->mText:Ljava/lang/String;

    return-object v0
.end method

.method public getText(Landroid/content/Context;)Ljava/lang/String;
    .registers 4
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 57
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/holder/StringHolder;->mText:Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 58
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/holder/StringHolder;->mText:Ljava/lang/String;

    .line 62
    :goto_6
    return-object v0

    .line 59
    :cond_7
    iget v0, p0, Lcom/mikepenz/materialdrawer/holder/StringHolder;->mTextRes:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_13

    .line 60
    iget v0, p0, Lcom/mikepenz/materialdrawer/holder/StringHolder;->mTextRes:I

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_6

    .line 62
    :cond_13
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public getTextRes()I
    .registers 2

    .prologue
    .line 28
    iget v0, p0, Lcom/mikepenz/materialdrawer/holder/StringHolder;->mTextRes:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 84
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/holder/StringHolder;->mText:Ljava/lang/String;

    return-object v0
.end method
