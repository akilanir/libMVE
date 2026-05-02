.class public Lde/psdev/licensesdialog/LicensesDialogFragment$Builder;
.super Ljava/lang/Object;
.source "LicensesDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/psdev/licensesdialog/LicensesDialogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;

.field private mDividerColor:I

.field private mIncludeOwnLicense:Z

.field private mNotices:Lde/psdev/licensesdialog/model/Notices;

.field private mRawNoticesResourceId:Ljava/lang/Integer;

.field private mShowFullLicenseText:Z

.field private mThemeResourceId:I

.field private mUseAppCompat:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v1, 0x0

    .line 250
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 251
    iput-object p1, p0, Lde/psdev/licensesdialog/LicensesDialogFragment$Builder;->mContext:Landroid/content/Context;

    .line 253
    iput-boolean v1, p0, Lde/psdev/licensesdialog/LicensesDialogFragment$Builder;->mShowFullLicenseText:Z

    .line 254
    const/4 v0, 0x1

    iput-boolean v0, p0, Lde/psdev/licensesdialog/LicensesDialogFragment$Builder;->mIncludeOwnLicense:Z

    .line 255
    iput v1, p0, Lde/psdev/licensesdialog/LicensesDialogFragment$Builder;->mThemeResourceId:I

    .line 256
    iput v1, p0, Lde/psdev/licensesdialog/LicensesDialogFragment$Builder;->mDividerColor:I

    .line 257
    iput-boolean v1, p0, Lde/psdev/licensesdialog/LicensesDialogFragment$Builder;->mUseAppCompat:Z

    .line 258
    return-void
.end method


# virtual methods
.method public build()Lde/psdev/licensesdialog/LicensesDialogFragment;
    .registers 7

    .prologue
    .line 311
    iget-object v0, p0, Lde/psdev/licensesdialog/LicensesDialogFragment$Builder;->mNotices:Lde/psdev/licensesdialog/model/Notices;

    if-eqz v0, :cond_15

    .line 312
    iget-object v0, p0, Lde/psdev/licensesdialog/LicensesDialogFragment$Builder;->mNotices:Lde/psdev/licensesdialog/model/Notices;

    iget-boolean v1, p0, Lde/psdev/licensesdialog/LicensesDialogFragment$Builder;->mShowFullLicenseText:Z

    iget-boolean v2, p0, Lde/psdev/licensesdialog/LicensesDialogFragment$Builder;->mIncludeOwnLicense:Z

    iget v3, p0, Lde/psdev/licensesdialog/LicensesDialogFragment$Builder;->mThemeResourceId:I

    iget v4, p0, Lde/psdev/licensesdialog/LicensesDialogFragment$Builder;->mDividerColor:I

    iget-boolean v5, p0, Lde/psdev/licensesdialog/LicensesDialogFragment$Builder;->mUseAppCompat:Z

    # invokes: Lde/psdev/licensesdialog/LicensesDialogFragment;->newInstance(Lde/psdev/licensesdialog/model/Notices;ZZIIZ)Lde/psdev/licensesdialog/LicensesDialogFragment;
    invoke-static/range {v0 .. v5}, Lde/psdev/licensesdialog/LicensesDialogFragment;->access$000(Lde/psdev/licensesdialog/model/Notices;ZZIIZ)Lde/psdev/licensesdialog/LicensesDialogFragment;

    move-result-object v0

    .line 314
    :goto_14
    return-object v0

    .line 313
    :cond_15
    iget-object v0, p0, Lde/psdev/licensesdialog/LicensesDialogFragment$Builder;->mRawNoticesResourceId:Ljava/lang/Integer;

    if-eqz v0, :cond_2e

    .line 314
    iget-object v0, p0, Lde/psdev/licensesdialog/LicensesDialogFragment$Builder;->mRawNoticesResourceId:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget-boolean v1, p0, Lde/psdev/licensesdialog/LicensesDialogFragment$Builder;->mShowFullLicenseText:Z

    iget-boolean v2, p0, Lde/psdev/licensesdialog/LicensesDialogFragment$Builder;->mIncludeOwnLicense:Z

    iget v3, p0, Lde/psdev/licensesdialog/LicensesDialogFragment$Builder;->mThemeResourceId:I

    iget v4, p0, Lde/psdev/licensesdialog/LicensesDialogFragment$Builder;->mDividerColor:I

    iget-boolean v5, p0, Lde/psdev/licensesdialog/LicensesDialogFragment$Builder;->mUseAppCompat:Z

    # invokes: Lde/psdev/licensesdialog/LicensesDialogFragment;->newInstance(IZZIIZ)Lde/psdev/licensesdialog/LicensesDialogFragment;
    invoke-static/range {v0 .. v5}, Lde/psdev/licensesdialog/LicensesDialogFragment;->access$100(IZZIIZ)Lde/psdev/licensesdialog/LicensesDialogFragment;

    move-result-object v0

    goto :goto_14

    .line 316
    :cond_2e
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Required parameter not set. You need to call setNotices."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setDividerColor(I)Lde/psdev/licensesdialog/LicensesDialogFragment$Builder;
    .registers 2
    .param p1, "dividerColor"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 301
    iput p1, p0, Lde/psdev/licensesdialog/LicensesDialogFragment$Builder;->mDividerColor:I

    .line 302
    return-object p0
.end method

.method public setDividerColorRes(I)Lde/psdev/licensesdialog/LicensesDialogFragment$Builder;
    .registers 3
    .param p1, "dividerColor"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 296
    iget-object v0, p0, Lde/psdev/licensesdialog/LicensesDialogFragment$Builder;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lde/psdev/licensesdialog/LicensesDialogFragment$Builder;->mDividerColor:I

    .line 297
    return-object p0
.end method

.method public setIncludeOwnLicense(Z)Lde/psdev/licensesdialog/LicensesDialogFragment$Builder;
    .registers 2
    .param p1, "includeOwnLicense"    # Z

    .prologue
    .line 286
    iput-boolean p1, p0, Lde/psdev/licensesdialog/LicensesDialogFragment$Builder;->mIncludeOwnLicense:Z

    .line 287
    return-object p0
.end method

.method public setNotice(Lde/psdev/licensesdialog/model/Notice;)Lde/psdev/licensesdialog/LicensesDialogFragment$Builder;
    .registers 3
    .param p1, "notice"    # Lde/psdev/licensesdialog/model/Notice;

    .prologue
    .line 265
    new-instance v0, Lde/psdev/licensesdialog/model/Notices;

    invoke-direct {v0}, Lde/psdev/licensesdialog/model/Notices;-><init>()V

    iput-object v0, p0, Lde/psdev/licensesdialog/LicensesDialogFragment$Builder;->mNotices:Lde/psdev/licensesdialog/model/Notices;

    .line 266
    iget-object v0, p0, Lde/psdev/licensesdialog/LicensesDialogFragment$Builder;->mNotices:Lde/psdev/licensesdialog/model/Notices;

    invoke-virtual {v0, p1}, Lde/psdev/licensesdialog/model/Notices;->addNotice(Lde/psdev/licensesdialog/model/Notice;)V

    .line 267
    return-object p0
.end method

.method public setNotices(I)Lde/psdev/licensesdialog/LicensesDialogFragment$Builder;
    .registers 3
    .param p1, "rawNoticesResourceId"    # I
        .annotation build Landroid/support/annotation/RawRes;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 276
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lde/psdev/licensesdialog/LicensesDialogFragment$Builder;->mRawNoticesResourceId:Ljava/lang/Integer;

    .line 277
    return-object p0
.end method

.method public setNotices(Lde/psdev/licensesdialog/model/Notices;)Lde/psdev/licensesdialog/LicensesDialogFragment$Builder;
    .registers 2
    .param p1, "notices"    # Lde/psdev/licensesdialog/model/Notices;

    .prologue
    .line 271
    iput-object p1, p0, Lde/psdev/licensesdialog/LicensesDialogFragment$Builder;->mNotices:Lde/psdev/licensesdialog/model/Notices;

    .line 272
    return-object p0
.end method

.method public setShowFullLicenseText(Z)Lde/psdev/licensesdialog/LicensesDialogFragment$Builder;
    .registers 2
    .param p1, "showFullLicenseText"    # Z

    .prologue
    .line 281
    iput-boolean p1, p0, Lde/psdev/licensesdialog/LicensesDialogFragment$Builder;->mShowFullLicenseText:Z

    .line 282
    return-object p0
.end method

.method public setThemeResourceId(I)Lde/psdev/licensesdialog/LicensesDialogFragment$Builder;
    .registers 2
    .param p1, "themeResourceId"    # I
        .annotation build Landroid/support/annotation/StyleRes;
        .end annotation
    .end param

    .prologue
    .line 291
    iput p1, p0, Lde/psdev/licensesdialog/LicensesDialogFragment$Builder;->mThemeResourceId:I

    .line 292
    return-object p0
.end method

.method public setUseAppCompat(Z)Lde/psdev/licensesdialog/LicensesDialogFragment$Builder;
    .registers 2
    .param p1, "useAppCompat"    # Z

    .prologue
    .line 306
    iput-boolean p1, p0, Lde/psdev/licensesdialog/LicensesDialogFragment$Builder;->mUseAppCompat:Z

    .line 307
    return-object p0
.end method
