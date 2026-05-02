.class public Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable$Builder;
.super Ljava/lang/Object;
.source "NexusRotationCrossDrawable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private mColors:[I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 185
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 186
    invoke-direct {p0, p1}, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable$Builder;->initDefaults(Landroid/content/Context;)V

    .line 187
    return-void
.end method

.method private initDefaults(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 190
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/jpardogo/android/googleprogressbar/library/R$array;->google_colors:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getIntArray(I)[I

    move-result-object v0

    iput-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable$Builder;->mColors:[I

    .line 191
    return-void
.end method


# virtual methods
.method public build()Landroid/graphics/drawable/Drawable;
    .registers 3

    .prologue
    .line 203
    new-instance v0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;

    iget-object v1, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable$Builder;->mColors:[I

    invoke-direct {v0, v1}, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;-><init>([I)V

    return-object v0
.end method

.method public colors([I)Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable$Builder;
    .registers 4
    .param p1, "colors"    # [I

    .prologue
    .line 194
    if-eqz p1, :cond_6

    array-length v0, p1

    const/4 v1, 0x4

    if-eq v0, v1, :cond_e

    .line 195
    :cond_6
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Your color array must contains 4 values"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 198
    :cond_e
    iput-object p1, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable$Builder;->mColors:[I

    .line 199
    return-object p0
.end method
