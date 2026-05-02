.class public Lcom/mikepenz/aboutlibraries/ui/LibsFragment;
.super Landroid/support/v4/app/Fragment;
.source "LibsFragment.java"


# instance fields
.field builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

.field private comparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lcom/mikepenz/aboutlibraries/entity/Library;",
            ">;"
        }
    .end annotation
.end field

.field private libraries:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/aboutlibraries/entity/Library;",
            ">;"
        }
    .end annotation
.end field

.field private mAdapter:Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;

.field private mRecyclerView:Landroid/support/v7/widget/RecyclerView;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 49
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    .line 39
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    .line 50
    return-void
.end method

.method private extractBooleanBundleOrResource(Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/Boolean;Ljava/lang/String;)Ljava/lang/Boolean;
    .registers 7
    .param p1, "libs"    # Lcom/mikepenz/aboutlibraries/Libs;
    .param p2, "value"    # Ljava/lang/Boolean;
    .param p3, "resName"    # Ljava/lang/String;

    .prologue
    .line 201
    const/4 v1, 0x0

    .line 202
    .local v1, "result":Ljava/lang/Boolean;
    if-eqz p2, :cond_5

    .line 203
    move-object v1, p2

    .line 213
    :cond_4
    :goto_4
    return-object v1

    .line 205
    :cond_5
    invoke-virtual {p0}, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {p1, v2, p3}, Lcom/mikepenz/aboutlibraries/Libs;->getStringResourceByName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 206
    .local v0, "descriptionShowVersion":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 208
    :try_start_13
    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_1a} :catch_1c

    move-result-object v1

    goto :goto_4

    .line 209
    :catch_1c
    move-exception v2

    goto :goto_4
.end method

.method private extractStringBundleOrResource(Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p1, "libs"    # Lcom/mikepenz/aboutlibraries/Libs;
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "resName"    # Ljava/lang/String;

    .prologue
    .line 225
    const/4 v1, 0x0

    .line 226
    .local v1, "result":Ljava/lang/String;
    if-eqz p2, :cond_5

    .line 227
    move-object v1, p2

    .line 234
    :cond_4
    :goto_4
    return-object v1

    .line 229
    :cond_5
    invoke-virtual {p0}, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {p1, v2, p3}, Lcom/mikepenz/aboutlibraries/Libs;->getStringResourceByName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 230
    .local v0, "descriptionShowVersion":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 231
    move-object v1, v0

    goto :goto_4
.end method

.method private generateAboutThisAppSection()V
    .registers 9

    .prologue
    .line 159
    iget-object v7, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v7, v7, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowIcon:Ljava/lang/Boolean;

    if-eqz v7, :cond_5a

    iget-object v7, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v7, v7, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersion:Ljava/lang/Boolean;

    if-nez v7, :cond_1c

    iget-object v7, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v7, v7, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersionName:Ljava/lang/Boolean;

    if-nez v7, :cond_1c

    iget-object v7, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v7, v7, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersionCode:Ljava/lang/Boolean;

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    if-eqz v7, :cond_5a

    .line 161
    :cond_1c
    invoke-virtual {p0}, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v7

    invoke-virtual {v7}, Landroid/support/v4/app/FragmentActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    .line 163
    .local v4, "pm":Landroid/content/pm/PackageManager;
    invoke-virtual {p0}, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v7

    invoke-virtual {v7}, Landroid/support/v4/app/FragmentActivity;->getPackageName()Ljava/lang/String;

    move-result-object v3

    .line 165
    .local v3, "packageName":Ljava/lang/String;
    const/4 v0, 0x0

    .line 166
    .local v0, "appInfo":Landroid/content/pm/ApplicationInfo;
    const/4 v2, 0x0

    .line 168
    .local v2, "packageInfo":Landroid/content/pm/PackageInfo;
    const/4 v7, 0x0

    :try_start_2f
    invoke-virtual {v4, v3, v7}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 169
    const/4 v7, 0x0

    invoke-virtual {v4, v3, v7}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_37
    .catch Ljava/lang/Exception; {:try_start_2f .. :try_end_37} :catch_5b

    move-result-object v2

    .line 174
    :goto_38
    const/4 v1, 0x0

    .line 175
    .local v1, "icon":Landroid/graphics/drawable/Drawable;
    iget-object v7, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v7, v7, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowIcon:Ljava/lang/Boolean;

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    if-eqz v7, :cond_49

    if-eqz v0, :cond_49

    .line 176
    invoke-virtual {v0, v4}, Landroid/content/pm/ApplicationInfo;->loadIcon(Landroid/content/pm/PackageManager;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 180
    :cond_49
    const/4 v6, 0x0

    .line 181
    .local v6, "versionName":Ljava/lang/String;
    const/4 v5, 0x0

    .line 182
    .local v5, "versionCode":Ljava/lang/Integer;
    if-eqz v2, :cond_55

    .line 183
    iget-object v6, v2, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    .line 184
    iget v7, v2, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 188
    :cond_55
    iget-object v7, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->mAdapter:Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;

    invoke-virtual {v7, v6, v5, v1}, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->setHeader(Ljava/lang/String;Ljava/lang/Integer;Landroid/graphics/drawable/Drawable;)V

    .line 190
    .end local v0    # "appInfo":Landroid/content/pm/ApplicationInfo;
    .end local v1    # "icon":Landroid/graphics/drawable/Drawable;
    .end local v2    # "packageInfo":Landroid/content/pm/PackageInfo;
    .end local v3    # "packageName":Ljava/lang/String;
    .end local v4    # "pm":Landroid/content/pm/PackageManager;
    .end local v5    # "versionCode":Ljava/lang/Integer;
    .end local v6    # "versionName":Ljava/lang/String;
    :cond_5a
    return-void

    .line 170
    .restart local v0    # "appInfo":Landroid/content/pm/ApplicationInfo;
    .restart local v2    # "packageInfo":Landroid/content/pm/PackageInfo;
    .restart local v3    # "packageName":Ljava/lang/String;
    .restart local v4    # "pm":Landroid/content/pm/PackageManager;
    :catch_5b
    move-exception v7

    goto :goto_38
.end method


# virtual methods
.method public onAttach(Landroid/app/Activity;)V
    .registers 9
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 58
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onAttach(Landroid/app/Activity;)V

    .line 63
    invoke-virtual {p0}, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v6

    .line 64
    .local v6, "bundle":Landroid/os/Bundle;
    if-eqz v6, :cond_13

    .line 65
    const-string v1, "data"

    invoke-virtual {v6, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v1

    check-cast v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    .line 69
    :cond_13
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v1, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->fields:[Ljava/lang/String;

    if-nez v1, :cond_10c

    .line 70
    new-instance v0, Lcom/mikepenz/aboutlibraries/Libs;

    invoke-virtual {p0}, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/mikepenz/aboutlibraries/Libs;-><init>(Landroid/content/Context;)V

    .line 76
    .local v0, "libs":Lcom/mikepenz/aboutlibraries/Libs;
    :goto_22
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v2, v2, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowIcon:Ljava/lang/Boolean;

    const-string v3, "aboutLibraries_description_showIcon"

    invoke-direct {p0, v0, v2, v3}, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->extractBooleanBundleOrResource(Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/Boolean;Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowIcon:Ljava/lang/Boolean;

    .line 77
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v2, v2, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersion:Ljava/lang/Boolean;

    const-string v3, "aboutLibraries_description_showVersion"

    invoke-direct {p0, v0, v2, v3}, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->extractBooleanBundleOrResource(Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/Boolean;Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersion:Ljava/lang/Boolean;

    .line 78
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v2, v2, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersionName:Ljava/lang/Boolean;

    const-string v3, "aboutLibraries_description_showVersionName"

    invoke-direct {p0, v0, v2, v3}, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->extractBooleanBundleOrResource(Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/Boolean;Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersionName:Ljava/lang/Boolean;

    .line 79
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v2, v2, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersionCode:Ljava/lang/Boolean;

    const-string v3, "aboutLibraries_description_showVersionCode"

    invoke-direct {p0, v0, v2, v3}, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->extractBooleanBundleOrResource(Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/Boolean;Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersionCode:Ljava/lang/Boolean;

    .line 81
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v2, v2, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppName:Ljava/lang/String;

    const-string v3, "aboutLibraries_description_name"

    invoke-direct {p0, v0, v2, v3}, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->extractStringBundleOrResource(Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppName:Ljava/lang/String;

    .line 82
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v2, v2, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutDescription:Ljava/lang/String;

    const-string v3, "aboutLibraries_description_text"

    invoke-direct {p0, v0, v2, v3}, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->extractStringBundleOrResource(Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutDescription:Ljava/lang/String;

    .line 84
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v2, v2, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial1:Ljava/lang/String;

    const-string v3, "aboutLibraries_description_special1_name"

    invoke-direct {p0, v0, v2, v3}, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->extractStringBundleOrResource(Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial1:Ljava/lang/String;

    .line 85
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v2, v2, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial1Description:Ljava/lang/String;

    const-string v3, "aboutLibraries_description_special1_text"

    invoke-direct {p0, v0, v2, v3}, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->extractStringBundleOrResource(Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial1Description:Ljava/lang/String;

    .line 86
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v2, v2, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial2:Ljava/lang/String;

    const-string v3, "aboutLibraries_description_special2_name"

    invoke-direct {p0, v0, v2, v3}, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->extractStringBundleOrResource(Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial2:Ljava/lang/String;

    .line 87
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v2, v2, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial2Description:Ljava/lang/String;

    const-string v3, "aboutLibraries_description_special2_text"

    invoke-direct {p0, v0, v2, v3}, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->extractStringBundleOrResource(Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial2Description:Ljava/lang/String;

    .line 88
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v2, v2, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial3:Ljava/lang/String;

    const-string v3, "aboutLibraries_description_special3_name"

    invoke-direct {p0, v0, v2, v3}, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->extractStringBundleOrResource(Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial3:Ljava/lang/String;

    .line 89
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v2, v2, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial3Description:Ljava/lang/String;

    const-string v3, "aboutLibraries_description_special3_text"

    invoke-direct {p0, v0, v2, v3}, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->extractStringBundleOrResource(Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial3Description:Ljava/lang/String;

    .line 92
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v1, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->libraryModification:Ljava/util/HashMap;

    invoke-virtual {v0, v1}, Lcom/mikepenz/aboutlibraries/Libs;->modifyLibraries(Ljava/util/HashMap;)V

    .line 95
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v1, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->sort:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_11b

    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v1, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->libraryComparator:Ljava/util/Comparator;

    if-nez v1, :cond_11b

    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->comparator:Ljava/util/Comparator;

    if-nez v1, :cond_11b

    const/4 v5, 0x1

    .line 96
    .local v5, "doDefaultSort":Z
    :goto_e6
    invoke-virtual {p0}, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v2, v2, Lcom/mikepenz/aboutlibraries/LibsBuilder;->internalLibraries:[Ljava/lang/String;

    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v3, v3, Lcom/mikepenz/aboutlibraries/LibsBuilder;->excludeLibraries:[Ljava/lang/String;

    iget-object v4, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v4, v4, Lcom/mikepenz/aboutlibraries/LibsBuilder;->autoDetect:Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    invoke-virtual/range {v0 .. v5}, Lcom/mikepenz/aboutlibraries/Libs;->prepareLibraries(Landroid/content/Context;[Ljava/lang/String;[Ljava/lang/String;ZZ)Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->libraries:Ljava/util/ArrayList;

    .line 98
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->comparator:Ljava/util/Comparator;

    if-eqz v1, :cond_11d

    .line 99
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->libraries:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->comparator:Ljava/util/Comparator;

    invoke-static {v1, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 103
    :cond_10b
    :goto_10b
    return-void

    .line 72
    .end local v0    # "libs":Lcom/mikepenz/aboutlibraries/Libs;
    .end local v5    # "doDefaultSort":Z
    :cond_10c
    new-instance v0, Lcom/mikepenz/aboutlibraries/Libs;

    invoke-virtual {p0}, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v2, v2, Lcom/mikepenz/aboutlibraries/LibsBuilder;->fields:[Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lcom/mikepenz/aboutlibraries/Libs;-><init>(Landroid/content/Context;[Ljava/lang/String;)V

    .restart local v0    # "libs":Lcom/mikepenz/aboutlibraries/Libs;
    goto/16 :goto_22

    .line 95
    :cond_11b
    const/4 v5, 0x0

    goto :goto_e6

    .line 100
    .restart local v5    # "doDefaultSort":Z
    :cond_11d
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v1, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->libraryComparator:Ljava/util/Comparator;

    if-eqz v1, :cond_10b

    .line 101
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->libraries:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v2, v2, Lcom/mikepenz/aboutlibraries/LibsBuilder;->libraryComparator:Ljava/util/Comparator;

    invoke-static {v1, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    goto :goto_10b
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 8
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 108
    sget v1, Lcom/mikepenz/aboutlibraries/R$layout;->fragment_opensource:I

    const/4 v2, 0x0

    invoke-virtual {p1, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 111
    .local v0, "view":Landroid/view/View;
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getUiListener()Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsUIListener;

    move-result-object v1

    if-eqz v1, :cond_1d

    .line 112
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getUiListener()Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsUIListener;

    move-result-object v1

    invoke-interface {v1, v0}, Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsUIListener;->preOnCreateView(Landroid/view/View;)Landroid/view/View;

    move-result-object v0

    .line 116
    :cond_1d
    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v1

    sget v2, Lcom/mikepenz/aboutlibraries/R$id;->cardListView:I

    if-ne v1, v2, :cond_6c

    move-object v1, v0

    .line 117
    check-cast v1, Landroid/support/v7/widget/RecyclerView;

    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 121
    :goto_2a
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v2, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 122
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v2, Landroid/support/v7/widget/DefaultItemAnimator;

    invoke-direct {v2}, Landroid/support/v7/widget/DefaultItemAnimator;-><init>()V

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/RecyclerView;->setItemAnimator(Landroid/support/v7/widget/RecyclerView$ItemAnimator;)V

    .line 123
    new-instance v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    invoke-direct {v1, v2}, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;-><init>(Lcom/mikepenz/aboutlibraries/LibsBuilder;)V

    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->mAdapter:Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;

    .line 124
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->mAdapter:Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 126
    invoke-direct {p0}, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->generateAboutThisAppSection()V

    .line 129
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getUiListener()Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsUIListener;

    move-result-object v1

    if-eqz v1, :cond_6b

    .line 130
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getUiListener()Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsUIListener;

    move-result-object v1

    invoke-interface {v1, v0}, Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsUIListener;->postOnCreateView(Landroid/view/View;)Landroid/view/View;

    move-result-object v0

    .line 133
    :cond_6b
    return-object v0

    .line 119
    :cond_6c
    sget v1, Lcom/mikepenz/aboutlibraries/R$id;->cardListView:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/RecyclerView;

    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    goto :goto_2a
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 7
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 138
    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->mAdapter:Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;

    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->libraries:Ljava/util/ArrayList;

    invoke-virtual {v2, v3}, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->addLibs(Ljava/util/List;)V

    .line 140
    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v2, v2, Lcom/mikepenz/aboutlibraries/LibsBuilder;->animate:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_3a

    .line 143
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getLayoutAnimationController()Landroid/view/animation/LayoutAnimationController;

    move-result-object v2

    if-nez v2, :cond_3e

    .line 144
    invoke-virtual {p0}, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    const v3, 0x10a0002

    invoke-static {v2, v3}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 145
    .local v0, "fadeIn":Landroid/view/animation/Animation;
    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v2, v3}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 146
    new-instance v1, Landroid/view/animation/LayoutAnimationController;

    invoke-direct {v1, v0}, Landroid/view/animation/LayoutAnimationController;-><init>(Landroid/view/animation/Animation;)V

    .line 151
    .end local v0    # "fadeIn":Landroid/view/animation/Animation;
    .local v1, "layoutAnimationController":Landroid/view/animation/LayoutAnimationController;
    :goto_30
    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v2, v1}, Landroid/support/v7/widget/RecyclerView;->setLayoutAnimation(Landroid/view/animation/LayoutAnimationController;)V

    .line 152
    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView;->startLayoutAnimation()V

    .line 155
    .end local v1    # "layoutAnimationController":Landroid/view/animation/LayoutAnimationController;
    :cond_3a
    invoke-super {p0, p1, p2}, Landroid/support/v4/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 156
    return-void

    .line 148
    :cond_3e
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getLayoutAnimationController()Landroid/view/animation/LayoutAnimationController;

    move-result-object v1

    .restart local v1    # "layoutAnimationController":Landroid/view/animation/LayoutAnimationController;
    goto :goto_30
.end method

.method public setLibraryComparator(Ljava/util/Comparator;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator",
            "<",
            "Lcom/mikepenz/aboutlibraries/entity/Library;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 53
    .local p1, "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<Lcom/mikepenz/aboutlibraries/entity/Library;>;"
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->comparator:Ljava/util/Comparator;

    .line 54
    return-void
.end method
