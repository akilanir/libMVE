.class public Lde/psdev/licensesdialog/SingleLicenseDialogFragment;
.super Landroid/support/v4/app/DialogFragment;
.source "SingleLicenseDialogFragment.java"


# static fields
.field private static final ARGUMENT_FULL_LICENSE_TEXT:Ljava/lang/String; = "ARGUMENT_FULL_LICENSE_TEXT"

.field private static final ARGUMENT_NOTICE:Ljava/lang/String; = "ARGUMENT_NOTICE"

.field private static final STATE_CLOSE_TEXT:Ljava/lang/String; = "close_text"

.field private static final STATE_LICENSE_TEXT:Ljava/lang/String; = "license_text"

.field private static final STATE_TITLE_TEXT:Ljava/lang/String; = "title_text"


# instance fields
.field private mCloseButtonText:Ljava/lang/String;

.field private mLicenseText:Ljava/lang/String;

.field private mOnDismissListener:Landroid/content/DialogInterface$OnDismissListener;

.field private mShowFullLicenseText:Z

.field private mTitleText:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 56
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    .line 57
    return-void
.end method

.method private getNotice()Lde/psdev/licensesdialog/model/Notice;
    .registers 4

    .prologue
    .line 124
    invoke-virtual {p0}, Lde/psdev/licensesdialog/SingleLicenseDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 125
    .local v0, "arguments":Landroid/os/Bundle;
    if-eqz v0, :cond_17

    const-string v1, "ARGUMENT_NOTICE"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_17

    .line 126
    const-string v1, "ARGUMENT_NOTICE"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lde/psdev/licensesdialog/model/Notice;

    return-object v1

    .line 129
    :cond_17
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "no notice provided"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static newInstance(Lde/psdev/licensesdialog/model/Notice;)Lde/psdev/licensesdialog/SingleLicenseDialogFragment;
    .registers 2
    .param p0, "notice"    # Lde/psdev/licensesdialog/model/Notice;

    .prologue
    .line 44
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lde/psdev/licensesdialog/SingleLicenseDialogFragment;->newInstance(Lde/psdev/licensesdialog/model/Notice;Z)Lde/psdev/licensesdialog/SingleLicenseDialogFragment;

    move-result-object v0

    return-object v0
.end method

.method public static newInstance(Lde/psdev/licensesdialog/model/Notice;Z)Lde/psdev/licensesdialog/SingleLicenseDialogFragment;
    .registers 5
    .param p0, "notice"    # Lde/psdev/licensesdialog/model/Notice;
    .param p1, "showFullLicenseText"    # Z

    .prologue
    .line 48
    new-instance v1, Lde/psdev/licensesdialog/SingleLicenseDialogFragment;

    invoke-direct {v1}, Lde/psdev/licensesdialog/SingleLicenseDialogFragment;-><init>()V

    .line 49
    .local v1, "fragment":Lde/psdev/licensesdialog/SingleLicenseDialogFragment;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 50
    .local v0, "args":Landroid/os/Bundle;
    const-string v2, "ARGUMENT_NOTICE"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 51
    const-string v2, "ARGUMENT_FULL_LICENSE_TEXT"

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 52
    invoke-virtual {v1, v0}, Lde/psdev/licensesdialog/SingleLicenseDialogFragment;->setArguments(Landroid/os/Bundle;)V

    .line 53
    return-object v1
.end method


# virtual methods
.method public getOnDismissListener()Landroid/content/DialogInterface$OnDismissListener;
    .registers 2

    .prologue
    .line 106
    iget-object v0, p0, Lde/psdev/licensesdialog/SingleLicenseDialogFragment;->mOnDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    return-object v0
.end method

.method public isShowFullLicenseText()Z
    .registers 2

    .prologue
    .line 114
    iget-boolean v0, p0, Lde/psdev/licensesdialog/SingleLicenseDialogFragment;->mShowFullLicenseText:Z

    return v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 9
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 61
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 62
    invoke-virtual {p0}, Lde/psdev/licensesdialog/SingleLicenseDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 64
    .local v2, "resources":Landroid/content/res/Resources;
    if-eqz p1, :cond_22

    .line 65
    const-string v4, "title_text"

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lde/psdev/licensesdialog/SingleLicenseDialogFragment;->mTitleText:Ljava/lang/String;

    .line 66
    const-string v4, "license_text"

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lde/psdev/licensesdialog/SingleLicenseDialogFragment;->mLicenseText:Ljava/lang/String;

    .line 67
    const-string v4, "close_text"

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lde/psdev/licensesdialog/SingleLicenseDialogFragment;->mCloseButtonText:Ljava/lang/String;

    .line 80
    :goto_21
    return-void

    .line 69
    :cond_22
    sget v4, Lde/psdev/licensesdialog/R$string;->notices_title:I

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lde/psdev/licensesdialog/SingleLicenseDialogFragment;->mTitleText:Ljava/lang/String;

    .line 70
    sget v4, Lde/psdev/licensesdialog/R$string;->notices_close:I

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lde/psdev/licensesdialog/SingleLicenseDialogFragment;->mCloseButtonText:Ljava/lang/String;

    .line 73
    :try_start_32
    invoke-direct {p0}, Lde/psdev/licensesdialog/SingleLicenseDialogFragment;->getNotice()Lde/psdev/licensesdialog/model/Notice;

    move-result-object v1

    .line 74
    .local v1, "notice":Lde/psdev/licensesdialog/model/Notice;
    invoke-virtual {p0}, Lde/psdev/licensesdialog/SingleLicenseDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v4

    const-string v5, "ARGUMENT_FULL_LICENSE_TEXT"

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    .line 75
    .local v3, "showFullLicenseText":Z
    invoke-virtual {p0}, Lde/psdev/licensesdialog/SingleLicenseDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v4

    invoke-static {v4}, Lde/psdev/licensesdialog/NoticesHtmlBuilder;->create(Landroid/content/Context;)Lde/psdev/licensesdialog/NoticesHtmlBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Lde/psdev/licensesdialog/NoticesHtmlBuilder;->setNotice(Lde/psdev/licensesdialog/model/Notice;)Lde/psdev/licensesdialog/NoticesHtmlBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Lde/psdev/licensesdialog/NoticesHtmlBuilder;->setShowFullLicenseText(Z)Lde/psdev/licensesdialog/NoticesHtmlBuilder;

    move-result-object v4

    invoke-virtual {v4}, Lde/psdev/licensesdialog/NoticesHtmlBuilder;->build()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lde/psdev/licensesdialog/SingleLicenseDialogFragment;->mLicenseText:Ljava/lang/String;
    :try_end_57
    .catch Ljava/lang/Exception; {:try_start_32 .. :try_end_57} :catch_58

    goto :goto_21

    .line 76
    .end local v1    # "notice":Lde/psdev/licensesdialog/model/Notice;
    .end local v3    # "showFullLicenseText":Z
    :catch_58
    move-exception v0

    .line 77
    .local v0, "e":Ljava/lang/Exception;
    new-instance v4, Ljava/lang/IllegalStateException;

    invoke-direct {v4, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v4
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 92
    new-instance v0, Lde/psdev/licensesdialog/LicensesDialog$Builder;

    invoke-virtual {p0}, Lde/psdev/licensesdialog/SingleLicenseDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Lde/psdev/licensesdialog/LicensesDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Lde/psdev/licensesdialog/SingleLicenseDialogFragment;->mLicenseText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lde/psdev/licensesdialog/LicensesDialog$Builder;->setNotices(Ljava/lang/String;)Lde/psdev/licensesdialog/LicensesDialog$Builder;

    move-result-object v0

    iget-object v1, p0, Lde/psdev/licensesdialog/SingleLicenseDialogFragment;->mTitleText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lde/psdev/licensesdialog/LicensesDialog$Builder;->setTitle(Ljava/lang/String;)Lde/psdev/licensesdialog/LicensesDialog$Builder;

    move-result-object v0

    iget-object v1, p0, Lde/psdev/licensesdialog/SingleLicenseDialogFragment;->mCloseButtonText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lde/psdev/licensesdialog/LicensesDialog$Builder;->setCloseText(Ljava/lang/String;)Lde/psdev/licensesdialog/LicensesDialog$Builder;

    move-result-object v0

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
    .line 97
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onDismiss(Landroid/content/DialogInterface;)V

    .line 98
    iget-object v0, p0, Lde/psdev/licensesdialog/SingleLicenseDialogFragment;->mOnDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    if-eqz v0, :cond_c

    .line 99
    iget-object v0, p0, Lde/psdev/licensesdialog/SingleLicenseDialogFragment;->mOnDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    invoke-interface {v0, p1}, Landroid/content/DialogInterface$OnDismissListener;->onDismiss(Landroid/content/DialogInterface;)V

    .line 101
    :cond_c
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 84
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 85
    const-string v0, "title_text"

    iget-object v1, p0, Lde/psdev/licensesdialog/SingleLicenseDialogFragment;->mTitleText:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    const-string v0, "license_text"

    iget-object v1, p0, Lde/psdev/licensesdialog/SingleLicenseDialogFragment;->mLicenseText:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    const-string v0, "close_text"

    iget-object v1, p0, Lde/psdev/licensesdialog/SingleLicenseDialogFragment;->mCloseButtonText:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    return-void
.end method

.method public setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V
    .registers 2
    .param p1, "onDismissListener"    # Landroid/content/DialogInterface$OnDismissListener;

    .prologue
    .line 110
    iput-object p1, p0, Lde/psdev/licensesdialog/SingleLicenseDialogFragment;->mOnDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    .line 111
    return-void
.end method

.method public setShowFullLicenseText(Z)V
    .registers 2
    .param p1, "showFullLicenseText"    # Z

    .prologue
    .line 118
    iput-boolean p1, p0, Lde/psdev/licensesdialog/SingleLicenseDialogFragment;->mShowFullLicenseText:Z

    .line 119
    return-void
.end method
