.class Lcom/github/curioustechizen/ago/RelativeTimeTextView$UpdateTimeRunnable;
.super Ljava/lang/Object;
.source "RelativeTimeTextView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/github/curioustechizen/ago/RelativeTimeTextView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "UpdateTimeRunnable"
.end annotation


# instance fields
.field private mRefTime:J

.field final synthetic this$0:Lcom/github/curioustechizen/ago/RelativeTimeTextView;


# direct methods
.method constructor <init>(Lcom/github/curioustechizen/ago/RelativeTimeTextView;J)V
    .registers 4
    .param p2, "refTime"    # J

    .prologue
    .line 250
    iput-object p1, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView$UpdateTimeRunnable;->this$0:Lcom/github/curioustechizen/ago/RelativeTimeTextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 251
    iput-wide p2, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView$UpdateTimeRunnable;->mRefTime:J

    .line 252
    return-void
.end method


# virtual methods
.method public run()V
    .registers 9

    .prologue
    .line 256
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView$UpdateTimeRunnable;->mRefTime:J

    sub-long/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->abs(J)J

    move-result-wide v0

    .line 257
    .local v0, "difference":J
    const-wide/32 v2, 0xea60

    .line 258
    .local v2, "interval":J
    const-wide/32 v4, 0x240c8400

    cmp-long v4, v0, v4

    if-lez v4, :cond_27

    .line 259
    const-wide/32 v2, 0x240c8400

    .line 265
    :cond_18
    :goto_18
    iget-object v4, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView$UpdateTimeRunnable;->this$0:Lcom/github/curioustechizen/ago/RelativeTimeTextView;

    # invokes: Lcom/github/curioustechizen/ago/RelativeTimeTextView;->updateTextDisplay()V
    invoke-static {v4}, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->access$200(Lcom/github/curioustechizen/ago/RelativeTimeTextView;)V

    .line 266
    iget-object v4, p0, Lcom/github/curioustechizen/ago/RelativeTimeTextView$UpdateTimeRunnable;->this$0:Lcom/github/curioustechizen/ago/RelativeTimeTextView;

    # getter for: Lcom/github/curioustechizen/ago/RelativeTimeTextView;->mHandler:Landroid/os/Handler;
    invoke-static {v4}, Lcom/github/curioustechizen/ago/RelativeTimeTextView;->access$300(Lcom/github/curioustechizen/ago/RelativeTimeTextView;)Landroid/os/Handler;

    move-result-object v4

    invoke-virtual {v4, p0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 268
    return-void

    .line 260
    :cond_27
    const-wide/32 v4, 0x5265c00

    cmp-long v4, v0, v4

    if-lez v4, :cond_32

    .line 261
    const-wide/32 v2, 0x5265c00

    goto :goto_18

    .line 262
    :cond_32
    const-wide/32 v4, 0x36ee80

    cmp-long v4, v0, v4

    if-lez v4, :cond_18

    .line 263
    const-wide/32 v2, 0x36ee80

    goto :goto_18
.end method
