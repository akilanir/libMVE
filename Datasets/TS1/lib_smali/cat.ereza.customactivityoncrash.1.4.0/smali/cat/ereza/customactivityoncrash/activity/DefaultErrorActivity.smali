.class public final Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity;
.super Landroid/app/Activity;
.source "DefaultErrorActivity.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 37
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity;)V
    .registers 1
    .param p0, "x0"    # Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity;

    .prologue
    .line 37
    invoke-direct {p0}, Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity;->copyErrorToClipboard()V

    return-void
.end method

.method private copyErrorToClipboard()V
    .registers 6

    .prologue
    .line 112
    invoke-virtual {p0}, Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    invoke-static {p0, v3}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->getAllErrorDetailsFromIntent(Landroid/content/Context;Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v2

    .line 115
    .local v2, "errorInformation":Ljava/lang/String;
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0xb

    if-lt v3, v4, :cond_24

    .line 116
    const-string v3, "clipboard"

    invoke-virtual {p0, v3}, Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/ClipboardManager;

    .line 117
    .local v1, "clipboard":Landroid/content/ClipboardManager;
    sget v3, Lcat/ereza/customactivityoncrash/R$string;->customactivityoncrash_error_activity_error_details_clipboard_label:I

    invoke-virtual {p0, v3}, Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v2}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object v0

    .line 118
    .local v0, "clip":Landroid/content/ClipData;
    invoke-virtual {v1, v0}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    .line 124
    .end local v0    # "clip":Landroid/content/ClipData;
    .end local v1    # "clipboard":Landroid/content/ClipboardManager;
    :goto_23
    return-void

    .line 121
    :cond_24
    const-string v3, "clipboard"

    invoke-virtual {p0, v3}, Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/text/ClipboardManager;

    .line 122
    .local v1, "clipboard":Landroid/text/ClipboardManager;
    invoke-virtual {v1, v2}, Landroid/text/ClipboardManager;->setText(Ljava/lang/CharSequence;)V

    goto :goto_23
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .registers 9
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 41
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 43
    sget v5, Lcat/ereza/customactivityoncrash/R$layout;->customactivityoncrash_default_error_activity:I

    invoke-virtual {p0, v5}, Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity;->setContentView(I)V

    .line 49
    sget v5, Lcat/ereza/customactivityoncrash/R$id;->customactivityoncrash_error_activity_restart_button:I

    invoke-virtual {p0, v5}, Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/Button;

    .line 51
    .local v4, "restartButton":Landroid/widget/Button;
    invoke-virtual {p0}, Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    invoke-static {v5}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->getRestartActivityClassFromIntent(Landroid/content/Intent;)Ljava/lang/Class;

    move-result-object v3

    .line 53
    .local v3, "restartActivityClass":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/app/Activity;>;"
    if-eqz v3, :cond_67

    .line 54
    sget v5, Lcat/ereza/customactivityoncrash/R$string;->customactivityoncrash_error_activity_restart_app:I

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setText(I)V

    .line 55
    new-instance v5, Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity$1;

    invoke-direct {v5, p0, v3}, Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity$1;-><init>(Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity;Ljava/lang/Class;)V

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 71
    :goto_27
    sget v5, Lcat/ereza/customactivityoncrash/R$id;->customactivityoncrash_error_activity_more_info_button:I

    invoke-virtual {p0, v5}, Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 73
    .local v2, "moreInfoButton":Landroid/widget/Button;
    invoke-virtual {p0}, Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    invoke-static {v5}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->isShowErrorDetailsFromIntent(Landroid/content/Intent;)Z

    move-result v5

    if-eqz v5, :cond_70

    .line 75
    new-instance v5, Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity$3;

    invoke-direct {v5, p0}, Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity$3;-><init>(Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity;)V

    invoke-virtual {v2, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 101
    :goto_41
    invoke-virtual {p0}, Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    invoke-static {v5}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->getDefaultErrorActivityDrawableIdFromIntent(Landroid/content/Intent;)I

    move-result v0

    .line 102
    .local v0, "defaultErrorActivityDrawableId":I
    sget v5, Lcat/ereza/customactivityoncrash/R$id;->customactivityoncrash_error_activity_image:I

    invoke-virtual {p0, v5}, Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 103
    .local v1, "errorImageView":Landroid/widget/ImageView;
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x15

    if-lt v5, v6, :cond_76

    .line 104
    invoke-virtual {p0}, Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {p0}, Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v6

    invoke-virtual {v5, v0, v6}, Landroid/content/res/Resources;->getDrawable(ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 109
    :goto_66
    return-void

    .line 63
    .end local v0    # "defaultErrorActivityDrawableId":I
    .end local v1    # "errorImageView":Landroid/widget/ImageView;
    .end local v2    # "moreInfoButton":Landroid/widget/Button;
    :cond_67
    new-instance v5, Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity$2;

    invoke-direct {v5, p0}, Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity$2;-><init>(Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity;)V

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_27

    .line 98
    .restart local v2    # "moreInfoButton":Landroid/widget/Button;
    :cond_70
    const/16 v5, 0x8

    invoke-virtual {v2, v5}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_41

    .line 107
    .restart local v0    # "defaultErrorActivityDrawableId":I
    .restart local v1    # "errorImageView":Landroid/widget/ImageView;
    :cond_76
    invoke-virtual {p0}, Lcat/ereza/customactivityoncrash/activity/DefaultErrorActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_66
.end method
