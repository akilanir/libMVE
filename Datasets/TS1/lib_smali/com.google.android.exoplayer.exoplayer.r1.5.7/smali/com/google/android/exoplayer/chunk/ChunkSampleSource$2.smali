.class Lcom/google/android/exoplayer/chunk/ChunkSampleSource$2;
.super Ljava/lang/Object;
.source "ChunkSampleSource.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->notifyLoadCompleted(JIILcom/google/android/exoplayer/chunk/Format;JJJJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/exoplayer/chunk/ChunkSampleSource;

.field final synthetic val$bytesLoaded:J

.field final synthetic val$elapsedRealtimeMs:J

.field final synthetic val$format:Lcom/google/android/exoplayer/chunk/Format;

.field final synthetic val$loadDurationMs:J

.field final synthetic val$mediaEndTimeUs:J

.field final synthetic val$mediaStartTimeUs:J

.field final synthetic val$trigger:I

.field final synthetic val$type:I


# direct methods
.method constructor <init>(Lcom/google/android/exoplayer/chunk/ChunkSampleSource;JIILcom/google/android/exoplayer/chunk/Format;JJJJ)V
    .registers 15

    .prologue
    .line 625
    iput-object p1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$2;->this$0:Lcom/google/android/exoplayer/chunk/ChunkSampleSource;

    iput-wide p2, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$2;->val$bytesLoaded:J

    iput p4, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$2;->val$type:I

    iput p5, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$2;->val$trigger:I

    iput-object p6, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$2;->val$format:Lcom/google/android/exoplayer/chunk/Format;

    iput-wide p7, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$2;->val$mediaStartTimeUs:J

    iput-wide p9, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$2;->val$mediaEndTimeUs:J

    iput-wide p11, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$2;->val$elapsedRealtimeMs:J

    iput-wide p13, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$2;->val$loadDurationMs:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 16

    .prologue
    .line 628
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$2;->this$0:Lcom/google/android/exoplayer/chunk/ChunkSampleSource;

    # getter for: Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->eventListener:Lcom/google/android/exoplayer/chunk/ChunkSampleSource$EventListener;
    invoke-static {v0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->access$100(Lcom/google/android/exoplayer/chunk/ChunkSampleSource;)Lcom/google/android/exoplayer/chunk/ChunkSampleSource$EventListener;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$2;->this$0:Lcom/google/android/exoplayer/chunk/ChunkSampleSource;

    # getter for: Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->eventSourceId:I
    invoke-static {v1}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->access$000(Lcom/google/android/exoplayer/chunk/ChunkSampleSource;)I

    move-result v1

    iget-wide v2, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$2;->val$bytesLoaded:J

    iget v4, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$2;->val$type:I

    iget v5, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$2;->val$trigger:I

    iget-object v6, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$2;->val$format:Lcom/google/android/exoplayer/chunk/Format;

    iget-object v7, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$2;->this$0:Lcom/google/android/exoplayer/chunk/ChunkSampleSource;

    iget-wide v8, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$2;->val$mediaStartTimeUs:J

    invoke-virtual {v7, v8, v9}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->usToMs(J)J

    move-result-wide v7

    iget-object v9, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$2;->this$0:Lcom/google/android/exoplayer/chunk/ChunkSampleSource;

    iget-wide v10, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$2;->val$mediaEndTimeUs:J

    invoke-virtual {v9, v10, v11}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->usToMs(J)J

    move-result-wide v9

    iget-wide v11, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$2;->val$elapsedRealtimeMs:J

    iget-wide v13, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$2;->val$loadDurationMs:J

    invoke-interface/range {v0 .. v14}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$EventListener;->onLoadCompleted(IJIILcom/google/android/exoplayer/chunk/Format;JJJJ)V

    .line 630
    return-void
.end method
