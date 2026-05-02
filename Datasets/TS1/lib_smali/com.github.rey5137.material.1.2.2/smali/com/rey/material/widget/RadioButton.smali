.class public Lcom/rey/material/widget/RadioButton;
.super Lcom/rey/material/widget/CompoundButton;
.source "RadioButton.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 11
    invoke-direct {p0, p1}, Lcom/rey/material/widget/CompoundButton;-><init>(Landroid/content/Context;)V

    .line 12
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 15
    invoke-direct {p0, p1, p2}, Lcom/rey/material/widget/CompoundButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 16
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 19
    invoke-direct {p0, p1, p2, p3}, Lcom/rey/material/widget/CompoundButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 20
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 23
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/rey/material/widget/CompoundButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 24
    return-void
.end method


# virtual methods
.method protected applyStyle(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 28
    invoke-super {p0, p1, p2, p3, p4}, Lcom/rey/material/widget/CompoundButton;->applyStyle(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 30
    new-instance v1, Lcom/rey/material/drawable/RadioButtonDrawable$Builder;

    invoke-direct {v1, p1, p2, p3, p4}, Lcom/rey/material/drawable/RadioButtonDrawable$Builder;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    invoke-virtual {v1}, Lcom/rey/material/drawable/RadioButtonDrawable$Builder;->build()Lcom/rey/material/drawable/RadioButtonDrawable;

    move-result-object v0

    .line 31
    .local v0, "drawable":Lcom/rey/material/drawable/RadioButtonDrawable;
    invoke-virtual {p0}, Lcom/rey/material/widget/RadioButton;->isInEditMode()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/rey/material/drawable/RadioButtonDrawable;->setInEditMode(Z)V

    .line 32
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/rey/material/drawable/RadioButtonDrawable;->setAnimEnable(Z)V

    .line 33
    invoke-virtual {p0, v0}, Lcom/rey/material/widget/RadioButton;->setButtonDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 34
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/rey/material/drawable/RadioButtonDrawable;->setAnimEnable(Z)V

    .line 35
    return-void
.end method

.method public setCheckedImmediately(Z)V
    .registers 4
    .param p1, "checked"    # Z

    .prologue
    .line 51
    invoke-virtual {p0}, Lcom/rey/material/widget/RadioButton;->getButtonDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    instance-of v1, v1, Lcom/rey/material/drawable/RadioButtonDrawable;

    if-eqz v1, :cond_1a

    .line 52
    invoke-virtual {p0}, Lcom/rey/material/widget/RadioButton;->getButtonDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lcom/rey/material/drawable/RadioButtonDrawable;

    .line 53
    .local v0, "drawable":Lcom/rey/material/drawable/RadioButtonDrawable;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/rey/material/drawable/RadioButtonDrawable;->setAnimEnable(Z)V

    .line 54
    invoke-virtual {p0, p1}, Lcom/rey/material/widget/RadioButton;->setChecked(Z)V

    .line 55
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/rey/material/drawable/RadioButtonDrawable;->setAnimEnable(Z)V

    .line 59
    .end local v0    # "drawable":Lcom/rey/material/drawable/RadioButtonDrawable;
    :goto_19
    return-void

    .line 58
    :cond_1a
    invoke-virtual {p0, p1}, Lcom/rey/material/widget/RadioButton;->setChecked(Z)V

    goto :goto_19
.end method

.method public toggle()V
    .registers 2

    .prologue
    .line 41
    invoke-virtual {p0}, Lcom/rey/material/widget/RadioButton;->isChecked()Z

    move-result v0

    if-nez v0, :cond_9

    .line 42
    invoke-super {p0}, Lcom/rey/material/widget/CompoundButton;->toggle()V

    .line 44
    :cond_9
    return-void
.end method
