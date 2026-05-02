.class public Lcom/rey/material/widget/CheckBox;
.super Lcom/rey/material/widget/CompoundButton;
.source "CheckBox.java"


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
    new-instance v1, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;

    invoke-direct {v1, p1, p2, p3, p4}, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    invoke-virtual {v1}, Lcom/rey/material/drawable/CheckBoxDrawable$Builder;->build()Lcom/rey/material/drawable/CheckBoxDrawable;

    move-result-object v0

    .line 31
    .local v0, "drawable":Lcom/rey/material/drawable/CheckBoxDrawable;
    invoke-virtual {p0}, Lcom/rey/material/widget/CheckBox;->isInEditMode()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/rey/material/drawable/CheckBoxDrawable;->setInEditMode(Z)V

    .line 32
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/rey/material/drawable/CheckBoxDrawable;->setAnimEnable(Z)V

    .line 33
    invoke-virtual {p0, v0}, Lcom/rey/material/widget/CheckBox;->setButtonDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 34
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/rey/material/drawable/CheckBoxDrawable;->setAnimEnable(Z)V

    .line 35
    return-void
.end method

.method public setCheckedImmediately(Z)V
    .registers 4
    .param p1, "checked"    # Z

    .prologue
    .line 42
    invoke-virtual {p0}, Lcom/rey/material/widget/CheckBox;->getButtonDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    instance-of v1, v1, Lcom/rey/material/drawable/CheckBoxDrawable;

    if-eqz v1, :cond_1a

    .line 43
    invoke-virtual {p0}, Lcom/rey/material/widget/CheckBox;->getButtonDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lcom/rey/material/drawable/CheckBoxDrawable;

    .line 44
    .local v0, "drawable":Lcom/rey/material/drawable/CheckBoxDrawable;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/rey/material/drawable/CheckBoxDrawable;->setAnimEnable(Z)V

    .line 45
    invoke-virtual {p0, p1}, Lcom/rey/material/widget/CheckBox;->setChecked(Z)V

    .line 46
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/rey/material/drawable/CheckBoxDrawable;->setAnimEnable(Z)V

    .line 50
    .end local v0    # "drawable":Lcom/rey/material/drawable/CheckBoxDrawable;
    :goto_19
    return-void

    .line 49
    :cond_1a
    invoke-virtual {p0, p1}, Lcom/rey/material/widget/CheckBox;->setChecked(Z)V

    goto :goto_19
.end method
