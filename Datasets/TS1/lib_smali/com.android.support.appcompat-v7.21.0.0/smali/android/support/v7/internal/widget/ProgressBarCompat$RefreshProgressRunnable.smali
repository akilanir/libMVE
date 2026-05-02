.class Landroid/support/v7/internal/widget/ProgressBarCompat$RefreshProgressRunnable;
.super Ljava/lang/Object;
.source "ProgressBarCompat.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/internal/widget/ProgressBarCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RefreshProgressRunnable"
.end annotation


# instance fields
.field private mFromUser:Z

.field private mId:I

.field private mProgress:I

.field final synthetic this$0:Landroid/support/v7/internal/widget/ProgressBarCompat;


# direct methods
.method constructor <init>(Landroid/support/v7/internal/widget/ProgressBarCompat;IIZ)V
    .registers 5
    .param p2, "id"    # I
    .param p3, "progress"    # I
    .param p4, "fromUser"    # Z

    .prologue
    .line 397
    iput-object p1, p0, Landroid/support/v7/internal/widget/ProgressBarCompat$RefreshProgressRunnable;->this$0:Landroid/support/v7/internal/widget/ProgressBarCompat;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 398
    iput p2, p0, Landroid/support/v7/internal/widget/ProgressBarCompat$RefreshProgressRunnable;->mId:I

    .line 399
    iput p3, p0, Landroid/support/v7/internal/widget/ProgressBarCompat$RefreshProgressRunnable;->mProgress:I

    .line 400
    iput-boolean p4, p0, Landroid/support/v7/internal/widget/ProgressBarCompat$RefreshProgressRunnable;->mFromUser:Z

    .line 401
    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    .prologue
    .line 404
    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat$RefreshProgressRunnable;->this$0:Landroid/support/v7/internal/widget/ProgressBarCompat;

    iget v1, p0, Landroid/support/v7/internal/widget/ProgressBarCompat$RefreshProgressRunnable;->mId:I

    iget v2, p0, Landroid/support/v7/internal/widget/ProgressBarCompat$RefreshProgressRunnable;->mProgress:I

    iget-boolean v3, p0, Landroid/support/v7/internal/widget/ProgressBarCompat$RefreshProgressRunnable;->mFromUser:Z

    const/4 v4, 0x1

    # invokes: Landroid/support/v7/internal/widget/ProgressBarCompat;->doRefreshProgress(IIZZ)V
    invoke-static {v0, v1, v2, v3, v4}, Landroid/support/v7/internal/widget/ProgressBarCompat;->access$000(Landroid/support/v7/internal/widget/ProgressBarCompat;IIZZ)V

    .line 406
    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat$RefreshProgressRunnable;->this$0:Landroid/support/v7/internal/widget/ProgressBarCompat;

    # setter for: Landroid/support/v7/internal/widget/ProgressBarCompat;->mRefreshProgressRunnable:Landroid/support/v7/internal/widget/ProgressBarCompat$RefreshProgressRunnable;
    invoke-static {v0, p0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->access$102(Landroid/support/v7/internal/widget/ProgressBarCompat;Landroid/support/v7/internal/widget/ProgressBarCompat$RefreshProgressRunnable;)Landroid/support/v7/internal/widget/ProgressBarCompat$RefreshProgressRunnable;

    .line 407
    return-void
.end method

.method public setup(IIZ)V
    .registers 4
    .param p1, "id"    # I
    .param p2, "progress"    # I
    .param p3, "fromUser"    # Z

    .prologue
    .line 410
    iput p1, p0, Landroid/support/v7/internal/widget/ProgressBarCompat$RefreshProgressRunnable;->mId:I

    .line 411
    iput p2, p0, Landroid/support/v7/internal/widget/ProgressBarCompat$RefreshProgressRunnable;->mProgress:I

    .line 412
    iput-boolean p3, p0, Landroid/support/v7/internal/widget/ProgressBarCompat$RefreshProgressRunnable;->mFromUser:Z

    .line 413
    return-void
.end method
