.class Luk/co/chrisjenx/calligraphy/CalligraphyFactory;
.super Ljava/lang/Object;
.source "CalligraphyFactory.java"


# static fields
.field private static final ACTION_BAR_SUBTITLE:Ljava/lang/String; = "action_bar_subtitle"

.field private static final ACTION_BAR_TITLE:Ljava/lang/String; = "action_bar_title"


# instance fields
.field private final mAttributeId:I


# direct methods
.method public constructor <init>(I)V
    .registers 2
    .param p1, "attributeId"    # I

    .prologue
    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 96
    iput p1, p0, Luk/co/chrisjenx/calligraphy/CalligraphyFactory;->mAttributeId:I

    .line 97
    return-void
.end method

.method protected static getStyleForTextView(Landroid/widget/TextView;)[I
    .registers 6
    .param p0, "view"    # Landroid/widget/TextView;

    .prologue
    const v4, 0x10102ce

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 26
    const/4 v1, 0x2

    new-array v0, v1, [I

    fill-array-data v0, :array_5a

    .line 28
    .local v0, "styleIds":[I
    invoke-static {p0}, Luk/co/chrisjenx/calligraphy/CalligraphyFactory;->isActionBarTitle(Landroid/widget/TextView;)Z

    move-result v1

    if-eqz v1, :cond_48

    .line 29
    aput v4, v0, v3

    .line 30
    const v1, 0x10102f8

    aput v1, v0, v2

    .line 35
    :cond_18
    :goto_18
    aget v1, v0, v3

    const/4 v2, -0x1

    if-ne v1, v2, :cond_47

    .line 37
    invoke-static {}, Luk/co/chrisjenx/calligraphy/CalligraphyConfig;->get()Luk/co/chrisjenx/calligraphy/CalligraphyConfig;

    move-result-object v1

    invoke-virtual {v1}, Luk/co/chrisjenx/calligraphy/CalligraphyConfig;->getClassStyles()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_56

    .line 38
    invoke-static {}, Luk/co/chrisjenx/calligraphy/CalligraphyConfig;->get()Luk/co/chrisjenx/calligraphy/CalligraphyConfig;

    move-result-object v1

    invoke-virtual {v1}, Luk/co/chrisjenx/calligraphy/CalligraphyConfig;->getClassStyles()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    :goto_45
    aput v1, v0, v3

    .line 41
    :cond_47
    return-object v0

    .line 31
    :cond_48
    invoke-static {p0}, Luk/co/chrisjenx/calligraphy/CalligraphyFactory;->isActionBarSubTitle(Landroid/widget/TextView;)Z

    move-result v1

    if-eqz v1, :cond_18

    .line 32
    aput v4, v0, v3

    .line 33
    const v1, 0x10102f9

    aput v1, v0, v2

    goto :goto_18

    .line 38
    :cond_56
    const v1, 0x1010034

    goto :goto_45

    .line 26
    :array_5a
    .array-data 4
        -0x1
        -0x1
    .end array-data
.end method

.method protected static isActionBarSubTitle(Landroid/widget/TextView;)Z
    .registers 4
    .param p0, "view"    # Landroid/widget/TextView;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 68
    const-string v1, "action_bar_subtitle"

    invoke-static {p0, v1}, Luk/co/chrisjenx/calligraphy/CalligraphyFactory;->matchesResourceIdName(Landroid/view/View;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_a

    const/4 v1, 0x1

    .line 73
    :goto_9
    return v1

    .line 69
    :cond_a
    invoke-static {p0}, Luk/co/chrisjenx/calligraphy/CalligraphyFactory;->parentIsToolbarV7(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_23

    .line 70
    invoke-virtual {p0}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/Toolbar;

    .line 71
    .local v0, "parent":Landroid/support/v7/widget/Toolbar;
    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->getSubtitle()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    goto :goto_9

    .line 73
    .end local v0    # "parent":Landroid/support/v7/widget/Toolbar;
    :cond_23
    const/4 v1, 0x0

    goto :goto_9
.end method

.method protected static isActionBarTitle(Landroid/widget/TextView;)Z
    .registers 4
    .param p0, "view"    # Landroid/widget/TextView;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 52
    const-string v1, "action_bar_title"

    invoke-static {p0, v1}, Luk/co/chrisjenx/calligraphy/CalligraphyFactory;->matchesResourceIdName(Landroid/view/View;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_a

    const/4 v1, 0x1

    .line 57
    :goto_9
    return v1

    .line 53
    :cond_a
    invoke-static {p0}, Luk/co/chrisjenx/calligraphy/CalligraphyFactory;->parentIsToolbarV7(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_23

    .line 54
    invoke-virtual {p0}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/Toolbar;

    .line 55
    .local v0, "parent":Landroid/support/v7/widget/Toolbar;
    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->getTitle()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    goto :goto_9

    .line 57
    .end local v0    # "parent":Landroid/support/v7/widget/Toolbar;
    :cond_23
    const/4 v1, 0x0

    goto :goto_9
.end method

.method protected static matchesResourceIdName(Landroid/view/View;Ljava/lang/String;)Z
    .registers 5
    .param p0, "view"    # Landroid/view/View;
    .param p1, "matches"    # Ljava/lang/String;

    .prologue
    .line 88
    invoke-virtual {p0}, Landroid/view/View;->getId()I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_9

    const/4 v1, 0x0

    .line 90
    :goto_8
    return v1

    .line 89
    :cond_9
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {p0}, Landroid/view/View;->getId()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getResourceEntryName(I)Ljava/lang/String;

    move-result-object v0

    .line 90
    .local v0, "resourceEntryName":Ljava/lang/String;
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    goto :goto_8
.end method

.method protected static parentIsToolbarV7(Landroid/view/View;)Z
    .registers 2
    .param p0, "view"    # Landroid/view/View;

    .prologue
    .line 77
    invoke-static {}, Luk/co/chrisjenx/calligraphy/CalligraphyUtils;->canCheckForV7Toolbar()Z

    move-result v0

    if-eqz v0, :cond_16

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_16

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/support/v7/widget/Toolbar;

    if-eqz v0, :cond_16

    const/4 v0, 0x1

    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method


# virtual methods
.method public onViewCreated(Landroid/view/View;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .registers 6
    .param p1, "view"    # Landroid/view/View;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 109
    if-eqz p1, :cond_16

    sget v0, Luk/co/chrisjenx/calligraphy/R$id;->calligraphy_tag_id:I

    invoke-virtual {p1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    if-eq v0, v1, :cond_16

    .line 110
    invoke-virtual {p0, p1, p2, p3}, Luk/co/chrisjenx/calligraphy/CalligraphyFactory;->onViewCreatedInternal(Landroid/view/View;Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 111
    sget v0, Luk/co/chrisjenx/calligraphy/R$id;->calligraphy_tag_id:I

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p1, v0, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 113
    :cond_16
    return-object p1
.end method

.method onViewCreatedInternal(Landroid/view/View;Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 12
    .param p1, "view"    # Landroid/view/View;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v5, 0x1

    const/4 v0, 0x0

    .line 117
    instance-of v4, p1, Landroid/widget/TextView;

    if-eqz v4, :cond_69

    move-object v4, p1

    .line 121
    check-cast v4, Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v4

    invoke-static {v4}, Luk/co/chrisjenx/calligraphy/TypefaceUtils;->isLoaded(Landroid/graphics/Typeface;)Z

    move-result v4

    if-eqz v4, :cond_14

    .line 181
    :cond_13
    :goto_13
    return-void

    .line 128
    :cond_14
    iget v4, p0, Luk/co/chrisjenx/calligraphy/CalligraphyFactory;->mAttributeId:I

    invoke-static {p2, p3, v4}, Luk/co/chrisjenx/calligraphy/CalligraphyUtils;->pullFontPathFromView(Landroid/content/Context;Landroid/util/AttributeSet;I)Ljava/lang/String;

    move-result-object v3

    .line 131
    .local v3, "textViewFont":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_26

    .line 132
    iget v4, p0, Luk/co/chrisjenx/calligraphy/CalligraphyFactory;->mAttributeId:I

    invoke-static {p2, p3, v4}, Luk/co/chrisjenx/calligraphy/CalligraphyUtils;->pullFontPathFromStyle(Landroid/content/Context;Landroid/util/AttributeSet;I)Ljava/lang/String;

    move-result-object v3

    .line 136
    :cond_26
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_32

    .line 137
    iget v4, p0, Luk/co/chrisjenx/calligraphy/CalligraphyFactory;->mAttributeId:I

    invoke-static {p2, p3, v4}, Luk/co/chrisjenx/calligraphy/CalligraphyUtils;->pullFontPathFromTextAppearance(Landroid/content/Context;Landroid/util/AttributeSet;I)Ljava/lang/String;

    move-result-object v3

    .line 141
    :cond_32
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_4e

    move-object v4, p1

    .line 142
    check-cast v4, Landroid/widget/TextView;

    invoke-static {v4}, Luk/co/chrisjenx/calligraphy/CalligraphyFactory;->getStyleForTextView(Landroid/widget/TextView;)[I

    move-result-object v2

    .line 143
    .local v2, "styleForTextView":[I
    aget v4, v2, v5

    const/4 v6, -0x1

    if-eq v4, v6, :cond_83

    .line 144
    aget v4, v2, v0

    aget v6, v2, v5

    iget v7, p0, Luk/co/chrisjenx/calligraphy/CalligraphyFactory;->mAttributeId:I

    invoke-static {p2, v4, v6, v7}, Luk/co/chrisjenx/calligraphy/CalligraphyUtils;->pullFontPathFromTheme(Landroid/content/Context;III)Ljava/lang/String;

    move-result-object v3

    .line 150
    .end local v2    # "styleForTextView":[I
    :cond_4e
    :goto_4e
    const-string v4, "action_bar_title"

    invoke-static {p1, v4}, Luk/co/chrisjenx/calligraphy/CalligraphyFactory;->matchesResourceIdName(Landroid/view/View;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_5e

    const-string v4, "action_bar_subtitle"

    invoke-static {p1, v4}, Luk/co/chrisjenx/calligraphy/CalligraphyFactory;->matchesResourceIdName(Landroid/view/View;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5f

    :cond_5e
    move v0, v5

    .local v0, "deferred":Z
    :cond_5f
    move-object v4, p1

    .line 152
    check-cast v4, Landroid/widget/TextView;

    invoke-static {}, Luk/co/chrisjenx/calligraphy/CalligraphyConfig;->get()Luk/co/chrisjenx/calligraphy/CalligraphyConfig;

    move-result-object v5

    invoke-static {p2, v4, v5, v3, v0}, Luk/co/chrisjenx/calligraphy/CalligraphyUtils;->applyFontToTextView(Landroid/content/Context;Landroid/widget/TextView;Luk/co/chrisjenx/calligraphy/CalligraphyConfig;Ljava/lang/String;Z)V

    .line 157
    .end local v0    # "deferred":Z
    .end local v3    # "textViewFont":Ljava/lang/String;
    :cond_69
    invoke-static {}, Luk/co/chrisjenx/calligraphy/CalligraphyUtils;->canCheckForV7Toolbar()Z

    move-result v4

    if-eqz v4, :cond_13

    instance-of v4, p1, Landroid/support/v7/widget/Toolbar;

    if-eqz v4, :cond_13

    move-object v1, p1

    .line 158
    check-cast v1, Landroid/view/ViewGroup;

    .line 159
    .local v1, "parent":Landroid/view/ViewGroup;
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v4

    new-instance v5, Luk/co/chrisjenx/calligraphy/CalligraphyFactory$1;

    invoke-direct {v5, p0, v1, p2}, Luk/co/chrisjenx/calligraphy/CalligraphyFactory$1;-><init>(Luk/co/chrisjenx/calligraphy/CalligraphyFactory;Landroid/view/ViewGroup;Landroid/content/Context;)V

    invoke-virtual {v4, v5}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    goto :goto_13

    .line 146
    .end local v1    # "parent":Landroid/view/ViewGroup;
    .restart local v2    # "styleForTextView":[I
    .restart local v3    # "textViewFont":Ljava/lang/String;
    :cond_83
    aget v4, v2, v0

    iget v6, p0, Luk/co/chrisjenx/calligraphy/CalligraphyFactory;->mAttributeId:I

    invoke-static {p2, v4, v6}, Luk/co/chrisjenx/calligraphy/CalligraphyUtils;->pullFontPathFromTheme(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v3

    goto :goto_4e
.end method
