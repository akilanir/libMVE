.class public Lde/psdev/licensesdialog/LicensesDialogFragment;
.super Landroid/support/v4/app/DialogFragment;
.source "LicensesDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lde/psdev/licensesdialog/LicensesDialogFragment$Builder;
    }
.end annotation


# static fields
.field private static final ARGUMENT_DIVIDER_COLOR:Ljava/lang/String; = "ARGUMENT_DIVIDER_COLOR"

.field private static final ARGUMENT_FULL_LICENSE_TEXT:Ljava/lang/String; = "ARGUMENT_FULL_LICENSE_TEXT"

.field private static final ARGUMENT_INCLUDE_OWN_LICENSE:Ljava/lang/String; = "ARGUMENT_INCLUDE_OWN_LICENSE"

.field private static final ARGUMENT_NOTICES:Ljava/lang/String; = "ARGUMENT_NOTICES"

.field private static final ARGUMENT_NOTICES_XML_ID:Ljava/lang/String; = "ARGUMENT_NOTICES_XML_ID"

.field private static final ARGUMENT_THEME_XML_ID:Ljava/lang/String; = "ARGUMENT_THEME_XML_ID"

.field private static final ARGUMENT_USE_APPCOMPAT:Ljava/lang/String; = "ARGUMENT_USE_APPCOMPAT"

.field private static final STATE_CLOSE_TEXT:Ljava/lang/String; = "close_text"

.field private static final STATE_DIVIDER_COLOR:Ljava/lang/String; = "divider_color"

.field private static final STATE_LICENSES_TEXT:Ljava/lang/String; = "licenses_text"

.field private static final STATE_THEME_XML_ID:Ljava/lang/String; = "theme_xml_id"

.field private static final STATE_TITLE_TEXT:Ljava/lang/String; = "title_text"


# instance fields
.field private mCloseButtonText:Ljava/lang/String;

.field private mDividerColor:I

.field private mLicensesText:Ljava/lang/String;

.field private mOnDismissListener:Landroid/content/DialogInterface$OnDismissListener;

.field private mThemeResourceId:I

.field private mTitleText:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 102
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    .line 103
    return-void
.end method

.method static synthetic access$000(Lde/psdev/licensesdialog/model/Notices;ZZIIZ)Lde/psdev/licensesdialog/LicensesDialogFragment;
    .registers 7
    .param p0, "x0"    # Lde/psdev/licensesdialog/model/Notices;
    .param p1, "x1"    # Z
    .param p2, "x2"    # Z
    .param p3, "x3"    # I
    .param p4, "x4"    # I
    .param p5, "x5"    # Z

    .prologue
    .line 34
    invoke-static/range {p0 .. p5}, Lde/psdev/licensesdialog/LicensesDialogFragment;->newInstance(Lde/psdev/licensesdialog/model/Notices;ZZIIZ)Lde/psdev/licensesdialog/LicensesDialogFragment;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(IZZIIZ)Lde/psdev/licensesdialog/LicensesDialogFragment;
    .registers 7
    .param p0, "x0"    # I
    .param p1, "x1"    # Z
    .param p2, "x2"    # Z
    .param p3, "x3"    # I
    .param p4, "x4"    # I
    .param p5, "x5"    # Z

    .prologue
    .line 34
    invoke-static/range {p0 .. p5}, Lde/psdev/licensesdialog/LicensesDialogFragment;->newInstance(IZZIIZ)Lde/psdev/licensesdialog/LicensesDialogFragment;

    move-result-object v0

    return-object v0
.end method

.method private getNoticesXmlResourceId()I
    .registers 5

    .prologue
    .line 219
    sget v1, Lde/psdev/licensesdialog/R$raw;->notices:I

    .line 220
    .local v1, "resourceId":I
    invoke-virtual {p0}, Lde/psdev/licensesdialog/LicensesDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 221
    .local v0, "arguments":Landroid/os/Bundle;
    if-eqz v0, :cond_2e

    const-string v2, "ARGUMENT_NOTICES_XML_ID"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2e

    .line 222
    const-string v2, "ARGUMENT_NOTICES_XML_ID"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 223
    const-string v2, "raw"

    invoke-virtual {p0}, Lde/psdev/licensesdialog/LicensesDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/content/res/Resources;->getResourceTypeName(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2e

    .line 224
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "not a raw resource"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 228
    :cond_2e
    return v1
.end method

.method private static newInstance(IZZIIZ)Lde/psdev/licensesdialog/LicensesDialogFragment;
    .registers 9
    .param p0, "rawNoticesResourceId"    # I
    .param p1, "showFullLicenseText"    # Z
    .param p2, "includeOwnLicense"    # Z
    .param p3, "themeResourceId"    # I
    .param p4, "dividerColor"    # I
    .param p5, "useAppCompat"    # Z

    .prologue
    .line 86
    new-instance v1, Lde/psdev/licensesdialog/LicensesDialogFragment;

    invoke-direct {v1}, Lde/psdev/licensesdialog/LicensesDialogFragment;-><init>()V

    .line 87
    .local v1, "licensesDialogFragment":Lde/psdev/licensesdialog/LicensesDialogFragment;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 88
    .local v0, "args":Landroid/os/Bundle;
    const-string v2, "ARGUMENT_NOTICES_XML_ID"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 89
    const-string v2, "ARGUMENT_FULL_LICENSE_TEXT"

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 90
    const-string v2, "ARGUMENT_INCLUDE_OWN_LICENSE"

    invoke-virtual {v0, v2, p2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 91
    const-string v2, "ARGUMENT_THEME_XML_ID"

    invoke-virtual {v0, v2, p3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 92
    const-string v2, "ARGUMENT_DIVIDER_COLOR"

    invoke-virtual {v0, v2, p4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 93
    const-string v2, "ARGUMENT_USE_APPCOMPAT"

    invoke-virtual {v0, v2, p5}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 94
    invoke-virtual {v1, v0}, Lde/psdev/licensesdialog/LicensesDialogFragment;->setArguments(Landroid/os/Bundle;)V

    .line 95
    return-object v1
.end method

.method private static newInstance(Lde/psdev/licensesdialog/model/Notices;ZZIIZ)Lde/psdev/licensesdialog/LicensesDialogFragment;
    .registers 9
    .param p0, "notices"    # Lde/psdev/licensesdialog/model/Notices;
    .param p1, "showFullLicenseText"    # Z
    .param p2, "includeOwnLicense"    # Z
    .param p3, "themeResourceId"    # I
    .param p4, "dividerColor"    # I
    .param p5, "useAppCompat"    # Z

    .prologue
    .line 68
    new-instance v1, Lde/psdev/licensesdialog/LicensesDialogFragment;

    invoke-direct {v1}, Lde/psdev/licensesdialog/LicensesDialogFragment;-><init>()V

    .line 69
    .local v1, "licensesDialogFragment":Lde/psdev/licensesdialog/LicensesDialogFragment;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 70
    .local v0, "args":Landroid/os/Bundle;
    const-string v2, "ARGUMENT_NOTICES"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 71
    const-string v2, "ARGUMENT_FULL_LICENSE_TEXT"

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 72
    const-string v2, "ARGUMENT_INCLUDE_OWN_LICENSE"

    invoke-virtual {v0, v2, p2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 73
    const-string v2, "ARGUMENT_THEME_XML_ID"

    invoke-virtual {v0, v2, p3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 74
    const-string v2, "ARGUMENT_DIVIDER_COLOR"

    invoke-virtual {v0, v2, p4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 75
    const-string v2, "ARGUMENT_USE_APPCOMPAT"

    invoke-virtual {v0, v2, p5}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 76
    invoke-virtual {v1, v0}, Lde/psdev/licensesdialog/LicensesDialogFragment;->setArguments(Landroid/os/Bundle;)V

    .line 77
    return-object v1
.end method


# virtual methods
.method public getOnDismissListener()Landroid/content/DialogInterface$OnDismissListener;
    .registers 2

    .prologue
    .line 207
    iget-object v0, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mOnDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    return-object v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 10
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/16 v7, 0xe

    .line 111
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 112
    invoke-virtual {p0}, Lde/psdev/licensesdialog/LicensesDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 114
    .local v3, "resources":Landroid/content/res/Resources;
    if-eqz p1, :cond_44

    .line 115
    const-string v5, "title_text"

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mTitleText:Ljava/lang/String;

    .line 116
    const-string v5, "licenses_text"

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mLicensesText:Ljava/lang/String;

    .line 117
    const-string v5, "close_text"

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mCloseButtonText:Ljava/lang/String;

    .line 118
    const-string v5, "theme_xml_id"

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_33

    .line 119
    const-string v5, "theme_xml_id"

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mThemeResourceId:I

    .line 121
    :cond_33
    const-string v5, "divider_color"

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_43

    .line 122
    const-string v5, "divider_color"

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mDividerColor:I

    .line 164
    :cond_43
    :goto_43
    return-void

    .line 125
    :cond_44
    sget v5, Lde/psdev/licensesdialog/R$string;->notices_title:I

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mTitleText:Ljava/lang/String;

    .line 126
    sget v5, Lde/psdev/licensesdialog/R$string;->notices_close:I

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mCloseButtonText:Ljava/lang/String;

    .line 129
    :try_start_54
    invoke-virtual {p0}, Lde/psdev/licensesdialog/LicensesDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 130
    .local v0, "arguments":Landroid/os/Bundle;
    if-eqz v0, :cond_ff

    .line 131
    const-string v5, "ARGUMENT_NOTICES_XML_ID"

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_d4

    .line 132
    invoke-direct {p0}, Lde/psdev/licensesdialog/LicensesDialogFragment;->getNoticesXmlResourceId()I

    move-result v5

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v5

    invoke-static {v5}, Lde/psdev/licensesdialog/NoticesXmlParser;->parse(Ljava/io/InputStream;)Lde/psdev/licensesdialog/model/Notices;

    move-result-object v2

    .line 138
    .local v2, "notices":Lde/psdev/licensesdialog/model/Notices;
    :goto_6e
    const-string v5, "ARGUMENT_INCLUDE_OWN_LICENSE"

    const/4 v6, 0x0

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_80

    .line 139
    invoke-virtual {v2}, Lde/psdev/licensesdialog/model/Notices;->getNotices()Ljava/util/List;

    move-result-object v5

    sget-object v6, Lde/psdev/licensesdialog/LicensesDialog;->LICENSES_DIALOG_NOTICE:Lde/psdev/licensesdialog/model/Notice;

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 141
    :cond_80
    const-string v5, "ARGUMENT_FULL_LICENSE_TEXT"

    const/4 v6, 0x0

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    .line 142
    .local v4, "showFullLicenseText":Z
    const-string v5, "ARGUMENT_THEME_XML_ID"

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_9e

    .line 143
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v5, v7, :cond_ed

    .line 144
    const-string v5, "ARGUMENT_THEME_XML_ID"

    const v6, 0x1030132

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v5

    iput v5, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mThemeResourceId:I

    .line 149
    :cond_9e
    :goto_9e
    const-string v5, "ARGUMENT_DIVIDER_COLOR"

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_b5

    .line 150
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v5, v7, :cond_f6

    .line 151
    const-string v5, "ARGUMENT_DIVIDER_COLOR"

    const v6, 0x1060012

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v5

    iput v5, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mDividerColor:I

    .line 156
    :cond_b5
    :goto_b5
    invoke-virtual {p0}, Lde/psdev/licensesdialog/LicensesDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    invoke-static {v5}, Lde/psdev/licensesdialog/NoticesHtmlBuilder;->create(Landroid/content/Context;)Lde/psdev/licensesdialog/NoticesHtmlBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Lde/psdev/licensesdialog/NoticesHtmlBuilder;->setNotices(Lde/psdev/licensesdialog/model/Notices;)Lde/psdev/licensesdialog/NoticesHtmlBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Lde/psdev/licensesdialog/NoticesHtmlBuilder;->setShowFullLicenseText(Z)Lde/psdev/licensesdialog/NoticesHtmlBuilder;

    move-result-object v5

    invoke-virtual {v5}, Lde/psdev/licensesdialog/NoticesHtmlBuilder;->build()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mLicensesText:Ljava/lang/String;
    :try_end_cb
    .catch Ljava/lang/Exception; {:try_start_54 .. :try_end_cb} :catch_cd

    goto/16 :goto_43

    .line 160
    .end local v0    # "arguments":Landroid/os/Bundle;
    .end local v2    # "notices":Lde/psdev/licensesdialog/model/Notices;
    .end local v4    # "showFullLicenseText":Z
    :catch_cd
    move-exception v1

    .line 161
    .local v1, "e":Ljava/lang/Exception;
    new-instance v5, Ljava/lang/IllegalStateException;

    invoke-direct {v5, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 133
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v0    # "arguments":Landroid/os/Bundle;
    :cond_d4
    :try_start_d4
    const-string v5, "ARGUMENT_NOTICES"

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_e5

    .line 134
    const-string v5, "ARGUMENT_NOTICES"

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Lde/psdev/licensesdialog/model/Notices;

    .restart local v2    # "notices":Lde/psdev/licensesdialog/model/Notices;
    goto :goto_6e

    .line 136
    .end local v2    # "notices":Lde/psdev/licensesdialog/model/Notices;
    :cond_e5
    new-instance v5, Ljava/lang/IllegalStateException;

    const-string v6, "Missing ARGUMENT_NOTICES_XML_ID / ARGUMENT_NOTICES"

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 146
    .restart local v2    # "notices":Lde/psdev/licensesdialog/model/Notices;
    .restart local v4    # "showFullLicenseText":Z
    :cond_ed
    const-string v5, "ARGUMENT_THEME_XML_ID"

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mThemeResourceId:I

    goto :goto_9e

    .line 153
    :cond_f6
    const-string v5, "ARGUMENT_DIVIDER_COLOR"

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mDividerColor:I

    goto :goto_b5

    .line 158
    .end local v2    # "notices":Lde/psdev/licensesdialog/model/Notices;
    .end local v4    # "showFullLicenseText":Z
    :cond_ff
    new-instance v5, Ljava/lang/IllegalStateException;

    const-string v6, "Missing arguments"

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_107
    .catch Ljava/lang/Exception; {:try_start_d4 .. :try_end_107} :catch_cd
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .registers 7
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 182
    new-instance v2, Lde/psdev/licensesdialog/LicensesDialog$Builder;

    invoke-virtual {p0}, Lde/psdev/licensesdialog/LicensesDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    invoke-direct {v2, v3}, Lde/psdev/licensesdialog/LicensesDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v3, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mLicensesText:Ljava/lang/String;

    .line 183
    invoke-virtual {v2, v3}, Lde/psdev/licensesdialog/LicensesDialog$Builder;->setNotices(Ljava/lang/String;)Lde/psdev/licensesdialog/LicensesDialog$Builder;

    move-result-object v2

    iget-object v3, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mTitleText:Ljava/lang/String;

    .line 184
    invoke-virtual {v2, v3}, Lde/psdev/licensesdialog/LicensesDialog$Builder;->setTitle(Ljava/lang/String;)Lde/psdev/licensesdialog/LicensesDialog$Builder;

    move-result-object v2

    iget-object v3, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mCloseButtonText:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lde/psdev/licensesdialog/LicensesDialog$Builder;->setCloseText(Ljava/lang/String;)Lde/psdev/licensesdialog/LicensesDialog$Builder;

    move-result-object v2

    iget v3, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mThemeResourceId:I

    .line 185
    invoke-virtual {v2, v3}, Lde/psdev/licensesdialog/LicensesDialog$Builder;->setThemeResourceId(I)Lde/psdev/licensesdialog/LicensesDialog$Builder;

    move-result-object v2

    iget v3, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mDividerColor:I

    invoke-virtual {v2, v3}, Lde/psdev/licensesdialog/LicensesDialog$Builder;->setDividerColor(I)Lde/psdev/licensesdialog/LicensesDialog$Builder;

    move-result-object v0

    .line 186
    .local v0, "builder":Lde/psdev/licensesdialog/LicensesDialog$Builder;
    invoke-virtual {v0}, Lde/psdev/licensesdialog/LicensesDialog$Builder;->build()Lde/psdev/licensesdialog/LicensesDialog;

    move-result-object v1

    .line 187
    .local v1, "licensesDialog":Lde/psdev/licensesdialog/LicensesDialog;
    invoke-virtual {p0}, Lde/psdev/licensesdialog/LicensesDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string v3, "ARGUMENT_USE_APPCOMPAT"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_3d

    .line 188
    invoke-virtual {v1}, Lde/psdev/licensesdialog/LicensesDialog;->createAppCompat()Landroid/app/Dialog;

    move-result-object v2

    .line 190
    :goto_3c
    return-object v2

    :cond_3d
    invoke-virtual {v1}, Lde/psdev/licensesdialog/LicensesDialog;->create()Landroid/app/Dialog;

    move-result-object v2

    goto :goto_3c
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .registers 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 196
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onDismiss(Landroid/content/DialogInterface;)V

    .line 197
    iget-object v0, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mOnDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    if-eqz v0, :cond_c

    .line 198
    iget-object v0, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mOnDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    invoke-interface {v0, p1}, Landroid/content/DialogInterface$OnDismissListener;->onDismiss(Landroid/content/DialogInterface;)V

    .line 200
    :cond_c
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 168
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 169
    const-string v0, "title_text"

    iget-object v1, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mTitleText:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 170
    const-string v0, "licenses_text"

    iget-object v1, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mLicensesText:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 171
    const-string v0, "close_text"

    iget-object v1, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mCloseButtonText:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    iget v0, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mThemeResourceId:I

    if-eqz v0, :cond_23

    .line 173
    const-string v0, "theme_xml_id"

    iget v1, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mThemeResourceId:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 175
    :cond_23
    iget v0, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mDividerColor:I

    if-eqz v0, :cond_2e

    .line 176
    const-string v0, "divider_color"

    iget v1, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mDividerColor:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 178
    :cond_2e
    return-void
.end method

.method public setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V
    .registers 2
    .param p1, "onDismissListener"    # Landroid/content/DialogInterface$OnDismissListener;

    .prologue
    .line 211
    iput-object p1, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mOnDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    .line 212
    return-void
.end method
