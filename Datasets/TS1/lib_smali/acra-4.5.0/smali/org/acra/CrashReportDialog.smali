.class public Lorg/acra/CrashReportDialog;
.super Landroid/app/Activity;
.source "CrashReportDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;
.implements Landroid/content/DialogInterface$OnDismissListener;


# static fields
.field private static final STATE_COMMENT:Ljava/lang/String; = "comment"

.field private static final STATE_EMAIL:Ljava/lang/String; = "email"


# instance fields
.field mDialog:Landroid/app/AlertDialog;

.field mReportFileName:Ljava/lang/String;

.field private prefs:Landroid/content/SharedPreferences;

.field private userComment:Landroid/widget/EditText;

.field private userEmail:Landroid/widget/EditText;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 35
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private buildCustomView(Landroid/os/Bundle;)Landroid/view/View;
    .registers 15
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 80
    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 81
    .local v4, "root":Landroid/widget/LinearLayout;
    const/4 v9, 0x1

    invoke-virtual {v4, v9}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 82
    const/16 v9, 0xa

    const/16 v10, 0xa

    const/16 v11, 0xa

    const/16 v12, 0xa

    invoke-virtual {v4, v9, v10, v11, v12}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 83
    new-instance v9, Landroid/view/ViewGroup$LayoutParams;

    const/4 v10, -0x1

    const/4 v11, -0x2

    invoke-direct {v9, v10, v11}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v9}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 84
    const/4 v9, 0x1

    invoke-virtual {v4, v9}, Landroid/widget/LinearLayout;->setFocusable(Z)V

    .line 85
    const/4 v9, 0x1

    invoke-virtual {v4, v9}, Landroid/widget/LinearLayout;->setFocusableInTouchMode(Z)V

    .line 87
    new-instance v6, Landroid/widget/ScrollView;

    invoke-direct {v6, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 88
    .local v6, "scroll":Landroid/widget/ScrollView;
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v10, -0x1

    const/4 v11, -0x1

    const/high16 v12, 0x3f800000    # 1.0f

    invoke-direct {v9, v10, v11, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v4, v6, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 89
    new-instance v7, Landroid/widget/LinearLayout;

    invoke-direct {v7, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 90
    .local v7, "scrollable":Landroid/widget/LinearLayout;
    const/4 v9, 0x1

    invoke-virtual {v7, v9}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 91
    invoke-virtual {v6, v7}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 93
    new-instance v8, Landroid/widget/TextView;

    invoke-direct {v8, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 94
    .local v8, "text":Landroid/widget/TextView;
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v9

    invoke-virtual {v9}, Lorg/acra/ACRAConfiguration;->resDialogText()I

    move-result v1

    .line 95
    .local v1, "dialogTextId":I
    if-eqz v1, :cond_59

    .line 96
    invoke-virtual {p0, v1}, Lorg/acra/CrashReportDialog;->getText(I)Ljava/lang/CharSequence;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 98
    :cond_59
    invoke-virtual {v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 101
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v9

    invoke-virtual {v9}, Lorg/acra/ACRAConfiguration;->resDialogCommentPrompt()I

    move-result v0

    .line 102
    .local v0, "commentPromptId":I
    if-eqz v0, :cond_ae

    .line 103
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 104
    .local v3, "label":Landroid/widget/TextView;
    invoke-virtual {p0, v0}, Lorg/acra/CrashReportDialog;->getText(I)Ljava/lang/CharSequence;

    move-result-object v9

    invoke-virtual {v3, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 106
    invoke-virtual {v3}, Landroid/widget/TextView;->getPaddingLeft()I

    move-result v9

    const/16 v10, 0xa

    invoke-virtual {v3}, Landroid/widget/TextView;->getPaddingRight()I

    move-result v11

    invoke-virtual {v3}, Landroid/widget/TextView;->getPaddingBottom()I

    move-result v12

    invoke-virtual {v3, v9, v10, v11, v12}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 107
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v10, -0x1

    const/4 v11, -0x2

    invoke-direct {v9, v10, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v3, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 110
    new-instance v9, Landroid/widget/EditText;

    invoke-direct {v9, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    iput-object v9, p0, Lorg/acra/CrashReportDialog;->userComment:Landroid/widget/EditText;

    .line 111
    iget-object v9, p0, Lorg/acra/CrashReportDialog;->userComment:Landroid/widget/EditText;

    const/4 v10, 0x2

    invoke-virtual {v9, v10}, Landroid/widget/EditText;->setLines(I)V

    .line 112
    if-eqz p1, :cond_a9

    .line 113
    const-string v9, "comment"

    invoke-virtual {p1, v9}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 114
    .local v5, "savedValue":Ljava/lang/String;
    if-eqz v5, :cond_a9

    .line 115
    iget-object v9, p0, Lorg/acra/CrashReportDialog;->userComment:Landroid/widget/EditText;

    invoke-virtual {v9, v5}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 118
    .end local v5    # "savedValue":Ljava/lang/String;
    :cond_a9
    iget-object v9, p0, Lorg/acra/CrashReportDialog;->userComment:Landroid/widget/EditText;

    invoke-virtual {v7, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 122
    .end local v3    # "label":Landroid/widget/TextView;
    :cond_ae
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v9

    invoke-virtual {v9}, Lorg/acra/ACRAConfiguration;->resDialogEmailPrompt()I

    move-result v2

    .line 123
    .local v2, "emailPromptId":I
    if-eqz v2, :cond_116

    .line 124
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 125
    .restart local v3    # "label":Landroid/widget/TextView;
    invoke-virtual {p0, v2}, Lorg/acra/CrashReportDialog;->getText(I)Ljava/lang/CharSequence;

    move-result-object v9

    invoke-virtual {v3, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 127
    invoke-virtual {v3}, Landroid/widget/TextView;->getPaddingLeft()I

    move-result v9

    const/16 v10, 0xa

    invoke-virtual {v3}, Landroid/widget/TextView;->getPaddingRight()I

    move-result v11

    invoke-virtual {v3}, Landroid/widget/TextView;->getPaddingBottom()I

    move-result v12

    invoke-virtual {v3, v9, v10, v11, v12}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 128
    invoke-virtual {v7, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 130
    new-instance v9, Landroid/widget/EditText;

    invoke-direct {v9, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    iput-object v9, p0, Lorg/acra/CrashReportDialog;->userEmail:Landroid/widget/EditText;

    .line 131
    iget-object v9, p0, Lorg/acra/CrashReportDialog;->userEmail:Landroid/widget/EditText;

    invoke-virtual {v9}, Landroid/widget/EditText;->setSingleLine()V

    .line 132
    iget-object v9, p0, Lorg/acra/CrashReportDialog;->userEmail:Landroid/widget/EditText;

    const/16 v10, 0x21

    invoke-virtual {v9, v10}, Landroid/widget/EditText;->setInputType(I)V

    .line 134
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v9

    invoke-virtual {v9}, Lorg/acra/ACRAConfiguration;->sharedPreferencesName()Ljava/lang/String;

    move-result-object v9

    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v10

    invoke-virtual {v10}, Lorg/acra/ACRAConfiguration;->sharedPreferencesMode()I

    move-result v10

    invoke-virtual {p0, v9, v10}, Lorg/acra/CrashReportDialog;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v9

    iput-object v9, p0, Lorg/acra/CrashReportDialog;->prefs:Landroid/content/SharedPreferences;

    .line 136
    const/4 v5, 0x0

    .line 137
    .restart local v5    # "savedValue":Ljava/lang/String;
    if-eqz p1, :cond_10a

    .line 138
    const-string v9, "email"

    invoke-virtual {p1, v9}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 140
    :cond_10a
    if-eqz v5, :cond_117

    .line 141
    iget-object v9, p0, Lorg/acra/CrashReportDialog;->userEmail:Landroid/widget/EditText;

    invoke-virtual {v9, v5}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 145
    :goto_111
    iget-object v9, p0, Lorg/acra/CrashReportDialog;->userEmail:Landroid/widget/EditText;

    invoke-virtual {v7, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 148
    .end local v3    # "label":Landroid/widget/TextView;
    .end local v5    # "savedValue":Ljava/lang/String;
    :cond_116
    return-object v4

    .line 143
    .restart local v3    # "label":Landroid/widget/TextView;
    .restart local v5    # "savedValue":Ljava/lang/String;
    :cond_117
    iget-object v9, p0, Lorg/acra/CrashReportDialog;->userEmail:Landroid/widget/EditText;

    iget-object v10, p0, Lorg/acra/CrashReportDialog;->prefs:Landroid/content/SharedPreferences;

    const-string v11, "acra.user.email"

    const-string v12, ""

    invoke-interface {v10, v11, v12}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto :goto_111
.end method

.method private cancelReports()V
    .registers 3

    .prologue
    .line 170
    invoke-static {}, Lorg/acra/ACRA;->getErrorReporter()Lorg/acra/ErrorReporter;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/acra/ErrorReporter;->deletePendingNonApprovedReports(Z)V

    .line 171
    return-void
.end method

.method private sendCrash()V
    .registers 12

    .prologue
    const/4 v10, 0x1

    .line 175
    iget-object v7, p0, Lorg/acra/CrashReportDialog;->userComment:Landroid/widget/EditText;

    if-eqz v7, :cond_88

    iget-object v7, p0, Lorg/acra/CrashReportDialog;->userComment:Landroid/widget/EditText;

    invoke-virtual {v7}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 179
    .local v0, "comment":Ljava/lang/String;
    :goto_f
    iget-object v7, p0, Lorg/acra/CrashReportDialog;->prefs:Landroid/content/SharedPreferences;

    if-eqz v7, :cond_8b

    iget-object v7, p0, Lorg/acra/CrashReportDialog;->userEmail:Landroid/widget/EditText;

    if-eqz v7, :cond_8b

    .line 180
    iget-object v7, p0, Lorg/acra/CrashReportDialog;->userEmail:Landroid/widget/EditText;

    invoke-virtual {v7}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    .line 181
    .local v6, "usrEmail":Ljava/lang/String;
    iget-object v7, p0, Lorg/acra/CrashReportDialog;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    .line 182
    .local v4, "prefEditor":Landroid/content/SharedPreferences$Editor;
    const-string v7, "acra.user.email"

    invoke-interface {v4, v7, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 183
    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 188
    .end local v4    # "prefEditor":Landroid/content/SharedPreferences$Editor;
    :goto_2f
    new-instance v3, Lorg/acra/CrashReportPersister;

    invoke-virtual {p0}, Lorg/acra/CrashReportDialog;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    invoke-direct {v3, v7}, Lorg/acra/CrashReportPersister;-><init>(Landroid/content/Context;)V

    .line 190
    .local v3, "persister":Lorg/acra/CrashReportPersister;
    :try_start_38
    sget-object v7, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Add user comment to "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lorg/acra/CrashReportDialog;->mReportFileName:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 191
    iget-object v7, p0, Lorg/acra/CrashReportDialog;->mReportFileName:Ljava/lang/String;

    invoke-virtual {v3, v7}, Lorg/acra/CrashReportPersister;->load(Ljava/lang/String;)Lorg/acra/collector/CrashReportData;

    move-result-object v1

    .line 192
    .local v1, "crashData":Lorg/acra/collector/CrashReportData;
    sget-object v7, Lorg/acra/ReportField;->USER_COMMENT:Lorg/acra/ReportField;

    invoke-virtual {v1, v7, v0}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    sget-object v7, Lorg/acra/ReportField;->USER_EMAIL:Lorg/acra/ReportField;

    invoke-virtual {v1, v7, v6}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    iget-object v7, p0, Lorg/acra/CrashReportDialog;->mReportFileName:Ljava/lang/String;

    invoke-virtual {v3, v1, v7}, Lorg/acra/CrashReportPersister;->store(Lorg/acra/collector/CrashReportData;Ljava/lang/String;)V
    :try_end_67
    .catch Ljava/io/IOException; {:try_start_38 .. :try_end_67} :catch_8e

    .line 200
    .end local v1    # "crashData":Lorg/acra/collector/CrashReportData;
    :goto_67
    sget-object v7, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v8, "About to start SenderWorker from CrashReportDialog"

    invoke-static {v7, v8}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 201
    invoke-static {}, Lorg/acra/ACRA;->getErrorReporter()Lorg/acra/ErrorReporter;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {v7, v8, v10}, Lorg/acra/ErrorReporter;->startSendingReports(ZZ)Lorg/acra/SendWorker;

    .line 204
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v7

    invoke-virtual {v7}, Lorg/acra/ACRAConfiguration;->resDialogOkToast()I

    move-result v5

    .line 205
    .local v5, "toastId":I
    if-eqz v5, :cond_87

    .line 206
    invoke-virtual {p0}, Lorg/acra/CrashReportDialog;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {v7, v5, v10}, Lorg/acra/util/ToastSender;->sendToast(Landroid/content/Context;II)V

    .line 208
    :cond_87
    return-void

    .line 175
    .end local v0    # "comment":Ljava/lang/String;
    .end local v3    # "persister":Lorg/acra/CrashReportPersister;
    .end local v5    # "toastId":I
    .end local v6    # "usrEmail":Ljava/lang/String;
    :cond_88
    const-string v0, ""

    goto :goto_f

    .line 185
    .restart local v0    # "comment":Ljava/lang/String;
    :cond_8b
    const-string v6, ""

    .restart local v6    # "usrEmail":Ljava/lang/String;
    goto :goto_2f

    .line 195
    .restart local v3    # "persister":Lorg/acra/CrashReportPersister;
    :catch_8e
    move-exception v2

    .line 196
    .local v2, "e":Ljava/io/IOException;
    sget-object v7, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v8, "User comment not added: "

    invoke-static {v7, v8, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_67
.end method


# virtual methods
.method protected cancelNotification()V
    .registers 3

    .prologue
    .line 155
    const-string v1, "notification"

    invoke-virtual {p0, v1}, Lorg/acra/CrashReportDialog;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    .line 156
    .local v0, "notificationManager":Landroid/app/NotificationManager;
    const/16 v1, 0x29a

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    .line 157
    return-void
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 161
    const/4 v0, -0x1

    if-ne p2, v0, :cond_a

    .line 162
    invoke-direct {p0}, Lorg/acra/CrashReportDialog;->sendCrash()V

    .line 166
    :goto_6
    invoke-virtual {p0}, Lorg/acra/CrashReportDialog;->finish()V

    .line 167
    return-void

    .line 164
    :cond_a
    invoke-direct {p0}, Lorg/acra/CrashReportDialog;->cancelReports()V

    goto :goto_6
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 9
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v6, 0x0

    .line 46
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 47
    invoke-virtual {p0}, Lorg/acra/CrashReportDialog;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string v4, "FORCE_CANCEL"

    invoke-virtual {v3, v4, v6}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    .line 48
    .local v1, "forceCancel":Z
    if-eqz v1, :cond_20

    .line 49
    sget-object v3, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v4, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v5, "Forced reports deletion."

    invoke-interface {v3, v4, v5}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    invoke-direct {p0}, Lorg/acra/CrashReportDialog;->cancelReports()V

    .line 51
    invoke-virtual {p0}, Lorg/acra/CrashReportDialog;->finish()V

    .line 77
    :goto_1f
    return-void

    .line 55
    :cond_20
    invoke-virtual {p0}, Lorg/acra/CrashReportDialog;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string v4, "REPORT_FILE_NAME"

    invoke-virtual {v3, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/acra/CrashReportDialog;->mReportFileName:Ljava/lang/String;

    .line 56
    sget-object v3, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Opening CrashReportDialog for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lorg/acra/CrashReportDialog;->mReportFileName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    iget-object v3, p0, Lorg/acra/CrashReportDialog;->mReportFileName:Ljava/lang/String;

    if-nez v3, :cond_4d

    .line 58
    invoke-virtual {p0}, Lorg/acra/CrashReportDialog;->finish()V

    .line 60
    :cond_4d
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 61
    .local v0, "dialogBuilder":Landroid/app/AlertDialog$Builder;
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v3

    invoke-virtual {v3}, Lorg/acra/ACRAConfiguration;->resDialogTitle()I

    move-result v2

    .line 62
    .local v2, "resourceId":I
    if-eqz v2, :cond_5f

    .line 63
    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 65
    :cond_5f
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v3

    invoke-virtual {v3}, Lorg/acra/ACRAConfiguration;->resDialogIcon()I

    move-result v2

    .line 66
    if-eqz v2, :cond_6c

    .line 67
    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    .line 69
    :cond_6c
    invoke-direct {p0, p1}, Lorg/acra/CrashReportDialog;->buildCustomView(Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 70
    const v3, 0x104000a

    invoke-virtual {v0, v3, p0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 71
    const/high16 v3, 0x1040000

    invoke-virtual {v0, v3, p0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 72
    invoke-virtual {p0}, Lorg/acra/CrashReportDialog;->cancelNotification()V

    .line 73
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v3

    iput-object v3, p0, Lorg/acra/CrashReportDialog;->mDialog:Landroid/app/AlertDialog;

    .line 74
    iget-object v3, p0, Lorg/acra/CrashReportDialog;->mDialog:Landroid/app/AlertDialog;

    invoke-virtual {v3, v6}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    .line 75
    iget-object v3, p0, Lorg/acra/CrashReportDialog;->mDialog:Landroid/app/AlertDialog;

    invoke-virtual {v3, p0}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 76
    iget-object v3, p0, Lorg/acra/CrashReportDialog;->mDialog:Landroid/app/AlertDialog;

    invoke-virtual {v3}, Landroid/app/AlertDialog;->show()V

    goto :goto_1f
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .registers 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 228
    invoke-virtual {p0}, Lorg/acra/CrashReportDialog;->finish()V

    .line 229
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 217
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 218
    iget-object v0, p0, Lorg/acra/CrashReportDialog;->userComment:Landroid/widget/EditText;

    if-eqz v0, :cond_1e

    iget-object v0, p0, Lorg/acra/CrashReportDialog;->userComment:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    if-eqz v0, :cond_1e

    .line 219
    const-string v0, "comment"

    iget-object v1, p0, Lorg/acra/CrashReportDialog;->userComment:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 221
    :cond_1e
    iget-object v0, p0, Lorg/acra/CrashReportDialog;->userEmail:Landroid/widget/EditText;

    if-eqz v0, :cond_39

    iget-object v0, p0, Lorg/acra/CrashReportDialog;->userEmail:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    if-eqz v0, :cond_39

    .line 222
    const-string v0, "email"

    iget-object v1, p0, Lorg/acra/CrashReportDialog;->userEmail:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 224
    :cond_39
    return-void
.end method
