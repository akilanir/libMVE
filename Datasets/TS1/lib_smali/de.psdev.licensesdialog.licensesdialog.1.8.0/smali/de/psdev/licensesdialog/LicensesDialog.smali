.class public Lde/psdev/licensesdialog/LicensesDialog;
.super Ljava/lang/Object;
.source "LicensesDialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lde/psdev/licensesdialog/LicensesDialog$Builder;
    }
.end annotation


# static fields
.field public static final LICENSES_DIALOG_NOTICE:Lde/psdev/licensesdialog/model/Notice;


# instance fields
.field private final mCloseText:Ljava/lang/String;

.field private final mContext:Landroid/content/Context;

.field private final mDividerColor:I

.field private final mLicensesText:Ljava/lang/String;

.field private mOnDismissListener:Landroid/content/DialogInterface$OnDismissListener;

.field private final mThemeResourceId:I

.field private final mTitleText:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    .line 35
    new-instance v0, Lde/psdev/licensesdialog/model/Notice;

    const-string v1, "LicensesDialog"

    const-string v2, "http://psdev.de/LicensesDialog"

    const-string v3, "Copyright 2013 Philip Schiffer"

    new-instance v4, Lde/psdev/licensesdialog/licenses/ApacheSoftwareLicense20;

    invoke-direct {v4}, Lde/psdev/licensesdialog/licenses/ApacheSoftwareLicense20;-><init>()V

    invoke-direct {v0, v1, v2, v3, v4}, Lde/psdev/licensesdialog/model/Notice;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lde/psdev/licensesdialog/licenses/License;)V

    sput-object v0, Lde/psdev/licensesdialog/LicensesDialog;->LICENSES_DIALOG_NOTICE:Lde/psdev/licensesdialog/model/Notice;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;II)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "licensesText"    # Ljava/lang/String;
    .param p3, "titleText"    # Ljava/lang/String;
    .param p4, "closeText"    # Ljava/lang/String;
    .param p5, "themeResourceId"    # I
    .param p6, "dividerColor"    # I

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iput-object p1, p0, Lde/psdev/licensesdialog/LicensesDialog;->mContext:Landroid/content/Context;

    .line 55
    iput-object p3, p0, Lde/psdev/licensesdialog/LicensesDialog;->mTitleText:Ljava/lang/String;

    .line 56
    iput-object p2, p0, Lde/psdev/licensesdialog/LicensesDialog;->mLicensesText:Ljava/lang/String;

    .line 57
    iput-object p4, p0, Lde/psdev/licensesdialog/LicensesDialog;->mCloseText:Ljava/lang/String;

    .line 58
    iput p5, p0, Lde/psdev/licensesdialog/LicensesDialog;->mThemeResourceId:I

    .line 59
    iput p6, p0, Lde/psdev/licensesdialog/LicensesDialog;->mDividerColor:I

    .line 60
    return-void
.end method

.method synthetic constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IILde/psdev/licensesdialog/LicensesDialog$1;)V
    .registers 8
    .param p1, "x0"    # Landroid/content/Context;
    .param p2, "x1"    # Ljava/lang/String;
    .param p3, "x2"    # Ljava/lang/String;
    .param p4, "x3"    # Ljava/lang/String;
    .param p5, "x4"    # I
    .param p6, "x5"    # I
    .param p7, "x6"    # Lde/psdev/licensesdialog/LicensesDialog$1;

    .prologue
    .line 34
    invoke-direct/range {p0 .. p6}, Lde/psdev/licensesdialog/LicensesDialog;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;II)V

    return-void
.end method

.method static synthetic access$000(Lde/psdev/licensesdialog/LicensesDialog;)Landroid/content/DialogInterface$OnDismissListener;
    .registers 2
    .param p0, "x0"    # Lde/psdev/licensesdialog/LicensesDialog;

    .prologue
    .line 34
    iget-object v0, p0, Lde/psdev/licensesdialog/LicensesDialog;->mOnDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    return-object v0
.end method

.method static synthetic access$100(Lde/psdev/licensesdialog/LicensesDialog;)I
    .registers 2
    .param p0, "x0"    # Lde/psdev/licensesdialog/LicensesDialog;

    .prologue
    .line 34
    iget v0, p0, Lde/psdev/licensesdialog/LicensesDialog;->mDividerColor:I

    return v0
.end method

.method static synthetic access$200(Lde/psdev/licensesdialog/LicensesDialog;)Landroid/content/Context;
    .registers 2
    .param p0, "x0"    # Lde/psdev/licensesdialog/LicensesDialog;

    .prologue
    .line 34
    iget-object v0, p0, Lde/psdev/licensesdialog/LicensesDialog;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$300(Lde/psdev/licensesdialog/model/Notice;)Lde/psdev/licensesdialog/model/Notices;
    .registers 2
    .param p0, "x0"    # Lde/psdev/licensesdialog/model/Notice;

    .prologue
    .line 34
    invoke-static {p0}, Lde/psdev/licensesdialog/LicensesDialog;->getSingleNoticeNotices(Lde/psdev/licensesdialog/model/Notice;)Lde/psdev/licensesdialog/model/Notices;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Landroid/content/Context;Lde/psdev/licensesdialog/model/Notices;ZZLjava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "x0"    # Landroid/content/Context;
    .param p1, "x1"    # Lde/psdev/licensesdialog/model/Notices;
    .param p2, "x2"    # Z
    .param p3, "x3"    # Z
    .param p4, "x4"    # Ljava/lang/String;

    .prologue
    .line 34
    invoke-static {p0, p1, p2, p3, p4}, Lde/psdev/licensesdialog/LicensesDialog;->getLicensesText(Landroid/content/Context;Lde/psdev/licensesdialog/model/Notices;ZZLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Landroid/content/Context;I)Lde/psdev/licensesdialog/model/Notices;
    .registers 3
    .param p0, "x0"    # Landroid/content/Context;
    .param p1, "x1"    # I

    .prologue
    .line 34
    invoke-static {p0, p1}, Lde/psdev/licensesdialog/LicensesDialog;->getNotices(Landroid/content/Context;I)Lde/psdev/licensesdialog/model/Notices;

    move-result-object v0

    return-object v0
.end method

.method private static getLicensesText(Landroid/content/Context;Lde/psdev/licensesdialog/model/Notices;ZZLjava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "notices"    # Lde/psdev/licensesdialog/model/Notices;
    .param p2, "showFullLicenseText"    # Z
    .param p3, "includeOwnLicense"    # Z
    .param p4, "style"    # Ljava/lang/String;

    .prologue
    .line 188
    if-eqz p3, :cond_b

    .line 189
    :try_start_2
    invoke-virtual {p1}, Lde/psdev/licensesdialog/model/Notices;->getNotices()Ljava/util/List;

    move-result-object v1

    .line 190
    .local v1, "noticeList":Ljava/util/List;, "Ljava/util/List<Lde/psdev/licensesdialog/model/Notice;>;"
    sget-object v2, Lde/psdev/licensesdialog/LicensesDialog;->LICENSES_DIALOG_NOTICE:Lde/psdev/licensesdialog/model/Notice;

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 192
    .end local v1    # "noticeList":Ljava/util/List;, "Ljava/util/List<Lde/psdev/licensesdialog/model/Notice;>;"
    :cond_b
    invoke-static {p0}, Lde/psdev/licensesdialog/NoticesHtmlBuilder;->create(Landroid/content/Context;)Lde/psdev/licensesdialog/NoticesHtmlBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Lde/psdev/licensesdialog/NoticesHtmlBuilder;->setShowFullLicenseText(Z)Lde/psdev/licensesdialog/NoticesHtmlBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Lde/psdev/licensesdialog/NoticesHtmlBuilder;->setNotices(Lde/psdev/licensesdialog/model/Notices;)Lde/psdev/licensesdialog/NoticesHtmlBuilder;

    move-result-object v2

    invoke-virtual {v2, p4}, Lde/psdev/licensesdialog/NoticesHtmlBuilder;->setStyle(Ljava/lang/String;)Lde/psdev/licensesdialog/NoticesHtmlBuilder;

    move-result-object v2

    invoke-virtual {v2}, Lde/psdev/licensesdialog/NoticesHtmlBuilder;->build()Ljava/lang/String;
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_1e} :catch_20

    move-result-object v2

    return-object v2

    .line 193
    :catch_20
    move-exception v0

    .line 194
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method private static getNotices(Landroid/content/Context;I)Lde/psdev/licensesdialog/model/Notices;
    .registers 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "rawNoticesResourceId"    # I

    .prologue
    .line 173
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 174
    .local v2, "resources":Landroid/content/res/Resources;
    const-string v3, "raw"

    invoke-virtual {v2, p1}, Landroid/content/res/Resources;->getResourceTypeName(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_19

    .line 175
    invoke-virtual {v2, p1}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v3

    invoke-static {v3}, Lde/psdev/licensesdialog/NoticesXmlParser;->parse(Ljava/io/InputStream;)Lde/psdev/licensesdialog/model/Notices;

    move-result-object v1

    .line 176
    .local v1, "notices":Lde/psdev/licensesdialog/model/Notices;
    return-object v1

    .line 178
    .end local v1    # "notices":Lde/psdev/licensesdialog/model/Notices;
    :cond_19
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "not a raw resource"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_21
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_21} :catch_21

    .line 180
    .end local v2    # "resources":Landroid/content/res/Resources;
    :catch_21
    move-exception v0

    .line 181
    .local v0, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method private static getSingleNoticeNotices(Lde/psdev/licensesdialog/model/Notice;)Lde/psdev/licensesdialog/model/Notices;
    .registers 2
    .param p0, "notice"    # Lde/psdev/licensesdialog/model/Notice;

    .prologue
    .line 199
    new-instance v0, Lde/psdev/licensesdialog/model/Notices;

    invoke-direct {v0}, Lde/psdev/licensesdialog/model/Notices;-><init>()V

    .line 200
    .local v0, "notices":Lde/psdev/licensesdialog/model/Notices;
    invoke-virtual {v0, p0}, Lde/psdev/licensesdialog/model/Notices;->addNotice(Lde/psdev/licensesdialog/model/Notice;)V

    .line 201
    return-object v0
.end method


# virtual methods
.method public create()Landroid/app/Dialog;
    .registers 9

    .prologue
    const/4 v1, 0x0

    .line 73
    new-instance v0, Landroid/webkit/WebView;

    iget-object v2, p0, Lde/psdev/licensesdialog/LicensesDialog;->mContext:Landroid/content/Context;

    invoke-direct {v0, v2}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 74
    .local v0, "webView":Landroid/webkit/WebView;
    iget-object v2, p0, Lde/psdev/licensesdialog/LicensesDialog;->mLicensesText:Ljava/lang/String;

    const-string v3, "text/html"

    const-string v4, "utf-8"

    move-object v5, v1

    invoke-virtual/range {v0 .. v5}, Landroid/webkit/WebView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    iget v1, p0, Lde/psdev/licensesdialog/LicensesDialog;->mThemeResourceId:I

    if-eqz v1, :cond_4d

    .line 77
    new-instance v6, Landroid/app/AlertDialog$Builder;

    new-instance v1, Landroid/view/ContextThemeWrapper;

    iget-object v2, p0, Lde/psdev/licensesdialog/LicensesDialog;->mContext:Landroid/content/Context;

    iget v3, p0, Lde/psdev/licensesdialog/LicensesDialog;->mThemeResourceId:I

    invoke-direct {v1, v2, v3}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    invoke-direct {v6, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 81
    .local v6, "builder":Landroid/app/AlertDialog$Builder;
    :goto_24
    iget-object v1, p0, Lde/psdev/licensesdialog/LicensesDialog;->mTitleText:Ljava/lang/String;

    invoke-virtual {v6, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 82
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    iget-object v2, p0, Lde/psdev/licensesdialog/LicensesDialog;->mCloseText:Ljava/lang/String;

    new-instance v3, Lde/psdev/licensesdialog/LicensesDialog$1;

    invoke-direct {v3, p0}, Lde/psdev/licensesdialog/LicensesDialog$1;-><init>(Lde/psdev/licensesdialog/LicensesDialog;)V

    .line 83
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 88
    invoke-virtual {v6}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v7

    .line 89
    .local v7, "dialog":Landroid/app/AlertDialog;
    new-instance v1, Lde/psdev/licensesdialog/LicensesDialog$2;

    invoke-direct {v1, p0}, Lde/psdev/licensesdialog/LicensesDialog$2;-><init>(Lde/psdev/licensesdialog/LicensesDialog;)V

    invoke-virtual {v7, v1}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 97
    new-instance v1, Lde/psdev/licensesdialog/LicensesDialog$3;

    invoke-direct {v1, p0, v7}, Lde/psdev/licensesdialog/LicensesDialog$3;-><init>(Lde/psdev/licensesdialog/LicensesDialog;Landroid/app/AlertDialog;)V

    invoke-virtual {v7, v1}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 110
    return-object v7

    .line 79
    .end local v6    # "builder":Landroid/app/AlertDialog$Builder;
    .end local v7    # "dialog":Landroid/app/AlertDialog;
    :cond_4d
    new-instance v6, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lde/psdev/licensesdialog/LicensesDialog;->mContext:Landroid/content/Context;

    invoke-direct {v6, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .restart local v6    # "builder":Landroid/app/AlertDialog$Builder;
    goto :goto_24
.end method

.method public createAppCompat()Landroid/app/Dialog;
    .registers 9

    .prologue
    const/4 v1, 0x0

    .line 115
    new-instance v0, Landroid/webkit/WebView;

    iget-object v2, p0, Lde/psdev/licensesdialog/LicensesDialog;->mContext:Landroid/content/Context;

    invoke-direct {v0, v2}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 116
    .local v0, "webView":Landroid/webkit/WebView;
    iget-object v2, p0, Lde/psdev/licensesdialog/LicensesDialog;->mLicensesText:Ljava/lang/String;

    const-string v3, "text/html"

    const-string v4, "utf-8"

    move-object v5, v1

    invoke-virtual/range {v0 .. v5}, Landroid/webkit/WebView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    iget v1, p0, Lde/psdev/licensesdialog/LicensesDialog;->mThemeResourceId:I

    if-eqz v1, :cond_4d

    .line 119
    new-instance v6, Landroid/support/v7/app/AlertDialog$Builder;

    new-instance v1, Landroid/view/ContextThemeWrapper;

    iget-object v2, p0, Lde/psdev/licensesdialog/LicensesDialog;->mContext:Landroid/content/Context;

    iget v3, p0, Lde/psdev/licensesdialog/LicensesDialog;->mThemeResourceId:I

    invoke-direct {v1, v2, v3}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    invoke-direct {v6, v1}, Landroid/support/v7/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 123
    .local v6, "builder":Landroid/support/v7/app/AlertDialog$Builder;
    :goto_24
    iget-object v1, p0, Lde/psdev/licensesdialog/LicensesDialog;->mTitleText:Ljava/lang/String;

    invoke-virtual {v6, v1}, Landroid/support/v7/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v1

    .line 124
    invoke-virtual {v1, v0}, Landroid/support/v7/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v1

    iget-object v2, p0, Lde/psdev/licensesdialog/LicensesDialog;->mCloseText:Ljava/lang/String;

    new-instance v3, Lde/psdev/licensesdialog/LicensesDialog$4;

    invoke-direct {v3, p0}, Lde/psdev/licensesdialog/LicensesDialog$4;-><init>(Lde/psdev/licensesdialog/LicensesDialog;)V

    .line 125
    invoke-virtual {v1, v2, v3}, Landroid/support/v7/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    .line 130
    invoke-virtual {v6}, Landroid/support/v7/app/AlertDialog$Builder;->create()Landroid/support/v7/app/AlertDialog;

    move-result-object v7

    .line 131
    .local v7, "dialog":Landroid/support/v7/app/AlertDialog;
    new-instance v1, Lde/psdev/licensesdialog/LicensesDialog$5;

    invoke-direct {v1, p0}, Lde/psdev/licensesdialog/LicensesDialog$5;-><init>(Lde/psdev/licensesdialog/LicensesDialog;)V

    invoke-virtual {v7, v1}, Landroid/support/v7/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 139
    new-instance v1, Lde/psdev/licensesdialog/LicensesDialog$6;

    invoke-direct {v1, p0, v7}, Lde/psdev/licensesdialog/LicensesDialog$6;-><init>(Lde/psdev/licensesdialog/LicensesDialog;Landroid/support/v7/app/AlertDialog;)V

    invoke-virtual {v7, v1}, Landroid/support/v7/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 152
    return-object v7

    .line 121
    .end local v6    # "builder":Landroid/support/v7/app/AlertDialog$Builder;
    .end local v7    # "dialog":Landroid/support/v7/app/AlertDialog;
    :cond_4d
    new-instance v6, Landroid/support/v7/app/AlertDialog$Builder;

    iget-object v1, p0, Lde/psdev/licensesdialog/LicensesDialog;->mContext:Landroid/content/Context;

    invoke-direct {v6, v1}, Landroid/support/v7/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .restart local v6    # "builder":Landroid/support/v7/app/AlertDialog$Builder;
    goto :goto_24
.end method

.method public setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)Lde/psdev/licensesdialog/LicensesDialog;
    .registers 2
    .param p1, "onDismissListener"    # Landroid/content/DialogInterface$OnDismissListener;

    .prologue
    .line 67
    iput-object p1, p0, Lde/psdev/licensesdialog/LicensesDialog;->mOnDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    .line 68
    return-object p0
.end method

.method public show()Landroid/app/Dialog;
    .registers 2

    .prologue
    .line 156
    invoke-virtual {p0}, Lde/psdev/licensesdialog/LicensesDialog;->create()Landroid/app/Dialog;

    move-result-object v0

    .line 157
    .local v0, "dialog":Landroid/app/Dialog;
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 158
    return-object v0
.end method

.method public showAppCompat()Landroid/app/Dialog;
    .registers 2

    .prologue
    .line 162
    invoke-virtual {p0}, Lde/psdev/licensesdialog/LicensesDialog;->createAppCompat()Landroid/app/Dialog;

    move-result-object v0

    .line 163
    .local v0, "dialog":Landroid/app/Dialog;
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 164
    return-object v0
.end method
