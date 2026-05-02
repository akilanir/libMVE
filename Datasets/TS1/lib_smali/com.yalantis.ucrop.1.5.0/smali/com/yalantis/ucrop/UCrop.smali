.class public Lcom/yalantis/ucrop/UCrop;
.super Ljava/lang/Object;
.source "UCrop.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yalantis/ucrop/UCrop$Options;
    }
.end annotation


# static fields
.field public static final EXTRA_ASPECT_RATIO_SET:Ljava/lang/String; = "com.yalantis.ucrop.AspectRatioSet"

.field public static final EXTRA_ASPECT_RATIO_X:Ljava/lang/String; = "com.yalantis.ucrop.AspectRatioX"

.field public static final EXTRA_ASPECT_RATIO_Y:Ljava/lang/String; = "com.yalantis.ucrop.AspectRatioY"

.field public static final EXTRA_ERROR:Ljava/lang/String; = "com.yalantis.ucrop.Error"

.field public static final EXTRA_INPUT_URI:Ljava/lang/String; = "com.yalantis.ucrop.InputUri"

.field public static final EXTRA_MAX_SIZE_SET:Ljava/lang/String; = "com.yalantis.ucrop.MaxSizeSet"

.field public static final EXTRA_MAX_SIZE_X:Ljava/lang/String; = "com.yalantis.ucrop.MaxSizeX"

.field public static final EXTRA_MAX_SIZE_Y:Ljava/lang/String; = "com.yalantis.ucrop.MaxSizeY"

.field public static final EXTRA_OUTPUT_CROP_ASPECT_RATIO:Ljava/lang/String; = "com.yalantis.ucrop.CropAspectRatio"

.field public static final EXTRA_OUTPUT_URI:Ljava/lang/String; = "com.yalantis.ucrop.OutputUri"

.field private static final EXTRA_PREFIX:Ljava/lang/String; = "com.yalantis.ucrop"

.field public static final REQUEST_CROP:I = 0x45

.field public static final RESULT_ERROR:I = 0x60


# instance fields
.field private mCropIntent:Landroid/content/Intent;

.field private mCropOptionsBundle:Landroid/os/Bundle;


# direct methods
.method private constructor <init>(Landroid/net/Uri;Landroid/net/Uri;)V
    .registers 5
    .param p1, "source"    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "destination"    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    iput-object v0, p0, Lcom/yalantis/ucrop/UCrop;->mCropIntent:Landroid/content/Intent;

    .line 58
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iput-object v0, p0, Lcom/yalantis/ucrop/UCrop;->mCropOptionsBundle:Landroid/os/Bundle;

    .line 59
    iget-object v0, p0, Lcom/yalantis/ucrop/UCrop;->mCropOptionsBundle:Landroid/os/Bundle;

    const-string v1, "com.yalantis.ucrop.InputUri"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 60
    iget-object v0, p0, Lcom/yalantis/ucrop/UCrop;->mCropOptionsBundle:Landroid/os/Bundle;

    const-string v1, "com.yalantis.ucrop.OutputUri"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 61
    return-void
.end method

.method public static getError(Landroid/content/Intent;)Ljava/lang/Throwable;
    .registers 2
    .param p0, "result"    # Landroid/content/Intent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 203
    const-string v0, "com.yalantis.ucrop.Error"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/lang/Throwable;

    return-object v0
.end method

.method public static getOutput(Landroid/content/Intent;)Landroid/net/Uri;
    .registers 2
    .param p0, "intent"    # Landroid/content/Intent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 182
    const-string v0, "com.yalantis.ucrop.OutputUri"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/net/Uri;

    return-object v0
.end method

.method public static getOutputCropAspectRatio(Landroid/content/Intent;)F
    .registers 2
    .param p0, "intent"    # Landroid/content/Intent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 192
    const-string v0, "com.yalantis.ucrop.CropAspectRatio"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    return v0
.end method

.method public static of(Landroid/net/Uri;Landroid/net/Uri;)Lcom/yalantis/ucrop/UCrop;
    .registers 3
    .param p0, "source"    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "destination"    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 53
    new-instance v0, Lcom/yalantis/ucrop/UCrop;

    invoke-direct {v0, p0, p1}, Lcom/yalantis/ucrop/UCrop;-><init>(Landroid/net/Uri;Landroid/net/Uri;)V

    return-object v0
.end method


# virtual methods
.method public getIntent(Landroid/content/Context;)Landroid/content/Intent;
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 170
    iget-object v0, p0, Lcom/yalantis/ucrop/UCrop;->mCropIntent:Landroid/content/Intent;

    const-class v1, Lcom/yalantis/ucrop/UCropActivity;

    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 171
    iget-object v0, p0, Lcom/yalantis/ucrop/UCrop;->mCropIntent:Landroid/content/Intent;

    iget-object v1, p0, Lcom/yalantis/ucrop/UCrop;->mCropOptionsBundle:Landroid/os/Bundle;

    invoke-virtual {v0, v1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 172
    iget-object v0, p0, Lcom/yalantis/ucrop/UCrop;->mCropIntent:Landroid/content/Intent;

    return-object v0
.end method

.method public start(Landroid/app/Activity;)V
    .registers 3
    .param p1, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 112
    const/16 v0, 0x45

    invoke-virtual {p0, p1, v0}, Lcom/yalantis/ucrop/UCrop;->start(Landroid/app/Activity;I)V

    .line 113
    return-void
.end method

.method public start(Landroid/app/Activity;I)V
    .registers 4
    .param p1, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "requestCode"    # I

    .prologue
    .line 122
    invoke-virtual {p0, p1}, Lcom/yalantis/ucrop/UCrop;->getIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p1, v0, p2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 123
    return-void
.end method

.method public start(Landroid/content/Context;Landroid/app/Fragment;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "fragment"    # Landroid/app/Fragment;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 131
    const/16 v0, 0x45

    invoke-virtual {p0, p1, p2, v0}, Lcom/yalantis/ucrop/UCrop;->start(Landroid/content/Context;Landroid/app/Fragment;I)V

    .line 132
    return-void
.end method

.method public start(Landroid/content/Context;Landroid/app/Fragment;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "fragment"    # Landroid/app/Fragment;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "requestCode"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 151
    invoke-virtual {p0, p1}, Lcom/yalantis/ucrop/UCrop;->getIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p2, v0, p3}, Landroid/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 152
    return-void
.end method

.method public start(Landroid/content/Context;Landroid/support/v4/app/Fragment;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "fragment"    # Landroid/support/v4/app/Fragment;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 140
    const/16 v0, 0x45

    invoke-virtual {p0, p1, p2, v0}, Lcom/yalantis/ucrop/UCrop;->start(Landroid/content/Context;Landroid/support/v4/app/Fragment;I)V

    .line 141
    return-void
.end method

.method public start(Landroid/content/Context;Landroid/support/v4/app/Fragment;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "fragment"    # Landroid/support/v4/app/Fragment;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "requestCode"    # I

    .prologue
    .line 161
    invoke-virtual {p0, p1}, Lcom/yalantis/ucrop/UCrop;->getIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p2, v0, p3}, Landroid/support/v4/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 162
    return-void
.end method

.method public useSourceImageAspectRatio()Lcom/yalantis/ucrop/UCrop;
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 82
    iget-object v0, p0, Lcom/yalantis/ucrop/UCrop;->mCropOptionsBundle:Landroid/os/Bundle;

    const-string v1, "com.yalantis.ucrop.AspectRatioSet"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 83
    iget-object v0, p0, Lcom/yalantis/ucrop/UCrop;->mCropOptionsBundle:Landroid/os/Bundle;

    const-string v1, "com.yalantis.ucrop.AspectRatioX"

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 84
    iget-object v0, p0, Lcom/yalantis/ucrop/UCrop;->mCropOptionsBundle:Landroid/os/Bundle;

    const-string v1, "com.yalantis.ucrop.AspectRatioY"

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 85
    return-object p0
.end method

.method public withAspectRatio(FF)Lcom/yalantis/ucrop/UCrop;
    .registers 6
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 71
    iget-object v0, p0, Lcom/yalantis/ucrop/UCrop;->mCropOptionsBundle:Landroid/os/Bundle;

    const-string v1, "com.yalantis.ucrop.AspectRatioSet"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 72
    iget-object v0, p0, Lcom/yalantis/ucrop/UCrop;->mCropOptionsBundle:Landroid/os/Bundle;

    const-string v1, "com.yalantis.ucrop.AspectRatioX"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    .line 73
    iget-object v0, p0, Lcom/yalantis/ucrop/UCrop;->mCropOptionsBundle:Landroid/os/Bundle;

    const-string v1, "com.yalantis.ucrop.AspectRatioY"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    .line 74
    return-object p0
.end method

.method public withMaxResultSize(II)Lcom/yalantis/ucrop/UCrop;
    .registers 6
    .param p1, "width"    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x64L
        .end annotation
    .end param
    .param p2, "height"    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x64L
        .end annotation
    .end param

    .prologue
    .line 95
    iget-object v0, p0, Lcom/yalantis/ucrop/UCrop;->mCropOptionsBundle:Landroid/os/Bundle;

    const-string v1, "com.yalantis.ucrop.MaxSizeSet"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 96
    iget-object v0, p0, Lcom/yalantis/ucrop/UCrop;->mCropOptionsBundle:Landroid/os/Bundle;

    const-string v1, "com.yalantis.ucrop.MaxSizeX"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 97
    iget-object v0, p0, Lcom/yalantis/ucrop/UCrop;->mCropOptionsBundle:Landroid/os/Bundle;

    const-string v1, "com.yalantis.ucrop.MaxSizeY"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 98
    return-object p0
.end method

.method public withOptions(Lcom/yalantis/ucrop/UCrop$Options;)Lcom/yalantis/ucrop/UCrop;
    .registers 4
    .param p1, "options"    # Lcom/yalantis/ucrop/UCrop$Options;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 102
    iget-object v0, p0, Lcom/yalantis/ucrop/UCrop;->mCropOptionsBundle:Landroid/os/Bundle;

    invoke-virtual {p1}, Lcom/yalantis/ucrop/UCrop$Options;->getOptionBundle()Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    .line 103
    return-object p0
.end method
