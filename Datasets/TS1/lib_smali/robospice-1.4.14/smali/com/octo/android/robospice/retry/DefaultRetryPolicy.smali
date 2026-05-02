.class public Lcom/octo/android/robospice/retry/DefaultRetryPolicy;
.super Ljava/lang/Object;
.source "DefaultRetryPolicy.java"

# interfaces
.implements Lcom/octo/android/robospice/retry/RetryPolicy;


# static fields
.field public static final DEFAULT_BACKOFF_MULT:F = 1.0f

.field public static final DEFAULT_DELAY_BEFORE_RETRY:J = 0x9c4L

.field public static final DEFAULT_RETRY_COUNT:I = 0x3


# instance fields
.field private backOffMultiplier:F

.field private delayBeforeRetry:J

.field private retryCount:I


# direct methods
.method public constructor <init>()V
    .registers 5

    .prologue
    .line 48
    const/4 v0, 0x3

    const-wide/16 v1, 0x9c4

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/octo/android/robospice/retry/DefaultRetryPolicy;-><init>(IJF)V

    .line 49
    return-void
.end method

.method public constructor <init>(IJF)V
    .registers 7
    .param p1, "retryCount"    # I
    .param p2, "delayBeforeRetry"    # J
    .param p4, "backOffMultiplier"    # F

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    const/4 v0, 0x3

    iput v0, p0, Lcom/octo/android/robospice/retry/DefaultRetryPolicy;->retryCount:I

    .line 30
    const-wide/16 v0, 0x9c4

    iput-wide v0, p0, Lcom/octo/android/robospice/retry/DefaultRetryPolicy;->delayBeforeRetry:J

    .line 36
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/octo/android/robospice/retry/DefaultRetryPolicy;->backOffMultiplier:F

    .line 42
    iput p1, p0, Lcom/octo/android/robospice/retry/DefaultRetryPolicy;->retryCount:I

    .line 43
    iput-wide p2, p0, Lcom/octo/android/robospice/retry/DefaultRetryPolicy;->delayBeforeRetry:J

    .line 44
    iput p4, p0, Lcom/octo/android/robospice/retry/DefaultRetryPolicy;->backOffMultiplier:F

    .line 45
    return-void
.end method


# virtual methods
.method public getDelayBeforeRetry()J
    .registers 3

    .prologue
    .line 68
    iget-wide v0, p0, Lcom/octo/android/robospice/retry/DefaultRetryPolicy;->delayBeforeRetry:J

    return-wide v0
.end method

.method public getRetryCount()I
    .registers 2

    .prologue
    .line 57
    iget v0, p0, Lcom/octo/android/robospice/retry/DefaultRetryPolicy;->retryCount:I

    return v0
.end method

.method public retry(Lcom/octo/android/robospice/persistence/exception/SpiceException;)V
    .registers 4
    .param p1, "e"    # Lcom/octo/android/robospice/persistence/exception/SpiceException;

    .prologue
    .line 62
    iget v0, p0, Lcom/octo/android/robospice/retry/DefaultRetryPolicy;->retryCount:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/octo/android/robospice/retry/DefaultRetryPolicy;->retryCount:I

    .line 63
    iget-wide v0, p0, Lcom/octo/android/robospice/retry/DefaultRetryPolicy;->delayBeforeRetry:J

    long-to-float v0, v0

    iget v1, p0, Lcom/octo/android/robospice/retry/DefaultRetryPolicy;->backOffMultiplier:F

    mul-float/2addr v0, v1

    float-to-long v0, v0

    iput-wide v0, p0, Lcom/octo/android/robospice/retry/DefaultRetryPolicy;->delayBeforeRetry:J

    .line 64
    return-void
.end method
