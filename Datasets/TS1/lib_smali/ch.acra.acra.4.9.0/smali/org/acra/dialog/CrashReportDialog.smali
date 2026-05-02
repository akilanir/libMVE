.class public Lorg/acra/dialog/CrashReportDialog;
.super Lorg/acra/dialog/BaseCrashReportDialog;
.source "CrashReportDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# static fields
.field private static final PADDING:I = 0xa

.field private static final STATE_COMMENT:Ljava/lang/String; = "comment"

.field private static final STATE_EMAIL:Ljava/lang/String; = "email"


# instance fields
.field private mDialog:Landroid/app/AlertDialog;

.field private scrollable:Landroid/widget/LinearLayout;

.field private sharedPreferencesFactory:Lorg/acra/prefs/SharedPreferencesFactory;

.field private userCommentView:Landroid/widget/EditText;

.field private userEmailView:Landroid/widget/EditText;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 29
    invoke-direct {p0}, Lorg/acra/dialog/BaseCrashReportDialog;-><init>()V

    return-void
.end method


# virtual methods
.method protected final addViewToDialog(Landroid/view/View;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 123
    iget-object v0, p0, Lorg/acra/dialog/CrashReportDialog;->scrollable:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 124
    return-void
.end method

.method protected buildAndShowDialog(Landroid/os/Bundle;)V
    .registers 7
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 60
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 61
    .local v0, "dialogBuilder":Landroid/app/AlertDialog$Builder;
    invoke-virtual {p0}, Lorg/acra/dialog/CrashReportDialog;->getConfig()Lorg/acra/config/ACRAConfiguration;

    move-result-object v3

    invoke-virtual {v3}, Lorg/acra/config/ACRAConfiguration;->resDialogTitle()I

    move-result v2

    .line 62
    .local v2, "titleResourceId":I
    if-eqz v2, :cond_12

    .line 63
    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 65
    :cond_12
    invoke-virtual {p0}, Lorg/acra/dialog/CrashReportDialog;->getConfig()Lorg/acra/config/ACRAConfiguration;

    move-result-object v3

    invoke-virtual {v3}, Lorg/acra/config/ACRAConfiguration;->resDialogIcon()I

    move-result v1

    .line 66
    .local v1, "iconResourceId":I
    if-eqz v1, :cond_1f

    .line 67
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    .line 69
    :cond_1f
    invoke-virtual {p0, p1}, Lorg/acra/dialog/CrashReportDialog;->buildCustomView(Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 70
    invoke-virtual {p0}, Lorg/acra/dialog/CrashReportDialog;->getConfig()Lorg/acra/config/ACRAConfiguration;

    move-result-object v4

    invoke-virtual {v4}, Lorg/acra/config/ACRAConfiguration;->resDialogPositiveButtonText()I

    move-result v4

    invoke-virtual {p0, v4}, Lorg/acra/dialog/CrashReportDialog;->getText(I)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v3, v4, p0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 71
    invoke-virtual {p0}, Lorg/acra/dialog/CrashReportDialog;->getConfig()Lorg/acra/config/ACRAConfiguration;

    move-result-object v4

    invoke-virtual {v4}, Lorg/acra/config/ACRAConfiguration;->resDialogNegativeButtonText()I

    move-result v4

    invoke-virtual {p0, v4}, Lorg/acra/dialog/CrashReportDialog;->getText(I)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v3, v4, p0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 73
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v3

    iput-object v3, p0, Lorg/acra/dialog/CrashReportDialog;->mDialog:Landroid/app/AlertDialog;

    .line 74
    iget-object v3, p0, Lorg/acra/dialog/CrashReportDialog;->mDialog:Landroid/app/AlertDialog;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    .line 75
    iget-object v3, p0, Lorg/acra/dialog/CrashReportDialog;->mDialog:Landroid/app/AlertDialog;

    invoke-virtual {v3}, Landroid/app/AlertDialog;->show()V

    .line 76
    return-void
.end method

.method protected buildCustomView(Landroid/os/Bundle;)Landroid/view/View;
    .registers 11
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v6, -0x1

    const/16 v8, 0xa

    .line 80
    new-instance v2, Landroid/widget/ScrollView;

    invoke-direct {v2, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 81
    .local v2, "root":Landroid/widget/ScrollView;
    invoke-virtual {v2, v8, v8, v8, v8}, Landroid/widget/ScrollView;->setPadding(IIII)V

    .line 82
    new-instance v5, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v5, v6, v6}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v5}, Landroid/widget/ScrollView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 83
    invoke-virtual {v2, v7}, Landroid/widget/ScrollView;->setFocusable(Z)V

    .line 84
    invoke-virtual {v2, v7}, Landroid/widget/ScrollView;->setFocusableInTouchMode(Z)V

    .line 85
    iget-object v5, p0, Lorg/acra/dialog/CrashReportDialog;->scrollable:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v5}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 87
    invoke-virtual {p0}, Lorg/acra/dialog/CrashReportDialog;->getMainView()Landroid/view/View;

    move-result-object v5

    invoke-virtual {p0, v5}, Lorg/acra/dialog/CrashReportDialog;->addViewToDialog(Landroid/view/View;)V

    .line 90
    invoke-virtual {p0}, Lorg/acra/dialog/CrashReportDialog;->getCommentLabel()Landroid/view/View;

    move-result-object v0

    .line 91
    .local v0, "comment":Landroid/view/View;
    if-eqz v0, :cond_52

    .line 92
    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result v5

    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    move-result v6

    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    move-result v7

    invoke-virtual {v0, v5, v8, v6, v7}, Landroid/view/View;->setPadding(IIII)V

    .line 93
    invoke-virtual {p0, v0}, Lorg/acra/dialog/CrashReportDialog;->addViewToDialog(Landroid/view/View;)V

    .line 94
    const/4 v3, 0x0

    .line 95
    .local v3, "savedComment":Ljava/lang/String;
    if-eqz p1, :cond_47

    .line 96
    const-string v5, "comment"

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 98
    :cond_47
    invoke-virtual {p0, v3}, Lorg/acra/dialog/CrashReportDialog;->getCommentPrompt(Ljava/lang/CharSequence;)Landroid/widget/EditText;

    move-result-object v5

    iput-object v5, p0, Lorg/acra/dialog/CrashReportDialog;->userCommentView:Landroid/widget/EditText;

    .line 99
    iget-object v5, p0, Lorg/acra/dialog/CrashReportDialog;->userCommentView:Landroid/widget/EditText;

    invoke-virtual {p0, v5}, Lorg/acra/dialog/CrashReportDialog;->addViewToDialog(Landroid/view/View;)V

    .line 103
    .end local v3    # "savedComment":Ljava/lang/String;
    :cond_52
    invoke-virtual {p0}, Lorg/acra/dialog/CrashReportDialog;->getEmailLabel()Landroid/view/View;

    move-result-object v1

    .line 104
    .local v1, "email":Landroid/view/View;
    if-eqz v1, :cond_7e

    .line 105
    invoke-virtual {v1}, Landroid/view/View;->getPaddingLeft()I

    move-result v5

    invoke-virtual {v1}, Landroid/view/View;->getPaddingRight()I

    move-result v6

    invoke-virtual {v1}, Landroid/view/View;->getPaddingBottom()I

    move-result v7

    invoke-virtual {v1, v5, v8, v6, v7}, Landroid/view/View;->setPadding(IIII)V

    .line 106
    invoke-virtual {p0, v1}, Lorg/acra/dialog/CrashReportDialog;->addViewToDialog(Landroid/view/View;)V

    .line 107
    const/4 v4, 0x0

    .line 108
    .local v4, "savedEmail":Ljava/lang/String;
    if-eqz p1, :cond_73

    .line 109
    const-string v5, "email"

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 111
    :cond_73
    invoke-virtual {p0, v4}, Lorg/acra/dialog/CrashReportDialog;->getEmailPrompt(Ljava/lang/CharSequence;)Landroid/widget/EditText;

    move-result-object v5

    iput-object v5, p0, Lorg/acra/dialog/CrashReportDialog;->userEmailView:Landroid/widget/EditText;

    .line 112
    iget-object v5, p0, Lorg/acra/dialog/CrashReportDialog;->userEmailView:Landroid/widget/EditText;

    invoke-virtual {p0, v5}, Lorg/acra/dialog/CrashReportDialog;->addViewToDialog(Landroid/view/View;)V

    .line 114
    .end local v4    # "savedEmail":Ljava/lang/String;
    :cond_7e
    return-object v2
.end method

.method protected getCommentLabel()Landroid/view/View;
    .registers 4
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 148
    invoke-virtual {p0}, Lorg/acra/dialog/CrashReportDialog;->getConfig()Lorg/acra/config/ACRAConfiguration;

    move-result-object v2

    invoke-virtual {v2}, Lorg/acra/config/ACRAConfiguration;->resDialogCommentPrompt()I

    move-result v0

    .line 149
    .local v0, "commentPromptId":I
    if-eqz v0, :cond_17

    .line 150
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 151
    .local v1, "labelView":Landroid/widget/TextView;
    invoke-virtual {p0, v0}, Lorg/acra/dialog/CrashReportDialog;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 154
    .end local v1    # "labelView":Landroid/widget/TextView;
    :goto_16
    return-object v1

    :cond_17
    const/4 v1, 0x0

    goto :goto_16
.end method

.method protected getCommentPrompt(Ljava/lang/CharSequence;)Landroid/widget/EditText;
    .registers 4
    .param p1, "savedComment"    # Ljava/lang/CharSequence;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 165
    new-instance v0, Landroid/widget/EditText;

    invoke-direct {v0, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 166
    .local v0, "userCommentView":Landroid/widget/EditText;
    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setLines(I)V

    .line 167
    if-eqz p1, :cond_e

    .line 168
    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 170
    :cond_e
    return-object v0
.end method

.method protected getDialog()Landroid/app/AlertDialog;
    .registers 2

    .prologue
    .line 256
    iget-object v0, p0, Lorg/acra/dialog/CrashReportDialog;->mDialog:Landroid/app/AlertDialog;

    return-object v0
.end method

.method protected getEmailLabel()Landroid/view/View;
    .registers 4
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 180
    invoke-virtual {p0}, Lorg/acra/dialog/CrashReportDialog;->getConfig()Lorg/acra/config/ACRAConfiguration;

    move-result-object v2

    invoke-virtual {v2}, Lorg/acra/config/ACRAConfiguration;->resDialogEmailPrompt()I

    move-result v0

    .line 181
    .local v0, "emailPromptId":I
    if-eqz v0, :cond_17

    .line 182
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 183
    .local v1, "labelView":Landroid/widget/TextView;
    invoke-virtual {p0, v0}, Lorg/acra/dialog/CrashReportDialog;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 186
    .end local v1    # "labelView":Landroid/widget/TextView;
    :goto_16
    return-object v1

    :cond_17
    const/4 v1, 0x0

    goto :goto_16
.end method

.method protected getEmailPrompt(Ljava/lang/CharSequence;)Landroid/widget/EditText;
    .registers 6
    .param p1, "savedEmail"    # Ljava/lang/CharSequence;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 197
    new-instance v1, Landroid/widget/EditText;

    invoke-direct {v1, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 198
    .local v1, "userEmailView":Landroid/widget/EditText;
    invoke-virtual {v1}, Landroid/widget/EditText;->setSingleLine()V

    .line 199
    const/16 v2, 0x21

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setInputType(I)V

    .line 201
    if-eqz p1, :cond_13

    .line 202
    invoke-virtual {v1, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 207
    :goto_12
    return-object v1

    .line 204
    :cond_13
    iget-object v2, p0, Lorg/acra/dialog/CrashReportDialog;->sharedPreferencesFactory:Lorg/acra/prefs/SharedPreferencesFactory;

    invoke-virtual {v2}, Lorg/acra/prefs/SharedPreferencesFactory;->create()Landroid/content/SharedPreferences;

    move-result-object v0

    .line 205
    .local v0, "prefs":Landroid/content/SharedPreferences;
    const-string v2, "acra.user.email"

    const-string v3, ""

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto :goto_12
.end method

.method protected getMainView()Landroid/view/View;
    .registers 4
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 133
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 134
    .local v1, "text":Landroid/widget/TextView;
    invoke-virtual {p0}, Lorg/acra/dialog/CrashReportDialog;->getConfig()Lorg/acra/config/ACRAConfiguration;

    move-result-object v2

    invoke-virtual {v2}, Lorg/acra/config/ACRAConfiguration;->resDialogText()I

    move-result v0

    .line 135
    .local v0, "dialogTextId":I
    if-eqz v0, :cond_16

    .line 136
    invoke-virtual {p0, v0}, Lorg/acra/dialog/CrashReportDialog;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 138
    :cond_16
    return-object v1
.end method

.method protected init(Landroid/os/Bundle;)V
    .registers 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    .prologue
    .line 45
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lorg/acra/dialog/CrashReportDialog;->scrollable:Landroid/widget/LinearLayout;

    .line 46
    iget-object v1, p0, Lorg/acra/dialog/CrashReportDialog;->scrollable:Landroid/widget/LinearLayout;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 47
    new-instance v1, Lorg/acra/prefs/SharedPreferencesFactory;

    invoke-virtual {p0}, Lorg/acra/dialog/CrashReportDialog;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {p0}, Lorg/acra/dialog/CrashReportDialog;->getConfig()Lorg/acra/config/ACRAConfiguration;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/acra/prefs/SharedPreferencesFactory;-><init>(Landroid/content/Context;Lorg/acra/config/ACRAConfiguration;)V

    iput-object v1, p0, Lorg/acra/dialog/CrashReportDialog;->sharedPreferencesFactory:Lorg/acra/prefs/SharedPreferencesFactory;

    .line 48
    invoke-virtual {p0}, Lorg/acra/dialog/CrashReportDialog;->getConfig()Lorg/acra/config/ACRAConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lorg/acra/config/ACRAConfiguration;->resDialogTheme()I

    move-result v0

    .line 49
    .local v0, "themeResourceId":I
    if-eqz v0, :cond_29

    invoke-virtual {p0, v0}, Lorg/acra/dialog/CrashReportDialog;->setTheme(I)V

    .line 51
    :cond_29
    invoke-virtual {p0, p1}, Lorg/acra/dialog/CrashReportDialog;->buildAndShowDialog(Landroid/os/Bundle;)V

    .line 52
    return-void
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 9
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 212
    const/4 v4, -0x1

    if-ne p2, v4, :cond_44

    .line 214
    iget-object v4, p0, Lorg/acra/dialog/CrashReportDialog;->userCommentView:Landroid/widget/EditText;

    if-eqz v4, :cond_38

    iget-object v4, p0, Lorg/acra/dialog/CrashReportDialog;->userCommentView:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 218
    .local v0, "comment":Ljava/lang/String;
    :goto_11
    iget-object v4, p0, Lorg/acra/dialog/CrashReportDialog;->sharedPreferencesFactory:Lorg/acra/prefs/SharedPreferencesFactory;

    invoke-virtual {v4}, Lorg/acra/prefs/SharedPreferencesFactory;->create()Landroid/content/SharedPreferences;

    move-result-object v2

    .line 219
    .local v2, "prefs":Landroid/content/SharedPreferences;
    iget-object v4, p0, Lorg/acra/dialog/CrashReportDialog;->userEmailView:Landroid/widget/EditText;

    if-eqz v4, :cond_3b

    .line 220
    iget-object v4, p0, Lorg/acra/dialog/CrashReportDialog;->userEmailView:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 221
    .local v3, "userEmail":Ljava/lang/String;
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 222
    .local v1, "prefEditor":Landroid/content/SharedPreferences$Editor;
    const-string v4, "acra.user.email"

    invoke-interface {v1, v4, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 223
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 227
    .end local v1    # "prefEditor":Landroid/content/SharedPreferences$Editor;
    :goto_31
    invoke-virtual {p0, v0, v3}, Lorg/acra/dialog/CrashReportDialog;->sendCrash(Ljava/lang/String;Ljava/lang/String;)V

    .line 232
    .end local v0    # "comment":Ljava/lang/String;
    .end local v2    # "prefs":Landroid/content/SharedPreferences;
    .end local v3    # "userEmail":Ljava/lang/String;
    :goto_34
    invoke-virtual {p0}, Lorg/acra/dialog/CrashReportDialog;->finish()V

    .line 233
    return-void

    .line 214
    :cond_38
    const-string v0, ""

    goto :goto_11

    .line 225
    .restart local v0    # "comment":Ljava/lang/String;
    .restart local v2    # "prefs":Landroid/content/SharedPreferences;
    :cond_3b
    const-string v4, "acra.user.email"

    const-string v5, ""

    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .restart local v3    # "userEmail":Ljava/lang/String;
    goto :goto_31

    .line 229
    .end local v0    # "comment":Ljava/lang/String;
    .end local v2    # "prefs":Landroid/content/SharedPreferences;
    .end local v3    # "userEmail":Ljava/lang/String;
    :cond_44
    invoke-virtual {p0}, Lorg/acra/dialog/CrashReportDialog;->cancelReports()V

    goto :goto_34
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "outState"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    .prologue
    .line 243
    invoke-super {p0, p1}, Lorg/acra/dialog/BaseCrashReportDialog;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 244
    iget-object v0, p0, Lorg/acra/dialog/CrashReportDialog;->userCommentView:Landroid/widget/EditText;

    if-eqz v0, :cond_1e

    iget-object v0, p0, Lorg/acra/dialog/CrashReportDialog;->userCommentView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    if-eqz v0, :cond_1e

    .line 245
    const-string v0, "comment"

    iget-object v1, p0, Lorg/acra/dialog/CrashReportDialog;->userCommentView:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 247
    :cond_1e
    iget-object v0, p0, Lorg/acra/dialog/CrashReportDialog;->userEmailView:Landroid/widget/EditText;

    if-eqz v0, :cond_39

    iget-object v0, p0, Lorg/acra/dialog/CrashReportDialog;->userEmailView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    if-eqz v0, :cond_39

    .line 248
    const-string v0, "email"

    iget-object v1, p0, Lorg/acra/dialog/CrashReportDialog;->userEmailView:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 250
    :cond_39
    return-void
.end method
