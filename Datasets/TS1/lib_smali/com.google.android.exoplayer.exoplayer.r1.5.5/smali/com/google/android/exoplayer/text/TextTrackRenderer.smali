.class public final Lcom/google/android/exoplayer/text/TextTrackRenderer;
.super Lcom/google/android/exoplayer/SampleSourceTrackRenderer;
.source "TextTrackRenderer.java"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x10
.end annotation


# static fields
.field private static final DEFAULT_PARSER_CLASSES:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Class",
            "<+",
            "Lcom/google/android/exoplayer/text/SubtitleParser;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final MSG_UPDATE_OVERLAY:I


# instance fields
.field private final formatHolder:Lcom/google/android/exoplayer/MediaFormatHolder;

.field private inputStreamEnded:Z

.field private nextSubtitle:Lcom/google/android/exoplayer/text/PlayableSubtitle;

.field private nextSubtitleEventIndex:I

.field private parserHelper:Lcom/google/android/exoplayer/text/SubtitleParserHelper;

.field private parserIndex:I

.field private parserThread:Landroid/os/HandlerThread;

.field private subtitle:Lcom/google/android/exoplayer/text/PlayableSubtitle;

.field private final subtitleParsers:[Lcom/google/android/exoplayer/text/SubtitleParser;

.field private final textRenderer:Lcom/google/android/exoplayer/text/TextRenderer;

.field private final textRendererHandler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 72
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->DEFAULT_PARSER_CLASSES:Ljava/util/List;

    .line 77
    :try_start_7
    sget-object v0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->DEFAULT_PARSER_CLASSES:Ljava/util/List;

    const-string v1, "com.google.android.exoplayer.text.webvtt.WebvttParser"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcom/google/android/exoplayer/text/SubtitleParser;

    invoke-virtual {v1, v2}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_18
    .catch Ljava/lang/ClassNotFoundException; {:try_start_7 .. :try_end_18} :catch_65

    .line 84
    :goto_18
    :try_start_18
    sget-object v0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->DEFAULT_PARSER_CLASSES:Ljava/util/List;

    const-string v1, "com.google.android.exoplayer.text.ttml.TtmlParser"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcom/google/android/exoplayer/text/SubtitleParser;

    invoke-virtual {v1, v2}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_29
    .catch Ljava/lang/ClassNotFoundException; {:try_start_18 .. :try_end_29} :catch_63

    .line 91
    :goto_29
    :try_start_29
    sget-object v0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->DEFAULT_PARSER_CLASSES:Ljava/util/List;

    const-string v1, "com.google.android.exoplayer.text.webvtt.Mp4WebvttParser"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcom/google/android/exoplayer/text/SubtitleParser;

    invoke-virtual {v1, v2}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_3a
    .catch Ljava/lang/ClassNotFoundException; {:try_start_29 .. :try_end_3a} :catch_61

    .line 98
    :goto_3a
    :try_start_3a
    sget-object v0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->DEFAULT_PARSER_CLASSES:Ljava/util/List;

    const-string v1, "com.google.android.exoplayer.text.subrip.SubripParser"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcom/google/android/exoplayer/text/SubtitleParser;

    invoke-virtual {v1, v2}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_4b
    .catch Ljava/lang/ClassNotFoundException; {:try_start_3a .. :try_end_4b} :catch_5f

    .line 105
    :goto_4b
    :try_start_4b
    sget-object v0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->DEFAULT_PARSER_CLASSES:Ljava/util/List;

    const-string v1, "com.google.android.exoplayer.text.tx3g.Tx3gParser"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcom/google/android/exoplayer/text/SubtitleParser;

    invoke-virtual {v1, v2}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_5c
    .catch Ljava/lang/ClassNotFoundException; {:try_start_4b .. :try_end_5c} :catch_5d

    .line 111
    :goto_5c
    return-void

    .line 108
    :catch_5d
    move-exception v0

    goto :goto_5c

    .line 101
    :catch_5f
    move-exception v0

    goto :goto_4b

    .line 94
    :catch_61
    move-exception v0

    goto :goto_3a

    .line 87
    :catch_63
    move-exception v0

    goto :goto_29

    .line 80
    :catch_65
    move-exception v0

    goto :goto_18
.end method

.method public varargs constructor <init>(Lcom/google/android/exoplayer/SampleSource;Lcom/google/android/exoplayer/text/TextRenderer;Landroid/os/Looper;[Lcom/google/android/exoplayer/text/SubtitleParser;)V
    .registers 7
    .param p1, "source"    # Lcom/google/android/exoplayer/SampleSource;
    .param p2, "textRenderer"    # Lcom/google/android/exoplayer/text/TextRenderer;
    .param p3, "textRendererLooper"    # Landroid/os/Looper;
    .param p4, "subtitleParsers"    # [Lcom/google/android/exoplayer/text/SubtitleParser;

    .prologue
    .line 139
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/google/android/exoplayer/SampleSource;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-direct {p0, v0, p2, p3, p4}, Lcom/google/android/exoplayer/text/TextTrackRenderer;-><init>([Lcom/google/android/exoplayer/SampleSource;Lcom/google/android/exoplayer/text/TextRenderer;Landroid/os/Looper;[Lcom/google/android/exoplayer/text/SubtitleParser;)V

    .line 140
    return-void
.end method

.method public varargs constructor <init>([Lcom/google/android/exoplayer/SampleSource;Lcom/google/android/exoplayer/text/TextRenderer;Landroid/os/Looper;[Lcom/google/android/exoplayer/text/SubtitleParser;)V
    .registers 9
    .param p1, "sources"    # [Lcom/google/android/exoplayer/SampleSource;
    .param p2, "textRenderer"    # Lcom/google/android/exoplayer/text/TextRenderer;
    .param p3, "textRendererLooper"    # Landroid/os/Looper;
    .param p4, "subtitleParsers"    # [Lcom/google/android/exoplayer/text/SubtitleParser;

    .prologue
    .line 155
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;-><init>([Lcom/google/android/exoplayer/SampleSource;)V

    .line 156
    invoke-static {p2}, Lcom/google/android/exoplayer/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/exoplayer/text/TextRenderer;

    iput-object v2, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->textRenderer:Lcom/google/android/exoplayer/text/TextRenderer;

    .line 157
    if-nez p3, :cond_34

    const/4 v2, 0x0

    :goto_e
    iput-object v2, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->textRendererHandler:Landroid/os/Handler;

    .line 159
    if-eqz p4, :cond_15

    array-length v2, p4

    if-nez v2, :cond_4c

    .line 160
    :cond_15
    sget-object v2, Lcom/google/android/exoplayer/text/TextTrackRenderer;->DEFAULT_PARSER_CLASSES:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    new-array p4, v2, [Lcom/google/android/exoplayer/text/SubtitleParser;

    .line 161
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1e
    array-length v2, p4

    if-ge v1, v2, :cond_4c

    .line 163
    :try_start_21
    sget-object v2, Lcom/google/android/exoplayer/text/TextTrackRenderer;->DEFAULT_PARSER_CLASSES:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Class;

    invoke-virtual {v2}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/exoplayer/text/SubtitleParser;

    aput-object v2, p4, v1
    :try_end_31
    .catch Ljava/lang/InstantiationException; {:try_start_21 .. :try_end_31} :catch_3a
    .catch Ljava/lang/IllegalAccessException; {:try_start_21 .. :try_end_31} :catch_43

    .line 161
    add-int/lit8 v1, v1, 0x1

    goto :goto_1e

    .line 157
    .end local v1    # "i":I
    :cond_34
    new-instance v2, Landroid/os/Handler;

    invoke-direct {v2, p3, p0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    goto :goto_e

    .line 164
    .restart local v1    # "i":I
    :catch_3a
    move-exception v0

    .line 165
    .local v0, "e":Ljava/lang/InstantiationException;
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "Unexpected error creating default parser"

    invoke-direct {v2, v3, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 166
    .end local v0    # "e":Ljava/lang/InstantiationException;
    :catch_43
    move-exception v0

    .line 167
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "Unexpected error creating default parser"

    invoke-direct {v2, v3, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 171
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    .end local v1    # "i":I
    :cond_4c
    iput-object p4, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->subtitleParsers:[Lcom/google/android/exoplayer/text/SubtitleParser;

    .line 172
    new-instance v2, Lcom/google/android/exoplayer/MediaFormatHolder;

    invoke-direct {v2}, Lcom/google/android/exoplayer/MediaFormatHolder;-><init>()V

    iput-object v2, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->formatHolder:Lcom/google/android/exoplayer/MediaFormatHolder;

    .line 173
    return-void
.end method

.method private clearTextRenderer()V
    .registers 2

    .prologue
    .line 301
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/text/TextTrackRenderer;->updateTextRenderer(Ljava/util/List;)V

    .line 302
    return-void
.end method

.method private getNextEventTime()J
    .registers 3

    .prologue
    .line 287
    iget v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->nextSubtitleEventIndex:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_f

    iget v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->nextSubtitleEventIndex:I

    iget-object v1, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->subtitle:Lcom/google/android/exoplayer/text/PlayableSubtitle;

    invoke-virtual {v1}, Lcom/google/android/exoplayer/text/PlayableSubtitle;->getEventTimeCount()I

    move-result v1

    if-lt v0, v1, :cond_15

    :cond_f
    const-wide v0, 0x7fffffffffffffffL

    :goto_14
    return-wide v0

    :cond_15
    iget-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->subtitle:Lcom/google/android/exoplayer/text/PlayableSubtitle;

    iget v1, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->nextSubtitleEventIndex:I

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/text/PlayableSubtitle;->getEventTime(I)J

    move-result-wide v0

    goto :goto_14
.end method

.method private getParserIndex(Lcom/google/android/exoplayer/MediaFormat;)I
    .registers 5
    .param p1, "mediaFormat"    # Lcom/google/android/exoplayer/MediaFormat;

    .prologue
    .line 320
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->subtitleParsers:[Lcom/google/android/exoplayer/text/SubtitleParser;

    array-length v1, v1

    if-ge v0, v1, :cond_16

    .line 321
    iget-object v1, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->subtitleParsers:[Lcom/google/android/exoplayer/text/SubtitleParser;

    aget-object v1, v1, v0

    iget-object v2, p1, Lcom/google/android/exoplayer/MediaFormat;->mimeType:Ljava/lang/String;

    invoke-interface {v1, v2}, Lcom/google/android/exoplayer/text/SubtitleParser;->canParse(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_13

    .line 325
    .end local v0    # "i":I
    :goto_12
    return v0

    .line 320
    .restart local v0    # "i":I
    :cond_13
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 325
    :cond_16
    const/4 v0, -0x1

    goto :goto_12
.end method

.method private invokeRendererInternalCues(Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer/text/Cue;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 316
    .local p1, "cues":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/text/Cue;>;"
    iget-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->textRenderer:Lcom/google/android/exoplayer/text/TextRenderer;

    invoke-interface {v0, p1}, Lcom/google/android/exoplayer/text/TextRenderer;->onCues(Ljava/util/List;)V

    .line 317
    return-void
.end method

.method private updateTextRenderer(Ljava/util/List;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer/text/Cue;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 293
    .local p1, "cues":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/text/Cue;>;"
    iget-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->textRendererHandler:Landroid/os/Handler;

    if-eqz v0, :cond_f

    .line 294
    iget-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->textRendererHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 298
    :goto_e
    return-void

    .line 296
    :cond_f
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/text/TextTrackRenderer;->invokeRendererInternalCues(Ljava/util/List;)V

    goto :goto_e
.end method


# virtual methods
.method protected doSomeWork(JJZ)V
    .registers 14
    .param p1, "positionUs"    # J
    .param p3, "elapsedRealtimeUs"    # J
    .param p5, "sourceIsReady"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 204
    iget-object v6, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->nextSubtitle:Lcom/google/android/exoplayer/text/PlayableSubtitle;

    if-nez v6, :cond_c

    .line 206
    :try_start_4
    iget-object v6, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->parserHelper:Lcom/google/android/exoplayer/text/SubtitleParserHelper;

    invoke-virtual {v6}, Lcom/google/android/exoplayer/text/SubtitleParserHelper;->getAndClearResult()Lcom/google/android/exoplayer/text/PlayableSubtitle;

    move-result-object v6

    iput-object v6, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->nextSubtitle:Lcom/google/android/exoplayer/text/PlayableSubtitle;
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_c} :catch_14

    .line 212
    :cond_c
    invoke-virtual {p0}, Lcom/google/android/exoplayer/text/TextTrackRenderer;->getState()I

    move-result v6

    const/4 v7, 0x3

    if-eq v6, v7, :cond_1b

    .line 255
    :cond_13
    :goto_13
    return-void

    .line 207
    :catch_14
    move-exception v0

    .line 208
    .local v0, "e":Ljava/io/IOException;
    new-instance v6, Lcom/google/android/exoplayer/ExoPlaybackException;

    invoke-direct {v6, v0}, Lcom/google/android/exoplayer/ExoPlaybackException;-><init>(Ljava/lang/Throwable;)V

    throw v6

    .line 216
    .end local v0    # "e":Ljava/io/IOException;
    :cond_1b
    const/4 v5, 0x0

    .line 217
    .local v5, "textRendererNeedsUpdate":Z
    const-wide v3, 0x7fffffffffffffffL

    .line 218
    .local v3, "subtitleNextEventTimeUs":J
    iget-object v6, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->subtitle:Lcom/google/android/exoplayer/text/PlayableSubtitle;

    if-eqz v6, :cond_39

    .line 221
    invoke-direct {p0}, Lcom/google/android/exoplayer/text/TextTrackRenderer;->getNextEventTime()J

    move-result-wide v3

    .line 222
    :goto_29
    cmp-long v6, v3, p1

    if-gtz v6, :cond_39

    .line 223
    iget v6, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->nextSubtitleEventIndex:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->nextSubtitleEventIndex:I

    .line 224
    invoke-direct {p0}, Lcom/google/android/exoplayer/text/TextTrackRenderer;->getNextEventTime()J

    move-result-wide v3

    .line 225
    const/4 v5, 0x1

    goto :goto_29

    .line 229
    :cond_39
    iget-object v6, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->nextSubtitle:Lcom/google/android/exoplayer/text/PlayableSubtitle;

    if-eqz v6, :cond_55

    iget-object v6, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->nextSubtitle:Lcom/google/android/exoplayer/text/PlayableSubtitle;

    iget-wide v6, v6, Lcom/google/android/exoplayer/text/PlayableSubtitle;->startTimeUs:J

    cmp-long v6, v6, p1

    if-gtz v6, :cond_55

    .line 231
    iget-object v6, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->nextSubtitle:Lcom/google/android/exoplayer/text/PlayableSubtitle;

    iput-object v6, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->subtitle:Lcom/google/android/exoplayer/text/PlayableSubtitle;

    .line 232
    const/4 v6, 0x0

    iput-object v6, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->nextSubtitle:Lcom/google/android/exoplayer/text/PlayableSubtitle;

    .line 233
    iget-object v6, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->subtitle:Lcom/google/android/exoplayer/text/PlayableSubtitle;

    invoke-virtual {v6, p1, p2}, Lcom/google/android/exoplayer/text/PlayableSubtitle;->getNextEventTimeIndex(J)I

    move-result v6

    iput v6, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->nextSubtitleEventIndex:I

    .line 234
    const/4 v5, 0x1

    .line 237
    :cond_55
    if-eqz v5, :cond_60

    .line 239
    iget-object v6, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->subtitle:Lcom/google/android/exoplayer/text/PlayableSubtitle;

    invoke-virtual {v6, p1, p2}, Lcom/google/android/exoplayer/text/PlayableSubtitle;->getCues(J)Ljava/util/List;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/google/android/exoplayer/text/TextTrackRenderer;->updateTextRenderer(Ljava/util/List;)V

    .line 242
    :cond_60
    iget-boolean v6, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->inputStreamEnded:Z

    if-nez v6, :cond_13

    iget-object v6, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->nextSubtitle:Lcom/google/android/exoplayer/text/PlayableSubtitle;

    if-nez v6, :cond_13

    iget-object v6, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->parserHelper:Lcom/google/android/exoplayer/text/SubtitleParserHelper;

    invoke-virtual {v6}, Lcom/google/android/exoplayer/text/SubtitleParserHelper;->isParsing()Z

    move-result v6

    if-nez v6, :cond_13

    .line 244
    iget-object v6, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->parserHelper:Lcom/google/android/exoplayer/text/SubtitleParserHelper;

    invoke-virtual {v6}, Lcom/google/android/exoplayer/text/SubtitleParserHelper;->getSampleHolder()Lcom/google/android/exoplayer/SampleHolder;

    move-result-object v2

    .line 245
    .local v2, "sampleHolder":Lcom/google/android/exoplayer/SampleHolder;
    invoke-virtual {v2}, Lcom/google/android/exoplayer/SampleHolder;->clearData()V

    .line 246
    iget-object v6, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->formatHolder:Lcom/google/android/exoplayer/MediaFormatHolder;

    invoke-virtual {p0, p1, p2, v6, v2}, Lcom/google/android/exoplayer/text/TextTrackRenderer;->readSource(JLcom/google/android/exoplayer/MediaFormatHolder;Lcom/google/android/exoplayer/SampleHolder;)I

    move-result v1

    .line 247
    .local v1, "result":I
    const/4 v6, -0x4

    if-ne v1, v6, :cond_8c

    .line 248
    iget-object v6, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->parserHelper:Lcom/google/android/exoplayer/text/SubtitleParserHelper;

    iget-object v7, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->formatHolder:Lcom/google/android/exoplayer/MediaFormatHolder;

    iget-object v7, v7, Lcom/google/android/exoplayer/MediaFormatHolder;->format:Lcom/google/android/exoplayer/MediaFormat;

    invoke-virtual {v6, v7}, Lcom/google/android/exoplayer/text/SubtitleParserHelper;->setFormat(Lcom/google/android/exoplayer/MediaFormat;)V

    goto :goto_13

    .line 249
    :cond_8c
    const/4 v6, -0x3

    if-ne v1, v6, :cond_96

    .line 250
    iget-object v6, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->parserHelper:Lcom/google/android/exoplayer/text/SubtitleParserHelper;

    invoke-virtual {v6}, Lcom/google/android/exoplayer/text/SubtitleParserHelper;->startParseOperation()V

    goto/16 :goto_13

    .line 251
    :cond_96
    const/4 v6, -0x1

    if-ne v1, v6, :cond_13

    .line 252
    const/4 v6, 0x1

    iput-boolean v6, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->inputStreamEnded:Z

    goto/16 :goto_13
.end method

.method protected getBufferedPositionUs()J
    .registers 3

    .prologue
    .line 271
    const-wide/16 v0, -0x3

    return-wide v0
.end method

.method public handleMessage(Landroid/os/Message;)Z
    .registers 3
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 307
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_10

    .line 312
    const/4 v0, 0x0

    :goto_6
    return v0

    .line 309
    :pswitch_7
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/text/TextTrackRenderer;->invokeRendererInternalCues(Ljava/util/List;)V

    .line 310
    const/4 v0, 0x1

    goto :goto_6

    .line 307
    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_7
    .end packed-switch
.end method

.method protected handlesTrack(Lcom/google/android/exoplayer/MediaFormat;)Z
    .registers 4
    .param p1, "mediaFormat"    # Lcom/google/android/exoplayer/MediaFormat;

    .prologue
    .line 177
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/text/TextTrackRenderer;->getParserIndex(Lcom/google/android/exoplayer/MediaFormat;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method protected isEnded()Z
    .registers 5

    .prologue
    .line 276
    iget-boolean v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->inputStreamEnded:Z

    if-eqz v0, :cond_17

    iget-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->subtitle:Lcom/google/android/exoplayer/text/PlayableSubtitle;

    if-eqz v0, :cond_15

    invoke-direct {p0}, Lcom/google/android/exoplayer/text/TextTrackRenderer;->getNextEventTime()J

    move-result-wide v0

    const-wide v2, 0x7fffffffffffffffL

    cmp-long v0, v0, v2

    if-nez v0, :cond_17

    :cond_15
    const/4 v0, 0x1

    :goto_16
    return v0

    :cond_17
    const/4 v0, 0x0

    goto :goto_16
.end method

.method protected isReady()Z
    .registers 2

    .prologue
    .line 283
    const/4 v0, 0x1

    return v0
.end method

.method protected onDisabled()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 259
    iput-object v1, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->subtitle:Lcom/google/android/exoplayer/text/PlayableSubtitle;

    .line 260
    iput-object v1, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->nextSubtitle:Lcom/google/android/exoplayer/text/PlayableSubtitle;

    .line 261
    iget-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->parserThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    .line 262
    iput-object v1, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->parserThread:Landroid/os/HandlerThread;

    .line 263
    iput-object v1, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->parserHelper:Lcom/google/android/exoplayer/text/SubtitleParserHelper;

    .line 264
    invoke-direct {p0}, Lcom/google/android/exoplayer/text/TextTrackRenderer;->clearTextRenderer()V

    .line 265
    invoke-super {p0}, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->onDisabled()V

    .line 266
    return-void
.end method

.method protected onDiscontinuity(J)V
    .registers 5
    .param p1, "positionUs"    # J

    .prologue
    const/4 v1, 0x0

    .line 192
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->inputStreamEnded:Z

    .line 193
    iput-object v1, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->subtitle:Lcom/google/android/exoplayer/text/PlayableSubtitle;

    .line 194
    iput-object v1, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->nextSubtitle:Lcom/google/android/exoplayer/text/PlayableSubtitle;

    .line 195
    invoke-direct {p0}, Lcom/google/android/exoplayer/text/TextTrackRenderer;->clearTextRenderer()V

    .line 196
    iget-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->parserHelper:Lcom/google/android/exoplayer/text/SubtitleParserHelper;

    if-eqz v0, :cond_14

    .line 197
    iget-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->parserHelper:Lcom/google/android/exoplayer/text/SubtitleParserHelper;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/text/SubtitleParserHelper;->flush()V

    .line 199
    :cond_14
    return-void
.end method

.method protected onEnabled(IJZ)V
    .registers 9
    .param p1, "track"    # I
    .param p2, "positionUs"    # J
    .param p4, "joining"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 183
    invoke-super {p0, p1, p2, p3, p4}, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->onEnabled(IJZ)V

    .line 184
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer/text/TextTrackRenderer;->getFormat(I)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/text/TextTrackRenderer;->getParserIndex(Lcom/google/android/exoplayer/MediaFormat;)I

    move-result v0

    iput v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->parserIndex:I

    .line 185
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "textParser"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->parserThread:Landroid/os/HandlerThread;

    .line 186
    iget-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->parserThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 187
    new-instance v0, Lcom/google/android/exoplayer/text/SubtitleParserHelper;

    iget-object v1, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->parserThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->subtitleParsers:[Lcom/google/android/exoplayer/text/SubtitleParser;

    iget v3, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->parserIndex:I

    aget-object v2, v2, v3

    invoke-direct {v0, v1, v2}, Lcom/google/android/exoplayer/text/SubtitleParserHelper;-><init>(Landroid/os/Looper;Lcom/google/android/exoplayer/text/SubtitleParser;)V

    iput-object v0, p0, Lcom/google/android/exoplayer/text/TextTrackRenderer;->parserHelper:Lcom/google/android/exoplayer/text/SubtitleParserHelper;

    .line 188
    return-void
.end method
