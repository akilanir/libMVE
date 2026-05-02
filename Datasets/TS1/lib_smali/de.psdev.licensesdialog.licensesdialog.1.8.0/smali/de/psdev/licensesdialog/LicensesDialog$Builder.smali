.class public final Lde/psdev/licensesdialog/LicensesDialog$Builder;
.super Ljava/lang/Object;
.source "LicensesDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/psdev/licensesdialog/LicensesDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private mCloseText:Ljava/lang/String;

.field private final mContext:Landroid/content/Context;

.field private mDividerColor:I

.field private mIncludeOwnLicense:Z

.field private mNotices:Lde/psdev/licensesdialog/model/Notices;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private mNoticesStyle:Ljava/lang/String;

.field private mNoticesText:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private mRawNoticesId:Ljava/lang/Integer;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private mShowFullLicenseText:Z

.field private mThemeResourceId:I

.field private mTitleText:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 227
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 228
    iput-object p1, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mContext:Landroid/content/Context;

    .line 229
    sget v0, Lde/psdev/licensesdialog/R$string;->notices_title:I

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mTitleText:Ljava/lang/String;

    .line 230
    sget v0, Lde/psdev/licensesdialog/R$string;->notices_close:I

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mCloseText:Ljava/lang/String;

    .line 231
    sget v0, Lde/psdev/licensesdialog/R$string;->notices_default_style:I

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mNoticesStyle:Ljava/lang/String;

    .line 232
    iput-boolean v1, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mShowFullLicenseText:Z

    .line 233
    iput-boolean v1, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mIncludeOwnLicense:Z

    .line 234
    iput v1, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mThemeResourceId:I

    .line 235
    iput v1, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mDividerColor:I

    .line 236
    return-void
.end method


# virtual methods
.method public build()Lde/psdev/licensesdialog/LicensesDialog;
    .registers 9

    .prologue
    .line 318
    iget-object v0, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mNotices:Lde/psdev/licensesdialog/model/Notices;

    if-eqz v0, :cond_23

    .line 319
    iget-object v0, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mNotices:Lde/psdev/licensesdialog/model/Notices;

    iget-boolean v3, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mShowFullLicenseText:Z

    iget-boolean v4, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mIncludeOwnLicense:Z

    iget-object v5, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mNoticesStyle:Ljava/lang/String;

    # invokes: Lde/psdev/licensesdialog/LicensesDialog;->getLicensesText(Landroid/content/Context;Lde/psdev/licensesdialog/model/Notices;ZZLjava/lang/String;)Ljava/lang/String;
    invoke-static {v0, v1, v3, v4, v5}, Lde/psdev/licensesdialog/LicensesDialog;->access$400(Landroid/content/Context;Lde/psdev/licensesdialog/model/Notices;ZZLjava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 328
    .local v2, "licensesText":Ljava/lang/String;
    :goto_12
    new-instance v0, Lde/psdev/licensesdialog/LicensesDialog;

    iget-object v1, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mTitleText:Ljava/lang/String;

    iget-object v4, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mCloseText:Ljava/lang/String;

    iget v5, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mThemeResourceId:I

    iget v6, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mDividerColor:I

    const/4 v7, 0x0

    invoke-direct/range {v0 .. v7}, Lde/psdev/licensesdialog/LicensesDialog;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IILde/psdev/licensesdialog/LicensesDialog$1;)V

    return-object v0

    .line 320
    .end local v2    # "licensesText":Ljava/lang/String;
    :cond_23
    iget-object v0, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mRawNoticesId:Ljava/lang/Integer;

    if-eqz v0, :cond_40

    .line 321
    iget-object v0, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mRawNoticesId:Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    # invokes: Lde/psdev/licensesdialog/LicensesDialog;->getNotices(Landroid/content/Context;I)Lde/psdev/licensesdialog/model/Notices;
    invoke-static {v1, v3}, Lde/psdev/licensesdialog/LicensesDialog;->access$500(Landroid/content/Context;I)Lde/psdev/licensesdialog/model/Notices;

    move-result-object v1

    iget-boolean v3, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mShowFullLicenseText:Z

    iget-boolean v4, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mIncludeOwnLicense:Z

    iget-object v5, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mNoticesStyle:Ljava/lang/String;

    # invokes: Lde/psdev/licensesdialog/LicensesDialog;->getLicensesText(Landroid/content/Context;Lde/psdev/licensesdialog/model/Notices;ZZLjava/lang/String;)Ljava/lang/String;
    invoke-static {v0, v1, v3, v4, v5}, Lde/psdev/licensesdialog/LicensesDialog;->access$400(Landroid/content/Context;Lde/psdev/licensesdialog/model/Notices;ZZLjava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .restart local v2    # "licensesText":Ljava/lang/String;
    goto :goto_12

    .line 322
    .end local v2    # "licensesText":Ljava/lang/String;
    :cond_40
    iget-object v0, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mNoticesText:Ljava/lang/String;

    if-eqz v0, :cond_47

    .line 323
    iget-object v2, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mNoticesText:Ljava/lang/String;

    .restart local v2    # "licensesText":Ljava/lang/String;
    goto :goto_12

    .line 325
    .end local v2    # "licensesText":Ljava/lang/String;
    :cond_47
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Notices have to be provided, see setNotices"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setCloseText(I)Lde/psdev/licensesdialog/LicensesDialog$Builder;
    .registers 3
    .param p1, "closeId"    # I

    .prologue
    .line 249
    iget-object v0, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mContext:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mCloseText:Ljava/lang/String;

    .line 250
    return-object p0
.end method

.method public setCloseText(Ljava/lang/String;)Lde/psdev/licensesdialog/LicensesDialog$Builder;
    .registers 2
    .param p1, "closeText"    # Ljava/lang/String;

    .prologue
    .line 254
    iput-object p1, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mCloseText:Ljava/lang/String;

    .line 255
    return-object p0
.end method

.method public setDividerColor(I)Lde/psdev/licensesdialog/LicensesDialog$Builder;
    .registers 2
    .param p1, "dividerColor"    # I

    .prologue
    .line 307
    iput p1, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mDividerColor:I

    .line 308
    return-object p0
.end method

.method public setDividerColorId(I)Lde/psdev/licensesdialog/LicensesDialog$Builder;
    .registers 3
    .param p1, "dividerColorId"    # I

    .prologue
    .line 312
    iget-object v0, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mDividerColor:I

    .line 313
    return-object p0
.end method

.method public setIncludeOwnLicense(Z)Lde/psdev/licensesdialog/LicensesDialog$Builder;
    .registers 2
    .param p1, "includeOwnLicense"    # Z

    .prologue
    .line 297
    iput-boolean p1, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mIncludeOwnLicense:Z

    .line 298
    return-object p0
.end method

.method public setNotices(I)Lde/psdev/licensesdialog/LicensesDialog$Builder;
    .registers 3
    .param p1, "rawNoticesId"    # I

    .prologue
    .line 259
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mRawNoticesId:Ljava/lang/Integer;

    .line 260
    const/4 v0, 0x0

    iput-object v0, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mNotices:Lde/psdev/licensesdialog/model/Notices;

    .line 261
    return-object p0
.end method

.method public setNotices(Lde/psdev/licensesdialog/model/Notice;)Lde/psdev/licensesdialog/LicensesDialog$Builder;
    .registers 3
    .param p1, "notice"    # Lde/psdev/licensesdialog/model/Notice;

    .prologue
    .line 271
    # invokes: Lde/psdev/licensesdialog/LicensesDialog;->getSingleNoticeNotices(Lde/psdev/licensesdialog/model/Notice;)Lde/psdev/licensesdialog/model/Notices;
    invoke-static {p1}, Lde/psdev/licensesdialog/LicensesDialog;->access$300(Lde/psdev/licensesdialog/model/Notice;)Lde/psdev/licensesdialog/model/Notices;

    move-result-object v0

    invoke-virtual {p0, v0}, Lde/psdev/licensesdialog/LicensesDialog$Builder;->setNotices(Lde/psdev/licensesdialog/model/Notices;)Lde/psdev/licensesdialog/LicensesDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public setNotices(Lde/psdev/licensesdialog/model/Notices;)Lde/psdev/licensesdialog/LicensesDialog$Builder;
    .registers 3
    .param p1, "notices"    # Lde/psdev/licensesdialog/model/Notices;

    .prologue
    .line 265
    iput-object p1, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mNotices:Lde/psdev/licensesdialog/model/Notices;

    .line 266
    const/4 v0, 0x0

    iput-object v0, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mRawNoticesId:Ljava/lang/Integer;

    .line 267
    return-object p0
.end method

.method setNotices(Ljava/lang/String;)Lde/psdev/licensesdialog/LicensesDialog$Builder;
    .registers 3
    .param p1, "notices"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 275
    iput-object v0, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mNotices:Lde/psdev/licensesdialog/model/Notices;

    .line 276
    iput-object v0, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mRawNoticesId:Ljava/lang/Integer;

    .line 277
    iput-object p1, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mNoticesText:Ljava/lang/String;

    .line 278
    return-object p0
.end method

.method public setNoticesCssStyle(I)Lde/psdev/licensesdialog/LicensesDialog$Builder;
    .registers 3
    .param p1, "cssStyleTextId"    # I

    .prologue
    .line 282
    iget-object v0, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mContext:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mNoticesStyle:Ljava/lang/String;

    .line 283
    return-object p0
.end method

.method public setNoticesCssStyle(Ljava/lang/String;)Lde/psdev/licensesdialog/LicensesDialog$Builder;
    .registers 2
    .param p1, "cssStyleText"    # Ljava/lang/String;

    .prologue
    .line 287
    iput-object p1, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mNoticesStyle:Ljava/lang/String;

    .line 288
    return-object p0
.end method

.method public setShowFullLicenseText(Z)Lde/psdev/licensesdialog/LicensesDialog$Builder;
    .registers 2
    .param p1, "showFullLicenseText"    # Z

    .prologue
    .line 292
    iput-boolean p1, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mShowFullLicenseText:Z

    .line 293
    return-object p0
.end method

.method public setThemeResourceId(I)Lde/psdev/licensesdialog/LicensesDialog$Builder;
    .registers 2
    .param p1, "themeResourceId"    # I

    .prologue
    .line 302
    iput p1, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mThemeResourceId:I

    .line 303
    return-object p0
.end method

.method public setTitle(I)Lde/psdev/licensesdialog/LicensesDialog$Builder;
    .registers 3
    .param p1, "titleId"    # I

    .prologue
    .line 239
    iget-object v0, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mContext:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mTitleText:Ljava/lang/String;

    .line 240
    return-object p0
.end method

.method public setTitle(Ljava/lang/String;)Lde/psdev/licensesdialog/LicensesDialog$Builder;
    .registers 2
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 244
    iput-object p1, p0, Lde/psdev/licensesdialog/LicensesDialog$Builder;->mTitleText:Ljava/lang/String;

    .line 245
    return-object p0
.end method
