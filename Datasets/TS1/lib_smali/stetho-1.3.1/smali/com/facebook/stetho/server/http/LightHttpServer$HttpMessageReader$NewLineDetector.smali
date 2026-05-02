.class Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageReader$NewLineDetector;
.super Ljava/lang/Object;
.source "LightHttpServer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "NewLineDetector"
.end annotation


# static fields
.field private static final STATE_ON_CR:I = 0x2

.field private static final STATE_ON_CRLF:I = 0x3

.field private static final STATE_ON_OTHER:I = 0x1


# instance fields
.field private state:I


# direct methods
.method private constructor <init>()V
    .registers 2

    .prologue
    .line 216
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 221
    const/4 v0, 0x1

    iput v0, p0, Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageReader$NewLineDetector;->state:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/facebook/stetho/server/http/LightHttpServer$1;)V
    .registers 2
    .param p1, "x0"    # Lcom/facebook/stetho/server/http/LightHttpServer$1;

    .prologue
    .line 216
    invoke-direct {p0}, Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageReader$NewLineDetector;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(C)V
    .registers 6
    .param p1, "c"    # C

    .prologue
    const/16 v3, 0xd

    const/4 v2, 0x2

    const/4 v1, 0x1

    .line 224
    iget v0, p0, Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageReader$NewLineDetector;->state:I

    packed-switch v0, :pswitch_data_3c

    .line 245
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageReader$NewLineDetector;->state:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 226
    :pswitch_24
    if-ne p1, v3, :cond_28

    .line 227
    iput v2, p0, Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageReader$NewLineDetector;->state:I

    .line 247
    :cond_28
    :goto_28
    return-void

    .line 231
    :pswitch_29
    const/16 v0, 0xa

    if-ne p1, v0, :cond_31

    .line 232
    const/4 v0, 0x3

    iput v0, p0, Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageReader$NewLineDetector;->state:I

    goto :goto_28

    .line 234
    :cond_31
    iput v1, p0, Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageReader$NewLineDetector;->state:I

    goto :goto_28

    .line 238
    :pswitch_34
    if-ne p1, v3, :cond_39

    .line 239
    iput v2, p0, Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageReader$NewLineDetector;->state:I

    goto :goto_28

    .line 241
    :cond_39
    iput v1, p0, Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageReader$NewLineDetector;->state:I

    goto :goto_28

    .line 224
    :pswitch_data_3c
    .packed-switch 0x1
        :pswitch_24
        :pswitch_29
        :pswitch_34
    .end packed-switch
.end method

.method public state()I
    .registers 2

    .prologue
    .line 250
    iget v0, p0, Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageReader$NewLineDetector;->state:I

    return v0
.end method
