.class public Lcom/lb/material_preferences_library/custom_preferences/NumberEditTextPreference;
.super Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference;
.source "NumberEditTextPreference.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 17
    invoke-direct {p0, p1}, Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference;-><init>(Landroid/content/Context;)V

    .line 18
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 22
    invoke-direct {p0, p1, p2}, Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 23
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 27
    invoke-direct {p0, p1, p2, p3}, Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 28
    return-void
.end method


# virtual methods
.method protected onAddEditTextToDialogView(Landroid/view/View;Landroid/widget/EditText;)V
    .registers 4
    .param p1, "dialogView"    # Landroid/view/View;
    .param p2, "editText"    # Landroid/widget/EditText;

    .prologue
    .line 41
    invoke-super {p0, p1, p2}, Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference;->onAddEditTextToDialogView(Landroid/view/View;Landroid/widget/EditText;)V

    .line 42
    const/16 v0, 0x2002

    invoke-virtual {p2, v0}, Landroid/widget/EditText;->setInputType(I)V

    .line 43
    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Landroid/widget/EditText;->setSelectAllOnFocus(Z)V

    .line 44
    return-void
.end method

.method protected onCreateView(Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 3
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .prologue
    .line 34
    invoke-super {p0, p1}, Lcom/lb/material_preferences_library/custom_preferences/EditTextPreference;->onCreateView(Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 35
    .local v0, "view":Landroid/view/View;
    return-object v0
.end method
