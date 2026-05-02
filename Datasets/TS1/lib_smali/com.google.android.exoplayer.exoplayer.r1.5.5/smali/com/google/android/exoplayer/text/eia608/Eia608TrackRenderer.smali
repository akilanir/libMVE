.class public final Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;
.super Lcom/google/android/exoplayer/SampleSourceTrackRenderer;
.source "Eia608TrackRenderer.java"

# interfaces
.implements Landroid/os/Handler$Callback;


# static fields
.field private static final CC_MODE_PAINT_ON:I = 0x3

.field private static final CC_MODE_POP_ON:I = 0x2

.field private static final CC_MODE_ROLL_UP:I = 0x1

.field private static final CC_MODE_UNKNOWN:I = 0x0

.field private static final DEFAULT_CAPTIONS_ROW_COUNT:I = 0x4

.field private static final MAX_SAMPLE_READAHEAD_US:I = 0x4c4b40

.field private static final MSG_INVOKE_RENDERER:I


# instance fields
.field private caption:Ljava/lang/String;

.field private captionMode:I

.field private captionRowCount:I

.field private final captionStringBuilder:Ljava/lang/StringBuilder;

.field private final eia608Parser:Lcom/google/android/exoplayer/text/eia608/Eia608Parser;

.field private final formatHolder:Lcom/google/android/exoplayer/MediaFormatHolder;

.field private inputStreamEnded:Z

.field private lastRenderedCaption:Ljava/lang/String;

.field private final pendingCaptionLists:Ljava/util/TreeSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/TreeSet",
            "<",
            "Lcom/google/android/exoplayer/text/eia608/ClosedCaptionList;",
            ">;"
        }
    .end annotation
.end field

.field private final sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

.field private final textRenderer:Lcom/google/android/exoplayer/text/TextRenderer;

.field private final textRendererHandler:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/SampleSource;Lcom/google/android/exoplayer/text/TextRenderer;Landroid/os/Looper;)V
    .registers 7
    .param p1, "source"    # Lcom/google/android/exoplayer/SampleSource;
    .param p2, "textRenderer"    # Lcom/google/android/exoplayer/text/TextRenderer;
    .param p3, "textRendererLooper"    # Landroid/os/Looper;

    .prologue
    const/4 v2, 0x1

    .line 81
    new-array v0, v2, [Lcom/google/android/exoplayer/SampleSource;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;-><init>([Lcom/google/android/exoplayer/SampleSource;)V

    .line 82
    invoke-static {p2}, Lcom/google/android/exoplayer/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/text/TextRenderer;

    iput-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->textRenderer:Lcom/google/android/exoplayer/text/TextRenderer;

    .line 83
    if-nez p3, :cond_3a

    const/4 v0, 0x0

    :goto_14
    iput-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->textRendererHandler:Landroid/os/Handler;

    .line 84
    new-instance v0, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;

    invoke-direct {v0}, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->eia608Parser:Lcom/google/android/exoplayer/text/eia608/Eia608Parser;

    .line 85
    new-instance v0, Lcom/google/android/exoplayer/MediaFormatHolder;

    invoke-direct {v0}, Lcom/google/android/exoplayer/MediaFormatHolder;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->formatHolder:Lcom/google/android/exoplayer/MediaFormatHolder;

    .line 86
    new-instance v0, Lcom/google/android/exoplayer/SampleHolder;

    invoke-direct {v0, v2}, Lcom/google/android/exoplayer/SampleHolder;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    .line 87
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionStringBuilder:Ljava/lang/StringBuilder;

    .line 88
    new-instance v0, Ljava/util/TreeSet;

    invoke-direct {v0}, Ljava/util/TreeSet;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->pendingCaptionLists:Ljava/util/TreeSet;

    .line 89
    return-void

    .line 83
    :cond_3a
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0, p3, p0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    goto :goto_14
.end method

.method private clearPendingSample()V
    .registers 4

    .prologue
    .line 340
    iget-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    const-wide/16 v1, -0x1

    iput-wide v1, v0, Lcom/google/android/exoplayer/SampleHolder;->timeUs:J

    .line 341
    iget-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/SampleHolder;->clearData()V

    .line 342
    return-void
.end method

.method private consumeCaptionList(Lcom/google/android/exoplayer/text/eia608/ClosedCaptionList;)V
    .registers 8
    .param p1, "captionList"    # Lcom/google/android/exoplayer/text/eia608/ClosedCaptionList;

    .prologue
    .line 204
    iget-object v4, p1, Lcom/google/android/exoplayer/text/eia608/ClosedCaptionList;->captions:[Lcom/google/android/exoplayer/text/eia608/ClosedCaption;

    array-length v1, v4

    .line 205
    .local v1, "captionBufferSize":I
    if-nez v1, :cond_6

    .line 226
    :cond_5
    :goto_5
    return-void

    .line 209
    :cond_6
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_7
    if-ge v3, v1, :cond_30

    .line 210
    iget-object v4, p1, Lcom/google/android/exoplayer/text/eia608/ClosedCaptionList;->captions:[Lcom/google/android/exoplayer/text/eia608/ClosedCaption;

    aget-object v0, v4, v3

    .line 211
    .local v0, "caption":Lcom/google/android/exoplayer/text/eia608/ClosedCaption;
    iget v4, v0, Lcom/google/android/exoplayer/text/eia608/ClosedCaption;->type:I

    if-nez v4, :cond_2a

    move-object v2, v0

    .line 212
    check-cast v2, Lcom/google/android/exoplayer/text/eia608/ClosedCaptionCtrl;

    .line 213
    .local v2, "captionCtrl":Lcom/google/android/exoplayer/text/eia608/ClosedCaptionCtrl;
    invoke-virtual {v2}, Lcom/google/android/exoplayer/text/eia608/ClosedCaptionCtrl;->isMiscCode()Z

    move-result v4

    if-eqz v4, :cond_20

    .line 214
    invoke-direct {p0, v2}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->handleMiscCode(Lcom/google/android/exoplayer/text/eia608/ClosedCaptionCtrl;)V

    .line 209
    .end local v0    # "caption":Lcom/google/android/exoplayer/text/eia608/ClosedCaption;
    .end local v2    # "captionCtrl":Lcom/google/android/exoplayer/text/eia608/ClosedCaptionCtrl;
    :cond_1d
    :goto_1d
    add-int/lit8 v3, v3, 0x1

    goto :goto_7

    .line 215
    .restart local v0    # "caption":Lcom/google/android/exoplayer/text/eia608/ClosedCaption;
    .restart local v2    # "captionCtrl":Lcom/google/android/exoplayer/text/eia608/ClosedCaptionCtrl;
    :cond_20
    invoke-virtual {v2}, Lcom/google/android/exoplayer/text/eia608/ClosedCaptionCtrl;->isPreambleAddressCode()Z

    move-result v4

    if-eqz v4, :cond_1d

    .line 216
    invoke-direct {p0}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->handlePreambleAddressCode()V

    goto :goto_1d

    .line 219
    .end local v2    # "captionCtrl":Lcom/google/android/exoplayer/text/eia608/ClosedCaptionCtrl;
    :cond_2a
    check-cast v0, Lcom/google/android/exoplayer/text/eia608/ClosedCaptionText;

    .end local v0    # "caption":Lcom/google/android/exoplayer/text/eia608/ClosedCaption;
    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->handleText(Lcom/google/android/exoplayer/text/eia608/ClosedCaptionText;)V

    goto :goto_1d

    .line 223
    :cond_30
    iget v4, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionMode:I

    const/4 v5, 0x1

    if-eq v4, v5, :cond_3a

    iget v4, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionMode:I

    const/4 v5, 0x3

    if-ne v4, v5, :cond_5

    .line 224
    :cond_3a
    invoke-direct {p0}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->getDisplayCaption()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->caption:Ljava/lang/String;

    goto :goto_5
.end method

.method private getDisplayCaption()Ljava/lang/String;
    .registers 13

    .prologue
    const/4 v6, 0x0

    const/4 v11, -0x1

    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 312
    iget-object v9, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionStringBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    .line 313
    .local v0, "buildLength":I
    if-nez v0, :cond_d

    .line 336
    :cond_c
    :goto_c
    return-object v6

    .line 317
    :cond_d
    iget-object v9, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionStringBuilder:Ljava/lang/StringBuilder;

    add-int/lit8 v10, v0, -0x1

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v9

    const/16 v10, 0xa

    if-ne v9, v10, :cond_2d

    move v2, v7

    .line 318
    .local v2, "endsWithNewline":Z
    :goto_1a
    if-ne v0, v7, :cond_1e

    if-nez v2, :cond_c

    .line 322
    :cond_1e
    if-eqz v2, :cond_2f

    add-int/lit8 v1, v0, -0x1

    .line 323
    .local v1, "endIndex":I
    :goto_22
    iget v6, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionMode:I

    if-eq v6, v7, :cond_31

    .line 324
    iget-object v6, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionStringBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v6, v8, v1}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v6

    goto :goto_c

    .end local v1    # "endIndex":I
    .end local v2    # "endsWithNewline":Z
    :cond_2d
    move v2, v8

    .line 317
    goto :goto_1a

    .restart local v2    # "endsWithNewline":Z
    :cond_2f
    move v1, v0

    .line 322
    goto :goto_22

    .line 327
    .restart local v1    # "endIndex":I
    :cond_31
    const/4 v5, 0x0

    .line 328
    .local v5, "startIndex":I
    move v4, v1

    .line 329
    .local v4, "searchBackwardFromIndex":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_34
    iget v6, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionRowCount:I

    if-ge v3, v6, :cond_47

    if-eq v4, v11, :cond_47

    .line 330
    iget-object v6, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionStringBuilder:Ljava/lang/StringBuilder;

    const-string v7, "\n"

    add-int/lit8 v9, v4, -0x1

    invoke-virtual {v6, v7, v9}, Ljava/lang/StringBuilder;->lastIndexOf(Ljava/lang/String;I)I

    move-result v4

    .line 329
    add-int/lit8 v3, v3, 0x1

    goto :goto_34

    .line 332
    :cond_47
    if-eq v4, v11, :cond_4b

    .line 333
    add-int/lit8 v5, v4, 0x1

    .line 335
    :cond_4b
    iget-object v6, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionStringBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v6, v8, v5}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 336
    iget-object v6, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionStringBuilder:Ljava/lang/StringBuilder;

    sub-int v7, v1, v5

    invoke-virtual {v6, v8, v7}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v6

    goto :goto_c
.end method

.method private handleMiscCode(Lcom/google/android/exoplayer/text/eia608/ClosedCaptionCtrl;)V
    .registers 7
    .param p1, "captionCtrl"    # Lcom/google/android/exoplayer/text/eia608/ClosedCaptionCtrl;

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x3

    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 235
    iget-byte v0, p1, Lcom/google/android/exoplayer/text/eia608/ClosedCaptionCtrl;->cc2:B

    packed-switch v0, :pswitch_data_6c

    .line 256
    :pswitch_9
    iget v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionMode:I

    if-nez v0, :cond_29

    .line 283
    :cond_d
    :goto_d
    return-void

    .line 237
    :pswitch_e
    iput v4, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionRowCount:I

    .line 238
    invoke-direct {p0, v1}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->setCaptionMode(I)V

    goto :goto_d

    .line 241
    :pswitch_14
    iput v3, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionRowCount:I

    .line 242
    invoke-direct {p0, v1}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->setCaptionMode(I)V

    goto :goto_d

    .line 245
    :pswitch_1a
    const/4 v0, 0x4

    iput v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionRowCount:I

    .line 246
    invoke-direct {p0, v1}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->setCaptionMode(I)V

    goto :goto_d

    .line 249
    :pswitch_21
    invoke-direct {p0, v4}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->setCaptionMode(I)V

    goto :goto_d

    .line 252
    :pswitch_25
    invoke-direct {p0, v3}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->setCaptionMode(I)V

    goto :goto_d

    .line 260
    :cond_29
    iget-byte v0, p1, Lcom/google/android/exoplayer/text/eia608/ClosedCaptionCtrl;->cc2:B

    sparse-switch v0, :sswitch_data_84

    goto :goto_d

    .line 278
    :sswitch_2f
    iget-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionStringBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-lez v0, :cond_d

    .line 279
    iget-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionStringBuilder:Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionStringBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    goto :goto_d

    .line 262
    :sswitch_45
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->caption:Ljava/lang/String;

    .line 263
    iget v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionMode:I

    if-eq v0, v1, :cond_50

    iget v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionMode:I

    if-ne v0, v3, :cond_d

    .line 264
    :cond_50
    iget-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionStringBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    goto :goto_d

    .line 268
    :sswitch_56
    iget-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionStringBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    goto :goto_d

    .line 271
    :sswitch_5c
    invoke-direct {p0}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->getDisplayCaption()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->caption:Ljava/lang/String;

    .line 272
    iget-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionStringBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    goto :goto_d

    .line 275
    :sswitch_68
    invoke-direct {p0}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->maybeAppendNewline()V

    goto :goto_d

    .line 235
    :pswitch_data_6c
    .packed-switch 0x20
        :pswitch_21
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_e
        :pswitch_14
        :pswitch_1a
        :pswitch_9
        :pswitch_25
    .end packed-switch

    .line 260
    :sswitch_data_84
    .sparse-switch
        0x21 -> :sswitch_2f
        0x2c -> :sswitch_45
        0x2d -> :sswitch_68
        0x2e -> :sswitch_56
        0x2f -> :sswitch_5c
    .end sparse-switch
.end method

.method private handlePreambleAddressCode()V
    .registers 1

    .prologue
    .line 287
    invoke-direct {p0}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->maybeAppendNewline()V

    .line 288
    return-void
.end method

.method private handleText(Lcom/google/android/exoplayer/text/eia608/ClosedCaptionText;)V
    .registers 4
    .param p1, "captionText"    # Lcom/google/android/exoplayer/text/eia608/ClosedCaptionText;

    .prologue
    .line 229
    iget v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionMode:I

    if-eqz v0, :cond_b

    .line 230
    iget-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionStringBuilder:Ljava/lang/StringBuilder;

    iget-object v1, p1, Lcom/google/android/exoplayer/text/eia608/ClosedCaptionText;->text:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 232
    :cond_b
    return-void
.end method

.method private invokeRenderer(Ljava/lang/String;)V
    .registers 4
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 160
    iget-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->lastRenderedCaption:Ljava/lang/String;

    invoke-static {v0, p1}, Lcom/google/android/exoplayer/util/Util;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 170
    :goto_8
    return-void

    .line 164
    :cond_9
    iput-object p1, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->lastRenderedCaption:Ljava/lang/String;

    .line 165
    iget-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->textRendererHandler:Landroid/os/Handler;

    if-eqz v0, :cond_1a

    .line 166
    iget-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->textRendererHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    goto :goto_8

    .line 168
    :cond_1a
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->invokeRendererInternal(Ljava/lang/String;)V

    goto :goto_8
.end method

.method private invokeRendererInternal(Ljava/lang/String;)V
    .registers 4
    .param p1, "cueText"    # Ljava/lang/String;

    .prologue
    .line 184
    if-nez p1, :cond_c

    .line 185
    iget-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->textRenderer:Lcom/google/android/exoplayer/text/TextRenderer;

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer/text/TextRenderer;->onCues(Ljava/util/List;)V

    .line 189
    :goto_b
    return-void

    .line 187
    :cond_c
    iget-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->textRenderer:Lcom/google/android/exoplayer/text/TextRenderer;

    new-instance v1, Lcom/google/android/exoplayer/text/Cue;

    invoke-direct {v1, p1}, Lcom/google/android/exoplayer/text/Cue;-><init>(Ljava/lang/CharSequence;)V

    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer/text/TextRenderer;->onCues(Ljava/util/List;)V

    goto :goto_b
.end method

.method private isSamplePending()Z
    .registers 5

    .prologue
    .line 345
    iget-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    iget-wide v0, v0, Lcom/google/android/exoplayer/SampleHolder;->timeUs:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method private maybeAppendNewline()V
    .registers 5

    .prologue
    const/16 v3, 0xa

    .line 305
    iget-object v1, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionStringBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    .line 306
    .local v0, "buildLength":I
    if-lez v0, :cond_19

    iget-object v1, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionStringBuilder:Ljava/lang/StringBuilder;

    add-int/lit8 v2, v0, -0x1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v1

    if-eq v1, v3, :cond_19

    .line 307
    iget-object v1, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionStringBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 309
    :cond_19
    return-void
.end method

.method private maybeParsePendingSample(J)V
    .registers 8
    .param p1, "positionUs"    # J

    .prologue
    .line 192
    iget-object v1, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    iget-wide v1, v1, Lcom/google/android/exoplayer/SampleHolder;->timeUs:J

    const-wide/32 v3, 0x4c4b40

    add-long/2addr v3, p1

    cmp-long v1, v1, v3

    if-lez v1, :cond_d

    .line 201
    :cond_c
    :goto_c
    return-void

    .line 196
    :cond_d
    iget-object v1, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->eia608Parser:Lcom/google/android/exoplayer/text/eia608/Eia608Parser;

    iget-object v2, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->parse(Lcom/google/android/exoplayer/SampleHolder;)Lcom/google/android/exoplayer/text/eia608/ClosedCaptionList;

    move-result-object v0

    .line 197
    .local v0, "holder":Lcom/google/android/exoplayer/text/eia608/ClosedCaptionList;
    invoke-direct {p0}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->clearPendingSample()V

    .line 198
    if-eqz v0, :cond_c

    .line 199
    iget-object v1, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->pendingCaptionLists:Ljava/util/TreeSet;

    invoke-virtual {v1, v0}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z

    goto :goto_c
.end method

.method private setCaptionMode(I)V
    .registers 4
    .param p1, "captionMode"    # I

    .prologue
    .line 291
    iget v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionMode:I

    if-ne v0, p1, :cond_5

    .line 302
    :cond_4
    :goto_4
    return-void

    .line 295
    :cond_5
    iput p1, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionMode:I

    .line 297
    iget-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionStringBuilder:Ljava/lang/StringBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 298
    const/4 v0, 0x1

    if-eq p1, v0, :cond_12

    if-nez p1, :cond_4

    .line 300
    :cond_12
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->caption:Ljava/lang/String;

    goto :goto_4
.end method


# virtual methods
.method protected doSomeWork(JJZ)V
    .registers 12
    .param p1, "positionUs"    # J
    .param p3, "elapsedRealtimeUs"    # J
    .param p5, "sourceIsReady"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    const/4 v2, -0x1

    const/4 v3, -0x3

    .line 115
    invoke-direct {p0}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->isSamplePending()Z

    move-result v4

    if-eqz v4, :cond_b

    .line 116
    invoke-direct {p0, p1, p2}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->maybeParsePendingSample(J)V

    .line 119
    :cond_b
    iget-boolean v4, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->inputStreamEnded:Z

    if-eqz v4, :cond_26

    move v1, v2

    .line 120
    .local v1, "result":I
    :cond_10
    :goto_10
    invoke-direct {p0}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->isSamplePending()Z

    move-result v4

    if-nez v4, :cond_42

    if-ne v1, v3, :cond_42

    .line 121
    iget-object v4, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->formatHolder:Lcom/google/android/exoplayer/MediaFormatHolder;

    iget-object v5, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    invoke-virtual {p0, p1, p2, v4, v5}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->readSource(JLcom/google/android/exoplayer/MediaFormatHolder;Lcom/google/android/exoplayer/SampleHolder;)I

    move-result v1

    .line 122
    if-ne v1, v3, :cond_28

    .line 123
    invoke-direct {p0, p1, p2}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->maybeParsePendingSample(J)V

    goto :goto_10

    .end local v1    # "result":I
    :cond_26
    move v1, v3

    .line 119
    goto :goto_10

    .line 124
    .restart local v1    # "result":I
    :cond_28
    if-ne v1, v2, :cond_10

    .line 125
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->inputStreamEnded:Z

    goto :goto_10

    .line 135
    :cond_2e
    iget-object v2, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->pendingCaptionLists:Ljava/util/TreeSet;

    invoke-virtual {v2}, Ljava/util/TreeSet;->pollFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/text/eia608/ClosedCaptionList;

    .line 136
    .local v0, "nextCaptionList":Lcom/google/android/exoplayer/text/eia608/ClosedCaptionList;
    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->consumeCaptionList(Lcom/google/android/exoplayer/text/eia608/ClosedCaptionList;)V

    .line 138
    iget-boolean v2, v0, Lcom/google/android/exoplayer/text/eia608/ClosedCaptionList;->decodeOnly:Z

    if-nez v2, :cond_42

    .line 139
    iget-object v2, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->caption:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->invokeRenderer(Ljava/lang/String;)V

    .line 129
    .end local v0    # "nextCaptionList":Lcom/google/android/exoplayer/text/eia608/ClosedCaptionList;
    :cond_42
    iget-object v2, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->pendingCaptionLists:Ljava/util/TreeSet;

    invoke-virtual {v2}, Ljava/util/TreeSet;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_58

    .line 130
    iget-object v2, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->pendingCaptionLists:Ljava/util/TreeSet;

    invoke-virtual {v2}, Ljava/util/TreeSet;->first()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/exoplayer/text/eia608/ClosedCaptionList;

    iget-wide v2, v2, Lcom/google/android/exoplayer/text/eia608/ClosedCaptionList;->timeUs:J

    cmp-long v2, v2, p1

    if-lez v2, :cond_2e

    .line 142
    :cond_58
    return-void
.end method

.method protected getBufferedPositionUs()J
    .registers 3

    .prologue
    .line 146
    const-wide/16 v0, -0x3

    return-wide v0
.end method

.method public handleMessage(Landroid/os/Message;)Z
    .registers 3
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 175
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_10

    .line 180
    const/4 v0, 0x0

    :goto_6
    return v0

    .line 177
    :pswitch_7
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->invokeRendererInternal(Ljava/lang/String;)V

    .line 178
    const/4 v0, 0x1

    goto :goto_6

    .line 175
    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_7
    .end packed-switch
.end method

.method protected handlesTrack(Lcom/google/android/exoplayer/MediaFormat;)Z
    .registers 4
    .param p1, "mediaFormat"    # Lcom/google/android/exoplayer/MediaFormat;

    .prologue
    .line 93
    iget-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->eia608Parser:Lcom/google/android/exoplayer/text/eia608/Eia608Parser;

    iget-object v1, p1, Lcom/google/android/exoplayer/MediaFormat;->mimeType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->canParse(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method protected isEnded()Z
    .registers 2

    .prologue
    .line 151
    iget-boolean v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->inputStreamEnded:Z

    return v0
.end method

.method protected isReady()Z
    .registers 2

    .prologue
    .line 156
    const/4 v0, 0x1

    return v0
.end method

.method protected onDiscontinuity(J)V
    .registers 5
    .param p1, "positionUs"    # J

    .prologue
    const/4 v1, 0x0

    .line 104
    iput-boolean v1, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->inputStreamEnded:Z

    .line 105
    iget-object v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->pendingCaptionLists:Ljava/util/TreeSet;

    invoke-virtual {v0}, Ljava/util/TreeSet;->clear()V

    .line 106
    invoke-direct {p0}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->clearPendingSample()V

    .line 107
    const/4 v0, 0x4

    iput v0, p0, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->captionRowCount:I

    .line 108
    invoke-direct {p0, v1}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->setCaptionMode(I)V

    .line 109
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/text/eia608/Eia608TrackRenderer;->invokeRenderer(Ljava/lang/String;)V

    .line 110
    return-void
.end method

.method protected onEnabled(IJZ)V
    .registers 5
    .param p1, "track"    # I
    .param p2, "positionUs"    # J
    .param p4, "joining"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 99
    invoke-super {p0, p1, p2, p3, p4}, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->onEnabled(IJZ)V

    .line 100
    return-void
.end method
