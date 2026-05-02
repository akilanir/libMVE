.class public abstract Lcom/lb/material_preferences_library/PreferenceActivity;
.super Lcom/lb/material_preferences_library/AppCompatPreferenceActivity;
.source "PreferenceActivity.java"


# instance fields
.field private _toolbar:Landroid/support/v7/widget/Toolbar;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 19
    invoke-direct {p0}, Lcom/lb/material_preferences_library/AppCompatPreferenceActivity;-><init>()V

    return-void
.end method

.method public static buildPreferenceParentTree(Landroid/preference/PreferenceActivity;)Ljava/util/Map;
    .registers 8
    .param p0, "activity"    # Landroid/preference/PreferenceActivity;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/preference/PreferenceActivity;",
            ")",
            "Ljava/util/Map",
            "<",
            "Landroid/preference/Preference;",
            "Landroid/preference/PreferenceGroup;",
            ">;"
        }
    .end annotation

    .prologue
    .line 76
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 77
    .local v5, "result":Ljava/util/Map;, "Ljava/util/Map<Landroid/preference/Preference;Landroid/preference/PreferenceGroup;>;"
    new-instance v2, Ljava/util/Stack;

    invoke-direct {v2}, Ljava/util/Stack;-><init>()V

    .line 78
    .local v2, "curParents":Ljava/util/Stack;, "Ljava/util/Stack<Landroid/preference/PreferenceGroup;>;"
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/util/Stack;->add(Ljava/lang/Object;)Z

    .line 79
    :cond_11
    invoke-virtual {v2}, Ljava/util/Stack;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_37

    .line 81
    invoke-virtual {v2}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/preference/PreferenceGroup;

    .line 82
    .local v4, "parent":Landroid/preference/PreferenceGroup;
    invoke-virtual {v4}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v1

    .line 83
    .local v1, "childCount":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_22
    if-ge v3, v1, :cond_11

    .line 85
    invoke-virtual {v4, v3}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v0

    .line 86
    .local v0, "child":Landroid/preference/Preference;
    invoke-interface {v5, v0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    instance-of v6, v0, Landroid/preference/PreferenceGroup;

    if-eqz v6, :cond_34

    .line 88
    check-cast v0, Landroid/preference/PreferenceGroup;

    .end local v0    # "child":Landroid/preference/Preference;
    invoke-virtual {v2, v0}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    :cond_34
    add-int/lit8 v3, v3, 0x1

    goto :goto_22

    .line 91
    .end local v1    # "childCount":I
    .end local v3    # "i":I
    .end local v4    # "parent":Landroid/preference/PreferenceGroup;
    :cond_37
    return-object v5
.end method

.method private static getResIdFromAttribute(Landroid/app/Activity;I)I
    .registers 5
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "attr"    # I

    .prologue
    .line 66
    if-nez p1, :cond_4

    .line 67
    const/4 v1, 0x0

    .line 70
    :goto_3
    return v1

    .line 68
    :cond_4
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 69
    .local v0, "typedValue":Landroid/util/TypedValue;
    invoke-virtual {p0}, Landroid/app/Activity;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v0, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 70
    iget v1, v0, Landroid/util/TypedValue;->resourceId:I

    goto :goto_3
.end method


# virtual methods
.method protected abstract getPreferencesXmlId()I
    .annotation build Landroid/support/annotation/XmlRes;
    .end annotation
.end method

.method public getToolbar()Landroid/support/v7/widget/Toolbar;
    .registers 2

    .prologue
    .line 30
    iget-object v0, p0, Lcom/lb/material_preferences_library/PreferenceActivity;->_toolbar:Landroid/support/v7/widget/Toolbar;

    return-object v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 9
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 37
    invoke-super {p0, p1}, Lcom/lb/material_preferences_library/AppCompatPreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 38
    sget v5, Lcom/lb/material_preferences_library/R$layout;->mpl__preference_activity:I

    invoke-virtual {p0, v5}, Lcom/lb/material_preferences_library/PreferenceActivity;->setContentView(I)V

    .line 39
    sget v5, Lcom/lb/material_preferences_library/R$id;->abp__toolbar:I

    invoke-virtual {p0, v5}, Lcom/lb/material_preferences_library/PreferenceActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/support/v7/widget/Toolbar;

    iput-object v5, p0, Lcom/lb/material_preferences_library/PreferenceActivity;->_toolbar:Landroid/support/v7/widget/Toolbar;

    .line 40
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x15

    if-lt v5, v6, :cond_27

    .line 42
    sget v5, Lcom/lb/material_preferences_library/R$id;->abp__shadowView:I

    invoke-virtual {p0, v5}, Lcom/lb/material_preferences_library/PreferenceActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .line 43
    .local v4, "shadowView":Landroid/view/View;
    invoke-virtual {v4}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 44
    .local v1, "parent":Landroid/view/ViewGroup;
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 46
    .end local v1    # "parent":Landroid/view/ViewGroup;
    .end local v4    # "shadowView":Landroid/view/View;
    :cond_27
    invoke-virtual {p0}, Lcom/lb/material_preferences_library/PreferenceActivity;->getPreferencesXmlId()I

    move-result v5

    invoke-virtual {p0, v5}, Lcom/lb/material_preferences_library/PreferenceActivity;->addPreferencesFromResource(I)V

    .line 47
    invoke-static {p0}, Lcom/lb/material_preferences_library/PreferenceActivity;->buildPreferenceParentTree(Landroid/preference/PreferenceActivity;)Ljava/util/Map;

    move-result-object v3

    .line 48
    .local v3, "preferenceToParentMap":Ljava/util/Map;, "Ljava/util/Map<Landroid/preference/Preference;Landroid/preference/PreferenceGroup;>;"
    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_3a
    :goto_3a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_52

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/preference/PreferenceGroup;

    .line 49
    .local v2, "preferenceGroup":Landroid/preference/PreferenceGroup;
    if-eqz v2, :cond_3a

    instance-of v5, v2, Landroid/preference/PreferenceScreen;

    if-eqz v5, :cond_3a

    .line 50
    sget v5, Lcom/lb/material_preferences_library/R$layout;->mpl__preference:I

    invoke-virtual {v2, v5}, Landroid/preference/PreferenceGroup;->setLayoutResource(I)V

    goto :goto_3a

    .line 51
    .end local v2    # "preferenceGroup":Landroid/preference/PreferenceGroup;
    :cond_52
    iget-object v5, p0, Lcom/lb/material_preferences_library/PreferenceActivity;->_toolbar:Landroid/support/v7/widget/Toolbar;

    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Landroid/support/v7/widget/Toolbar;->setClickable(Z)V

    .line 52
    iget-object v5, p0, Lcom/lb/material_preferences_library/PreferenceActivity;->_toolbar:Landroid/support/v7/widget/Toolbar;

    sget v6, Lcom/lb/material_preferences_library/R$attr;->homeAsUpIndicator:I

    invoke-static {p0, v6}, Lcom/lb/material_preferences_library/PreferenceActivity;->getResIdFromAttribute(Landroid/app/Activity;I)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(I)V

    .line 53
    iget-object v5, p0, Lcom/lb/material_preferences_library/PreferenceActivity;->_toolbar:Landroid/support/v7/widget/Toolbar;

    new-instance v6, Lcom/lb/material_preferences_library/PreferenceActivity$1;

    invoke-direct {v6, p0}, Lcom/lb/material_preferences_library/PreferenceActivity$1;-><init>(Lcom/lb/material_preferences_library/PreferenceActivity;)V

    invoke-virtual {v5, v6}, Landroid/support/v7/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 61
    iget-object v5, p0, Lcom/lb/material_preferences_library/PreferenceActivity;->_toolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {p0}, Lcom/lb/material_preferences_library/PreferenceActivity;->getTitle()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/support/v7/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    .line 62
    return-void
.end method
