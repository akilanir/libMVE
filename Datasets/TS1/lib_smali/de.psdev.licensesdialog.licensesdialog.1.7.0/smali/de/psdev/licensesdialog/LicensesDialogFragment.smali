.class public Lde/psdev/licensesdialog/LicensesDialogFragment;
.super Landroid/support/v4/app/DialogFragment;
.source "LicensesDialogFragment.java"


# static fields
.field private static final ARGUMENT_DIVIDER_COLOR:Ljava/lang/String; = "ARGUMENT_DIVIDER_COLOR"

.field private static final ARGUMENT_FULL_LICENSE_TEXT:Ljava/lang/String; = "ARGUMENT_FULL_LICENSE_TEXT"

.field private static final ARGUMENT_INCLUDE_OWN_LICENSE:Ljava/lang/String; = "ARGUMENT_INCLUDE_OWN_LICENSE"

.field private static final ARGUMENT_NOTICES:Ljava/lang/String; = "ARGUMENT_NOTICES"

.field private static final ARGUMENT_NOTICES_XML_ID:Ljava/lang/String; = "ARGUMENT_NOTICES_XML_ID"

.field private static final ARGUMENT_THEME_XML_ID:Ljava/lang/String; = "ARGUMENT_THEME_XML_ID"

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
    .line 118
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    .line 119
    return-void
.end method

.method private static getColor(ILandroid/content/Context;)I
    .registers 3
    .param p0, "dividerColorId"    # I
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 115
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    return v0
.end method

.method private getNoticesXmlResourceId()I
    .registers 5

    .prologue
    .line 222
    sget v1, Lde/psdev/licensesdialog/R$raw;->notices:I

    .line 223
    .local v1, "resourceId":I
    invoke-virtual {p0}, Lde/psdev/licensesdialog/LicensesDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 224
    .local v0, "arguments":Landroid/os/Bundle;
    if-eqz v0, :cond_2e

    const-string v2, "ARGUMENT_NOTICES_XML_ID"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2e

    .line 225
    const-string v2, "ARGUMENT_NOTICES_XML_ID"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 226
    const-string v2, "raw"

    invoke-virtual {p0}, Lde/psdev/licensesdialog/LicensesDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/content/res/Resources;->getResourceTypeName(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2e

    .line 227
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "not a raw resource"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 231
    :cond_2e
    return v1
.end method

.method public static newInstance(I)Lde/psdev/licensesdialog/LicensesDialogFragment;
    .registers 2
    .param p0, "rawNoticesResourceId"    # I

    .prologue
    .line 52
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lde/psdev/licensesdialog/LicensesDialogFragment;->newInstance(IZ)Lde/psdev/licensesdialog/LicensesDialogFragment;

    move-result-object v0

    return-object v0
.end method

.method public static newInstance(IZ)Lde/psdev/licensesdialog/LicensesDialogFragment;
    .registers 3
    .param p0, "rawNoticesResourceId"    # I
    .param p1, "showFullLicenseText"    # Z

    .prologue
    .line 56
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lde/psdev/licensesdialog/LicensesDialogFragment;->newInstance(IZZ)Lde/psdev/licensesdialog/LicensesDialogFragment;

    move-result-object v0

    return-object v0
.end method

.method public static newInstance(IZZ)Lde/psdev/licensesdialog/LicensesDialogFragment;
    .registers 4
    .param p0, "rawNoticesResourceId"    # I
    .param p1, "showFullLicenseText"    # Z
    .param p2, "includeOwnLicense"    # Z

    .prologue
    .line 60
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lde/psdev/licensesdialog/LicensesDialogFragment;->newInstance(IZZI)Lde/psdev/licensesdialog/LicensesDialogFragment;

    move-result-object v0

    return-object v0
.end method

.method public static newInstance(IZZI)Lde/psdev/licensesdialog/LicensesDialogFragment;
    .registers 5
    .param p0, "rawNoticesResourceId"    # I
    .param p1, "showFullLicenseText"    # Z
    .param p2, "includeOwnLicense"    # Z
    .param p3, "themeResourceId"    # I

    .prologue
    .line 65
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, p3, v0}, Lde/psdev/licensesdialog/LicensesDialogFragment;->newInstance(IZZII)Lde/psdev/licensesdialog/LicensesDialogFragment;

    move-result-object v0

    return-object v0
.end method

.method public static newInstance(IZZII)Lde/psdev/licensesdialog/LicensesDialogFragment;
    .registers 11
    .param p0, "rawNoticesResourceId"    # I
    .param p1, "showFullLicenseText"    # Z
    .param p2, "includeOwnLicense"    # Z
    .param p3, "themeResourceId"    # I
    .param p4, "dividerColor"    # I

    .prologue
    .line 70
    const/4 v0, 0x0

    move v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-static/range {v0 .. v5}, Lde/psdev/licensesdialog/LicensesDialogFragment;->newInstance(Lde/psdev/licensesdialog/model/Notices;IZZII)Lde/psdev/licensesdialog/LicensesDialogFragment;

    move-result-object v0

    return-object v0
.end method

.method public static newInstance(IZZIILandroid/content/Context;)Lde/psdev/licensesdialog/LicensesDialogFragment;
    .registers 12
    .param p0, "rawNoticesResourceId"    # I
    .param p1, "showFullLicenseText"    # Z
    .param p2, "includeOwnLicense"    # Z
    .param p3, "themeResourceId"    # I
    .param p4, "dividerColorId"    # I
    .param p5, "context"    # Landroid/content/Context;

    .prologue
    .line 75
    const/4 v0, 0x0

    invoke-static {p4, p5}, Lde/psdev/licensesdialog/LicensesDialogFragment;->getColor(ILandroid/content/Context;)I

    move-result v5

    move v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    invoke-static/range {v0 .. v5}, Lde/psdev/licensesdialog/LicensesDialogFragment;->newInstance(Lde/psdev/licensesdialog/model/Notices;IZZII)Lde/psdev/licensesdialog/LicensesDialogFragment;

    move-result-object v0

    return-object v0
.end method

.method private static newInstance(Lde/psdev/licensesdialog/model/Notices;IZZII)Lde/psdev/licensesdialog/LicensesDialogFragment;
    .registers 9
    .param p0, "notices"    # Lde/psdev/licensesdialog/model/Notices;
    .param p1, "rawNoticesResourceId"    # I
    .param p2, "showFullLicenseText"    # Z
    .param p3, "includeOwnLicense"    # Z
    .param p4, "themeResourceId"    # I
    .param p5, "dividerColor"    # I

    .prologue
    .line 99
    new-instance v1, Lde/psdev/licensesdialog/LicensesDialogFragment;

    invoke-direct {v1}, Lde/psdev/licensesdialog/LicensesDialogFragment;-><init>()V

    .line 100
    .local v1, "licensesDialogFragment":Lde/psdev/licensesdialog/LicensesDialogFragment;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 101
    .local v0, "args":Landroid/os/Bundle;
    if-eqz p0, :cond_29

    .line 102
    const-string v2, "ARGUMENT_NOTICES"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 106
    :goto_11
    const-string v2, "ARGUMENT_FULL_LICENSE_TEXT"

    invoke-virtual {v0, v2, p2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 107
    const-string v2, "ARGUMENT_INCLUDE_OWN_LICENSE"

    invoke-virtual {v0, v2, p3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 108
    const-string v2, "ARGUMENT_THEME_XML_ID"

    invoke-virtual {v0, v2, p4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 109
    const-string v2, "ARGUMENT_DIVIDER_COLOR"

    invoke-virtual {v0, v2, p5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 110
    invoke-virtual {v1, v0}, Lde/psdev/licensesdialog/LicensesDialogFragment;->setArguments(Landroid/os/Bundle;)V

    .line 111
    return-object v1

    .line 104
    :cond_29
    const-string v2, "ARGUMENT_NOTICES_XML_ID"

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    goto :goto_11
.end method

.method public static newInstance(Lde/psdev/licensesdialog/model/Notices;ZZ)Lde/psdev/licensesdialog/LicensesDialogFragment;
    .registers 4
    .param p0, "notices"    # Lde/psdev/licensesdialog/model/Notices;
    .param p1, "showFullLicenseText"    # Z
    .param p2, "includeOwnLicense"    # Z

    .prologue
    .line 79
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lde/psdev/licensesdialog/LicensesDialogFragment;->newInstance(Lde/psdev/licensesdialog/model/Notices;ZZI)Lde/psdev/licensesdialog/LicensesDialogFragment;

    move-result-object v0

    return-object v0
.end method

.method public static newInstance(Lde/psdev/licensesdialog/model/Notices;ZZI)Lde/psdev/licensesdialog/LicensesDialogFragment;
    .registers 5
    .param p0, "notices"    # Lde/psdev/licensesdialog/model/Notices;
    .param p1, "showFullLicenseText"    # Z
    .param p2, "includeOwnLicense"    # Z
    .param p3, "themeResourceId"    # I

    .prologue
    .line 84
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, p3, v0}, Lde/psdev/licensesdialog/LicensesDialogFragment;->newInstance(Lde/psdev/licensesdialog/model/Notices;ZZII)Lde/psdev/licensesdialog/LicensesDialogFragment;

    move-result-object v0

    return-object v0
.end method

.method public static newInstance(Lde/psdev/licensesdialog/model/Notices;ZZII)Lde/psdev/licensesdialog/LicensesDialogFragment;
    .registers 11
    .param p0, "notices"    # Lde/psdev/licensesdialog/model/Notices;
    .param p1, "showFullLicenseText"    # Z
    .param p2, "includeOwnLicense"    # Z
    .param p3, "themeResourceId"    # I
    .param p4, "dividerColor"    # I

    .prologue
    .line 89
    const/4 v1, -0x1

    move-object v0, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-static/range {v0 .. v5}, Lde/psdev/licensesdialog/LicensesDialogFragment;->newInstance(Lde/psdev/licensesdialog/model/Notices;IZZII)Lde/psdev/licensesdialog/LicensesDialogFragment;

    move-result-object v0

    return-object v0
.end method

.method public static newInstance(Lde/psdev/licensesdialog/model/Notices;ZZIILandroid/content/Context;)Lde/psdev/licensesdialog/LicensesDialogFragment;
    .registers 12
    .param p0, "notices"    # Lde/psdev/licensesdialog/model/Notices;
    .param p1, "showFullLicenseText"    # Z
    .param p2, "includeOwnLicense"    # Z
    .param p3, "themeResourceId"    # I
    .param p4, "dividerColorId"    # I
    .param p5, "context"    # Landroid/content/Context;

    .prologue
    .line 94
    const/4 v1, -0x1

    invoke-static {p4, p5}, Lde/psdev/licensesdialog/LicensesDialogFragment;->getColor(ILandroid/content/Context;)I

    move-result v5

    move-object v0, p0

    move v2, p1

    move v3, p2

    move v4, p3

    invoke-static/range {v0 .. v5}, Lde/psdev/licensesdialog/LicensesDialogFragment;->newInstance(Lde/psdev/licensesdialog/model/Notices;IZZII)Lde/psdev/licensesdialog/LicensesDialogFragment;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getOnDismissListener()Landroid/content/DialogInterface$OnDismissListener;
    .registers 2

    .prologue
    .line 212
    iget-object v0, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mOnDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    return-object v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 10
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/16 v7, 0xe

    .line 123
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 124
    invoke-virtual {p0}, Lde/psdev/licensesdialog/LicensesDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 126
    .local v3, "resources":Landroid/content/res/Resources;
    if-eqz p1, :cond_44

    .line 127
    const-string v5, "title_text"

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mTitleText:Ljava/lang/String;

    .line 128
    const-string v5, "licenses_text"

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mLicensesText:Ljava/lang/String;

    .line 129
    const-string v5, "close_text"

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mCloseButtonText:Ljava/lang/String;

    .line 130
    const-string v5, "theme_xml_id"

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_33

    .line 131
    const-string v5, "theme_xml_id"

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mThemeResourceId:I

    .line 133
    :cond_33
    const-string v5, "divider_color"

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_43

    .line 134
    const-string v5, "divider_color"

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mDividerColor:I

    .line 176
    :cond_43
    :goto_43
    return-void

    .line 137
    :cond_44
    sget v5, Lde/psdev/licensesdialog/R$string;->notices_title:I

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mTitleText:Ljava/lang/String;

    .line 138
    sget v5, Lde/psdev/licensesdialog/R$string;->notices_close:I

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mCloseButtonText:Ljava/lang/String;

    .line 141
    :try_start_54
    invoke-virtual {p0}, Lde/psdev/licensesdialog/LicensesDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 142
    .local v0, "arguments":Landroid/os/Bundle;
    if-eqz v0, :cond_ff

    .line 143
    const-string v5, "ARGUMENT_NOTICES_XML_ID"

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_d4

    .line 144
    invoke-direct {p0}, Lde/psdev/licensesdialog/LicensesDialogFragment;->getNoticesXmlResourceId()I

    move-result v5

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v5

    invoke-static {v5}, Lde/psdev/licensesdialog/NoticesXmlParser;->parse(Ljava/io/InputStream;)Lde/psdev/licensesdialog/model/Notices;

    move-result-object v2

    .line 150
    .local v2, "notices":Lde/psdev/licensesdialog/model/Notices;
    :goto_6e
    const-string v5, "ARGUMENT_INCLUDE_OWN_LICENSE"

    const/4 v6, 0x0

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_80

    .line 151
    invoke-virtual {v2}, Lde/psdev/licensesdialog/model/Notices;->getNotices()Ljava/util/List;

    move-result-object v5

    sget-object v6, Lde/psdev/licensesdialog/LicensesDialog;->LICENSES_DIALOG_NOTICE:Lde/psdev/licensesdialog/model/Notice;

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 153
    :cond_80
    const-string v5, "ARGUMENT_FULL_LICENSE_TEXT"

    const/4 v6, 0x0

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    .line 154
    .local v4, "showFullLicenseText":Z
    const-string v5, "ARGUMENT_THEME_XML_ID"

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_9e

    .line 155
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v5, v7, :cond_ed

    .line 156
    const-string v5, "ARGUMENT_THEME_XML_ID"

    const v6, 0x1030132

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v5

    iput v5, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mThemeResourceId:I

    .line 161
    :cond_9e
    :goto_9e
    const-string v5, "ARGUMENT_DIVIDER_COLOR"

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_b5

    .line 162
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v5, v7, :cond_f6

    .line 163
    const-string v5, "ARGUMENT_DIVIDER_COLOR"

    const v6, 0x1060012

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v5

    iput v5, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mDividerColor:I

    .line 168
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

    .line 172
    .end local v0    # "arguments":Landroid/os/Bundle;
    .end local v2    # "notices":Lde/psdev/licensesdialog/model/Notices;
    .end local v4    # "showFullLicenseText":Z
    :catch_cd
    move-exception v1

    .line 173
    .local v1, "e":Ljava/lang/Exception;
    new-instance v5, Ljava/lang/IllegalStateException;

    invoke-direct {v5, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 145
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v0    # "arguments":Landroid/os/Bundle;
    :cond_d4
    :try_start_d4
    const-string v5, "ARGUMENT_NOTICES"

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_e5

    .line 146
    const-string v5, "ARGUMENT_NOTICES"

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Lde/psdev/licensesdialog/model/Notices;

    .restart local v2    # "notices":Lde/psdev/licensesdialog/model/Notices;
    goto :goto_6e

    .line 148
    .end local v2    # "notices":Lde/psdev/licensesdialog/model/Notices;
    :cond_e5
    new-instance v5, Ljava/lang/IllegalStateException;

    const-string v6, "Missing ARGUMENT_NOTICES_XML_ID / ARGUMENT_NOTICES"

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 158
    .restart local v2    # "notices":Lde/psdev/licensesdialog/model/Notices;
    .restart local v4    # "showFullLicenseText":Z
    :cond_ed
    const-string v5, "ARGUMENT_THEME_XML_ID"

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mThemeResourceId:I

    goto :goto_9e

    .line 165
    :cond_f6
    const-string v5, "ARGUMENT_DIVIDER_COLOR"

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mDividerColor:I

    goto :goto_b5

    .line 170
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
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 194
    new-instance v0, Lde/psdev/licensesdialog/LicensesDialog$Builder;

    invoke-virtual {p0}, Lde/psdev/licensesdialog/LicensesDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Lde/psdev/licensesdialog/LicensesDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mLicensesText:Ljava/lang/String;

    .line 195
    invoke-virtual {v0, v1}, Lde/psdev/licensesdialog/LicensesDialog$Builder;->setNotices(Ljava/lang/String;)Lde/psdev/licensesdialog/LicensesDialog$Builder;

    move-result-object v0

    iget-object v1, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mTitleText:Ljava/lang/String;

    .line 196
    invoke-virtual {v0, v1}, Lde/psdev/licensesdialog/LicensesDialog$Builder;->setTitle(Ljava/lang/String;)Lde/psdev/licensesdialog/LicensesDialog$Builder;

    move-result-object v0

    iget-object v1, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mCloseButtonText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lde/psdev/licensesdialog/LicensesDialog$Builder;->setCloseText(Ljava/lang/String;)Lde/psdev/licensesdialog/LicensesDialog$Builder;

    move-result-object v0

    iget v1, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mThemeResourceId:I

    .line 197
    invoke-virtual {v0, v1}, Lde/psdev/licensesdialog/LicensesDialog$Builder;->setThemeResourceId(I)Lde/psdev/licensesdialog/LicensesDialog$Builder;

    move-result-object v0

    iget v1, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mDividerColor:I

    invoke-virtual {v0, v1}, Lde/psdev/licensesdialog/LicensesDialog$Builder;->setDividerColor(I)Lde/psdev/licensesdialog/LicensesDialog$Builder;

    move-result-object v0

    .line 198
    invoke-virtual {v0}, Lde/psdev/licensesdialog/LicensesDialog$Builder;->build()Lde/psdev/licensesdialog/LicensesDialog;

    move-result-object v0

    invoke-virtual {v0}, Lde/psdev/licensesdialog/LicensesDialog;->create()Landroid/app/Dialog;

    move-result-object v0

    return-object v0
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .registers 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 203
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onDismiss(Landroid/content/DialogInterface;)V

    .line 204
    iget-object v0, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mOnDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    if-eqz v0, :cond_c

    .line 205
    iget-object v0, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mOnDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    invoke-interface {v0, p1}, Landroid/content/DialogInterface$OnDismissListener;->onDismiss(Landroid/content/DialogInterface;)V

    .line 207
    :cond_c
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 180
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 181
    const-string v0, "title_text"

    iget-object v1, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mTitleText:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 182
    const-string v0, "licenses_text"

    iget-object v1, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mLicensesText:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 183
    const-string v0, "close_text"

    iget-object v1, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mCloseButtonText:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 184
    iget v0, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mThemeResourceId:I

    if-eqz v0, :cond_23

    .line 185
    const-string v0, "theme_xml_id"

    iget v1, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mThemeResourceId:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 187
    :cond_23
    iget v0, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mDividerColor:I

    if-eqz v0, :cond_2e

    .line 188
    const-string v0, "divider_color"

    iget v1, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mDividerColor:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 190
    :cond_2e
    return-void
.end method

.method public setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V
    .registers 2
    .param p1, "onDismissListener"    # Landroid/content/DialogInterface$OnDismissListener;

    .prologue
    .line 216
    iput-object p1, p0, Lde/psdev/licensesdialog/LicensesDialogFragment;->mOnDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    .line 217
    return-void
.end method
